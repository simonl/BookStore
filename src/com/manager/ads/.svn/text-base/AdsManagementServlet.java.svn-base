package com.manager.ads;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.BannerAd;
import com.dataAccess.tables.RssFeed;
import com.dataAccess.tables.SmallAd;
import com.dataAccess.tables.SmallAd.Id;
import com.dataClasses.Database;
import com.dataClasses.Func;
import com.dataClasses.Funcs;
import com.dataClasses.Preparers;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

public class AdsManagementServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {

		final Map<SmallAd.Id, SmallAd.Data> smallAds = 
			Funcs.maps(db.getSmallAds(token, "WHERE true", Preparers.empty), db.getSmallAd);
		
		final Map<BannerAd.Id, BannerAd.Data> bannerAds =
			Funcs.maps(db.getBannerAds(token, "WHERE true", Preparers.empty), db.getBannerAd);
		
		final BannerAd.Id currentBannerAd = db.getCurrentBannerAd();
		final Set<SmallAd.Id> currentSmallAds = db.getCurrentSmallAds();
		
		final Map<SmallAd.Id, Boolean> isCurrent =
			Funcs.maps(db.getSmallAds(token, "WHERE true", Preparers.empty), new Func<SmallAd.Id, Boolean>() {
				public Boolean apply(final SmallAd.Id id) throws RuntimeException {
					return currentSmallAds.contains(id);
				} 
			});
		
		final Attributes attributes = new Attributes();
		attributes.set("currentBannerAd", currentBannerAd);
		attributes.set("currentSmallAds", currentSmallAds);
		attributes.set("bannerAds", bannerAds.entrySet());
		attributes.set("smallAds", smallAds.entrySet());
		attributes.set("isCurrent", isCurrent);

		return Conts.display("/admin/manageAds.jsp", attributes);
	}
}
