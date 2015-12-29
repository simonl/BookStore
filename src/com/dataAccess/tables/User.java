package com.dataAccess.tables;


import com.dataClasses.Backend;
import com.dataClasses.Database;
import com.dataClasses.Key;
import com.dataClasses.Maybe;
import com.dataClasses.Wrapper;

/**  
 * Defines types and classes related to the database table with the same name
 * There is a separation between the ID, which refers to a row, and the other fields in a row
 * Each database field get its own abstract data type and parsing/validating constructor
 * 
 * @author Simon Langlois
 */
public final class User {
	private User() { }
	



	
	
	
	

	public static class Id extends Key {
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}
	
	public static final class Authority extends Wrapper<Id> {
		public final Id reference;
		
		public Authority(final Database.Authority token, final Id reference) {
			super(reference);
			this.reference = reference;
		}
		
		public Id getReference() {
			return reference;
		}
	}

	public static final class Login extends Wrapper<String> {
		private Login(final String value) {
			super(value);
		}

		public static final Maybe<Login> parse(final String input) {
			return Maybe.just(new Login(input));
		}
	}
	
	public static final class Password extends Wrapper<String> {
		private Password(final String value) {
			super(value);
		}

		public static final Maybe<Password> parse(final String input) {
			return Maybe.just(new Password(input));
		}
	}
	
	
	
	
	
	
	
	
	
	
	public static final class Input {
		
		public final Maybe<String> login;
		public final Maybe<String> password;
				
		public Input(
				final Maybe<String> login,
				final Maybe<String> password) {
			this.login = login;
			this.password = password;
		}

		public final Builder parseFields() {
			final Builder builder = new Builder();
			
			if(!login.isNull())
				builder.login = Login.parse(login.value());
			if(!password.isNull())
				builder.password = Password.parse(password.value());
		
			return builder;
		}

		public String getLogin() {
			return login.or("");
		}

		public String getPassword() {
			return password.or("");
		}

		@Override
		public String toString() {
			return "Input [firstName="
					+ ", login=" + login + ", password="
					+ password + "]";
		}
	}
	
	
	
	
	


	
	
	public static final class Builder {
		
		public Maybe<Maybe<Client.Id>> clientID = Maybe.nothing();
		public Maybe<Login> login = Maybe.nothing();
		public Maybe<Password> password = Maybe.nothing();
		
		public Builder() { }
		
		public Builder(
				final Maybe<Maybe<Client.Id>> clientID,
				final Maybe<Login> login,
				final Maybe<Password> password) {
			this.login = login;
			this.password = password;
		}

		public final Maybe<NewData> build() {
			if(clientID.isNull()) return Maybe.nothing();
			if(login.isNull()) return Maybe.nothing();
			if(password.isNull()) return Maybe.nothing();
			
			return Maybe.just(new NewData(
				clientID.value(),
				login.value(),
				password.value()
			));
		}

		public final Maybe<Login> getLogin() {
			return login;
		}

		public final void setLogin(Maybe<Login> login) {
			this.login = login;
		}

		public final Maybe<Password> getPassword() {
			return password;
		}

		public final void setPassword(Maybe<Password> password) {
			this.password = password; 
		}

		@Override
		public String toString() {
			return "Builder [shippingAddressID=" + 
			", login=" + login + ", password=" + password + "]";
		}
	}

	
	
	
	
	
	
	public static final class NewData {
		public final Maybe<Client.Id> clientID;
		public final Login login;
		public final Password password;

		public NewData(
				final Maybe<Client.Id> clientID,
				final Login login,
				final Password password) {
			this.clientID = clientID;
			this.login = login;
			this.password = password;
		}

		public final Maybe<Client.Id> getClientID() {
			return clientID;
		}
		
		public final Login getLogin() {
			return login;
		}

		public final Password getPassword() {
			return password;
		}

		@Override
		public String toString() {
			return "Data [clientID="
					+ ", login=" + login + ", password=" + password + "]";
		}
	}
	
	
	
	
	
	
	public static final class Data {
		
		public final Maybe<Client.Id> clientID;
		public final Login login;
		public final Password password;
		public final boolean manager;
		public final Maybe<Book.Genre> lastGenre;
		
		public Data(
				final Maybe<Client.Id> clientID,
				final Login login,
				final Password password,
				final boolean manager,
				final Maybe<Book.Genre> lastGenre) {
			this.clientID = clientID;
			this.login = login;
			this.password = password;
			this.manager = manager;
			this.lastGenre = lastGenre;
		}

		public final Maybe<Client.Id> getClientID() {
			return clientID;
		}
		
		public final Login getLogin() {
			return login;
		}

		public final Password getPassword() {
			return password;
		}

		public final boolean getManager() {
			return manager;
		}

		public Maybe<Book.Genre> getLastGenre() {
			return lastGenre;
		}
		
		@Override
		public String toString() {
			return "Data [clientID="
					+ ", login=" + login + ", password=" + password
					+ ", lastGenre=" + lastGenre + "]";
		}
	}
}
