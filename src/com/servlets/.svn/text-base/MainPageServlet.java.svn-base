package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.BannerAd;
import com.dataAccess.tables.RssFeed;
import com.dataAccess.tables.SmallAd;
import com.dataAccess.tables.Survey;
import com.dataAccess.tables.User;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.mobile.ShowBooksMobileServlet;
import com.survey.SurveyResultServlet;

/**
 * @author Simon Langlois
 */
public abstract class MainPageServlet extends PageServlet {
	private static final long serialVersionUID = 1L;
	
	public abstract Conts.Cont body(
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException;
	
	@Override
	public final Conts.Cont main(
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {

		if(session.isMobile)
			return Conts.redirect(new ClosedServlet(new ShowBooksMobileServlet()));
		
		final Conts.Cont cont = body(db, session, parameters);
		if(cont.getType() != Conts.Type.DISPLAY) return cont;
		
		final String middleContainerPanelPath = cont.getDisplay();
		final Attributes attributes = cont.getAttributes();

		attributes.set("middleContainerPanelPath", middleContainerPanelPath);

		final Survey.Id currentSurvey = db.currentSurvey();
		final RssFeed.Id currentFeed = db.getCurrentFeed();
		final BannerAd.Id currentBanner = db.getCurrentBannerAd();
		final Set<SmallAd.Id> currentAds = db.getCurrentSmallAds();
		
		attributes.set("currentSurvey", db.get(currentSurvey));
		attributes.set("currentFeed", db.get(currentFeed));
		attributes.set("currentBanner", db.get(currentBanner));
		attributes.set("currentAds", db.getSmallAds(currentAds));
		attributes.set("allGenres", db.getAllGenres());
		attributes.set("recentBooks", db.getBooks(db.lastBooks(3)));
		
		if(!session.surveyAnswered.isNull()) {
			final Survey.Id id = session.surveyAnswered.value();
			if(!id.equals(currentSurvey)) {
				session.surveyAnswered = Maybe.nothing(); 
			} else {
				final Attributes statAttributes = 
					SurveyResultServlet.statistics(db.get(currentSurvey));

				for(final Entry<String, Object> entry : statAttributes) {
					attributes.set(entry.getKey(), entry.getValue());
				}
			}
		}
		
		if(!session.loggedOnUser.isNull()) {
			final User.Authority user = session.loggedOnUser.value();
			attributes.set("userPrivateData", db.get(user));
		}
	
		return Conts.display("/jsp/index.jsp", attributes);		
	}
}
