package com.servlets;

import java.util.HashMap;

import com.cart.ViewCartServlet;
import com.dataAccess.tables.Book;
import com.manager.AdminShowBookServlet;
import com.manager.feeds.FeedManagementServlet;
import com.survey.SurveyManagementServlet;
import com.view.book.ViewBookServlet;
import com.welcome.WelcomeServlet;

/**
 * A bunch of ClosedServlets
 */
public abstract class Closures {

	public static final ClosedServlet welcome =
		new ClosedServlet(new WelcomeServlet());
	
	public static final ClosedServlet viewCart =
		new ClosedServlet(new ViewCartServlet());

	@SuppressWarnings("serial")
	public static final ClosedServlet viewBook(final Book.Isbn13 book) {
		return new ClosedServlet(new ViewBookServlet(), new Parameters(new HashMap<String, String[]>() {{ 
			put("isbn", new String[] { book.value }); 
		}}));
	}
	
	@SuppressWarnings("serial")
	public static final ClosedServlet adminShowBook(final Book.Isbn13 book) {
		return new ClosedServlet(new AdminShowBookServlet(), new Parameters(new HashMap<String, String[]>() {{ 
			put("isbn", new String[] { book.value });
		}}));
	}

	public static final ClosedServlet surveyManagement = 
		new ClosedServlet(new SurveyManagementServlet());
	@SuppressWarnings("serial")
	public static final ClosedServlet surveyManagement(final String searchKey) {
		return new ClosedServlet(new SurveyManagementServlet(), new Parameters(new HashMap<String, String[]>() {{ 
			put("searchKey", new String[] { searchKey });
		}}));
	}
	
	public static final ClosedServlet feedManagement = 
		new ClosedServlet(new FeedManagementServlet());
	@SuppressWarnings("serial")
	public static final ClosedServlet feedManagement(final String searchKey) {
		return new ClosedServlet(new FeedManagementServlet(), new Parameters(new HashMap<String, String[]>() {{ 
			put("searchKey", new String[] { searchKey });
		}}));
	}
}
