package com.dataAccess.tables;

import java.net.URL;

import com.dataClasses.Backend;
import com.dataClasses.Key;

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
