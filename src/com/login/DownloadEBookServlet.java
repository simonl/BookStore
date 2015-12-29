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

public class DownloadEBookServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Cont body(
			final Database db, 
			final Session session, 
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
		
		for(final String isbnInput : parameters.get("isbn"))
		for(final String formatInput : parameters.get("eformat"))
		for(final Book.Isbn13 isbn : Book.Isbn13.parse(isbnInput))
		for(final Book.EFormat format : Book.EFormat.parse(formatInput))
		{
			for(final Book.Id book : db.fromIsbn(isbn))
			{
				final Book.Data data = db.get(book);
				
				if(!data.eformats.contains(format))
					return Conts.error("EBookDownloadError", "This ebook format is not available");
				
				return Conts.download("ebooks/lambda.pdf");
			}
			
			return Conts.error("EBookDownloadError", "This book is not in our inventory");
		}
		
		return Conts.error("EBookDownloadError", "Invalid arguments");
	}
}
