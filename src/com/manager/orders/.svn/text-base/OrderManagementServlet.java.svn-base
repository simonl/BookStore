package com.manager.orders;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataAccess.tables.Order;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.dataClasses.Nat;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

public class OrderManagementServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Cont body(
			final Manager token,
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {
		
		Maybe<String> searchKey = parameters.get("searchKey");
		if(searchKey.isNull() || searchKey.value().equals(""))
			searchKey = Maybe.nothing();
		
		for(final String key : searchKey)
		for(final Book.Isbn13 isbn : Book.Isbn13.parse(key.trim()))
		for(final Book.Id book : db.fromIsbn(isbn))
		{
			final Maybe<Order.Id> current = db.getPendingOrder(token, book);

			final List<Order.Id> orders = db.getReceivedOrders(token, book);
			
			final Attributes attributes = new Attributes();
			attributes.set("book", book);
			attributes.set("bookData", db.get(book));
			attributes.set("previousOrders", db.getOrders(orders));
			if(!current.isNull()) {
				attributes.set("current", current.value());
				attributes.set("currentData", db.get(current.value()));
			}
			
			return Conts.display("/admin/manageOrders.jsp", attributes);
		}

		if(searchKey.isNull())
		{
			final Set<Order.Id> orders = db.getPendingOrders(token);
			
			final Map<Order.Id, Order.Data> datas = new HashMap<Order.Id, Order.Data>();
			final Map<Order.Id, Book.Data> books = new HashMap<Order.Id, Book.Data>(); 
			for(final Order.Id id : orders) {
				final Order.Data data = db.get(id);
				datas.put(id, data);
				books.put(id, db.get(data.book));
			}
			
			final List<Order.Data> previousOrdersData = db.getOrders(db.getReceivedOrders(token, 10)); 
			final List<Entry<Order.Data, Book.Data>> previousOrders = new ArrayList<Entry<Order.Data, Book.Data>>();
			for(final Order.Data order : previousOrdersData) {
				previousOrders.add(entry(order, db.get(order.book)));
			}
			
			final Nat minimum = db.getMinimumNumberOfBooks(token);
			
			final Attributes attributes = new Attributes();
			attributes.set("currentOrders", orders);
			attributes.set("currentDatas", datas);
			attributes.set("currentBooks", books);
			attributes.set("previousOrders", previousOrders);
			attributes.set("minimum", minimum);
			
			return Conts.display("/admin/manageOrders.jsp", attributes);
		}
		
		return Conts.error("orderManagementError", "Unknown book");
	}
		
	public static final <K, V> Entry<K, V> entry(final K key, final V value) {
		return new Entry<K, V>() {

			@Override
			public K getKey() {
				return key;
			}

			@Override
			public V getValue() {
				return value;
			}

			@Override
			public V setValue(V value) {
				throw new UnsupportedOperationException();
			}
			
		};
	}
}
