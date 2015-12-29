package com.login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.User;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.ProcessingServlet;
import com.servlets.Session;

/**
 * Servlet implementation class Login
 */
public class LoginServlet extends ProcessingServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void body(
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException, ProcessingError {
		
		final String usernameInput = parameters.get("username").except(new ProcessingError("loginError", "Please provide a username"));
		final String passwordInput = parameters.get("password").except(new ProcessingError("loginError", "Please provide a username"));

		final User.Login username = User.Login.parse(usernameInput).except(new ProcessingError("loginError", "Please provide a valid username."));
		final User.Password password = User.Password.parse(passwordInput).except(new ProcessingError("loginError", "Please provide a valid password."));
							
		final User.Id id = db.fromUsername(username).except(new ProcessingError("loginError", "Username does not exist"));
		
		final User.Authority user = db.login(id, password).except(new ProcessingError("loginError", "Incorrect Password"));
		
		session.loggedOnUser = Maybe.just(user);
	}
}
