package com.welcome;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;

import com.dataAccess.tables.Book;
import com.dataAccess.tables.User;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class WelcomeServlet
 */
public class WelcomeServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
	public Conts.Cont body(
			final Database db, 
			final Session session,
			final Parameters parameters)
    		throws ServletException, IOException, SQLException {
    	
    	try {
    		Cookie[] cookies = session.getCookies();
    		if(cookies == null || cookies.length == 0){
    			return Conts.error("404", "Error occured in the welcome servlet");
    		}

			final Attributes attributes = new Attributes();
			
			attributes.set("booksOnSale", db.getBooks(db.booksOnSale()));

			final Maybe<Book.Genre> lastGenre = getLastGenre(db, session);
			if(!lastGenre.isNull()) {
				final Set<Book.Id> books = db.booksOfInterest(lastGenre.value(), 5);
				attributes.set("booksOfInterest", db.getBooks(books));
			}
			
			Maybe<User.Authority> user = session.loggedOnUser;
			
			if(!user.isNull()) {
				attributes.set("displayString", "Welcome " + db.get(user.value()).login);
			} else {
				attributes.set("displayString", "Welcome");
			}
					
			return Conts.display("/jsp/welcome.jsp", attributes);
		} catch (Exception e) {
			e.printStackTrace();
			return Conts.error("404", "Error occured in the welcome servlet");
		}			
	}

	private static final Maybe<Book.Genre> getLastGenre(
			final Database db, 
			final Session session) throws SQLException {
		final Maybe<Book.Genre> fromUser = getLastGenreFromUser(db, session.loggedOnUser);
		
		if(!fromUser.isNull()) return fromUser;
		
		final Maybe<Book.Genre> fromCookie = getLastGenreFromCookie(session.getCookies());
		
		return fromCookie;
	}
	
	private static final Maybe<Book.Genre> getLastGenreFromUser(
			final Database db,
			final Maybe<User.Authority> user) throws SQLException {
		
		if(user.isNull()) return Maybe.nothing();
				
		final Maybe<Book.Genre> genre = db.get(user.value()).lastGenre;
				
		return genre;
	}
	
	private static final Maybe<Book.Genre> getLastGenreFromCookie(final Cookie[] cookies) {
		try {
			for(int i = 0; i < cookies.length; i++)
				if(cookies[i].getName().equals("lastGenre"))
					return Book.Genre.parse(cookies[i].getValue());
		}
		catch (NullPointerException npe)
		{
			System.out.println("cookies are null - error");
		}
		return Maybe.nothing();
	}
}
