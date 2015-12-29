package com.help;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dataClasses.Database;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class ErrorServlet
 */
public class ErrorServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ErrorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	@Override
	public Cont body(Database db, Session session, Parameters parameters)
			throws ServletException, IOException, SQLException {
		System.out.println("Error page invoked!!!");
		
		Attributes att = new Attributes();
		att.set("displayString", "Page Not Found");
		return Conts.display("/jsp/ErrorPage.jsp", att);
		
	}

}
