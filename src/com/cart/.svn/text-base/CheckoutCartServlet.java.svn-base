package com.cart;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Address;
import com.dataAccess.tables.Book;
import com.dataAccess.tables.Book.Id;
import com.dataAccess.tables.Client;
import com.dataAccess.tables.Province;
import com.dataAccess.tables.Purchase;
import com.dataAccess.tables.User;
import com.dataAccess.tables.User.Data;
import com.dataClasses.CreditCardType;
import com.dataClasses.Database;
import com.dataClasses.Func;
import com.dataClasses.Funcs;
import com.dataClasses.Item;
import com.dataClasses.Maybe;
import com.dataClasses.Money;
import com.dataClasses.Month;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

public class CheckoutCartServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
			
		final Maybe<User.Authority> user = session.loggedOnUser;
		
		if(user.isNull())
			return Conts.error("checkoutError", "You are not logged on!");
		
		final Maybe<Client.Id> client = db.get(user.value()).clientID;

		if(client.isNull())
			return Conts.error("checkoutError", "You are not a client!");

		final Address.Id billing = db.get(client.value()).billingAddressID;
		final Province.Id province = db.get(billing).province;
		final Province.Data provinceData = db.get(province);
		final Province.Rate taxRate = provinceData.taxRate;
		final Maybe<Province.Rate> secondTaxRate = provinceData.secondTaxRate;
		

		final Map<Book.Id, Item> cart = session.cart.value;
		final Map<Book.Id, Book.Data> books = Funcs.maps(cart.keySet(), db.getBook);
		
		final Attributes attributes = new Attributes();
		attributes.set("cartEntries", books.entrySet());
		attributes.set("months", Arrays.asList(Month.values()));
		attributes.set("cardTypes", Arrays.asList(CreditCardType.values()));

		final Map<Book.Id, Money> itemTotals = Funcs.maps(cart.keySet(), new Func<Book.Id, Money>() {
			public Money apply(final Book.Id id) {
				return itemTotal(books.get(id).salePrice, cart.get(id));
			} 
		});
		
		final Money cost = ConfirmCheckoutServlet.total(itemTotals.values());
		final Money total = ConfirmCheckoutServlet.withTax(cost, taxRate);
		
		attributes.set("cost", cost);
		attributes.set("taxRate", taxRate);
		attributes.set("total", total.value.setScale(2,BigDecimal.ROUND_HALF_UP));
		if(!secondTaxRate.isNull()) {
			final Money secondTotal = ConfirmCheckoutServlet.withTax(total, secondTaxRate.value());
			attributes.set("secondTaxRate", secondTaxRate.value());
			attributes.set("secondTotal", secondTotal.value.setScale(2,BigDecimal.ROUND_HALF_UP));
		}
		
		return Conts.display("/jsp/checkoutCart.jsp", attributes);
	}

	public static final Money itemTotal(final Money price, final Item item) {
		final int number = item.numberOfCopies.value + (item.electronic ? 1 : 0);
		final BigDecimal itemTotal = price.value.multiply(new BigDecimal(number));
		
		return Money.from(itemTotal).value();
	}
}
