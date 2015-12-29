package com.dataAccess.tables;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.dataClasses.Backend;
import com.dataClasses.Key;
import com.dataClasses.Maybe;
import com.dataClasses.Nat;
import com.dataClasses.Wrapper;

/**  
 * Defines types and classes related to the database table with the same name
 * There is a separation between the ID, which refers to a row, and the other fields in a row
 * Each database field get its own abstract data type and parsing/validating constructor
 * 
 * The Survey.Data objects have a field that contains a set of answers, 
 *   which differs from the database representation
 *   
 * @author Simon Langlois
 */
public final class Survey {
	private Survey() { }
	
	
	
	
	


	
	
	
	
	
	

	public static final class Id extends Key {		
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}
	
	public static final class Question extends Wrapper<String> {
		private Question(final String value) {
			super(value);
		}
		
		public static final Maybe<Question> parse(final String input) {
			if(input.length() == 0) return Maybe.nothing();
			
			return Maybe.just(new Question(input));
		}
	}

	public static final class Choice extends Wrapper<String> {
		private Choice(final String value) {
			super(value);
		}
		
		public static final Maybe<Choice> parse(final String input) {
			if(input.length() == 0) return Maybe.nothing();
			
			return Maybe.just(new Choice(input));
		}
	}
	
	public static final class Choices extends Wrapper<Set<Choice>> {
		private Choices(final Set<Choice> values) {
			super(values);
		}
		
		public int getSize() {
			return value.size();
		}
		
		public static final Maybe<Choices> from(final Set<Choice> values) {
			if(values.size() < 2) return Maybe.nothing();
			
			return Maybe.just(new Choices(Collections.unmodifiableSet(values)));
		}
	}
	
	public static final class Votes extends Wrapper<Map<Choice, Nat>> {		
		private Votes(final Choices domain) {
			super(init(domain));
		}
		
		private static final Map<Choice, Nat> init(final Choices domain) {
			final Map<Choice, Nat> values = new HashMap<Choice, Nat>();
			
			for(final Choice choice : domain.value) {
				values.put(choice, Nat.from(0).value());
			}
			
			return Collections.unmodifiableMap(values);
		}
		
		public Votes(final Backend.Authority token, final Map<Choice, Nat> values) {
			super(Collections.unmodifiableMap(values));
		}
	}

	
	
	
	
	public static final class Data {
		
		public final Question question;
		public final Choices choices;
		public final Votes votes;
		
		public Data(
				final Question question,
				final Choices choices) {
			this.question = question;
			this.choices = choices;
			this.votes = new Votes(choices);
		}
		
		public Data(
				final Backend.Authority token,
				final Question question,
				final Choices choices,
				final Votes votes) {		
			this.question = question;
			this.choices = choices;
			this.votes = votes;
		}

		public final Question getQuestion() {
			return question;
		}

		public final Choices getChoices() {
			return choices;
		}
		
		public final Votes getVotes() {
			return votes;
		}

		@Override
		public String toString() {
			return "Data [question=" + question + ", choices=" + choices + "]";
		}
	}
}
