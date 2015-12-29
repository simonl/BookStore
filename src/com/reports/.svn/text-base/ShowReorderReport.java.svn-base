package com.reports;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataAccess.tables.Book.Data;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Funcs;
import com.dataClasses.Nat;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.Parameters;
import com.servlets.ReportPageServlet;
import com.servlets.Session;

/**
 * Servlet implementation class ShowReorderReport
 */
public class ShowReorderReport extends ReportPageServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	public Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters,
			final ReportDate timespan)
			throws ServletException, IOException, SQLException {
		
		final Attributes attributes = new Attributes();

		final Nat minimum = db.getMinimumNumberOfBooks(token);

		// details
		final Set<Book.Data> lowInventory = Funcs.map(db.lowInventory(token), db.getBook);

		// Summary
		final int differentBooks = lowInventory.size();
		int missingBooks = 0;
		for(final Book.Data book : lowInventory)
			missingBooks += (minimum.value - book.numberOfBooks.value().value);
		
 		attributes.set("minimum", minimum);
		attributes.set("lowInventory", lowInventory);
		attributes.set("differentBooks", differentBooks);
		attributes.set("missingBooks", missingBooks);
		
		attributes.set("displayString", "Reorder Report");
		return Conts.display("/admin/reports/reorder.jsp", attributes);
	}

}
