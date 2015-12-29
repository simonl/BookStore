package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import com.dataClasses.Database;

public abstract class ProcessingServlet extends PageServlet {
	private static final long serialVersionUID = 1L;

	public abstract void body(
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException, ProcessingError;
	
	@Override
	public final Conts.Cont main(
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {

		try {
			
			body(db, session, parameters);
			
			return Conts.redirect(session.lastPage);
		} catch(final ProcessingError err) {
			
			return Conts.error(err.name, err.message);
		}
	}
}
