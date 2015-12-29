package com.mobile;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.SearchInput;
import com.search.SearchResultServlet;
import com.servlets.Conts.Cont;
import com.servlets.Attributes;
import com.servlets.Closures;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.PageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class ShowBooksMobileServlet
 */
public class ShowBooksMobileServlet extends PageServlet {
	private static final long serialVersionUID = 1L;
    
    @Override
	public Conts.Cont main(
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {

		final SearchInput input = SearchResultServlet.read(parameters);
				
		final Set<Book.Id> books = db.search(input);
		final Attributes attributes = new Attributes();
		if(input.isNull()) {
			attributes.set("books", db.getBooks(db.booksOnSale()));
			attributes.set("displayString", "Books On Sale");
			attributes.set("browsingTitle", "Search");

		}
		else{
			attributes.set("books", db.getBooks(books));
			attributes.set("displayString", "Search Results");
			attributes.set("browsingTitle", "Search");
		}		
		
		return Conts.display("/mobile/index.jsp", attributes);
	}
}
