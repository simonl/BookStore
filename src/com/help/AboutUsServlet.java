package com.help;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class HelpIndexServlet
 * @author Edward Gagnon
 * @version March 27th, 2012;
 */
public class AboutUsServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;
       

	@Override
	public Cont body(Database db, Session session, Parameters parameters)
			throws ServletException, IOException, SQLException {
		
		return Conts.display("/jsp/aboutus.jsp", new Attributes());
	}

}
