package com.reports;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.jsp.jstl.sql.ResultSupport;

import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.dataClasses.ResultNotUnique;
import com.manager.DefaultReportResults;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.ReportPageServlet;
import com.servlets.Session;

/**
 * Servlet implementation class ShowTotalSalesReports
 * @author Edward Gagnon
 * @version March 22nd, 2012
 */
public class ShowTotalSalesReports extends ReportPageServlet {
	private static final long serialVersionUID = 1L;


	/* (non-Javadoc)
	 * @see com.servlets.ManagerPageServlet#body(com.dataClasses.Database.Manager, com.dataClasses.Database, com.servlets.Session, com.servlets.Parameters)
	 */
	@Override
	public Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters,
			final ReportDate reportDate)
			throws ServletException, IOException, SQLException {
		
		
		//Create variables
		ResultSet totalSalesWithinTimeLimitResult = null;
		ResultSet listSalesWithinTimeLimitResult = null;
		Attributes attributes = new Attributes();
		
		try {
			totalSalesWithinTimeLimitResult = db.queryUnique("select COALESCE(sum(p.price * p.number_of_copies), 0) as 'Total_Purchase_Within_Time_Limit' from book b, purchase p where b.id = p.book_id and p.purchased_on >= '" + reportDate.getSqlStartDate().toString() + "' and p.purchased_on <= '" + reportDate.getSqlEndDate().toString() + "';");
			listSalesWithinTimeLimitResult = db.query("select b.title as Title, p.number_of_copies as 'number_of_copies', p.purchased_on as 'Purchased_on', COALESCE(p.price * p.number_of_copies) as 'Purchase', COALESCE(b.wholesale_price * p.number_of_copies) as 'Cost', (COALESCE(p.price * p.number_of_copies, 0) - COALESCE(b.wholesale_price * p.number_of_copies, 0)) as 'Profit' from book b, purchase p where b.id = p.book_id and p.purchased_on >= '" + reportDate.getSqlStartDate().toString() + "' and p.purchased_on <= '" + reportDate.getSqlEndDate().toString() + "' Order by p.purchased_on;");
		} catch (ResultNotUnique e) {
			e.getStackTrace();
		}

		
		//Set the specific information
		attributes.set("displayString", "Total Sales Report");
		attributes.set("totalSalesWithinTimeLimitResult", totalSalesWithinTimeLimitResult.getDouble(1));
		attributes.set("listSalesWithinTimeLimitResult", ResultSupport.toResult(listSalesWithinTimeLimitResult));
		
		return Conts.display("/admin/reports/totalSales.jsp", attributes);
	}


}
