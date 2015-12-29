package com.dataClasses;

public final class ResultNotUnique extends Exception {
	public ResultNotUnique() {
		
	}
	public ResultNotUnique(final String string) {
		super(string);
	}

	private static final long serialVersionUID = 1L;
}