package com.dataAccess.tables;


import com.dataClasses.Backend;
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
public final class Client {
	private Client() { }
	



	
	
	
	

	public static final class Id extends Key {		
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}

	public static final class FirstName extends Wrapper<String> {
		private FirstName(final String value) {
			super(value);
		}

		public static final Maybe<FirstName> parse(final String input) {
			return Maybe.just(new FirstName(input));
		}
	}

	public static final class LastName extends Wrapper<String> {
		private LastName(final String value) {
			super(value);
		}

		public static final Maybe<LastName> parse(final String input) {
			return Maybe.just(new LastName(input));
		}
	}
	
	public static final class PhoneNumber extends Wrapper<String> {
		private PhoneNumber(final String value) {
			super(value);
		}

		public static final Maybe<PhoneNumber> parse(final String input) {
			return Maybe.just(new PhoneNumber(input));
		}
	}
	
	public static final class Email extends Wrapper<String> {
		private Email(final String value) {
			super(value);
		}

		public static final Maybe<Email> parse(final String input) {
			return Maybe.just(new Email(input));
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	public static final class Input {
		
		public final Maybe<String> firstName;
		public final Maybe<String> lastName;
		public final Maybe<String> homePhoneNumber;
		public final Maybe<String> cellPhoneNumber;
		public final Maybe<String> email;
				
		public Input(
				final Maybe<String> firstName,
				final Maybe<String> lastName,
				final Maybe<String> homePhoneNumber,
				final Maybe<String> cellPhoneNumber,
				final Maybe<String> email) {
			this.firstName = firstName;
			this.lastName = lastName;
			this.homePhoneNumber = homePhoneNumber;
			this.cellPhoneNumber = cellPhoneNumber;
			this.email = email;
		}

		public final Builder parseFields() {
			final Builder builder = new Builder();
			
			if(!firstName.isNull())
				builder.firstName = FirstName.parse(firstName.value());
			if(!lastName.isNull()) 
				builder.lastName = LastName.parse(lastName.value());
			if(!homePhoneNumber.isNull())
				builder.homePhoneNumber = PhoneNumber.parse(homePhoneNumber.value());
			if(!cellPhoneNumber.isNull())
				builder.cellPhoneNumber = PhoneNumber.parse(cellPhoneNumber.value());
			if(!email.isNull())
				builder.email = Email.parse(email.value());

			return builder;
		}

		public String getFirstName() {
			return firstName.or("");
		}

		public String getLastName() {
			return lastName.or("");
		}

		public String getHomePhoneNumber() {
			return homePhoneNumber.or("");
		}

		public String getCellPhoneNumber() {
			return cellPhoneNumber.or("");
		}

		public String getEmail() {
			return email.or("");
		}

		@Override
		public String toString() {
			return "Input [firstName=" + firstName
					+ ", lastName=" + lastName + ", homePhoneNumber="
					+ homePhoneNumber + ", cellPhoneNumber=" + cellPhoneNumber
					+ ", email=" + email + "]";
		}
	}
	
	
	
	
	


	
	
	public static final class Builder {
		
		public Maybe<Address.Id> shippingAddressID = Maybe.nothing();
		public Maybe<Address.Id> billingAddressID = Maybe.nothing();
		public Maybe<FirstName> firstName = Maybe.nothing();
		public Maybe<LastName> lastName = Maybe.nothing();
		public Maybe<PhoneNumber> homePhoneNumber = Maybe.nothing();
		public Maybe<PhoneNumber> cellPhoneNumber = Maybe.nothing();
		public Maybe<Email> email = Maybe.nothing();
		
		public Builder() { }
		
		public Builder(
				final Maybe<Address.Id> shippingAddressID,
				final Maybe<Address.Id> billingAddressID,
				final Maybe<FirstName> firstName,
				final Maybe<LastName> lastName,
				final Maybe<PhoneNumber> homePhoneNumber,
				final Maybe<PhoneNumber> cellPhoneNumber,
				final Maybe<Email> email) {
			this.shippingAddressID = shippingAddressID;
			this.billingAddressID = billingAddressID;
			this.firstName = firstName;
			this.lastName = lastName;
			this.homePhoneNumber = homePhoneNumber;
			this.cellPhoneNumber = cellPhoneNumber;
			this.email = email;
		}

		public final Maybe<Data> build() {
			if(shippingAddressID.isNull()) return Maybe.nothing();
			if(billingAddressID.isNull()) return Maybe.nothing();
			if(firstName.isNull()) return Maybe.nothing();
			if(lastName.isNull()) return Maybe.nothing();
			if(homePhoneNumber.isNull()) return Maybe.nothing();
			if(cellPhoneNumber.isNull()) return Maybe.nothing();
			if(email.isNull()) return Maybe.nothing();
			
			return Maybe.just(new Data(
				shippingAddressID.value(),
				billingAddressID.value(),
				firstName.value(),
				lastName.value(),
				homePhoneNumber.value(),
				cellPhoneNumber.value(),
				email.value()
			));
		}

		public final Maybe<Address.Id> getShippingAddressID() {
			return shippingAddressID;
		}

		public final void setShippingAddressID(Maybe<Address.Id> shippingAddressID) {
			this.shippingAddressID = shippingAddressID;
		}

		public final Maybe<Address.Id> getBillingAddressID() {
			return billingAddressID;
		}

		public final void setBillingAddressID(Maybe<Address.Id> billingAddressID) {
			this.billingAddressID = billingAddressID;
		}

		public final Maybe<FirstName> getFirstName() {
			return firstName;
		}

		public final void setFirstName(Maybe<FirstName> firstName) {
			this.firstName = firstName;
		}

		public final Maybe<LastName> getLastName() {
			return lastName;
		}

		public final void setLastName(Maybe<LastName> lastName) {
			this.lastName = lastName;
		}

		public final Maybe<PhoneNumber> getHomePhoneNumber() {
			return homePhoneNumber;
		}

		public final void setHomePhoneNumber(Maybe<PhoneNumber> homePhoneNumber) {
			this.homePhoneNumber = homePhoneNumber;
		}

		public final Maybe<PhoneNumber> getCellPhoneNumber() {
			return cellPhoneNumber;
		}

		public final void setCellPhoneNumber(Maybe<PhoneNumber> cellPhoneNumber) {
			this.cellPhoneNumber = cellPhoneNumber;
		}

		public final Maybe<Email> getEmail() {
			return email;
		}

		public final void setEmail(Maybe<Email> email) {
			this.email = email;
		}

		@Override
		public String toString() {
			return "Builder [shippingAddressID=" + shippingAddressID
					+ ", billingAddressID=" + billingAddressID + ", firstName="
					+ firstName + ", lastName=" + lastName
					+ ", homePhoneNumber=" + homePhoneNumber
					+ ", cellPhoneNumber=" + cellPhoneNumber + ", email="
					+ email + "]";
		}
	}

	
	
	
	
	
	
	
	
	public static final class Data {
		
		public final Address.Id shippingAddressID;
		public final Address.Id billingAddressID;
		public final FirstName firstName;
		public final LastName lastName;
		public final PhoneNumber homePhoneNumber;
		public final PhoneNumber cellPhoneNumber;
		public final Email email;
		
		public Data(
				final Address.Id shippingAddressID,
				final Address.Id billingAddressID,
				final FirstName firstName,
				final LastName lastName,
				final PhoneNumber homePhoneNumber,
				final PhoneNumber cellPhoneNumber,
				final Email email) {
			this.shippingAddressID = shippingAddressID;
			this.billingAddressID = billingAddressID;
			this.firstName = firstName;
			this.lastName = lastName;
			this.homePhoneNumber = homePhoneNumber;
			this.cellPhoneNumber = cellPhoneNumber;
			this.email = email;
		}

		public final Address.Id getShippingAddressID() {
			return shippingAddressID;
		}

		public final Address.Id getBillingAddressID() {
			return billingAddressID;
		}

		public final FirstName getFirstName() {
			return firstName;
		}

		public final LastName getLastName() {
			return lastName;
		}

		public final PhoneNumber getHomePhoneNumber() {
			return homePhoneNumber;
		}

		public final PhoneNumber getCellPhoneNumber() {
			return cellPhoneNumber;
		}

		public final Email getEmail() {
			return email;
		}

		@Override
		public String toString() {
			return "Data [shippingAddressID=" + shippingAddressID
					+ ", billingAddressID=" + billingAddressID 
					+ ", firstName=" + firstName + ", lastName="
					+ lastName + ", homePhoneNumber=" + homePhoneNumber
					+ ", cellPhoneNumber=" + cellPhoneNumber + ", email="
					+ email + "]";
		}
	}
}
