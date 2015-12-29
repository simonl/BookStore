package com.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.dataClasses.Database;

/**
 * Like a servlet, but with the parameters fixed
 *
 */
public final class ClosedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public final PageServlet servlet;
	public final Parameters parameters;
	
	public ClosedServlet(final PageServlet servlet) {
		this(servlet, new Parameters());
	}
	
	public ClosedServlet(final PageServlet servlet, final Parameters parameters) {
		this.servlet = servlet;
		this.parameters = parameters;
	}
	
	public Conts.Cont main(
			final Database db,
			final Session session) 
			throws ServletException, IOException, SQLException {
		return servlet.main(db, session, parameters);
	}
}
