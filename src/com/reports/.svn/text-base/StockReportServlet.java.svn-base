package com.reports;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.sql.ResultSupport;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Funcs;
import com.dataClasses.ResultNotUnique;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.manager.DefaultReportResults;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * 
 */
public class StockReportServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
		
		//Create variables
		ReportDate reportDate = null;
		Attributes attributes = new Attributes();
		ResultSet stock = null;
		ResultSet listValue = null;
		ResultSet wholeValue = null;
		
		//Get parameters
		Maybe<String> maybeOption = parameters.get("option");
		reportDate = new ReportDate(parameters.get("dateStart"), parameters.get("dateEnd"));
		
		try {
			DefaultReportResults.addDefaultAttributesToReport(db, attributes, reportDate);
			stock = db.query("select b.title, COALESCE(b.list_price * b.number_of_books, 0) as 'listValue', COALESCE(b.wholesale_price * b.number_of_books, 0) as 'wholeValue', COALESCE(b.number_of_books, -1) as 'inventory' from book b order by 1;");
			listValue = db.queryUnique("select COALESCE(sum(b.list_price * b.number_of_books), 0) as 'listValue' from book b;");
			wholeValue = db.queryUnique("select COALESCE(sum(b.wholesale_price * b.number_of_books), 0) as 'wholeValue' from book b;");
		} catch (ResultNotUnique e) {
			e.getStackTrace();
		}

		
		//Set the specific information
		attributes.set("displayString", "Stock Report");


		if(!maybeOption.isNull())
			attributes.set("option", maybeOption.getValue());
		attributes.set("stock", ResultSupport.toResult(stock));
		attributes.set("listValue", listValue.getDouble(1));
		attributes.set("wholeValue", wholeValue.getDouble(1));
		
		
		return Conts.display("/admin/adminStockReportDisplay.jsp", attributes );
		

//		final Set<Book.Id> lowInventory = db.lowInventory(token);
//		final Map<Book.Id, Book.Data> lowDatas = Funcs.maps(lowInventory, db.getBook);
//
//		final Attributes attributes = new Attributes();
//		attributes.set("lowInventory", lowInventory);
//		attributes.set("lowDatas", lowDatas);
//		
//		return Conts.display("jsp/noDatabase.jsp", attributes );
	}

}
