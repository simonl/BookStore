package com.dataAccess.tables;

import com.dataClasses.Backend;
import com.dataClasses.Key;
import com.dataClasses.Maybe;
import com.dataClasses.Wrapper;

public abstract class BannerAd {
	private BannerAd() { }


	public static final class Id extends Key {		
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}
	
	public static final class Image extends Wrapper<String> {
		private Image(final String value) {
			super(value);
		}
		
		public static final Maybe<Image> parse(final String value) {
			if(value.length() == 0) return Maybe.nothing();
			
			return Maybe.just(new Image(value));
		}
	}
	
	public static final class Data {
		public final Image image;
		
		public Data(final Image image) {
			this.image = image;
		}

		public final Image getImage() {
			return image;
		}

		@Override
		public String toString() {
			return "Data [image=" + image + "]";
		}
	}
}
