package com.manager;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.dataAccess.tables.Review.Data;
import com.dataAccess.tables.Review.Id;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class AdminShowReviewsServlet
 */
public class AdminShowReviewsServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminShowReviewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		Set<Id> pendingReviewsID = db.getPendingReviews(token);
		Map<Id, Data> pendingReviewsMap = new HashMap<Id, Data>();
		for(Id id: pendingReviewsID){
			if(!db.get(id).reviewText.getIsNull())
				pendingReviewsMap.put(id, db.get(id));
		}
		
		
		final Attributes attributes = new Attributes();
		attributes.set("reviews", pendingReviewsMap.entrySet());
		
		return Conts.display("/jsp/adminAllowDenyReviews.jsp", attributes);
	}

}
