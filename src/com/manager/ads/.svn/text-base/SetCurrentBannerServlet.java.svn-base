package com.manager.ads;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.BannerAd;
import com.dataClasses.Database;
import com.dataClasses.Nat;
import com.servlets.ManagerProcessingServlet;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.Session;

/**
 * @author Simon Langlois
 */
public class SetCurrentBannerServlet extends ManagerProcessingServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void body(
			final Database.Manager token,
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException, ProcessingError {

		for(final String inputId : parameters.get("bannerId"))
		for(final Nat numId : Nat.parse(inputId))
		for(final BannerAd.Id id : db.referToBannerAd(token, numId.value))
		{
			db.setCurrentBannerAd(token, id);
			
			return;
		}
		
		throw new ProcessingError("AdManagementError", "Invalid banner ID");
	}
}
