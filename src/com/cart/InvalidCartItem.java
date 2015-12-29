package com.cart;

public class InvalidCartItem extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public InvalidCartItem(final String msg) {
		super(msg);
	}
}
