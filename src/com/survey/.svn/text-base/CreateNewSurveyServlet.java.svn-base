package com.survey;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Survey;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.servlets.Closures;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.Session;

/**
 * @author Simon Langlois
 */
public final class CreateNewSurveyServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
		
		try {
			
			final Survey.Id survey = process(token, db, session, parameters);
			final String question = db.get(survey).question.value;
			
			return Conts.redirect(Closures.surveyManagement(question));
			
		} catch(final ProcessingError ex) {
			return Conts.error("surveyManagementError", ex.getMessage());
		}
	}

	private Survey.Id process(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException, ProcessingError {

		final String[] choicesInput = parameters.gets("choice");
		final String questionInput = parameters.get("question")
		  								.except(new ProcessingError("Missing question parameter"));
		  
	
		final Survey.Question question = Survey.Question.parse(questionInput)
											.except(new ProcessingError("Invalid question: " + questionInput));
		  
		final Survey.Choice[] choicesParsed = new Survey.Choice[choicesInput.length];
		for(int i = 0; i < choicesParsed.length; i++) {			  
			choicesParsed[i] = Survey.Choice.parse(choicesInput[i])
						 		.except(new ProcessingError("Invalid choice: " + choicesInput[i]));
		}
		  	  
		final Set<Survey.Choice> choiceSet = new HashSet<Survey.Choice>();
		for(final Survey.Choice choice : choicesParsed) {
			choiceSet.add(choice);
		}
		  
		if(choiceSet.size() < choicesParsed.length) throw new ProcessingError("Duplicate choices");
		  
		final Survey.Choices choices = Survey.Choices.from(choiceSet)
										.except(new ProcessingError("Not enough choices"));
		  
		final Survey.Data data = new Survey.Data(question, choices);
		  		  
		final Survey.Id survey = db.put(token, data);
		
		return survey;
	}
}

