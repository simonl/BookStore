package com.dataAccess.tables;

import java.sql.Timestamp;

import com.dataClasses.Backend;
import com.dataClasses.Key;
import com.dataClasses.Money;
import com.dataClasses.Nat;

public final class Purchase {
	private Purchase() { }
	
	
	
	
	


	
	
	

	
	

	public static final class Id extends Key {		
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}
	
	
	
	
	public static final class Data {
		
		public final User.Id user;
		public final Book.Id book;
		public final Money price;
		public final Timestamp purchasedOn;
		public final Nat numberOfCopies;
		public final boolean electronic;
		
		public Data(
				final User.Id user,
				final Book.Id book,
				final Money price,
				final Timestamp purchasedOn,
				final Nat numberOfCopies,
				final boolean electronic) {	
			this.user = user;
			this.book = book;
			this.price = price;
			this.purchasedOn = purchasedOn;
			this.numberOfCopies = numberOfCopies;
			this.electronic = electronic;
		}

		public final User.Id getUser() {
			return user;
		}

		public final Book.Id getBook() {
			return book;
		}

		public final Money getPrice() {
			return price;
		}

		public final Timestamp getPurchasedOn() {
			return purchasedOn;
		}

		public final Nat getNumberOfCopies() {
			return numberOfCopies;
		}

		public final boolean isElectronic() {
			return electronic;
		}

		@Override
		public String toString() {
			return "Data [user=" + user + ", book=" + book + ", price="
					+ price + ", purchasedOn=" + purchasedOn
					+ ", numberOfCopies=" + numberOfCopies + ", electronic="
					+ electronic + "]";
		}
	}

}
