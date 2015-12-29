package com.manager.orders;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Nat;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * @author Simon Langlois
 */
public class ChangeMinimumBooksServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Cont body(
			final Manager token,
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {

		for(final String input : parameters.get("minimum"))
		for(final Nat minimum : Nat.parse(input))
		{
			db.setMinimumNumberOfBooks(token, minimum);
			
			return Conts.redirect(session.lastPage);
		}
		
		return Conts.error("orderManagementError", "Input not a number");
	}
}
