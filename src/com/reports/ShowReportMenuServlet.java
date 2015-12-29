package com.reports;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * @author Edward Gagnon
 * @version March 22nd, 2012
 */
public class ShowReportMenuServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowReportMenuServlet() {
        super();
    }

	/* (non-Javadoc)
	 * @see com.servlets.ManagerPageServlet#body(com.dataClasses.Database.Manager, com.dataClasses.Database, com.servlets.Session, com.servlets.Parameters)
	 */
	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {

		com.servlets.Attributes att = new com.servlets.Attributes();
		att.set("displayString", "Reports: Main Menu");
		return Conts.display("/admin/adminMainReportDisplay.jsp", att);
	}

}
