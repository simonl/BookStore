package com.manager.books;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.SearchInput;
import com.search.SearchResultServlet;
import com.servlets.Attributes;
import com.servlets.Closures;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class SearchBookServlet
 */
public class DiscontinuedBooksServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
		
		final Set<Book.Id> books = db.getDiscontinuedBooks(token);
		if(books.size() == 1) {
			for(final Book.Id id : books) {	
				final Book.Isbn13 isbn13 = db.get(id).isbn13;
				return Conts.redirect(Closures.adminShowBook(isbn13));
			}
		}
		
		final Attributes attributes = new Attributes();
		attributes.set("books", db.getBooks(books));
		attributes.set("ok", "ok");		
				
		return Conts.display("/admin/searchBook.jsp", attributes);
	}
}
