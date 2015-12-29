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
 * Servlet implementation class ShowSalesByAuthorReport
 */
public class ShowSalesByAuthorReport extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSalesByAuthorReport() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		//Create variables
		ReportDate reportDate = null;
		ResultSet authorBooks = null;
		ResultSet authorTotals = null;
		Attributes attributes = new Attributes();
		
		//Get parameters
		Maybe<String> maybeOption = parameters.get("option");
		Maybe<String> maybeAuthor = parameters.get("author");
		reportDate = new ReportDate(parameters.get("dateStart"), parameters.get("dateEnd"));
		
		try {
			DefaultReportResults.addDefaultAttributesToReport(db, attributes, reportDate);
			if(!maybeAuthor.isNull()){
				authorBooks = db.query("select book.title, book.author, purchase.number_of_copies, purchase.price, (purchase.price * purchase.number_of_copies) as 'totals', purchase.purchased_on from book, purchase where book.id = purchase.book_id and author = '" + maybeAuthor.getValue() +
						"' and purchase.purchased_on >= '" + reportDate.getSqlStartDate().toString() + "' and purchase.purchased_on <= '" + reportDate.getSqlEndDate().toString() + "' order by purchase.purchased_on;");
				
				authorTotals = db.queryUnique("select COALESCE(SUM(purchase.price * purchase.number_of_copies), 0) as 'total' " +
						"from book, purchase " +
						"where book.id = purchase.book_id and " +
						"author = '" + maybeAuthor.getValue() +
					"' and purchase.purchased_on >= '" + reportDate.getSqlStartDate().toString() + 
					"' and purchase.purchased_on <= '" + reportDate.getSqlEndDate().toString() + 
					"';"); 
			}
		} catch (ResultNotUnique e) {
			e.getStackTrace();
		}

		
		//Set the specific information
		attributes.set("displayString", "Sales for " + (maybeAuthor.isNull() ? "" : maybeAuthor.getValue()));
		attributes.set("authorBooks", ResultSupport.toResult(authorBooks));
		attributes.set("authorTotals", authorTotals.getDouble(1));

		if(!maybeOption.isNull())
			attributes.set("option", maybeOption.getValue());
		
		
		return Conts.display("/admin/adminSalesByAuthorDisplay.jsp", attributes );
	}

}
