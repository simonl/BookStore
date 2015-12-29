package com.cart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Item;
import com.dataClasses.Nat;
import com.servlets.Closures;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * @author David Preseault
 * 
 * Servlet implementation class UpdateCartServlet
 */
public class UpdateCartServlet extends MainPageServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public Cont body(Database db, Session session, Parameters parameters)
			throws ServletException, IOException, SQLException {

		final Set<Book.Id> isbnSet = session.cart.value.keySet();
		forFields: for (Book.Id book : isbnSet)
		{
			final String name = db.get(book).isbn13.value;
			for(final String param : parameters.get(name))
			for(final Nat newQty : Nat.parse(param))
			{
				final Item item = session.cart.value.get(book);
				if(item == null) continue forFields;
				
				if (newQty.value == 0)
					RemoveFromCartServlet.removePaperFromCart(session, book);
				else try {
					AddToCartServlet.setCartItem(db, session, book, item.setNumberOfCopies(newQty));
				} catch (final InvalidCartItem e) {
					// Could not modify that quantity
				}
			}
		}

		return Conts.redirect(Closures.viewCart);
	}
}
