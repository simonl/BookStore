package com.cart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Item;
import com.dataClasses.Maybe;
import com.dataClasses.Nat;
import com.servlets.Closures;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class RemoveFromCart
 */
public class RemoveFromCartServlet extends MainPageServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public Cont body(Database db, Session session, Parameters parameters)
			throws ServletException, IOException, SQLException {

		final Maybe<String> isbnInput = parameters.get("isbn");
		if(isbnInput.isNull())
			return Conts.error("removeFromCartError", "Missing arguments!");
		
		final Maybe<Book.Isbn13> isbn = Book.Isbn13.parse(isbnInput.value());
		
		final Maybe<String> electronicInput = parameters.get("electronic");
		final Maybe<Boolean> electronic = electronicInput.isNull() ? Maybe.just(false) : parseBoolean(electronicInput.value());
		
		if(electronic.isNull())
			return Conts.error("removeFromCartError", "Invalid boolean specifying to remove ebook");
		
		final Maybe<Book.Id> id = db.fromIsbn(isbn.value());
		if(id.isNull())
			return Conts.error("removeFromCartError", "We do not sell this book!");
	
		if(electronic.value())
			removeElectronicFromCart(session, id.value());
		else
			removePaperFromCart(session, id.value());

		return Conts.redirect(Closures.viewCart);
	}
	
	public static final void removePaperFromCart(
			final Session session, 
			final Book.Id book) {
		final Map<Book.Id, Item> cart = session.cart.value;
		
		final Item oldItem = cart.get(book);
		if(oldItem == null) return;
		
		final Item newItem = oldItem.setNumberOfCopies(Nat.from(0).value());
		 
		cart.remove(book);

		if(!newItem.equals(Item.empty))
			cart.put(book, newItem);
	}

	public static final void removeElectronicFromCart(
			final Session session, 
			final Book.Id book) {
		final Map<Book.Id, Item> cart = session.cart.value;
		
		final Item oldItem = cart.get(book);
		if(oldItem == null) return;
		
		final Item newItem = oldItem.setElectronic(false);
		
		cart.remove(book);

		if(!newItem.equals(Item.empty))
			cart.put(book, newItem);
	}
	
	private Maybe<Boolean> parseBoolean(final String input) {
		if(input.equalsIgnoreCase("true")) return Maybe.just(true);
		if(input.equalsIgnoreCase("false")) return Maybe.just(false);

		return Maybe.nothing();
	}
}
