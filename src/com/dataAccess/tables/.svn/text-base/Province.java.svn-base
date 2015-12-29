package com.dataAccess.tables;

import java.math.BigDecimal;

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
public final class Province {

	public static final class Id extends Key {		
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
		
	}
	
	public static final class Name extends Wrapper<String> {
		private Name(final String value) {
			super(value);
		}
		
		public static final Maybe<Name> parse(final String input) {
			if(input.length() == 0) return Maybe.nothing();
			
			return Maybe.just(new Name(input));
		}
	}
	
	public static final class Rate extends Wrapper<BigDecimal> {
		private Rate(final BigDecimal value) {
			super(value);
		}
		
		public static final Maybe<Rate> from(final BigDecimal rate) {
			if(rate.compareTo(BigDecimal.ZERO) < 0) return Maybe.nothing();
			if(rate.compareTo(BigDecimal.ONE) > 0) return Maybe.nothing();
			
			return Maybe.just(new Rate(rate));
		}
		
		public static final Maybe<Rate> parse(final String input) {
			try {				
				return from(new BigDecimal(input));
			} catch(final NumberFormatException ex) {
				return Maybe.nothing();
			}
		}
	}
	
	public static final class Data {
		public final Name name;
		public final Rate taxRate;
		public final Maybe<Rate> secondTaxRate;
		
		public Data(
				final Name name, 
				final Rate taxRate,
				final Maybe<Rate> secondTaxRate) {
			this.name = name;
			this.taxRate = taxRate;
			this.secondTaxRate = secondTaxRate;
		}

		public Name getName() {
			return name;
		}

		public Rate getTaxRate() {
			return taxRate;
		}

		public Maybe<Rate> getSecondTaxRate() {
			return secondTaxRate;
		}

		@Override
		public String toString() {
			return "Data [name=" + name + ", taxRate=" + taxRate
					+ ", secondTaxRate=" + secondTaxRate + "]";
		}
	}	
}
