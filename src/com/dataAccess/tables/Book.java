package com.dataAccess.tables;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

import com.dataClasses.Backend;
import com.dataClasses.Key;
import com.dataClasses.Maybe;
import com.dataClasses.Money;
import com.dataClasses.Nat;
import com.dataClasses.Wrapper;

/**  
 * Defines types and classes related to the database table with the same name
 * There is a separation between the ID, which refers to a row, and the other fields in a row
 * Each database field get its own abstract data type and parsing/validating constructor
 * 
 * The Book.Data objects have a field that contains a set of ebook formats, 
 *   which differs from the database representation
 *   
 * @author Simon Langlois
 */
public final class Book {
	private Book() { }
	
	
	
	


	
	
	
	

	public static final class Id extends Key {		
		public Id(final Backend.Authority token, final int value) {
			super(token, value);
		}
	}

	public static final class Title  extends Wrapper<String> {
		private Title(final String value) {
			super(value);
		}
		
		public static final Maybe<Title> parse(final String input) {
			return Maybe.just(new Title(input));
		}
	}

	public static final class Author extends Wrapper<String> {
		private Author(final String value) {
			super(value);
		}

		public static final Maybe<Author> parse(final String input) {
			return Maybe.just(new Author(input));
		}
	}

	public static final class Publisher  extends Wrapper<String> {
		private Publisher(final String value) {
			super(value);
		}

		public static final Maybe<Publisher> parse(final String input) {
			return Maybe.just(new Publisher(input));
		}
	}
	
	public static final class Isbn10 extends Wrapper<String> {
		private Isbn10(final String value) {
			super(value);
		}
		
		public static final Maybe<Isbn10> parse(final String input) {
			if(input.length() != 10) return Maybe.nothing();
			
			return Maybe.just(new Isbn10(input));
		}
	}

	public static final class Isbn13 extends Wrapper<String> {
		private Isbn13(final String value) {
			super(value);
		}

		public static final Maybe<Isbn13> parse(final String input) {
			if(input.length() != 14) return Maybe.nothing();
			if(input.charAt(3) != '-') return Maybe.nothing();
			
			return Maybe.just(new Isbn13(input));
		}
	}
	
	public static final class Genre extends Wrapper<String> {
		private Genre(final String value) {
			super(value);
		}
		
		public static final Maybe<Genre> parse(final String input) {
			if(input.equals("")) return Maybe.nothing();
			
			return Maybe.just(new Genre(input));
		}
	}
	
	public static final class Description extends Wrapper<String> {
		private Description(final String value) {
			super(value);
		}

		public static final Maybe<Description> parse(final String input) {
			return Maybe.just(new Description(input));
		}
	}
	
	public static final class Dimensions {
		public final double length;
		public final double width;
		public final double height;

		public Dimensions(
				final double length,
				final double width, 
				final double height) {
			this.length = length;
			this.width = width;
			this.height = height;
		}

		public static final Maybe<Dimensions> parse(final String input) {
			final String[] dims = input.split("[(),]");
			if(dims.length < 4) return Maybe.nothing();
			
			return Maybe.just(new Dimensions(
				Double.parseDouble(dims[1]),
				Double.parseDouble(dims[2]),
				Double.parseDouble(dims[3])
			));
		}
		
		public final String toString() {
			return "(" + length + ", " + width + ", " + height + ")";
		}

		public double getLength() {
			return length;
		}

		public double getWidth() {
			return width;
		}

		public double getHeight() {
			return height;
		}
	}
	
	public static final class Thumbnail extends Wrapper<String> {
		private Thumbnail(final String value) {
			super(value);
		}

		public static final Maybe<Thumbnail> parse(final String input) {
			return Maybe.just(new Thumbnail(input));
		}
	}

	public static final class Cover extends Wrapper<String> {
		private Cover(final String value) {
			super(value);
		}

		public static final Maybe<Cover> parse(final String input) {
			return Maybe.just(new Cover(input));
		}
	}

	public static final class EFormat extends Wrapper<String> {
		private EFormat(final String value) {
			super(value);
		}

		public static final Maybe<EFormat> parse(final String input) {
			if(input.length() == 0) return Maybe.nothing();
			
			return Maybe.just(new EFormat(input));
		}
	}
	
	
	
	public static final class Input {
		public Maybe<String> title = Maybe.nothing();
		public Maybe<String> author = Maybe.nothing();
		public Maybe<String> publisher = Maybe.nothing();
		public Maybe<String> isbn10 = Maybe.nothing();
		public Maybe<String> isbn13 = Maybe.nothing();
		public Maybe<String> genre = Maybe.nothing();
		public Maybe<String> description = Maybe.nothing();
		public Maybe<String> numberOfPages = Maybe.nothing();
		public Maybe<String> weight = Maybe.nothing();
		public Maybe<String> height = Maybe.nothing();
		public Maybe<String> length = Maybe.nothing();
		public Maybe<String> width = Maybe.nothing();
		public Maybe<String> thumbnail = Maybe.nothing();
		public Maybe<String> cover = Maybe.nothing();
		public Maybe<String> listPrice = Maybe.nothing();
		public Maybe<String> salePrice = Maybe.nothing();
		public Maybe<String> wholesalePrice = Maybe.nothing();
		public Maybe<String> numberOfBooks = Maybe.nothing();
		
		public Input() { }	
		
	}
	
	public static final class Builder {
		
		public Maybe<Title> title = Maybe.nothing();
		public Maybe<Author> author = Maybe.nothing();
		public Maybe<Publisher> publisher = Maybe.nothing();
		public Maybe<Isbn10> isbn10 = Maybe.nothing();
		public Maybe<Isbn13> isbn13 = Maybe.nothing();
		public Maybe<Genre> genre = Maybe.nothing();
		public Maybe<Description> description = Maybe.nothing();
		public Maybe<Nat> numberOfPages = Maybe.nothing();
		public Maybe<Nat> weight = Maybe.nothing();
		public Maybe<Dimensions> dimensions = Maybe.nothing();
		public Maybe<Thumbnail> thumbnail = Maybe.nothing();
		public Maybe<Cover> cover = Maybe.nothing();
		public Maybe<Money> listPrice = Maybe.nothing();
		public Maybe<Money> salePrice = Maybe.nothing();
		public Maybe<Money> wholesalePrice = Maybe.nothing();
		public Maybe<Maybe<Nat>> numberOfBooks = Maybe.nothing();
		public Maybe<Set<EFormat>> eformats = Maybe.nothing();
	
		public Builder() { }

		public final Maybe<Data> build() {
			if(title.isNull()) return Maybe.nothing();
			if(author.isNull()) return Maybe.nothing();
			if(publisher.isNull()) return Maybe.nothing();
			if(isbn10.isNull()) return Maybe.nothing();
			if(isbn13.isNull()) return Maybe.nothing();
			if(genre.isNull()) return Maybe.nothing();
			if(description.isNull()) return Maybe.nothing();
			if(numberOfPages.isNull()) return Maybe.nothing();
			if(weight.isNull()) return Maybe.nothing();
			if(dimensions.isNull()) return Maybe.nothing();
			if(thumbnail.isNull()) return Maybe.nothing();
			if(cover.isNull()) return Maybe.nothing();
			if(listPrice.isNull()) return Maybe.nothing();
			if(salePrice.isNull()) return Maybe.nothing();
			if(wholesalePrice.isNull()) return Maybe.nothing();
			if(numberOfBooks.isNull()) return Maybe.nothing();
			if(eformats.isNull()) return Maybe.nothing();
			
			return Maybe.just(new Data(
				new Timestamp(new Date().getTime()),
				title.value(),
				author.value(),
				publisher.value(),
				isbn10.value(),
				isbn13.value(),
				genre.value(),
				description.value(),
				numberOfPages.value(),
				weight.value(),
				dimensions.value(),
				thumbnail.value(),
				cover.value(),
				listPrice.value(),
				salePrice.value(),
				wholesalePrice.value(),
				numberOfBooks.value(),
				eformats.value()
			));
		}

		public final Maybe<Title> getTitle() {
			return title;
		}

		public final Maybe<Author> getAuthor() {
			return author;
		}

		public final Maybe<Publisher> getPublisher() {
			return publisher;
		}

		public final Maybe<Isbn10> getIsbn10() {
			return isbn10;
		}

		public final Maybe<Isbn13> getIsbn13() {
			return isbn13;
		}

		public final Maybe<Genre> getGenre() {
			return genre;
		}

		public final Maybe<Description> getDescription() {
			return description;
		}

		public final Maybe<Nat> getNumberOfPages() {
			return numberOfPages;
		}

		public final Maybe<Nat> getWeight() {
			return weight;
		}

		public final Maybe<Dimensions> getDimensions() {
			return dimensions;
		}

		public final Maybe<Thumbnail> getThumbnail() {
			return thumbnail;
		}

		public final Maybe<Cover> getCover() {
			return cover;
		}

		public final Maybe<Money> getListPrice() {
			return listPrice;
		}

		public final Maybe<Money> getSalePrice() {
			return salePrice;
		}

		public final Maybe<Money> getWholesalePrice() {
			return wholesalePrice;
		}

		public final Maybe<Maybe<Nat>> getNumberOfBooks() {
			return numberOfBooks;
		}		
	}
	
	
	
	
	
	public static final class Data {
		
		public final Timestamp dateEntered;
		public final Title title;
		public final Author author;
		public final Publisher publisher;
		public final Isbn10 isbn10;
		public final Isbn13 isbn13;
		public final Genre genre;
		public final Description description;
		public final Nat numberOfPages;
		public final Nat weight;
		public final Dimensions dimensions;
		public final Thumbnail thumbnail;
		public final Cover cover;
		public final Money listPrice;
		public final Money salePrice;
		public final Money wholesalePrice;
		public final Maybe<Nat> numberOfBooks;
		public final Set<EFormat> eformats;
		
		public Data(
				final Timestamp dateEntered,
				final Title title,
				final Author author,
				final Publisher publisher,
				final Isbn10 isbn10,
				final Isbn13 isbn13,
				final Genre genre,
				final Description description,
				final Nat numberOfPages,
				final Nat weight,
				final Dimensions dimensions,
				final Thumbnail thumbnail,
				final Cover cover,
				final Money listPrice,
				final Money salePrice,
				final Money wholesalePrice,
				final Maybe<Nat> numberOfBooks,
				final Set<EFormat> eformats) {	
			this.dateEntered = dateEntered;
			this.title = title;
			this.author = author;
			this.publisher = publisher;
			this.isbn10 = isbn10;
			this.isbn13 = isbn13;
			this.genre = genre;
			this.description = description;
			this.numberOfPages = numberOfPages;
			this.weight = weight;
			this.dimensions = dimensions;
			this.thumbnail = thumbnail;
			this.cover = cover;
			this.listPrice = listPrice;
			this.salePrice = salePrice;
			this.wholesalePrice = wholesalePrice;
			this.numberOfBooks = numberOfBooks;	
			this.eformats = eformats;
		}

		public final Timestamp getDateEntered() {
			return dateEntered;
		}

		public final Title getTitle() {
			return title;
		}

		public final Author getAuthor() {
			return author;
		}

		public final Publisher getPublisher() {
			return publisher;
		}

		public final Isbn10 getIsbn10() {
			return isbn10;
		}

		public final Isbn13 getIsbn13() {
			return isbn13;
		}

		public final Genre getGenre() {
			return genre;
		}

		public final Description getDescription() {
			return description;
		}

		public final Nat getNumberOfPages() {
			return numberOfPages;
		}

		public final Nat getWeight() {
			return weight;
		}

		public final Dimensions getDimensions() {
			return dimensions;
		}

		public final Thumbnail getThumbnail() {
			return thumbnail;
		}

		public final Cover getCover() {
			return cover;
		}

		public final Money getListPrice() {
			return listPrice;
		}

		public final Money getSalePrice() {
			return salePrice;
		}

		public final Money getWholesalePrice() {
			return wholesalePrice;
		}

		public final Maybe<Nat> getNumberOfBooks() {
			return numberOfBooks;
		}

		@Override
		public String toString() {
			return "Data [dateEntered=" + dateEntered + ", title=" + title
					+ ", author=" + author + ", publisher=" + publisher
					+ ", isbn10=" + isbn10 + ", isbn13=" + isbn13 + ", genre="
					+ genre + ", description=" + description
					+ ", numberOfPages=" + numberOfPages + ", weight=" + weight
					+ ", dimensions=" + dimensions + ", thumbnail=" + thumbnail
					+ ", cover=" + cover + ", listPrice=" + listPrice
					+ ", salePrice=" + salePrice + ", wholesalePrice="
					+ wholesalePrice + ", numberOfBooks=" + numberOfBooks + "]";
		}

		public final Set<EFormat> getEformats() {
			return eformats;
		}
	}
}
