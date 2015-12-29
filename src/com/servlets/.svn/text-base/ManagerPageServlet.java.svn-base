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
public abstract class ManagerPageServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

	public abstract Conts.Cont body(
			final Database.Manager token, 
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException;
	
	@Override
	public final Conts.Cont body(
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
		
		final Maybe<User.Authority> user = session.loggedOnUser;
		
		if(user.isNull()) { 
			return Conts.error("accessRightsError", "You are not logged on as a manager!");
		}
		
		final Maybe<Database.Manager> token = db.restricted(user.value()); 
		
		if(token.isNull()) {
			return Conts.error("accessRightsError", "You are not logged on as a manager!");
		}
		
		return body(token.value(), db, session, parameters);		
	}
}
