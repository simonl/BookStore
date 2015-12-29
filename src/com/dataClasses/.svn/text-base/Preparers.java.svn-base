package com.dataClasses;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public final class Preparers {
	private Preparers() { }
	
	public static final Preparer integer(final Integer value) {
		return integer.apply(value);
	}
	public static final Preparer string(final String value) {
		return string.apply(value);
	}
	public static final Preparer bigDecimal(final BigDecimal value) {
		return bigDecimal.apply(value);
	}
	public static final Preparer bool(final Boolean value) {
		return integer(value ? 1 : 0);
	}
	public static Preparer timestamp(final Timestamp value) {
		return timestamp.apply(value);
	}
	public static final <K extends Key> Preparer key(final K id) {
		return key().apply(id);
	}
	public static final <S extends Wrapper<String>> Preparer safeString(final S value) {
		return safeString().apply(value); 
	}
	
	public static final Func<Integer, Preparer> integer =
		new Func<Integer, Preparer>() {
		public Preparer apply(final Integer value) {
			return new Preparer() {
				public int prepare(int i, final PreparedStatement statement) throws SQLException {
					statement.setObject(i++, value);
					
					return i;
				}
			};
		}
	};
	public static final Func<String, Preparer> string =
	new Func<String, Preparer>() {
		public Preparer apply(final String value) {
			return new Preparer() {
				public int prepare(int i, final PreparedStatement statement) throws SQLException {
					statement.setString(i++, value);
					
					return i;
				}
			};
		}
	};
	public static final Func<BigDecimal, Preparer> bigDecimal =
	new Func<BigDecimal, Preparer>() {
		public Preparer apply(final BigDecimal value) {
			return new Preparer() {
				public int prepare(int i, final PreparedStatement statement) throws SQLException {
					statement.setBigDecimal(i++, value);
					
					return i;
				}
			};
		}
	};
	public static final Func<Timestamp, Preparer> timestamp =
	new Func<Timestamp, Preparer>() {
		public Preparer apply(final Timestamp value) {
			return new Preparer() {
				public int prepare(int i, final PreparedStatement statement) throws SQLException {
					statement.setTimestamp(i++, value);
					
					return i;
				}
			};
		}
	};
	public static final Preparer empty = 
	new Preparer() {
		public final int prepare(int i, final PreparedStatement statement) throws SQLException {
			// No preparation

			return i;
		}
	};


	public static final <A, W extends Wrapper<A>> Func<W, Preparer> wrapper(final Func<A, Preparer> preparer) {
		return new Func<W, Preparer>() {
			public Preparer apply(final W wrapper) {
				return preparer.apply(wrapper.value);
			} 
		};
	}
	public static final <A> Func<Maybe<A>, Preparer> maybe(final Func<A, Preparer> preparer) {
		return new Func<Maybe<A>, Preparer>() {
			public Preparer apply(final Maybe<A> value) {
				if(value.isNull()) 
					return nullPreparer;
				
				return preparer.apply(value.value());
			}
		};
	}
	public static final Preparer nullPreparer = new Preparer() {
		public int prepare(int i, final PreparedStatement statement) throws SQLException {
			statement.setObject(i++, null);
			
			return i;
		}		
	};
	public static final <A, I extends Iterable<A>> Func<I, Preparer> collection(final Func<A, Preparer> preparer) {
		return new Func<I, Preparer>() {
			public Preparer apply(final I value) {
				final List<Preparer> preparers = new ArrayList<Preparer>();
				
				for(final A x : value) {
					preparers.add(preparer.apply(x));
				}
				
				return sequence(preparers);
			}
		};
	}
	
	public static final <A> Preparer sequence(final Iterable<Preparer> preparers) {
		return new Preparer() {
			public int prepare(int i, final PreparedStatement statement) throws SQLException {
				for(final Preparer preparer : preparers)
					i = preparer.prepare(i, statement);
				
				return i;
			}
		};
	}
	public static final <A> Preparer sequence(final Preparer... preparers) {
		return new Preparer() {
			public int prepare(int i, final PreparedStatement statement) throws SQLException {
				for(final Preparer preparer : preparers)
					i = preparer.prepare(i, statement);
				
				return i;
			}
		};
	}
	
	public static final <K extends Key> Func<K, Preparer> key() { return wrapper(integer); }
	public static final <S extends Wrapper<String>> Func<S, Preparer> safeString() { return wrapper(string); }

	
}
