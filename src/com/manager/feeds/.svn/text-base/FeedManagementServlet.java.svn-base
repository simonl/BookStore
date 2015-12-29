package com.manager.feeds;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.RssFeed;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

public class FeedManagementServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {

		final RssFeed.Id currentFeed = db.getCurrentFeed();
		final Map<RssFeed.Id, RssFeed.Data> feeds = new HashMap<RssFeed.Id, RssFeed.Data>();
		
		final Maybe<String> key = parameters.get("searchKey");
		
		final Set<RssFeed.Id> ids = key.isNull() ? 
			db.getAllFeeds(token) : 
			db.getFeedsLike(token, key.value());

		for(final RssFeed.Id id : ids) {
			feeds.put(id, db.get(id));
		}

		final Attributes attributes = new Attributes();
		attributes.set("managerCurrentFeed", currentFeed);
		attributes.set("feeds", feeds.entrySet());

		return Conts.display("/admin/manageFeeds.jsp", attributes);
	}
}
