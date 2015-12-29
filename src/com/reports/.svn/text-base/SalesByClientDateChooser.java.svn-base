package com.reports;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.jsp.jstl.sql.ResultSupport;

import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * @author Edward Gagnon
 */
public class SalesByClientDateChooser extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesByClientDateChooser() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		Attributes att = new Attributes();
		ResultSet clients = db.query("Select c.first_name, c.last_name, c.id from client c, user u where c.id = u.client_id order by c.last_name;");
		att.set("displayString", "Choose a date");
		att.set("clients", ResultSupport.toResult(clients));
		return Conts.display("/admin/adminSalesByClientDateChooser.jsp", att);
	}

}
