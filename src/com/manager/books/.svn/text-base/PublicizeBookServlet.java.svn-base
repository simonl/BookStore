package com.manager.books;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.manager.AdminShowBookServlet;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.ManagerProcessingServlet;
import com.servlets.Parameters;
import com.servlets.Session;
import com.dataAccess.tables.Book;
import com.dataClasses.Maybe;
import com.dataClasses.Money;
import com.dataClasses.Nat;

import com.servlets.ProcessingError;
import com.view.book.ViewBookServlet;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

import javax.servlet.*;
import javax.servlet.http.*;



public class PublicizeBookServlet extends ManagerProcessingServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void body(
			final Database.Manager token,
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException, ProcessingError {

		for(final Book.Id book : AdminShowBookServlet.validate(db, token, parameters))
		{
			db.publicizeBook(token, book);
			
			return;
		}	
		
		throw new ProcessingError("bookManagementError", "Invalid book");
	}
}
