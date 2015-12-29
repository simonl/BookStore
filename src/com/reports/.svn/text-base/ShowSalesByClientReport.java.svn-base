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
import com.dataClasses.Maybe;
import com.dataClasses.ResultNotUnique;
import com.dataClasses.Database.Manager;
import com.manager.DefaultReportResults;
import com.servlets.Conts.Cont;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class ShowSalesByClientReport
 */
public class ShowSalesByClientReport extends ManagerPageServlet{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSalesByClientReport() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		//Create variables
		ReportDate reportDate = null;
		ResultSet clientBooks = null;
		ResultSet clientTotals = null;
		Attributes attributes = new Attributes();
		
		//Get parameters
		Maybe<String> maybeOption = parameters.get("option");
		Maybe<String> maybeClient = parameters.get("client");
		reportDate = new ReportDate(parameters.get("dateStart"), parameters.get("dateEnd"));
		
		try {
			DefaultReportResults.addDefaultAttributesToReport(db, attributes, reportDate);
			if(!maybeClient.isNull()){
				clientTotals = db.queryUnique("Select COALESCE(sum(p.price * p.number_of_copies), 0) as 'total', CONCAT(c.first_name, ' ',  c.last_name) as 'name' from client c, user u, purchase p " +
						" where c.id = u.client_id" +
						" and u.id = p.user_id " +
						" and c.id = " + maybeClient.getValue() +
						" and p.purchased_on >= '" + reportDate.getSqlStartDate().toString() + 
						"' and p.purchased_on <= '" + reportDate.getSqlEndDate().toString() + 
						"' group by 2");

				clientBooks = db.query("Select COALESCE(p.price * p.number_of_copies) as 'totals', b.title, p.number_of_copies, p.purchased_on " +
						"from client c, user u, purchase p, book b " +
						"where c.id = u.client_id and u.id = p.user_id and b.id = p.book_id" +
						" and p.purchased_on >= '" + reportDate.getSqlStartDate().toString() + 
						"' and p.purchased_on <= '" + reportDate.getSqlEndDate().toString() + 
						"' and c.id = " + maybeClient.getValue() +
						" order by p.purchased_on;");

			}
		} catch (ResultNotUnique e) {
			e.getStackTrace();
		}

		
		//Set the specific information
		attributes.set("displayString", "Sales for " + clientTotals.getString(2));
		attributes.set("clientBooks", ResultSupport.toResult(clientBooks));
		attributes.set("clientTotals", clientTotals.getDouble(1));

		if(!maybeOption.isNull())
			attributes.set("option", maybeOption.getValue());
		
		
		return Conts.display("/admin/adminSalesByClientDisplay.jsp", attributes );
	}
	

}
