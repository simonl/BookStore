package com.manager.ads;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.SmallAd;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Nat;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.ManagerProcessingServlet;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.ProcessingServlet;
import com.servlets.Session;

public class SetCurrentAdsServlet extends ManagerProcessingServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void body(
			final Database.Manager token,
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException, ProcessingError {

		final String[] adsInput = parameters.gets("ads");

		if(adsInput.length == 0)
			throw new ProcessingError("AdManagementError", "There must be at least 1 small ad");
		
		final Set<SmallAd.Id> ads = new HashSet<SmallAd.Id>(3);
		outer: for(final String adInput : adsInput) {
			for(final Nat numId : Nat.parse(adInput))
			for(final SmallAd.Id id : db.referToSmallAd(token, numId.value))
			{
				ads.add(id);
				continue outer;
			}
			
			throw new ProcessingError("AdManagementError", "Invalid advertisement ID");
		}
		
		if(ads.size() != adsInput.length)
			throw new ProcessingError("AdManagementError", "Submitted duplicate ads");
		
		db.setCurrentSmallAds(token, ads);

	}
}
