module XML where

import Control.Applicative
import Control.Monad
import Data.List as List
import Data.Char
import Data.Map as Map
import System.Directory (getDirectoryContents)


data Token = OpenXML | CloseXML | OpenCode | CloseCode | Source Char deriving (Show, Eq)

tokens "" = []
tokens ('<':'%':cs) = OpenXML : tokens cs
tokens ('%':'>':cs) = CloseXML : tokens cs
tokens ('{':'%':cs) = OpenCode : tokens cs
tokens ('%':'}':cs) = CloseCode : tokens cs
tokens (c:cs) = Source c : tokens cs

data Program q = Prog [Either q Char]
data Quote = Quote [Either (Program Quote) Char]

data XML
	= Text String
	| Splice (HighProg XML)
	| Node String (Map String (Either (HighProg XML) String)) (Maybe [XML])

data HighProg q = HighProg [HighLevel q]
data HighLevel q
	= Closure JType [(JType, String)] (HighProg q)
	| Call String (HighProg q)
	| Quoted q
	| Code Char

data JType
	= JClass [String]
	| JApply JType [JType]
	| JArray JType






source = token >>= \t -> case t of
	Source c -> return c
	_ -> failure

program = Prog <$> many (quasiQuote <||> source)

quasiQuote = between (sat (== OpenXML)) quoted (sat (== CloseXML))

quoted = Quote <$> many (splicedProgram <||> source)

splicedProgram = between (sat (== OpenCode)) program (sat (== CloseCode))

whole p cs = fst <$> parse (p <* end) cs

programTopLevel cs = whole program (tokens cs) >>= fixProg

xmlTopLevel cs = whole quasiQuote (tokens cs) >>= fixXML






fixProg :: Program Quote -> Maybe (HighProg XML)
fixProg (Prog pieces) = mapM onEach pieces >>= parseClosures
	where	onEach (Left xml) = Left <$> fixXML xml
		onEach (Right c) = return (Right c)

fixXML :: Quote -> Maybe XML
fixXML (Quote pieces) = mapM onEach pieces >>= parseXML
	where	onEach (Left prog) = Left <$> fixProg prog
		onEach (Right c) = return (Right c)








parseXML = whole (many white *> topLevelElement <* many white)

topLevelElement = element <|> return (Text "")

element = (Splice <$> from unLeft) <|> node <|> (Text <$> text)

text = some (satRight (/= '<'))

node = do
	satRight (== '<')
	many white
	htmlTag <- tag
	attr <- Map.fromList <$> many (some white *> parseAttribute)
	many white
	slash <- optional (satRight (== '/'))
	satRight (== '>')
	case slash of
	  Just '/' -> do
	  	return (Node htmlTag attr Nothing)
	  Nothing -> do
	  	chs <- many (element)
	  	satRight (== '<')
	  	satRight (== '/')
	  	many white
	  	() <- allOf htmlTag
	  	many white
	  	satRight (== '>')
	  	return (Node htmlTag attr (Just chs))

parseAttribute = do
	key <- name
	many white
	satRight (== '=')
	many white
	val <- parseValue
	return (key, val)

parseValue = from unLeft <||> parseString

parseString = do
	satRight (== '"')
	cs <- many (satRight (/= '"'))
	satRight (== '"')
	return cs









parseClosures = whole closures

closures = HighProg <$> many (token >>= highElem)

highElem (Left q) = return (Quoted q)
highElem (Right '#') = closureDef -- <|> closureCall
highElem (Right c) = return (Code c)

closureDef = do
	many white
	ret <- parseJType
	many white
	Just ts <- whole parseParams <$> balanced ('(', ')')
	many white
	satRight (== '=')
	satRight (== '>')
	many white
	body <- closureBody
	return (Closure ret ts body)

closureBody = block <|> quoteResult <|> inParen
	where	block = balanced ('{', '}') >>= lift . whole closures
		quoteResult = from unLeft >>= \q -> lift $ whole closures $ blockify [Left q]
		inParen = balanced ('(', ')') >>= lift . whole closures . blockify

blockify e = (Right <$> "return (") ++ e ++ (Right <$> ");")

parseParams = interleave parseParam (satRight (== ','))

parseParam = do
	many white
	t <- parseJType
	many white
	x <- name
	many white
	return (t, x)


parseJType = do
	name <- JClass <$> parseJClass
	many white
	arglist <- optional (balanced ('<', '>'))
	arrs <- many (many white >> satRight (== '[') >> satRight (== ']'))
	case arglist of
	  Nothing -> return (foldr (const JArray) name arrs)
	  Just args -> case (whole (many white >> parseJArgs) args) of
	  	Nothing -> failure
	  	Just list -> return (foldr (const JArray) (JApply name list) arrs)
	
parseJClass = do
	parts <- interleave (className <|> name) (many white *> satRight (== '.') <* many white)
	guard (length parts > 0)
	guard (isUpper (head (last parts)))
	return parts

parseJArgs = interleave parseJType (many white *> satRight (== ',') <* many white)

balanced (open, close) = satRight (== open) >> Parser (rec [] 0)
	where	rec prev n [] = Nothing
		rec prev n (Left q:cs) = rec (Left q:prev) n cs
		rec prev n (Right c:cs)
			| c == close && n == 0 = Just (reverse prev, cs)
			| c == close = rec (Right c:prev) (n-1) cs
			| c == open =  rec (Right c:prev) (n+1) cs
			| otherwise = rec (Right c:prev) n cs








instance (Show h) => Show (Program h) where
	show (Prog xs) = xs >>= either (\x -> "(" ++ show x ++ ")") (:[])

instance Show Quote where
	show (Quote xs) = List.intercalate " + " (either (\p -> "(" ++ show p ++ ")") show <$> compactSimpl xs)

compactSimpl = foldr step []
	where	step (Left p) xs = (Left p:xs)
		step (Right c) (Right cs:xs) = (Right (c:cs):xs)
		step (Right c) xs = (Right [c]:xs)
		
instance Show XML where
	show (Text s) = "XML.text(" ++ show s ++ ")"
	show (Splice p) = "(" ++ show p ++ ")"
	show (Node tag attr Nothing)
		| Map.size attr == 0 = "XML.closed(" ++ show tag ++ ")"
		| otherwise = "XML.closed(" ++ show tag ++ ", " ++ showAttr attr ++ ")"
	show (Node tag attr (Just children))
		| Map.size attr == 0 = "XML.open(" ++ show tag ++ ")" ++ (children >>= showChild)
		| otherwise = "XML.open(" ++ show tag ++ ", " ++ showAttr attr ++ ")" ++ (children >>= showChild)

showAttr attr = "XML.attributes(" ++ (Map.toList attr >>= showPutAttr) ++ ")"
showPutAttr (key, Left prog) = "XML.entry(" ++ show key ++ ", " ++ show prog ++ ")"
showPutAttr (key, Right val) = "XML.entry(" ++ show key ++ ", " ++ show val ++ ")"

showChild (Text s) | all isSpace s = ""
showChild xml = ".add(" ++ show xml ++ ")"


instance (Show q) => Show (HighProg q) where
	show (HighProg xs) = xs >>= show
	
instance (Show q) => Show (HighLevel q) where
	show (Closure ret ts body) = "new " ++ show (closureType ret ts) ++ "() { public final " ++ show ret ++ " apply(" ++ showParams ts ++ ") { " ++ show body ++ " } }"
	show (Call f xs) = f ++ ".apply(" ++ show xs ++ ")"
	show (Quoted q) = "(" ++ show q ++ ")"
	show (Code c) = [c]

closureType ret ps = JApply (JClass ["Func" ++ num]) (ret:ts)
	where	num = show (length ps)
		ts = fst <$> ps

showParams ps = List.intercalate ", " (showParam <$> ps)
showParam (t, x) = "final " ++ show t ++ " " ++ x

instance Show JType where
	show (JClass path) = List.intercalate "." path
	show (JApply f ts) = show f ++ "<" ++ List.intercalate ", " (show <$> ts) ++ ">"
	show (JArray t) = show t ++ "[]"
	










data Parser t a = Parser { parse :: [t] -> Maybe (a, [t]) }

instance Functor (Parser t) where
	fmap = liftM
	
instance Monad (Parser t) where
	return x = Parser (\cs -> Just (x, cs))
	(>>=) p f = Parser (\cs -> case (parse p cs) of
				Nothing -> Nothing
				Just (x, xs) -> parse (f x) xs)
	fail s = failure
	
instance Applicative (Parser t) where
	pure = return
	(<*>) = ap

instance Alternative (Parser t) where
	empty = failure
	p <|> q = Parser (\cs -> parse p cs <|> parse q cs)

instance MonadPlus (Parser t) where
	mzero = failure
	mplus = (<|>)

failure = Parser (\cs -> Nothing)
token = Parser (\cs -> case cs of
		[] -> Nothing
		(x:xs) -> Just (x, xs))
		
p <||> q = (Left <$> p) <|> (Right <$> q)

interleave p q = ((:) <$> p <*> many (q >> p)) <|> return []

between start mid end = do
	start
	x <- mid
	end
	return x

lift = maybe failure return

sat p = token >>= \t -> if (p t) then (return t) else failure

end = Parser (\cs -> case cs of
	[] -> Just ((), [])
	_ -> Nothing)


allOf [] = return ()
allOf (c:cs) = satRight (== c) >> allOf cs

satRight p = (sat $ \t -> case t of { Right c -> p c; _ -> False }) >>= \(Right c) -> return c

from get = token >>= \t -> case (get t) of { Just v -> return v; _ -> failure }

unRight (Right r) = Just r
unRight _ = Nothing

unLeft (Left l) = Just l
unLeft _ = Nothing

nameLetter = satRight (\c -> isAlphaNum c || c == '-' || c == '_')
name = some nameLetter

tag = some nameLetter
className = (:) <$> satRight isUpper <*> many nameLetter

white = satRight isSpace

