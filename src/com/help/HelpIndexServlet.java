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
public class HelpIndexServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpIndexServlet() {
        super();
    }


	@Override
	public Cont body(Database db, Session session, Parameters parameters)
			throws ServletException, IOException, SQLException {
		Attributes attributes = new Attributes();
		String destination = "/jsp/helpIndexPanel.jsp";
		Maybe<String> maybeDisplay = parameters.get("display");
		Maybe<String> maybeTitle = parameters.get("title");
		
		if(!maybeDisplay.isNull()){
			if(!maybeTitle.isNull())
				attributes.set("displayString", maybeTitle.getValue());
			else
				attributes.set("displayString", maybeDisplay.getValue());
			destination = "/jsp/help" + maybeDisplay.getValue() + "Panel.jsp";
		}
		else
			attributes.set("displayString", "Help Index");

		
		
		
		return Conts.display(destination, attributes);
	}

}
