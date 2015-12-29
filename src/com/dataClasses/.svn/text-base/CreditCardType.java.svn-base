package com.dataClasses;

public enum CreditCardType {
	MasterCard,
	Visa;
	
	public static final Maybe<CreditCardType> parse(final String input) {
		try {
			return Maybe.just(valueOf(input));
		} catch(final IllegalArgumentException ex) {
			return Maybe.nothing();
		}
	}
	
	public static final int sum(final byte[] number) {

		int sum = 0;
		
		for(final byte digit : number) {
			if(digit % 2 == number.length % 2) {
				final int n = digit * 2;
				sum += (n / 10) + (n % 10);
			} else {
				sum += digit;
			}
		}
		
		return sum;
	}
	
	public final boolean validate(final byte[] number) {
		switch(this) {
			case MasterCard: {
				if(number.length != 16)
					return false;
				if(number[0] != 5)
					return false;
				if(number[1] == 0) 
					return false;
				if(number[2] > 5)
					return false;
			} break;
			case Visa: {
				if(number.length != 13 && number.length != 16)
					return false;
				if(number[0] != 4)
					return false;
			} break;
		}
		
		if(sum(number) % 10 != 0)
			return false;
		
		return true;
	}
}
