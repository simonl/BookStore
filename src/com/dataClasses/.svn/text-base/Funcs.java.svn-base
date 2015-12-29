package com.dataClasses;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


public final class Funcs {
	private Funcs() { }

	public static final <A, B, E extends Exception> Set<B> map(final Set<A> set, final Throws<A, B, E> func) throws E {
		final Set<B> result = new HashSet<B>(set.size());
		
		for(final A value : set) {
			result.add(func.apply(value));
		}
		
		return Collections.unmodifiableSet(result);
	}

	public static final <A, B, E extends Exception> List<B> map(final List<A> list, final Throws<A, B, E> func) throws E {
		final List<B> result = new ArrayList<B>(list.size());
		
		for(final A value : list) {
			result.add(func.apply(value));
		}
		
		return Collections.unmodifiableList(result);
	}

	public static final <K, A, B, E extends Exception> Map<K, B> map(final Map<K, A> map, final Throws<A, B, E> func) throws E {
		final Map<K, B> result = new HashMap<K, B>(map.size());
		
		for(final K key : map.keySet()) {
			result.put(key, func.apply(map.get(key)));
		}
		
		return Collections.unmodifiableMap(result);
	}
	
	public static final <A, B, E extends Exception> Map<A, B> maps(final Set<A> set, final Throws<A, B, E> func) throws E {
		final Map<A, B> map = new HashMap<A, B>(set.size());
		
		for(final A value : set) {
			map.put(value, func.apply(value));
		}
		
		return map;
	}
	

}
