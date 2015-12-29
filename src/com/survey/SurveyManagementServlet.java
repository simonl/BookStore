package com.survey;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Survey;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

public final class SurveyManagementServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {

		final Survey.Id currentSurvey = db.currentSurvey();
		final Map<Survey.Id, Survey.Data> surveys = new HashMap<Survey.Id, Survey.Data>();
		
		final Maybe<String> key = parameters.get("searchKey");
		
		final Set<Survey.Id> ids = key.isNull() ? 
			db.getAllSurveys(token) : 
			db.getSurveysLike(token, key.value());
			
		for(final Survey.Id id : ids) {
			surveys.put(id, db.get(id));
		}

		final Attributes attributes = new Attributes();
		attributes.set("managerCurrentSurvey", currentSurvey);
		attributes.set("surveys", surveys.entrySet());
				
		return Conts.display("/admin/manageSurveys.jsp", attributes);
	}

}
