package com.reports;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;

import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.dataClasses.Database.Manager;
import com.servlets.ClosedServlet;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.ReportPageServlet;
import com.servlets.Session;

/**
 * Servlet implementation class SalesByAuthorDateChooser
 */
public class ChooseReportDatesServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Cont body(
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {

		final Maybe<String> dateStart = parameters.get("dateStart");
		final Maybe<String> dateEnd = parameters.get("dateEnd");

		if(dateStart.isNull())
			return Conts.error("reportDatesError", "Missing start date");
		if(dateEnd.isNull())
			return Conts.error("reportDatesError", "Missing end date");
		
		@SuppressWarnings("serial")
		final Map<String, String[]> reportDates = new HashMap<String, String[]>() {{
			put("dateStart", new String[] { dateStart.value() });
			put("dateEnd", new String[] { dateEnd.value() });
		}};

		final ClosedServlet previous = session.lastPage;
		
		final Parameters extended = new Parameters(merge(previous.parameters.parameters, reportDates));
		final ClosedServlet modified = new ClosedServlet(previous.servlet, extended);
		
		return Conts.redirect(modified);
	}
	
	public static final <K, V> Map<K, V> merge(final Map<K, V> first, final Map<K, V> second) {
		final Map<K, V> result = new HashMap<K, V>();

		for(final K key : first.keySet())
			result.put(key, first.get(key));
		
		for(final K key : second.keySet())
			result.put(key, second.get(key));
		
		return result;
	}

}
