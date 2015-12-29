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
import com.servlets.Session;

/**
 * @author Edward Gagnon
 */
public class ShowSalesByPublisherReport extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSalesByPublisherReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		//Create variables
		ReportDate reportDate = null;
		ResultSet publisherBooks = null;
		ResultSet publisherTotals = null;
		Attributes attributes = new Attributes();
		
		//Get parameters
		Maybe<String> maybeOption = parameters.get("option");
		Maybe<String> maybePublisher = parameters.get("publisher");
		reportDate = new ReportDate(parameters.get("dateStart"), parameters.get("dateEnd"));
		
		try {
			DefaultReportResults.addDefaultAttributesToReport(db, attributes, reportDate);
			if(!maybePublisher.isNull()){
				publisherTotals = db.queryUnique("Select COALESCE(sum(p.price * p.number_of_copies), 0) as 'total', b.publisher from book b, purchase p " +
						" where b.id = p.book_id" +
						" and b.publisher = '" + maybePublisher.getValue() +
						"' and p.purchased_on >= '" + reportDate.getSqlStartDate().toString() + 
						"' and p.purchased_on <= '" + reportDate.getSqlEndDate().toString() + 
						"' group by 2");

				publisherBooks = db.query("Select COALESCE(p.price * p.number_of_copies) as 'totals', b.title, p.number_of_copies, p.purchased_on " +
						"from purchase p, book b " +
						"where b.id = p.book_id" +
						" and b.publisher = '" + maybePublisher.getValue() +
						"' and p.purchased_on >= '" + reportDate.getSqlStartDate().toString() + 
						"' and p.purchased_on <= '" + reportDate.getSqlEndDate().toString() + 
						"' order by p.purchased_on;");

			}
		} catch (ResultNotUnique e) {
			e.getStackTrace();
		}

		
		//Set the specific information
		attributes.set("displayString", "Sales for " + publisherTotals.getString(2));
		attributes.set("publisherBooks", ResultSupport.toResult(publisherBooks));
		attributes.set("publisherTotals", publisherTotals.getDouble(1));

		if(!maybeOption.isNull())
			attributes.set("option", maybeOption.getValue());
		
		
		return Conts.display("/admin/adminSalesByPublisherDisplay.jsp", attributes );
	}

}
