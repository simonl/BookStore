package com.dataAccess.tables;

import java.sql.Timestamp;

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
public final class Review {
	private Review() { }
	

	
	



	
	
	
	

	public static final class Id extends Key {		
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}
	
	public static final class Rating extends Wrapper<Integer> {
		private Rating(final Integer value) {
			super(value);
		}
		
		public static final Maybe<Rating> from(final int value) {
			if(value < 1 || 5 < value) Maybe.nothing();
			
			return Maybe.just(new Rating(value));
		}

		public static final Maybe<Rating> parse(final String input) {
			try {
				return from(Integer.parseInt(input));
			} catch(final NumberFormatException ex) {
				return Maybe.nothing();
			}
		}
	}

	public static final class Text extends Wrapper<String> {
		private Text(final String value) {
			super(value);
		}

		public static final Maybe<Text> parse(final String input) {
			if(input.length() == 0) return Maybe.nothing();
			if(input.length() > 750) return Maybe.nothing();
			
			return Maybe.just(new Text(input));
		}
	}
	
	public static enum Status {
		PENDING(0),
		APPROVED(1),
		REJECTED(2);
		
		public final int code;
		
		private Status(final int code) {
			this.code = code;
		}
		
		public static final Maybe<Status> from(final int value) {
			switch(value) {
				case 0: return Maybe.just(PENDING);
				case 1: return Maybe.just(APPROVED);
				case 2: return Maybe.just(REJECTED);
				default: return Maybe.nothing();
			}
		}
	}

	
	
	
	
	public static final class Data {
		
		public final User.Id user;
		public final Book.Id book;
		public final Timestamp createdAt;
		public final Rating rating;
		public final Maybe<Text> reviewText;
		public final Status status;
		
		public Data(
				final User.Id user,
				final Book.Id book,
				final Timestamp createdAt,
				final Rating rating,
				final Maybe<Text> reviewText,
				final Status status) {
			this.user = user;
			this.book = book;
			this.createdAt = createdAt;
			this.rating = rating;
			this.reviewText = reviewText;
			this.status = status;
		}

		public final User.Id getUser() {
			return user;
		}

		public final Book.Id getBook() {
			return book;
		}

		public final Timestamp getCreatedAt() {
			return createdAt;
		}

		public final Rating getRating() {
			return rating;
		}

		public final Maybe<Text> getReviewText() {
			return reviewText;
		}

		public final Status getStatus() {
			return status;
		}

		@Override
		public String toString() {
			return "Data [user=" + user + ", book=" + book + ", createdAt="
					+ createdAt + ", rating=" + rating + ", reviewText="
					+ reviewText + ", status=" + status + "]";
		}
	}
}
