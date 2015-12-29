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
 * Servlet implementation class ShowTopSellersReport
 */
public class ShowTopSellersReport extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowTopSellersReport() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		//Create variables
		ReportDate reportDate = null;
		Attributes attributes = new Attributes();
		ResultSet topSellers = null;
		
		//Get parameters
		Maybe<String> maybeOption = parameters.get("option");
		reportDate = new ReportDate(parameters.get("dateStart"), parameters.get("dateEnd"));
		
		try {
			DefaultReportResults.addDefaultAttributesToReport(db, attributes, reportDate);
			topSellers = db.query("select COALESCE(sum(p.price * p.number_of_copies)) as 'Total_Sales', b.title, p.number_of_copies, b.publisher " +
					"from purchase p, book b " +
					" where b.id = p.book_id" +
					" and p.purchased_on >= '" + reportDate.getSqlStartDate().toString() + "' and p.purchased_on <= '" + reportDate.getSqlEndDate().toString() + "'" +
					" group by 2, 3, 4" +
					" order by 1 desc;");
		} catch (ResultNotUnique e) {
			e.getStackTrace();
		}

		
		//Set the specific information
		attributes.set("displayString", "Top Sellers Report");


		if(!maybeOption.isNull())
			attributes.set("option", maybeOption.getValue());
		attributes.set("topSellers", ResultSupport.toResult(topSellers));
		
		
		return Conts.display("/admin/adminTopSellersDisplay.jsp", attributes );
	}
}
