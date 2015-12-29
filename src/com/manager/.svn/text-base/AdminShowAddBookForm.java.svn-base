package com.manager;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class AdminShowAddBookForm
 */
public class AdminShowAddBookForm extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {

		return Conts.display("/admin/addBook.jsp", new Attributes());
	}

}
