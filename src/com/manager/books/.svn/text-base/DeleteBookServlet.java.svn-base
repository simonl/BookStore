package com.manager.books;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.manager.AdminShowBookServlet;
import com.servlets.ManagerProcessingServlet;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.Session;


/**
 * @author Simon Langlois
 */
public class DeleteBookServlet extends ManagerProcessingServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void body(
			final Database.Manager token,
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException, ProcessingError {
		
		for(final Book.Id book : AdminShowBookServlet.validate(db, token, parameters))
		{
			db.discontinueBook(token, book);
			
			return;	
		}	
		
		throw new ProcessingError("bookManagementError", "Invalid book");
	}
}
