package com.login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.ProcessingServlet;
import com.servlets.Session;

/**
 * @author David Preseault
 * 
 * Servlet implementation class logoutServlet
 */
public class LogoutServlet extends ProcessingServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void body(
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException, ProcessingError {
    	
    	session.loggedOnUser = Maybe.nothing();
    	
	}
}
