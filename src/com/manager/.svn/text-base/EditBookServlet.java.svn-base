package com.manager;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;
import com.view.book.ViewBookServlet;

/**
 * Servlet implementation class EditBookServlet
 */
public class EditBookServlet extends ManagerPageServlet{
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {
		
		for(final Book.Id id : ViewBookServlet.validate(db, parameters)) {			
			final Attributes attributes = ViewBookServlet.known(db, session, id);
			return Conts.display("/admin/adminEditBook.jsp", attributes);
		}
		
		return Conts.error("editBookError", "Invalid isbn#");
		
    }
}




