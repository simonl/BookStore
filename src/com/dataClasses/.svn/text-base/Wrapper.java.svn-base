package com.dataClasses;

/**
 * When you want a type that is basically like another one,
 *   but you want to control how it's constructed
 *  
 *  Ex. email address
 *      Instead of storing it as a string, use a Wrapper<String> that validates the string value
 *      
 * @author Simon Langlois
 */
public abstract class Wrapper<T> {
	public final T value;
	
	public Wrapper(final T value) {
		this.value = value;
	}

	public final T getValue() {
		return value;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((value == null) ? 0 : value.hashCode());
		return result;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Wrapper other = (Wrapper) obj;
		if (value == null) {
			if (other.value != null)
				return false;
		} else if (!value.equals(other.value))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return value.toString();
	}
}
