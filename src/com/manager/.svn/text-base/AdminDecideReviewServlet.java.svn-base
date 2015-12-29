package com.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dataAccess.tables.Review.Data;
import com.dataAccess.tables.Review.Id;
import com.dataAccess.tables.User;
import com.dataClasses.CouldNotConnect;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.servlets.Session;
import com.xml.XmlFactory;

/**
 * Servlet implementation class AdminDecideReviewServlet
 * @author Edward Gagnon
 */
public class AdminDecideReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDecideReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
	protected final void doGet(
			final HttpServletRequest request, 
			final HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected final void doPost(
			final HttpServletRequest request, 
			final HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			String reviewDecision = request.getParameter("reviewDecision");
			String reviewID = request.getParameter("reviewId");
			final Session session = (Session) request.getSession().getAttribute("session");
			final Maybe<User.Authority> user = session.getLoggedOnUser();
			String errorMessage = "";
			HashMap<String, String> map = new HashMap<String, String>();
			
			Database db = null;
			Maybe<Database.Manager> token = null;
			
			if(user.isNull()){
				System.out.println("User was null");
				XmlFactory.buildMap(map, "errorMessage", "User was null");
				XmlFactory.buildMap(map, "success", "false");
				return;
			}
			try {
				db = Database.connect();
				token = db.restricted(user.value());
				if(token.isNull()) {
					XmlFactory.buildMap(map, "errorMessage", "Unauthorized access");
					XmlFactory.buildMap(map, "success", "false");
					System.out.println("token was null");
					return;

				}
				else{
					System.out.println("Token is good");
				}
			} catch (CouldNotConnect e1) {
				XmlFactory.buildMap(map, "errorMessage", "Could Not Connect");
				XmlFactory.buildMap(map, "success", "false");
				return;
			}catch (SQLException e1) {
				XmlFactory.buildMap(map, "errorMessage", "Database error");
				XmlFactory.buildMap(map, "success", "false");
				return;
			}
			
			Integer id = null;
			try {
				id = Integer.parseInt(reviewID);
			} catch (NumberFormatException e) {
				XmlFactory.buildMap(map, "errorMessage", "Bad id number");
				XmlFactory.buildMap(map, "success", "false");
			}
			
			try {
				//Get all the pending reviews, just to find the matching id
				Set<Id> x = db.getPendingReviews(token.getValue());
				Set<Data> y = db.getReviews(x);
				Id reviewId = null;
				for(Id i: x){
					if(i.value.equals(id)){
						reviewId = i;
					}
				}

				if(reviewId != null){
					if(reviewDecision.equals("approve")){
						db.approve(token.getValue(), reviewId);
						XmlFactory.buildMap(map, "errorMessage", "");
						XmlFactory.buildMap(map, "success", "true");
					}
					else if(reviewDecision.equals("deny")){
						db.reject(token.getValue(), reviewId);
						XmlFactory.buildMap(map, "errorMessage", "");
						XmlFactory.buildMap(map, "success", "true");
					}
					else{
						XmlFactory.buildMap(map, "errorMessage", "Bad review id");
						XmlFactory.buildMap(map, "success", "false");
					}
				}
				else{
					XmlFactory.buildMap(map, "errorMessage", "Incorrectly parsed reviewId");
					XmlFactory.buildMap(map, "success", "false");
				}
			} catch (SQLException e) {
				XmlFactory.buildMap(map, "errorMessage", "Database error");
				XmlFactory.buildMap(map, "success", "false");
			}
			
			PrintWriter out = response.getWriter();
			out.print(XmlFactory.convertToXML(XmlFactory.createDocument(map, "ServerAnswer")));
		} catch (Exception e) {
			HashMap<String, String> map = new HashMap<String, String>();
			XmlFactory.buildMap(map, "errorMessage", "Unknown Error");
			XmlFactory.buildMap(map, "success", "false");
			PrintWriter out = response.getWriter();
			out.print(XmlFactory.convertToXML(XmlFactory.createDocument(map, "ServerAnswer")));
		}
		return;
		
	}

}
