package com.dataClasses;

import java.math.BigDecimal;

/**
 * @author Simon Langlois
 */
public class Money extends Wrapper<BigDecimal> {
	private Money(final BigDecimal value) {
		super(value);
	}
	
	public static final Maybe<Money> from(final BigDecimal value) {
		if(value.signum() < 0) return Maybe.nothing();
		
		return Maybe.just(new Money(value));
	}
	
	public static final Maybe<Money> parse(final String input) {
		try {
			return from(new BigDecimal(input));
		} catch(final NumberFormatException ex) {
			return Maybe.nothing();
		}
	}
}
