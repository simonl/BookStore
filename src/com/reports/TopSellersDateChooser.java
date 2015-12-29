package com.reports;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.sql.ResultSupport;

import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.servlets.Conts.Cont;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class TopSellersDateChooser
 */
public class TopSellersDateChooser extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopSellersDateChooser() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		Attributes att = new Attributes();
		att.set("displayString", "Choose a date");
		return Conts.display("/admin/adminTopSellersDateChooser.jsp", att);
	}

}
