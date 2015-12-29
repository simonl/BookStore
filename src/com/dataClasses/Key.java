package com.dataClasses;


/**
 * Base class for all the primary keys into the database tables
 *
 */
public abstract class Key extends Wrapper<Integer> {	
	public Key(final Backend.Authority token, final int value) {
		super(value);
	}
}
