package com.survey;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.Survey;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.dataClasses.Nat;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.ManagerProcessingServlet;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.Session;

/**
 * Servlet implementation class ChangeCurrentSurveyServlet
 */
public class ChangeCurrentSurveyServlet extends ManagerProcessingServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void body(
			final Database.Manager token,
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException, ProcessingError {
		
        for(final String inputId : parameters.get("surveyId"))
        for(final Nat parsedId : Nat.parse(inputId))
        for(final Survey.Id validId : db.referToSurvey(token, parsedId.value))
        {
       		db.setCurrentSurvey(token, validId);
       		
       		return;
        }
        
        throw new ProcessingError("surveyManagementError", "Please choose a survey");
	}
}
