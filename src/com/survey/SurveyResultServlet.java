package com.survey;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;

import com.dataAccess.tables.Survey;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.dataClasses.Nat;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.ProcessingServlet;
import com.servlets.Session;

/**
 * Servlet implementation class SurveyResultServlet
 */
public class SurveyResultServlet extends ProcessingServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void body(
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException, ProcessingError {
		
		final String input = parameters.get("answer").except(new ProcessingError("surveyMessage", "Please make a choice."));
		final Survey.Choice answer = Survey.Choice.parse(input).except(new ProcessingError("surveyMessage", "Please make a choice."));
       
       	final Survey.Id surveyId = db.currentSurvey(); // get the current survey id
        final boolean success = db.vote(surveyId, answer); //vote
        
        if(!success) {
        	throw new ProcessingError("surveyMessage", "Invalid choice");
        }

    	session.surveyAnswered = Maybe.just(surveyId);

	}

	public static final Attributes statistics(final Survey.Data surveyData) {
		
        final Map<Survey.Choice, Nat> votes = surveyData.votes.value;
        
        int sumVotes = 0;
        for(final Survey.Choice choice : surveyData.choices.value)
        {
        	sumVotes = sumVotes + votes.get(choice).value;
        }
        
        final Map<Survey.Choice, Double> percentages = new HashMap<Survey.Choice, Double>();
        
        for(final Survey.Choice choice : surveyData.choices.value) {
        	double  vote = Math.round(votes.get(choice).value * 100.0 / sumVotes * 100.0) / 100.0;
        	percentages.put(choice, vote);
        }
	        
        final Attributes attributes = new Attributes();
        attributes.set("surveyData", surveyData);
        attributes.set("percentages", Collections.unmodifiableMap(percentages));
        attributes.set("sumVotes", sumVotes);		
		
        return attributes;
	}
}
