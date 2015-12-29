package com.cart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Funcs;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**  
 * @author Simon Langlois
 */
public class ViewCartServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {
				
		final Map<Book.Id, Book.Data> books = Funcs.maps(session.cart.value.keySet(), db.getBook);
		
		final Attributes attributes = new Attributes();

		attributes.set("cartEntries", books.entrySet());
		
		return Conts.display("/jsp/viewCart.jsp", attributes);
	}

}
