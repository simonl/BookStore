package com.cart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataAccess.tables.Book.Data;
import com.dataClasses.Database;
import com.dataClasses.Item;
import com.dataClasses.Maybe;
import com.dataClasses.Nat;
import com.servlets.Closures;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

public class AddToCartServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

    @Override
	public Conts.Cont body(
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {
		
		final Maybe<String> isbnInput = parameters.get("isbn");
		final Maybe<String> numberOfCopiesInput = parameters.get("numberOfCopies");
		final Maybe<String> electronicInput = parameters.get("electronic");
		
		if(isbnInput.isNull() || numberOfCopiesInput.isNull() || electronicInput.isNull()) {
			return Conts.error("addToCartError", "Missing arguments!");
		}
		
		final Maybe<Book.Isbn13> isbn = Book.Isbn13.parse(isbnInput.value());
		final Maybe<Nat> numberOfCopies = Nat.parse(numberOfCopiesInput.value());
		final Maybe<Boolean> electronic = parseBoolean(electronicInput.value());
		
		if(isbn.isNull() || numberOfCopies.isNull() || electronic.isNull()) {
			return Conts.error("addToCartError", "Invalid arguments!");
		}

		final Maybe<Book.Id> mbook = db.fromIsbn(isbn.value());
		if(mbook.isNull()) {
			return Conts.error("addToCartError", "We do not sell this book!");
		}

		final Book.Id id = mbook.value();
		final Item newItem = new Item(numberOfCopies.value(), electronic.value());
		
		try {
			addToCart(db, session, id, newItem);
		} catch(final InvalidCartItem ex) {
			return Conts.error("addToCartError", ex.getMessage());
		}
		
		return Conts.redirect(Closures.viewCart);
	}

	public static final void addToCart(
			final Database db, 
			final Session session,
			final Book.Id id, 
			final Item newItem) 
			throws InvalidCartItem, SQLException {
				
		final Map<Book.Id, Item> cart = session.cart.value;
		
		final Item previous = cart.containsKey(id) ? cart.get(id) : Item.empty;
		
		setCartItem(db, session, id, Item.merge(previous, newItem));
	}
	
	public static final void setCartItem(
			final Database db, 
			final Session session,
			final Book.Id id, 
			final Item newItem) 
			throws InvalidCartItem, SQLException {
		
		final Book.Data data = db.get(id);
		
		if(newItem.equals(Item.empty))
			throw new InvalidCartItem("This is an empty purchase!");
		if(newItem.electronic && data.eformats.size() == 0)
			throw new InvalidCartItem("This books is not available electronically");
		if(data.numberOfBooks.isNull() && newItem.numberOfCopies.value > 0)
			throw new InvalidCartItem("This books is not available in physically");
		if(!data.numberOfBooks.isNull() && newItem.numberOfCopies.value > data.numberOfBooks.value().value)
			throw new InvalidCartItem("There are not enough books in stock");
		
		final Map<Book.Id, Item> cart = session.cart.value;
		
		cart.put(id, newItem);
	}
    
	public static final Maybe<Boolean> parseBoolean(final String input) {
		if(input.equalsIgnoreCase("true")) return Maybe.just(true);
		if(input.equalsIgnoreCase("false")) return Maybe.just(false);

		return Maybe.nothing();
	}
}
