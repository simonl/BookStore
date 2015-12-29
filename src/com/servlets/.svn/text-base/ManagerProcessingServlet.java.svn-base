package com.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.User;
import com.dataClasses.Database;
import com.dataClasses.Maybe;

/**
 * @author Simon Langlois
 */
public abstract class ManagerProcessingServlet extends ProcessingServlet {
	private static final long serialVersionUID = 1L;

	public abstract void body(
			final Database.Manager token,
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException, ProcessingError;

	@Override
	public void body(
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException, ProcessingError {

		final Maybe<User.Authority> user = session.loggedOnUser;
		
		if(user.isNull()) { 
			throw new ProcessingError("accessRightsError", "You are not logged on as a manager!");
		}
		
		final Maybe<Database.Manager> token = db.restricted(user.value()); 
		
		if(token.isNull()) {
			throw new ProcessingError("accessRightsError", "You are not logged on as a manager!");
		}
		
		body(token.value(), db, session, parameters);		
	}
}
