module Tables where

import Data.List as List
import Control.Monad
import Data.Char as Char

type TableName = String
type Nat = Int
data SQLType
	= Text
	| TimeStamp
	| Unsigned
	| Count
	| Money
	| FixedChar Nat
	| Enum Nat
	| Elem TableName
	| Optional SQLType
	| Unique SQLType




typeClause name Text = "TEXT NOT NULL"
typeClause name TimeStamp = "TIMESTAMP NOT NULL DEFAULT current_timestamp"
typeClause name Unsigned = "INT UNSIGNED NOT NULL"
typeClause name Count = "INT UNSIGNED NOT NULL DEFAULT 0"
typeClause name Money = "DECIMAL(5, 2) NOT NULL"
typeClause name (FixedChar n) = "CHAR(" ++ show n ++ ") NOT NULL"
typeClause name (Enum n) = "INT UNSIGNED NOT NULL CHECK (" ++ name ++ " < " ++ show n ++ ")"
typeClause name (Elem t) = "INT NOT NULL, FOREIGN KEY (" ++ name ++ ") REFERENCES " ++ t ++ "(id)"
typeClause name (Optional Text) = "TEXT"
typeClause name (Optional Unsigned) = "INT UNSIGNED"
typeClause name (Optional Money) = "DECIMAL(5, 2)"
typeClause name (Optional (FixedChar n)) = "CHAR(" ++ show n ++ ")"
typeClause name (Optional (Enum n)) = "INT UNSIGNED CHECK (" ++ name ++ " < " ++ show n ++ ")"
typeClause name (Optional (Elem t)) = "INT, FOREIGN KEY (" ++ name ++ ") REFERENCES " ++ t ++ "(id)"
typeClause name (Optional _) = undefined
typeClause name (Unique (Optional _)) = undefined
typeClause name (Unique (Unique _)) = undefined
typeClause name (Unique sub) = typeClause name sub ++ ", UNIQUE(" ++ name ++ ")"

fieldClause (name, sqlType) = "\t" ++ name ++ " " ++ typeClause name sqlType
idClause = "\tid INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id)"

createStmt (table, fields) = "CREATE TABLE " ++ table ++ "(" ++ body ++ ");\n"
	where	body = "\n" ++ List.intercalate ",\n" (idClause:clauses) ++ "\n"
		clauses = fmap fieldClause fields
dropStmt table = "DROP TABLE " ++ table ++ ";"

generateInit tables = List.intercalate "\n" (drops ++ ["\n"] ++ creates)
	where	drops = fmap (dropStmt . fst) (reverse tables)
		creates = fmap createStmt tables


abstractKey table = List.intercalate "\n" lines
	where	name = className table
		lines = [
			"public final class " ++ name ++ " {",
			"\tprivate final int id;",
			"\tprivate " ++ name ++ "(final int id) {",
			"\t\tthis.id = id",
			"\t}",
			"}"]

dataClass (table, fields) = List.intercalate "\n" lines
	where	name = className table ++ "Data"
		header = "public final class " ++ name ++ " {\n"
		staticName = "\tpublic static final String table = " ++ show table ++ ";"
		staticFields = "\tpublic static final String[] fields = {" ++ List.intercalate ", " (fmap (show . fst) fields) ++ "};\n"
		members = fmap dataMember fields
		consHeader = "\tpublic " ++ name ++ "("
		params = List.intercalate ",\n" (fmap dataParam fields) ++ ") {"
		sets = fmap dataSet fields
		consFooter = "\t}"
		footer = "}"
		
		lines = [header, staticName, staticFields] ++ members ++ [consHeader, params] ++ sets ++ [consFooter, footer]
		
dataMember (name, sqlType) = "\tpublic final " ++ javaType sqlType ++ " " ++ javaName name ++ ";"
dataParam (name, sqlType) = "\t\t\tfinal " ++ javaType sqlType ++ " " ++ javaName name
dataSet (name, sqlType) = "\t\tthis." ++ javaName name ++ " = " ++ javaName name ++ ";"
		
className cs = Char.toUpper n : ame
	where	(n:ame) = javaName cs

javaName ('_':c:cs) = Char.toUpper c : javaName cs
javaName (c:cs) = c : javaName cs
javaName [] = []

javaType Text = "String"
javaType TimeStamp = "java.sql.Timestamp"
javaType Unsigned = "int"
javaType Count = "int"
javaType Money = "java.math.BigDecimal"
javaType (FixedChar n) = "String"
javaType (Enum n) = "int"
javaType (Elem t) = "Database." ++ className t
javaType (Optional sqlType) = "Maybe<" ++ javaType sqlType ++ ">"
javaType (Unique sqlType) = javaType sqlType







getMethod (name, fields) = List.intercalate "\n" lines
	where	sig = "public final " ++ className name ++ "Data" ++ " get(final " ++ className name ++ " " ++ javaName name ++ ") throws SQLException {"
		result = "\tfinal ResultSet result = getData(" ++ show name ++ ", " ++ javaName name ++ ".id);"
		open = "\treturn new " ++ className name ++ "Data("
		gets = List.intercalate ",\n" (fmap ("\t\t" ++) (fmap dataGet fields))
		close = "\t);"
		end = "}"
		
		lines = [sig, result, open, gets, close, end]

dataGet (name, Text) = "result.getString(" ++ show name ++ ")"
dataGet (name, TimeStamp) = "result.getTimestamp(" ++ show name ++ ")"
dataGet (name, Unsigned) = "result.getInt(" ++ show name ++ ")"
dataGet (name, Count) = "result.getInt(" ++ show name ++ ")"
dataGet (name, Money) = "result.getBigDecimal(" ++ show name ++ ")"
dataGet (name, FixedChar n) = "result.getString(" ++ show name ++ ")"
dataGet (name, Enum n) = "result.getInt(" ++ show name ++ ")"
dataGet (name, Elem t) = "new " ++ className t ++ "(" ++ dataGet (name, Unsigned) ++ ")"
dataGet (name, Optional sqlType) = "Maybe.from(" ++ dataGet (name, sqlType) ++ ")"
dataGet (name, Unique sqlType) = dataGet (name, sqlType)






{--
	public Client put(final ClientData data) throws SQLException {
		final int id = usingPreparedInsert(ClientData.table, ClientData.fields, new Preparer() {
			@Override
			public void prepare(final PreparedStatement statement) throws SQLException {
				int i = 1;
				statement.setInt(i++, data.shippingAddressID.id);
				statement.setInt(i++, data.billingAddressID.id);
				statement.setString(i++, data.title);
				statement.setString(i++, data.firstName);
				statement.setString(i++, data.lastName);
				statement.setString(i++, data.homePhoneNumber);
				statement.setString(i++, data.cellPhoneNumber);
				statement.setString(i++, data.email);
				statement.setString(i++, data.login);
				statement.setString(i++, data.password);
				statement.setInt(i++, data.manager ? 1 : 0);
			} 			
		});
		
		return new Client(id);
	}	
--}

putMethod (name, fields) = List.intercalate "\n" lines
	where	sig = "public final " ++ className name ++ " put(final " ++ className name ++ "Data data) throws SQLException {"
		stmt = "\tfinal PreparedStatement statement = preparedInsert(" ++ className name ++ "Data.table, " ++ className name ++ "Data.fields);"
		ctr = "\tint i = 1;"
		sets = undefined
		lines = [sig, stmt]





main = writeFile "tables.sql" (generateInit tables)


tables = [
	("address", address),
	("client", client),
	("genre", genre),
	("book", book),
	("review", review),
	("purchase", purchase),
	("eformat", eformat),
	("ebook", ebook),
	("survey", survey),
	("survey_choice", survey_choice),
	("global_data", global_data)]
	
address = [
	("city", Text),
	("province", Text),
	("country", Text),
	("postal_code", FixedChar 6),
	("address", Text)]

client = [
	("shipping_address_id", Elem "address"),
	("billing_address_id", Elem "address"),
	("title", Optional Text),
	("first_name", Text),
	("last_name", Text),
	("home_phone", Text),
	("cell_phone", Text),
	("email", Text),
	("login", Text),
	("password", Text),
	("manager", Enum 2),
	("last_genre", Optional Text)]

genre = [("name", Text)]
book = [
	("date_entered", TimeStamp),
	("title", Text),
	("author", Text),
	("publisher", Text),
	("isbn_10", Unique (FixedChar 10)),
	("isbn_13", Unique (FixedChar 14)),
	("genre", Elem "genre"),
	("description", Text),
	("number_of_pages", Unsigned),
	("weight", Unsigned),
	("dimensions", Text),
	("thumbnail", Text),
	("cover", Text),
	("list_price", Money),
	("sale_price", Money),
	("wholesale_price", Money),
	("number_of_books", Count)]

review = [
	("client_id", Elem "client"),
	("book_id", Elem "book"),
	("created_at", TimeStamp),
	("rating", Enum 5),
	("review_text", Optional Text),
	("approved", Enum 2)]

purchase = [
	("client_id", Elem "client"),
	("book_id", Elem "book"),
	("price", Money),
	("purchases_on", TimeStamp),
	("number_of_copies", Unsigned),
	("electronic", Enum 2)]

eformat = [("name", Text)]
ebook = [
	("book_id", Elem "book"),
	("eformat_id", Elem "eformat")]

survey = [("question", Text)]
survey_choice = [
	("survey_id", Elem "survey"),
	("choice", Text),
	("votes", Count)]

global_data = [("current_survey", Optional (Elem "survey"))]

 
 