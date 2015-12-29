package com.dataClasses;

public enum Month {
	January,
	February,
	March,
	April,
	May,
	June,
	July,
	August,
	September,
	October,
	November,
	December;
	
	public static final Maybe<Month> parse(final String input) {
		try {
			return Maybe.just(valueOf(input));
		} catch(final IllegalArgumentException ex) {
			return Maybe.nothing();
		}
	}
}
