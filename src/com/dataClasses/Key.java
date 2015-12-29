package com.dataClasses;


/**
 * Base class for all the primary keys of database tables
 * Can only be instantiated by the trusted Backend
 * 
 * @author Simon Langlois
 */
public abstract class Key extends Wrapper<Integer> {	
	public Key(final Backend.Authority token, final int value) {
		super(value);
	}
}
