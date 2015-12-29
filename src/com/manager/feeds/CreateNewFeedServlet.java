package com.manager.feeds;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.RssFeed;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.servlets.Closures;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.Session;

/**
 * Servlet implementation class CreateNewSurveyServlet
 */
public final class CreateNewFeedServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
				
		try {

			final String urlInput = parameters.get("url")
			  							.except(new ProcessingError("Missing url parameter"));
			  
			final URL url = new URL(urlInput);
			
			final RssFeed.Data data = new RssFeed.Data(url);
			  		  
			@SuppressWarnings("unused")
			final RssFeed.Id feed = db.put(token, data);

			return Conts.redirect(Closures.feedManagement(url.toString()));
			
		} catch(final ProcessingError ex) {
			return Conts.error("feedManagementError", ex.getMessage());
		} catch(final MalformedURLException ex) {
			return Conts.error("feedManagementError", "Malformed URL: " + ex.getMessage());	
		}
	}
}

