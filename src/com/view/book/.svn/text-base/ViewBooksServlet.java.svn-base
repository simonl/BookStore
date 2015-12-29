package com.view.book;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class ViewBooksServlet
 */
public class ViewBooksServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
	public Conts.Cont body(
			final Database db, 
			final Session session,
			final Parameters parameters) 
    		throws ServletException, IOException, SQLException {
       	
		final Maybe<String> input = parameters.get("genre");
			
		final Attributes attributes = new Attributes();
		
		if(input.isNull()) {
			attributes.set("displayString", "Books > Genre > All");			
			attributes.set("books", db.getBooks(db.allBooks()));
		} else {			
			
			final Book.Genre genre = Book.Genre.parse(input.value()).value();
			
			final List<Book.Data> bestSellers = db.getBooks(db.bestSellers(genre, 5));
			final Set<Book.Data> books = db.getBooks(db.booksInGenre(genre));
						
			attributes.set("displayString", "Books > Genre > " + genre);
			attributes.set("bestSellers", bestSellers);
			attributes.set("books", books);
		}
		
		return Conts.display("/jsp/viewbookspanel.jsp", attributes);
	}

}
