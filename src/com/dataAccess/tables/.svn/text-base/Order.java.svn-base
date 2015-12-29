package com.dataAccess.tables;

import java.sql.Timestamp;

import com.dataClasses.Backend;
import com.dataClasses.Key;
import com.dataClasses.Maybe;
import com.dataClasses.Nat;

public final class Order {
	private Order() { }
	
	
	
	
	
	
	

	
	

	public static final class Id extends Key {		
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}
	
	
	
	
	public static final class Data {
		
		public final Book.Id book;
		public final Timestamp orderedOn;
		public final Maybe<Timestamp> receivedOn;
		public final Nat numberOfCopies;
		
		public Data(
				final Book.Id book,
				final Timestamp createdOn,
				final Maybe<Timestamp> receivedOn,
				final Nat numberOfCopies) {	
			this.book = book;
			this.orderedOn = createdOn;
			this.receivedOn = receivedOn;
			this.numberOfCopies = numberOfCopies;
		}

		public final Book.Id getBook() {
			return book;
		}

		public final Timestamp getOrderedOn() {
			return orderedOn;
		}

		public final Maybe<Timestamp> getReceivedOn() {
			return receivedOn;
		}

		public final Nat getNumberOfCopies() {
			return numberOfCopies;
		}

		@Override
		public String toString() {
			return "Data [book=" + book + ", orderedOn=" + orderedOn
					+ ", receivedOn=" + receivedOn + ", numberOfCopies="
					+ numberOfCopies + "]";
		}
	}

}
