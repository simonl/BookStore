import Data.Set as Set
import Data.List as List

type Question = String
type Answer = String

data Survey = Survey {
	question :: Question,
	choices :: Set Answer
}

surveys = [
	Survey {
		question = "What kind of books you like?",
		choices = Set.fromList [
			"Science-Fiction", 
			"Romance", 
			"History", 
			"Horror"]
	},
	Survey {
		question = "How old are you?",
		choices = Set.fromList [
			"Between 10 and 18", 
			"Between 19 and 25", 
			"Between 26 and 50", 
			"50 or more"]
	},
	Survey {
		question = "Do you prefer:",
		choices = Set.fromList [
			"Ebooks", 
			"Physical books"]
	},
	Survey {
		question = "What are you doing of your old books?",
		choices = Set.fromList [
			"I keep them", 
			"I sell them", 
			"I give them", 
			"I throw them away"]
	},
	Survey {
		question = "Do you think that the price of books is too expensive?",
		choices = Set.fromList [
			"Yes, it is often extremely expensive", 
			"Yes, it is sometimes a bit expensive", 
			"No, we can always buy paperback", 
			"No, when we love books, we do not count"]
	}]

string s = "'" ++ (s >>= \c -> if c == '\'' then "\\'" else [c]) ++ "'"

generateQuestion survey = "INSERT INTO survey(question) VALUE(" ++ string (question survey) ++ ");"
generateChoice surveyId choice = "INSERT INTO survey_choice(survey_id, choice) VALUE(" ++ show surveyId ++ ", " ++ string choice ++ ");"
generateSurvey surveyId survey = generateQuestion survey : fmap (generateChoice surveyId) (Set.toList (choices survey))

statements = do
	(id, survey) <- zip [1..] surveys
	statement <- generateSurvey id survey ++ [""]
	return statement

main = writeFile "surveys.sql" (List.intercalate "\n" statements ++ "\n")





