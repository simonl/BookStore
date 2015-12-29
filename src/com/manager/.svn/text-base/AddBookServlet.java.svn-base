package com.manager;

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
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
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



/**
 * Servlet implementation class AddBookServlet
 */
public class AddBookServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
	String uploadDir = "bookImages";

	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
		
		
		boolean DEBUG = true;
		boolean formCompleted = true;
		
		final Maybe<String> fileTitle = parameters.get("title");
		final Maybe<String> fileAuthor = parameters.get("author");
		final Maybe<String> filePublisher = parameters.get("publisher");
		final Maybe<String> fileIsbn10 = parameters.get("isbn10");
		final Maybe<String> fileIsbn13 = parameters.get("isbn13");
		final Maybe<String> fileGenre = parameters.get("genre");
		final Maybe<String> fileNumberOfPages = parameters.get("numberofpages");
		final Maybe<String> fileWeight = parameters.get("weight");
		final Maybe<String> inputLength = parameters.get("length");
		final Maybe<String> inputWidth = parameters.get("width");
		final Maybe<String> inputHeight = parameters.get("height");
		final Maybe<String> fileListPrice = parameters.get("listprice");
		final Maybe<String> fileSalePrice = parameters.get("saleprice");
		final Maybe<String> fileWholesalePrice = parameters.get("wholesaleprice");
		final Maybe<String> fileNumberOfBooks = parameters.get("numberofbooks");
		
		Maybe<Book.Title> bookTitle = null;
		Maybe<Book.Author> bookAuthor = null;
		Maybe<Book.Publisher> bookPublisher = null;
		Maybe<Book.Isbn10> bookIsbn10 = null;
		Maybe<Book.Isbn13> bookIsbn13 = null;
		Maybe<Book.Genre> bookGenre = null;
		Maybe<Nat> bookNumberOfPages = null;
		Maybe<Book.Dimensions> bookDimensions = null;
		Maybe<Nat> bookWeight = null;
		Maybe<Money> bookListPrice = null;
		Maybe<Money> bookSalePrice = null;
		Maybe<Money> bookWholesalePrice = null;
		Maybe<Nat> bookNumberOfBooks = null;
		
		
		Attributes attributes = new Attributes(); 
		
		String inputTitle = fileTitle.getValue(); 
		if(inputTitle.length() == 0){
			String messageTitle = "Please fill out the title box";
			attributes.set("messageTitle", messageTitle);
			formCompleted = false;
		}
		else{
			bookTitle = Book.Title.parse(inputTitle);
			attributes.set("title", inputTitle);
			//System.out.println("Book title =" + bookTitle);
		}
		
		
		String inputAuthor = fileAuthor.getValue();
		if(inputAuthor.length() == 0){
			String messageAuthor = "Please fill out the author box";
			attributes.set("messageAuthor", messageAuthor);
			formCompleted = false;
		}
		else{
			bookAuthor = Book.Author.parse(inputAuthor);
			attributes.set("author", inputAuthor);
			//System.out.println("Book author =" + bookAuthor);
		}
		
		
		String inputPublisher = filePublisher.getValue(); 
		if(inputPublisher.length() == 0){
			String messagePublisher = "Please fill out the publisher box";
			attributes.set("messagePublisher", messagePublisher);
			formCompleted = false;
		}
		else{
			bookPublisher = Book.Publisher.parse(inputPublisher);
			attributes.set("publisher",inputPublisher);
			//System.out.println("Book publisher =" + bookPublisher);
		}
		
		
		String inputIsbn10 = fileIsbn10.getValue(); 
		if(inputIsbn10.length() == 0){
			String messageIsbn10 = "Please fill out the isbn10 box";
			attributes.set("messageIsbn10", messageIsbn10);
			formCompleted = false;
		}
		else{
			bookIsbn10 = Book.Isbn10.parse(inputIsbn10);
			attributes.set("isbn10",inputIsbn10);
			//System.out.println("Book isbn10 =" + bookIsbn10);
		}
		
		
		String inputIsbn13 = fileIsbn13.getValue();
		if(inputIsbn13.length() == 0){
			String messageIsbn13 = "Please fill out the isbn13 box";
			attributes.set("messageIsbn13", messageIsbn13);
			formCompleted = false;
		}
		else{
			bookIsbn13 = Book.Isbn13.parse(inputIsbn13);
			//System.out.println("Book isbn13 =" + bookIsbn13);
			final Maybe<Book.Id> bookId = bookIsbn13.isNull() ? Maybe.<Book.Id>nothing() : db.fromIsbn(bookIsbn13.value());
			if(!bookId.isNull()) {
				DEBUG = false;
				String messageIsbn13 = "Isbn13 already exists";
				attributes.set("messageIsbn13", messageIsbn13);
				formCompleted = false;
				System.out.println("isbn13 already exists");
			}
			else 
				DEBUG = true;
				attributes.set("isbn13",inputIsbn13);
		}
		
		
		
		String inputGenre = fileGenre.getValue();
		if(!inputGenre.equals("other")){
			bookGenre = Book.Genre.parse(inputGenre);
			attributes.set("genre",inputGenre);
			//System.out.println("Book genre =" + bookGenre);
		}
		else{
			Maybe<String> fileOtherGenre = parameters.get("otherGenre");
			String inputOtherGenre = fileOtherGenre.getValue(); 
			if(inputOtherGenre.length() == 0){
				String messageGenre = "Please fill out the genre box";
				attributes.set("messageGenre", messageGenre);
				formCompleted = false;
			}
			else{
				bookGenre = Book.Genre.parse(inputOtherGenre);
				attributes.set("genre",inputOtherGenre);
				//System.out.println("Book otherGenre =" + bookGenre);		
			}
			
		}
		
		
		Maybe<String> fileDescription = parameters.get("description");
		String inputDescription = fileDescription.getValue(); 
		attributes.set("description",inputDescription);
		Maybe<Book.Description> bookDescription = Book.Description.parse(inputDescription);
		//System.out.println("Book Description =" + bookDescription);
		
		
		String inputNumberOfPages = fileNumberOfPages.getValue();
		if(inputNumberOfPages.length() == 0){
			String messageNumberOfPages= "Please fill out the number of pages box";
			attributes.set("messageNumberOfPages", messageNumberOfPages);
			formCompleted = false;
		}
		else{
			bookNumberOfPages = Nat.parse(inputNumberOfPages);
			attributes.set("numberOfPages",inputNumberOfPages);
			//System.out.println("Book NumberOfPages =" + bookNumberOfPages);
		}
		
		
		String inputWeight = fileWeight.getValue(); 
		if(inputWeight.length() == 0){
			String messageWeight = "Please fill out the weight box";
			attributes.set("messageWeight", messageWeight);
			formCompleted = false;
		}
		else{
			bookWeight = Nat.parse(inputWeight);
			attributes.set("weight",inputWeight);
			//System.out.println("Book Weight =" + bookWeight);		
		}
		
		
		/*
		Maybe<String> fileDimensions = parameters.get("dimensions");
		String inputDimensions = fileDimensions.getValue(); 
		Maybe<Book.Dimensions> bookDimensions = Book.Dimensions.parse(inputDimensions);
		//System.out.println("Book Dimensions =" + bookDimensions);
		*/
		
		if(inputLength.value().length() == 0 || inputWidth.value().length() == 0 || inputHeight.value().length() == 0){
			String messageDimensions = "Please fill out all dimensions";
			attributes.set("messageDimensions", messageDimensions);
			formCompleted = false;
		}
		else{
			final Maybe<Double> length = inputLength.isNull() ? Maybe.<Double>nothing() : parseDouble(inputLength.value());
			attributes.set("length", inputLength.value());
			final Maybe<Double> width = inputWidth.isNull() ? Maybe.<Double>nothing() : parseDouble(inputWidth.value());
			attributes.set("width",inputWidth.value());
			final Maybe<Double> height = inputHeight.isNull() ? Maybe.<Double>nothing() : parseDouble(inputHeight.value());
			attributes.set("height",inputHeight.value());
			
			bookDimensions =
				(length.isNull() || width.isNull() || height.isNull()) ? 
						Maybe.<Book.Dimensions>nothing() : 
						Maybe.just(new Book.Dimensions(length.value(), width.value(), height.value()));
		}
		
		
		
		String root = getServletContext().getRealPath("/");
		//-----------------------------------------------------------get the thumbnail fileItem
		//-----------------------------------------------------------
		Maybe<FileItem> fileThumbnail = parameters.file("thumbnail");
		String inputThumbnail = fileThumbnail.getValue().getName();
		//-----------------------------------------------------------uploading thumbnail into the bookImages/thumbnails folder
		File thumbnailPath = new File(root + "/" + uploadDir + "/thumbnails");
		if (!thumbnailPath.exists()) {
			boolean status = thumbnailPath.mkdirs();
			if (!status)
				throw new ServletException("The upload directory at " + thumbnailPath.getAbsolutePath() + " cannot be created.");
		}
		File uploadedThumbnailFile = new File(thumbnailPath + "/" + inputThumbnail);
		if (DEBUG){
			System.out.println(uploadedThumbnailFile.getAbsolutePath());
			try {
				fileThumbnail.getValue().write(uploadedThumbnailFile);
				//-----------------------------------------------------------changing the name of the thumbnail image
				File thumbnailDestination = new File(thumbnailPath + "/" + inputIsbn13 + ".jpg");
				uploadedThumbnailFile.renameTo(thumbnailDestination);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//-----------------------------------------------------------thumbnail's path in database
		String thumbnailBookPath = "thumbnails/" + inputIsbn13 + ".jpg";
		Maybe<Book.Thumbnail> bookThumbnail = Book.Thumbnail.parse(thumbnailBookPath);
		//System.out.println("Book Thumbnail =" + bookThumbnail);
		
		
		
		
		
		//-----------------------------------------------------------get the cover fileItem
		Maybe<FileItem> fileCover = parameters.file("cover");
		String inputCover = fileCover.getValue().getName();
		//-----------------------------------------------------------uploading cover into the bookImages/covers folder
		File coverPath = new File(root + "/" + uploadDir + "/covers");
		if (!coverPath.exists()) {
			boolean status = coverPath.mkdirs();
			if (!status)
				throw new ServletException("The upload directory at " + coverPath.getAbsolutePath() + " cannot be created.");
		}
		File uploadedCoverFile = new File(coverPath + "/" + inputCover);
		if (DEBUG){
			System.out.println(uploadedCoverFile.getAbsolutePath());
			try {
				fileCover.getValue().write(uploadedCoverFile);
				//-----------------------------------------------------------changing the name of the cover image
				File coverDestination = new File(coverPath + "/" + inputIsbn13 + ".jpg");
				uploadedCoverFile.renameTo(coverDestination);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//-----------------------------------------------------------cover's path in database
		String coverBookPath = "covers/" + inputIsbn13 + ".jpg";
		Maybe<Book.Cover> bookCover = Book.Cover.parse(coverBookPath);
		//System.out.println("Book Cover =" + bookCover);
		
		
		
		float listPrice = 0;
		String inputListPrice = fileListPrice.getValue();
		if(inputListPrice.length() == 0){
			String messageListPrice = "Please fill out the list price box";
			attributes.set("messageListPrice",messageListPrice);
			formCompleted = false;
		}
		else{
			bookListPrice = Money.parse(inputListPrice);
			attributes.set("listPrice", inputListPrice);
			listPrice = Float.parseFloat(inputListPrice);
			//System.out.println("Book ListPrice =" + bookListPrice);	
		}
		
		
		float salePrice = 0;
		String inputSalePrice = fileSalePrice.getValue();
		if(inputSalePrice.length() == 0){
			String messageSalePrice = "Please fill out the sale price box";
			attributes.set("messageSalePrice",messageSalePrice);
			formCompleted = false;
		}
		else{
			bookSalePrice = Money.parse(inputSalePrice);
			attributes.set("salePrice", inputSalePrice);
			salePrice = Float.parseFloat(inputSalePrice);
			//System.out.println("Book SalePrice =" + bookSalePrice);		
		}
		
		
		if(salePrice > listPrice){
			String messagePrice = "Sale price is greater than list price";
			attributes.set("messagePrice",messagePrice);
			formCompleted = false;
		}
		
		String inputWholesalePrice = fileWholesalePrice.getValue();
		if(inputWholesalePrice.length() == 0){
			String messageWholeSalePrice = "Please fill out the wholesale price box";
			attributes.set("messageWholesalePrice",messageWholeSalePrice);
			formCompleted = false;
		}
		else{
			bookWholesalePrice = Money.parse(inputWholesalePrice);
			attributes.set("wholesalePrice", inputWholesalePrice);
			//System.out.println("Book WholesalePrice =" + bookWholesalePrice);		
		}
		
		
		
		String inputNumberOfBooks = fileNumberOfBooks.getValue();
		attributes.set("numberOfBooks", inputNumberOfBooks);
		bookNumberOfBooks = Nat.parse(inputNumberOfBooks);
		/*if(inputNumberOfBooks.length() == 0){
			String messageNumberOfBooks = "Please fill out the number of books box";
			attributes.set("messageNumberOfBooks",messageNumberOfBooks);
			formCompleted = false;
		}
		else{
			bookNumberOfBooks = Nat.parse(inputNumberOfBooks);
			//System.out.println("Book NumberOfBooks =" + bookNumberOfBooks);		
		}*/
		
		
		
		
		final String[] inputEBookFormats = parameters.gets("eBookFormat");
		//final String[] inputEBookFormats = parameters.file("eBookFormat").getValue().getString();
		
		final Book.EFormat[] eBookFormatParsed = new Book.EFormat[inputEBookFormats.length];
		for(int i = 0; i < eBookFormatParsed.length; i++) {			  
			try {
				eBookFormatParsed[i] = Book.EFormat.parse(inputEBookFormats[i])
							 		.except(new ProcessingError("Invalid choice: " + inputEBookFormats[i]));
			} catch (ProcessingError e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		  	  
		final Set<Book.EFormat> eBookFormatSet = new HashSet<Book.EFormat>();
		for(final Book.EFormat eFormat : eBookFormatParsed) {
			eBookFormatSet.add(eFormat);
		}
		
		
		if(!formCompleted){
			return Conts.display("/admin/addBook.jsp", attributes);
		}
		
		final Book.Data data = new Book.Data(
				new Timestamp(new Date().getTime()), 
				bookTitle.value(), 
				bookAuthor.value(), 
				bookPublisher.value(), 
				bookIsbn10.value(),
				bookIsbn13.value(),
				bookGenre.value(), 
				bookDescription.value(),
				bookNumberOfPages.value(), 
				bookWeight.value(), 
				bookDimensions.value(), 
				bookThumbnail.value(), 
				bookCover.value(), 
				bookListPrice.value(),
				bookSalePrice.value(), 
				bookWholesalePrice.value(), 
				bookNumberOfBooks,
				eBookFormatSet);
		
		
		final Book.Id book = db.put(token, data);	
		
		final Attributes bookAttributes = ViewBookServlet.known(db, session, book);
		return Conts.display("/admin/adminViewBook.jsp", bookAttributes);

		
	}
	
	public static final Maybe<Double> parseDouble(final String input) {
		try {
			return Maybe.just(Double.parseDouble(input));
		} catch(final NumberFormatException ex) {
			return Maybe.nothing();
		}
	}

}
