package com.dataAccess.tables;

import java.net.URL;

import com.dataClasses.Backend;
import com.dataClasses.Key;

/**  
 * Defines types and classes related to the database table with the same name
 * There is a separation between the ID, which refers to a row, and the other fields in a row
 * Each database field get its own abstract data type and parsing/validating constructor
 * 
 * @author Simon Langlois
 */
public final class RssFeed {
	private RssFeed() { }
	
	public static final class Id extends Key {
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}
	
	public static final class Data {
		
		public final URL url;
		
		public Data(
				final URL url) {
			this.url = url;
		}

		public final URL getUrl() {
			return url;
		}

		@Override
		public String toString() {
			return "Data [url=" + url + "]";
		}		
	}
}
