package com.dataClasses;

public final class Nat extends Wrapper<Integer> {
	private Nat(final Integer value) {
		super(value);
	}
	
	public static final Maybe<Nat> from(final int value) {
		if(value < 0) return Maybe.nothing();
		
		return Maybe.just(new Nat(value));
	}
	
	public static final Maybe<Nat> parse(final String input) {
		try { 
			return from(Integer.parseInt(input));
		} catch(final NumberFormatException ex) {
			return Maybe.nothing();
		}
	}
}
