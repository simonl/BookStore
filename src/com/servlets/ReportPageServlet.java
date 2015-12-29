package com.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataClasses.Database;
import com.dataClasses.ResultNotUnique;
import com.manager.DefaultReportResults;
import com.reports.ReportDate;

/**
 * @author Simon Langlois
 */
public abstract class ReportPageServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	public abstract Conts.Cont body(
			final Database.Manager token, 
			final Database db,
			final Session session,
			final Parameters parameters,
			final ReportDate timespan)
			throws ServletException, IOException, SQLException;
	
	@Override
	public final Conts.Cont body(
			final Database.Manager token,
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {

		final String dateStart = parameters.get("dateStart").or("01/01/2000");
		final String dateEnd = parameters.get("dateEnd").or("01/01/3000");
		
		final ReportDate timespan = new ReportDate(dateStart, dateEnd);
		
		final Conts.Cont cont = body(token, db, session, parameters, timespan);
		if(cont.getType() != Conts.Type.DISPLAY) return cont;
		
		final String middleReportContainerPanelPath = cont.getDisplay();
		final Attributes attributes = cont.getAttributes();
		
		try {
			DefaultReportResults.addDefaultAttributesToReport(db, attributes, timespan);
		} catch (final ResultNotUnique e) {
			throw new SQLException("Could not get sales data", e);
		}

		attributes.set("dateStart", dateStart);
		attributes.set("dateEnd", dateEnd);
		
		attributes.set("middleReportContainerPanelPath", middleReportContainerPanelPath);
		return Conts.display("/admin/reports/template.jsp", attributes);
	}
}
