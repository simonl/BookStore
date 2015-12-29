package com.dataAccess.tables;

import com.dataClasses.Backend;
import com.dataClasses.Key;
import com.dataClasses.Maybe;
import com.dataClasses.Wrapper;

/**  
 * Defines types and classes related to the database table with the same name
 * There is a separation between the ID, which refers to a row, and the other fields in a row
 * Each database field get its own abstract data type and parsing/validating constructor
 * 
 * @author Simon Langlois
 */
public final class Address {
	private Address() { }

	
	
	
	

	
	
	
	
	public static final class Id extends Key {		
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}
	
	public static final class City extends Wrapper<String> {
		private City(final String value) {
			super(value);
		}
		
		public static final Maybe<City> parse(final String input) {
			return Maybe.just(new City(input));
		}
	}
	
	public static final class PostalCode extends Wrapper<String> {
		private PostalCode(final String value) {
			super(value);
		}
		
		public static final Maybe<PostalCode> parse(final String input) {
			if(input.length() != 6) return Maybe.nothing();
			
			return Maybe.just(new PostalCode(input));
		}
	}
	
	public static final class Location extends Wrapper<String> {
		private Location(final String value) {
			super(value);
		}
		
		public static final Maybe<Location> parse(final String input) {
			return Maybe.just(new Location(input));
		}
	}
	
	
	
	
	
	
	
	
	
	
	public static final class Input {
		
		public final Maybe<String> city;
		public final Maybe<String> province;
		public final Maybe<String> postalCode;
		public final Maybe<String> address;
		
		public Input(
				final Maybe<String> city,
				final Maybe<String> province,
				final Maybe<String> postalCode,
				final Maybe<String> address) {
			this.city = city;
			this.province = province;
			this.postalCode = postalCode;
			this.address = address;
		}

		public final Builder parseFields() {
			final Builder builder = new Builder();
			
			if(!city.isNull())
				builder.city = City.parse(city.value());
			if(!postalCode.isNull())
				builder.postalCode = PostalCode.parse(postalCode.value());
			if(!address.isNull())
				builder.address = Location.parse(address.value());
			
			return builder;
		}

		public final String getCity() {
			return city.or("");
		}

		public final String getProvince() {
			return province.or("");
		}

		public final String getPostalCode() {
			return postalCode.or("");
		}

		public final String getAddress() {
			return address.or("");
		}

		@Override
		public String toString() {
			return "Input [city=" + city + ", province=" + province
					+ ", postalCode=" + postalCode + ", address=" + address
					+ "]";
		}
	}

	
	
	
	
	
	
	public static final class Builder {
		
		public Maybe<City> city = Maybe.nothing();
		public Maybe<Province.Id> province = Maybe.nothing();
		public Maybe<PostalCode> postalCode = Maybe.nothing();
		public Maybe<Location> address = Maybe.nothing();
		
		public Builder() { }
		
		public Builder(
				final Maybe<City> city,
				final Maybe<Province.Id> province,
				final Maybe<PostalCode> postalCode,
				final Maybe<Location> address) { 
			this.city = city;
			this.province = province;
			this.postalCode = postalCode;
			this.address = address;
		}

		public final Maybe<Data> build() {
			if(city.isNull()) return Maybe.nothing();
			if(province.isNull()) return Maybe.nothing();
			if(postalCode.isNull()) return Maybe.nothing();
			if(address.isNull()) return Maybe.nothing();
			
			return Maybe.just(new Data(
				city.value(),
				province.value(),
				postalCode.value(),
				address.value()
			));
		}

		public final Maybe<City> getCity() {
			return city;
		}

		public final void setCity(Maybe<City> city) {
			this.city = city;
		}

		public final Maybe<Province.Id> getProvince() {
			return province;
		}

		public final void setProvince(Maybe<Province.Id> province) {
			this.province = province;
		}

		public final Maybe<PostalCode> getPostalCode() {
			return postalCode;
		}

		public final void setPostalCode(Maybe<PostalCode> postalCode) {
			this.postalCode = postalCode;
		}

		public final Maybe<Location> getAddress() {
			return address;
		}

		public final void setAddress(Maybe<Location> address) {
			this.address = address;
		}

		@Override
		public String toString() {
			return "Builder [city=" + city + ", province=" + province
					+ ", postalCode=" + postalCode + ", address=" + address
					+ "]";
		}
	}
	
	
	
	
	
	
	
	

	public static final class Data {
		
		public final City city;
		public final Province.Id province;
		public final PostalCode postalCode;
		public final Location address;
		
		public Data(
				final City city,
				final Province.Id province,
				final PostalCode postalCode,
				final Location address) {
			this.city = city;
			this.province = province;
			this.postalCode = postalCode;
			this.address = address;
		}

		public final City getCity() {
			return city;
		}

		public final Province.Id getProvince() {
			return province;
		}

		public final PostalCode getPostalCode() {
			return postalCode;
		}

		public final Location getAddress() {
			return address;
		}

		@Override
		public String toString() {
			return "Data [city=" + city + ", province=" + province
					+ ", postalCode=" + postalCode + ", address=" + address
					+ "]";
		}
	}	
}
