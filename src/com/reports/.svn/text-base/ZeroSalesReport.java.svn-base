package com.reports;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
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
 * Servlet implementation class ZeroSalesReport
 */
public class ZeroSalesReport extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZeroSalesReport() {
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
		ResultSet zeroSales = null;
		
		//Get parameters
		Maybe<String> maybeOption = parameters.get("option");
		reportDate = new ReportDate(parameters.get("dateStart"), parameters.get("dateEnd"));
		
		try {
			DefaultReportResults.addDefaultAttributesToReport(db, attributes, reportDate);
			zeroSales = db.query("select b.title, b.author, b.publisher, b.list_price, b.wholesale_price " +
					"from book b " +
					"left outer join purchase p on (b.id = p.book_id) " +
					"where p.purchased_on <= '" + reportDate.getSqlStartDate().toString() + "' or p.purchased_on >= '" + reportDate.getSqlEndDate().toString() + "' or (p.price is null) group by 1, 2, 3, 4;");
		} catch (ResultNotUnique e) {
			e.getStackTrace();
		}

		
		//Set the specific information
		attributes.set("displayString", "Zero Sales Report");


		if(!maybeOption.isNull())
			attributes.set("option", maybeOption.getValue());
		attributes.set("zeroSales", ResultSupport.toResult(zeroSales));
		
		
		return Conts.display("/admin/adminZeroSalesDisplay.jsp", attributes );
	}

}
