package com.manager;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;
import com.view.book.ViewBookServlet;

/**
 * Servlet implementation class AdminShowBookServlet
 */
public class AdminShowBookServlet extends ManagerPageServlet{
	private static final long serialVersionUID = 1L;

    public static final Maybe<Book.Id> validate(final Database db, final Database.Manager token, final Parameters parameters) throws SQLException {
    	for(final String input : parameters.get("isbn"))
    	for(final Book.Isbn13 isbn : Book.Isbn13.parse(input))
    	for(final Book.Id id : db.fromIsbn(token, isbn))
    		return Maybe.just(id);
    	
    	return Maybe.nothing();
    }
    
	@Override
	public final Conts.Cont body(
			final Manager token,
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {
	
		for(final Book.Id id : validate(db, token, parameters)) {
			final Attributes attributes = ViewBookServlet.known(db, session, id);
			
			attributes.set("discontinued", db.isDiscontinued(token, id));
			
			return Conts.display("/admin/adminViewBook.jsp", attributes);
		}
		
		return Conts.error("viewBookError", "Invalid isbn#");
	}
}

