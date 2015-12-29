package com.manager.orders;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Nat;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * @author Simon Langlois
 */
public class CreateNewOrderServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Cont body(
			final Manager token,
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {
		
		for(final String idInput : parameters.get("bookId"))
		for(final String quantityInput : parameters.get("quantity"))
		for(final Nat id : Nat.parse(idInput))
		for(final Book.Id book : db.referToBook(token, id.value))
		for(final Nat quantity : Nat.parse(quantityInput))
		{
			db.placeOrder(token, book, quantity);
		
			return Conts.redirect(session.lastPage);
		}
		
		return Conts.error("orderManagementError", "Invalid quantity");
	}
}
