package com.dataClasses;

import java.util.Collections;
import java.util.Iterator;

/**
 * One problem with null values is that their type doesn't reflect that they can be null,
 *   so we have to say it in comments
 *   Ex. String foo(Object o) // o can be null, return value is never null
 * 
 * The Maybe class solves this problem
 *   Ex. String foo(Maybe<Object> o)
 *   And then we just assume that the builtin null is never used
 * 
 * Also, it can prevent errors such as forgetting to check for null
 *   Integer bar(String s);
 *   String x; // x can be null
 *   
 *   Ex. foo(x) 
 *     instead of 
 *       if(x != null) foo(x);
 * 
 * With Maybe, this error is caught by the compiler
 *   Integer bar(String s);
 *   Maybe<String> x;
 *   
 *   Ex. foo(x) // Error: expected String, given Maybe<String>
 *     instead of
 *       if(!x.isNull()) foo(x.value())
 *
 * 
 * The 2 constructors are called empty() and just(T)
 * 
 * Properties (could make them unit tests) = {
 *	forall T. forall x:Maybe<T>. x.isNull() -> (x.value() = throw NullPointerException())
 * 	forall T. forall x:Maybe<T>. !x.isNull() -> (exists y:T.  x.value() = y && y != null)
 * 
 * 	forall T. <T>nothing().isNull()
 * 	forall T. forall x:T. (x == null) -> <T>just(x) = throw NullPointerException()
 * 	forall T. forall x:T. (x != null) -> !<T>just(x).isNull()
 * 
 *  forall T. forall x:T. (x == null) -> <T>from(x) = <T>nothing()
 *  forall T. forall x:T. (x != null) -> <T>from(x) = <T>just(x)
 * }
 * 
 * Examples:
 * 
 * 	Maybe<C> g(B input) { .. }
 *  Maybe<B> f(A input) { .. }
 *  
 *  Maybe<C> validate(Maybe<A> x) {
 * 		if(x.isNull()) return <C>nothing();
 * 
 *  	Maybe<B> y = f(x.value());
 *  	if(y.isNull()) return <C>nothing();
 *  
 *  	Maybe<C> z = g(y.value());
 *  	if(z.isNull()) return <C>nothing();
 *  
 *  	return <C>just(z.value());
 * }
 *  
 * @author Simon Langlois
 */
public abstract class Maybe<T> implements Iterable<T> {
	
	private Maybe() { }

	public abstract boolean isNull();
	public abstract T value();

	public final boolean getIsNull() { return isNull(); }
	
	public final T getValue() { return value(); }
	
	public final T or(final T defaultValue) {
		if(this.isNull()) return defaultValue;
		
		return value();
	}
	
	public final Maybe<T> or(final Maybe<T> other) {
		if(this.isNull()) return other;
		
		return this;
	}
	
	public final <E extends Exception> T except(final E ex) throws E {
		if(this.isNull()) throw ex;
		
		return value();
	}
	
	public final Iterator<T> iterator() {
		if(this.isNull()) return Collections.<T>emptyList().iterator();

		return Collections.singletonList(value()).iterator();		
	}
	
	public final String toString() {
		if(this.isNull()) return "Nothing";
		
		return "Just(" + value() + ")";
	}

	public static final <T> Maybe<T> nothing() {
		return new Maybe<T>() {

			@Override
			public boolean isNull() { return true; }
	
			@Override
			public T value() { throw new NullPointerException(); }
			
		};
	}
	
	public static final <T> Maybe<T> just(final T value) {
		return new Maybe<T>() {
	
			@Override
			public boolean isNull() { return false; }
	
			@Override
			public T value() { return value; }

		};
	}
	
	/**
	 * Converts from references that can be null to a Maybe value
	 */
	public static final <T> Maybe<T> from(final T value) {
		if(value == null)
			return nothing();
		else
			return just(value);
	}
}
