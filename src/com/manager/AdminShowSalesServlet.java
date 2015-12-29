package com.manager;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataAccess.tables.Book.Data;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.SearchInput;
import com.search.SearchResultServlet;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class AdminShowSalesServlet
 */
public class AdminShowSalesServlet extends ManagerPageServlet{
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {
		
		final SearchInput input = SearchResultServlet.read(parameters);
				
		final Set<Book.Id> booksID = db.search(input);
		Set<Data> books = null;
		
		//If the number of books returned by the search is more than 0 then return that set, else return all the books
		if(!booksID.isEmpty()){
			books = db.getBooks(booksID);
		}
		else{
			books = db.getBooks(db.allBooks());
		}
			
		
		final Attributes attributes = new Attributes();
		attributes.set("displayString", "Alter/Show Sales" );
		attributes.set("books", books);

		return Conts.display("/jsp/adminSetSalesPanel.jsp", attributes);
	}
	

	


}
