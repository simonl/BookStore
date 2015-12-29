package com.login;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataAccess.tables.Book.EFormat;
import com.dataAccess.tables.Book.Id;
import com.dataAccess.tables.User;
import com.dataClasses.Database;
import com.dataClasses.Func;
import com.dataClasses.Funcs;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;
import com.servlets.Conts.Cont;

public class EBookDownloadPageServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Cont body(
			final Database db, 
			final Session session, 
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
		
		if(session.loggedOnUser.isNull())
			return Conts.error("loginError", "You are not logged on!");
		
		final User.Authority user = session.loggedOnUser.value();
		
		final Set<Book.Id> books = db.getUserEBooks(user);
		final Map<Book.Id, Book.Data> data = Funcs.maps(books, db.getBook);
		
		final Attributes attributes = new Attributes();
		attributes.set("books", books);
		attributes.set("data", data);
		
		return Conts.display("/jsp/ebookDownload.jsp", attributes);
	}
}
