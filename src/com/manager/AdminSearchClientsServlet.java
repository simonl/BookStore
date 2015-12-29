package com.manager;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.jsp.jstl.sql.ResultSupport;

import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class AdminSearchClientsServlet
 * @author Edward Gagnon
 */
public class AdminSearchClientsServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchClientsServlet() {
        super();
    }

	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		
		//Get the search parameters
		Maybe<String> x = parameters.get("searchUserForFirstName");
		Maybe<String> y = parameters.get("searchUserForLastName");
		Maybe<String> z = parameters.get("searchUserForLoginName");
		
		//Create the where condition in the sql statement.
		String where = " where client.id = user.client_id and user.client_id is not null and ";
		where += x.isNull() || x.getValue().length() == 0 ? x.or("") : "client.first_name like '%" + x.getValue().replace("'", "") + "%' and ";
		where += y.isNull() || y.getValue().length() == 0 ? y.or("") : "client.last_name like '%" + y.getValue().replace("'", "") + "%' and ";
		where += z.isNull() || z.getValue().length() == 0 ? z.or("") : "user.login like '%" + z.getValue().replace("'", "") + "%' and ";
		
		where = where.substring(0, where.length() -5) + ";";

		//Get the query results
        ResultSet clientsResults = db.query("select user.id, user.login from user, client" + where);

        //Set the attributes.
		final Attributes attributes = new Attributes();
		attributes.set("users", ResultSupport.toResult(clientsResults));
		
		
		return Conts.display("/admin/adminShowClients.jsp", attributes);
	}

}
