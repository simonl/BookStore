package com.xml;

import java.sql.SQLException;
import java.util.Set;

import org.w3c.dom.Document;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Maybe;

public final class Converters {
	private Converters() { }
	
	
	public static final void main(final String... args) throws SQLException  {
		final Database db = Database.connectOld();
		final Maybe<Book.Isbn13> isbn = Book.Isbn13.parse("978-0722538616");
		final Maybe<Book.Id> book = db.fromIsbn(isbn.value());
		
		final XML.Node xmlBook = fromBook(db.get(book.value()));
		
		final Document document = XML.createDocument(xmlBook);
		
		System.out.println(xmlBook);
		System.out.println(document);
		System.out.println(XmlFactory.convertToXML(document));
	}
	
	public static final XML.Node fromBooks(final Set<Book.Data> books) {
		final XML.Node element = (XML.open("BOOKS"));
		
		for(final Book.Data book : books) {
			element.add(fromBook(book));
		}
		
		return element;
	}
	
	public static final XML.Node fromBook(final Book.Data data) {
		return (XML.open("BOOK").add(XML.open("TITLE").add(( data.title ))).add(XML.open("COVER").add(( data.cover ))).add(XML.open("GENRE").add(( data.genre ))).add(XML.open("THUMBNAIL").add(( data.thumbnail ))).add(XML.open("AUTHOR").add(( data.author ))).add(XML.open("DATE_ENTERED").add(( data.dateEntered ))).add(XML.open("DESCRIPTION").add(( data.description ))).add(( fromDimensions(data.dimensions) )).add(XML.open("TITLE").add(( data.title ))).add(XML.open("LIST_PRICE").add(( data.listPrice ))).add(XML.open("SALE_PRICE").add(( data.salePrice ))).add(XML.open("WHOLESALE_PRICE").add(( data.wholesalePrice ))).add(XML.open("ISBN10").add(( data.isbn10 ))).add(XML.open("ISBN13").add(( data.isbn13 ))).add(( fromEFormats(data.eformats) )).add(XML.open("PUBLISHER").add(( data.publisher ))).add(XML.open("NUMBER_OF_BOOKS").add(( data.numberOfBooks ))).add(XML.open("NUMBER_OF_PAGES").add(( data.numberOfPages ))).add(XML.open("WEIGHT").add(( data.weight ))));
	}
	
	public static final XML.Node fromDimensions(final Book.Dimensions dimensions) {
		return (XML.open("DIMENSIONS").add(XML.open("HEIGHT").add(( dimensions.height ))).add(XML.open("LENGTH").add(( dimensions.length ))).add(XML.open("WIDTH").add(( dimensions.width ))));
	}
	
	public static final XML.Node fromEFormats(final Set<Book.EFormat> eformats) {
		final XML.Node element = (XML.open("EFORMATS"));
	
		for(final Book.EFormat eformat : eformats) {
			element.add((XML.open("EFORMAT").add(( eformat ))));
		}
		
		return element;
	}
}

