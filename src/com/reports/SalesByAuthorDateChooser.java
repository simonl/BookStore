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
public class SalesByAuthorDateChooser extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesByAuthorDateChooser() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		Attributes att = new Attributes();
		ResultSet authors = db.query("select author, count(id) as 'count' from book group by 1 order by 1;");
		att.set("displayString", "Choose a date");
		att.set("authors", ResultSupport.toResult(authors));
		return Conts.display("/admin/adminSalesByAuthorDateChooser.jsp", att);
	}

}
