package com.search;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.SearchInput;
import com.servlets.Attributes;
import com.servlets.Closures;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class Login
 */
public class SearchResultServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

    public static final SearchInput read(final Parameters parameters) {
		String description = parameters.get("description").or((String) null);
		String title = parameters.get("title").or((String) null);
		String author = parameters.get("author").or((String) null);
		String publisher = parameters.get("publisher").or((String) null);
		String isbn = parameters.get("isbn").or((String) null);
		
		if(description == null || description.equals("")) description = null;
		if(title == null || title.equals("")) title = null;
		if(author == null || author.equals("")) author = null;
		if(publisher == null || publisher.equals("")) publisher = null;
		if(isbn == null || isbn.equals("")) isbn = null;
		
		final SearchInput input = new SearchInput(
			description,
			title,
			author,
			publisher,
			isbn
		);
		
		return input;
    }
    
    
    @Override
	public Conts.Cont body(
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {

		final SearchInput input = read(parameters);
				
		final Set<Book.Id> books = db.search(input);
		
		if(books.size() == 1) {
			for(final Book.Id id : books) {				
				return Conts.redirect(Closures.viewBook(db.get(id).isbn13));
			}
		}
		
		final Attributes attributes = new Attributes();
		attributes.set("browsingTitle", "Search");
		attributes.set("books", db.getBooks(books));
		attributes.set("displayString", "Search Results");
		
		return Conts.display("/jsp/viewbookspanel.jsp", attributes);
	}
}
