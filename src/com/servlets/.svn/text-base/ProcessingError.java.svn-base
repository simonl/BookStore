package com.servlets;

/**
 * Sometimes checking for Maybe.isNull() can produce a lot of noise in the program
 *   so some servlets just immediately throw this exception
 *   and handle all of them in one place
 * 
 * @author Simon Langlois
 */
public final class ProcessingError extends Exception { 
	private static final long serialVersionUID = 1L;

	public final String name;
	public final String message;
	
	public ProcessingError(final String message) {
		this("ProcessingError", message);
	}

	public ProcessingError(final String name, final String message) {
		super(message);
		
		this.name = name;
		this.message = message;
	}
}