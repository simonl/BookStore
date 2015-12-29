package com.servlets;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 
 * A servlet returns the path to the JSP that will be displayed,
 *   along with the Attributes the will be in its environment during execution
 * 
 */
public final class Attributes implements Iterable<Entry<String, Object>> {
	private final Map<String, Object> values;
	
	public Attributes() {
		this(new HashMap<String, Object>());
	}
	
	public Attributes(final String name, final Object value) {
		this(new HashMap<String, Object>() {
			private static final long serialVersionUID = 1L;
			{ 
				put(name, value); 
			}
		});
	}
	
	public Attributes(final Map<String, Object> values) {
		this.values = values;
	}
	
	
	
	public void set(final String name, final Object value) {
		this.values.put(name, value);
	}
	
	public String toString() {
		String result = "{\n";
		for(final String name : values.keySet()) {
			result += "\t" + name + " = " + values.get(name) + "\n";
		}
		result += "}";
		return result;
	}

	@Override
	public Iterator<Entry<String, Object>> iterator() {
		return values.entrySet().iterator();
	}
}
