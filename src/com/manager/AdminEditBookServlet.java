package com.manager;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;

import org.apache.commons.fileupload.FileItem;

import com.cart.AddToCartServlet;
import com.dataAccess.tables.Book;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.dataClasses.Money;
import com.dataClasses.Nat;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.Session;


/**
 * Servlet implementation class AdminEditBookServlet
 */
public class AdminEditBookServlet extends ManagerPageServlet{
	private static final long serialVersionUID = 1L;
       
	@Override
	public Conts.Cont body(
			final Manager token, 
			final Database db, 
			final Session session,
			final Parameters parameters) 
			throws ServletException, IOException, SQLException {
		
		/*
		 
		for(final String inputTitle : parameters.get("title"))
		for(final String inputAuthor : parameters.get("author"))
		for(final String inputPublisher : parameters.get("publisher"))
		for(final String inputIsbn10 : parameters.get("isbn10"))
		for(final String inputIsbn13 : parameters.get("isbn13"))
		for(final String inputGenre : parameters.get("genre"))
		for(final String inputDescription : parameters.get("description"))
		for(final String inputNumberOfPages : parameters.get("numberOfPages"))
		for(final String inputWeight: parameters.get("weight"))
		for(final String inputDimensions : parameters.get("dimensions"))
		for(final String inputThumbnail : parameters.get("thumbnail"))
		for(final String inputCover : parameters.get("cover"))
		for(final String inputListPrice : parameters.get("listPrice"))
		for(final String inputSalePrice : parameters.get("salePrice"))
		for(final String inputWholesalePrice : parameters.get("wholesalePrice"))
		for(final String inputNumberOfBooks : parameters.get("numberOfBooks"))
			
		for(final Book.Title title : Book.Title.parse(inputTitle))
		for(final Book.Author author : Book.Author.parse(inputAuthor))
		for(final Book.Publisher publisher : Book.Publisher.parse(inputPublisher))
		for(final Book.Isbn10 isbn10 : Book.Isbn10.parse(inputIsbn10))
		for(final Book.Isbn13 isbn13 : Book.Isbn13.parse(inputIsbn13))
		for(final Book.Genre genre : Book.Genre.parse(inputGenre))
		for(final Book.Description description : Book.Description.parse(inputDescription))
		for(final Nat numberOfPages : Nat.parse(inputNumberOfPages))
		for(final Nat weight : Nat.parse(inputWeight))
		for(final Book.Dimensions dimensions : Book.Dimensions.parse(inputDimensions))
		for(final Book.Thumbnail thumbnail : Book.Thumbnail.parse(inputThumbnail))
		for(final Book.Cover cover : Book.Cover.parse(inputCover))
		for(final Money listPrice : Money.parse(inputListPrice))
		for(final Money salePrice : Money.parse(inputSalePrice))
		for(final Money wholesalePrice : Money.parse(inputWholesalePrice))
		for(final Nat numberOfBooks : Nat.parse(inputNumberOfBooks)) 
		
		for(final Book.Id book : db.fromIsbn(isbn13))
					
		{
			final String[] inputEFormats = parameters.gets("eBookFormat");
			
			for(final Book.EFormat[] parsedEFormats : parse(inputEFormats))
			for(final Set<Book.EFormat> eFormats : distinct(parsedEFormats))
			
			{
				final Book.Data data = new Book.Data(
					db.get(book).getDateEntered(), 
					title,
					author,
					publisher,
					isbn10,
					isbn13,
					genre,
					description,
					numberOfPages,
					weight,
					dimensions,
					thumbnail,
					cover,
					listPrice,
					salePrice,
					wholesalePrice,
					numberOfBooks,
					eFormats
				);
				
				db.update(token, book, data);
				
				return Conts.redirect(session.lastPage);
			}			
		}
		
		return Conts.error("editBookError", "Invalid arguments");
		
		*/
		
		try {
	
			final Book.Data data = parseBook(db, parameters);
			System.out.println(data);
			for(final String input : parameters.get("isbn13"))
		    for(final Book.Isbn13 isbn : Book.Isbn13.parse(input))
		    for(final Book.Id book : db.fromIsbn(token, isbn))
		    {			
				db.update(token, book, data);
	
				return Conts.redirect(session.lastPage);
			}
			
		} catch (ProcessingError e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return Conts.error("editBookError", "Could not edit book!");
	}


	public final Book.Data parseBook(final Database db, final Parameters parameters)
			throws SQLException, ProcessingError {
		String uploadDir = "bookImages";
		
		final Maybe<String> inputTitle = parameters.get("title");
		final Maybe<Book.Title> title = inputTitle.isNull() ? Maybe.<Book.Title>nothing() : Book.Title.parse(inputTitle.value());
		
		
		final Maybe<String> inputAuthor = parameters.get("author");
		final Maybe<Book.Author> author = inputAuthor.isNull() ? Maybe.<Book.Author>nothing() : Book.Author.parse(inputAuthor.value());
		
		final Maybe<String> inputPublisher = parameters.get("publisher");
		final Maybe<Book.Publisher> publisher = inputPublisher.isNull() ? Maybe.<Book.Publisher>nothing() : Book.Publisher.parse(inputPublisher.value());
		
		final Maybe<String> inputIsbn10 = parameters.get("isbn10");
		final Maybe<Book.Isbn10> isbn10 = inputIsbn10.isNull() ? Maybe.<Book.Isbn10>nothing() : Book.Isbn10.parse(inputIsbn10.value());
		
		final Maybe<String> inputIsbn13 = parameters.get("isbn13");
		final Maybe<Book.Isbn13> isbn13 = inputIsbn13.isNull() ? Maybe.<Book.Isbn13>nothing() : Book.Isbn13.parse(inputIsbn13.value());
		
		final Maybe<Book.Id> bookId = isbn13.isNull() ? Maybe.<Book.Id>nothing() : db.fromIsbn(isbn13.value());
		if(bookId.isNull()) {
			throw new ProcessingError("Invalid isbn13");
		}
		
		Maybe<String> fileGenre = parameters.get("genre");
		String inputGenre = fileGenre.getValue();
		Maybe<Book.Genre> genre = null;
		if(!inputGenre.equals("other")){
			genre = Book.Genre.parse(inputGenre);
		}
		else{
			Maybe<String> fileOtherGenre = parameters.get("otherGenre");
			String inputOtherGenre = fileOtherGenre.getValue(); 
			genre = Book.Genre.parse(inputOtherGenre);
		}
		
		final Maybe<String> inputDescription = parameters.get("description");
		final Maybe<Book.Description> description = inputDescription.isNull() ? Maybe.<Book.Description>nothing() : Book.Description.parse(inputDescription.value());
		
		final Maybe<String> inputNbPages = parameters.get("numberOfPages");
		final Maybe<Nat> nbPages = (inputNbPages.isNull() ?  Maybe.<Nat>nothing() : Nat.parse(inputNbPages.value()));
		
		final Maybe<String> inputWeight = parameters.get("weight");
		final Maybe<Nat> weight = (inputWeight.isNull() ?  Maybe.<Nat>nothing() : Nat.parse(inputWeight.value()));
		
		final Maybe<String> inputLength = parameters.get("length");
		final Maybe<Double> length = inputLength.isNull() ? Maybe.<Double>nothing() : parseDouble(inputLength.value());

		final Maybe<String> inputWidth = parameters.get("width");
		final Maybe<Double> width = inputWidth.isNull() ? Maybe.<Double>nothing() : parseDouble(inputWidth.value());

		final Maybe<String> inputHeight = parameters.get("height");
		final Maybe<Double> height = inputHeight.isNull() ? Maybe.<Double>nothing() : parseDouble(inputHeight.value());

		final Maybe<Book.Dimensions> dimensions =
			(length.isNull() || width.isNull() || height.isNull()) ? 
					Maybe.<Book.Dimensions>nothing() : 
					Maybe.just(new Book.Dimensions(length.value(), width.value(), height.value()));
		
		String root = getServletContext().getRealPath("/");
		//-----------------------------------------------------------get the thumbnail fileItem
		//-----------------------------------------------------------
		Maybe<FileItem> fileThumbnail = parameters.file("thumbnail");
		String inputThumbnail = fileThumbnail.getValue().getName();
		//-----------------------------------------------------------uploading thumbnail into the bookImages/thumbnails folder if there is a a new thumbnail image
		if(!(inputThumbnail.equals("") || inputThumbnail.isEmpty() || inputThumbnail == null)){
			File thumbnailPath = new File(root + "/" + uploadDir + "/thumbnails");
			if (!thumbnailPath.exists()) {
				boolean status = thumbnailPath.mkdirs();
				if (!status)
					try {
						throw new ServletException("The upload directory at " + thumbnailPath.getAbsolutePath() + " cannot be created.");
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}
			File uploadedThumbnailFile = new File(thumbnailPath + "/" + inputThumbnail);
			try {
				fileThumbnail.getValue().write(uploadedThumbnailFile);
				//-----------------------------------------------------------changing the name of the thumbnail image
				File thumbnailDestination = new File(thumbnailPath + "/" + isbn13.value() + ".jpg");
				if (thumbnailDestination.exists()) {
					thumbnailDestination.delete();
				}
				uploadedThumbnailFile.renameTo(thumbnailDestination);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		//-----------------------------------------------------------thumbnail's path in database
		String thumbnailBookPath = "thumbnails/" + isbn13.value() + ".jpg";
		Maybe<Book.Thumbnail> thumbnail = Book.Thumbnail.parse(thumbnailBookPath);			

		
		
		//-----------------------------------------------------------get the cover fileItem
		Maybe<FileItem> fileCover = parameters.file("cover");
		String inputCover = fileCover.getValue().getName();
		//-----------------------------------------------------------uploading cover into the bookImages/covers folder if there is a new cover image
		if(!(inputThumbnail.equals("") || inputThumbnail.isEmpty() || inputThumbnail == null)){
			File coverPath = new File(root + "/" + uploadDir + "/covers");
			if (!coverPath.exists()) {
				boolean status = coverPath.mkdirs();
				if (!status)
					try {
						throw new ServletException("The upload directory at " + coverPath.getAbsolutePath() + " cannot be created.");
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}
			File uploadedCoverFile = new File(coverPath + "/" + inputCover);
			try {
				fileCover.getValue().write(uploadedCoverFile);
				//-----------------------------------------------------------changing the name of the cover image
				File coverDestination = new File(coverPath + "/" + isbn13.value() + ".jpg");
				if (coverDestination.exists()) {
					coverDestination.delete();
				}
				uploadedCoverFile.renameTo(coverDestination);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//-----------------------------------------------------------cover's path in database
		String coverBookPath = "covers/" + isbn13.value() + ".jpg";
		Maybe<Book.Cover> cover = Book.Cover.parse(coverBookPath);
		
		final Maybe<String> inputListPrice = parameters.get("listPrice");
		final Maybe<Money> listPrice = (inputListPrice.isNull() ?  Maybe.<Money>nothing() : Money.parse(inputListPrice.value()));
		
		final Maybe<String> inputSalePrice = parameters.get("salePrice");
		final Maybe<Money> salePrice = (inputSalePrice.isNull() ?  Maybe.<Money>nothing() : Money.parse(inputSalePrice.value()));
		
		final Maybe<String> inputWholesalePrice = parameters.get("wholesalePrice");
		final Maybe<Money> wholesalePrice = (inputWholesalePrice.isNull() ?  Maybe.<Money>nothing() : Money.parse(inputWholesalePrice.value()));

		final Maybe<String> inputHasNumberOfBooks = parameters.get("hasNumberOfBooks");
		Maybe<Maybe<Nat>> numberOfBooks = null;
		if(inputHasNumberOfBooks.isNull())
			numberOfBooks = Maybe.just(Maybe.<Nat>nothing());
		else {
			final Maybe<String> inputNumberOfBooks = parameters.get("numberOfBooks");
			final Maybe<Nat> numberOfBooksValue = (inputNumberOfBooks.isNull() ?  Maybe.<Nat>nothing() : Nat.parse(inputNumberOfBooks.value()));
			
			if(numberOfBooksValue.isNull())
				numberOfBooks = Maybe.nothing();
			else
				numberOfBooks = Maybe.just(numberOfBooksValue);
		}
		
		final String[] inputEBookFormats = parameters.gets("eBookFormat");
		
		final Book.EFormat[] eBookFormatParsed = new Book.EFormat[inputEBookFormats.length];
		for(int i = 0; i < eBookFormatParsed.length; i++) {			  
			eBookFormatParsed[i] = Book.EFormat.parse(inputEBookFormats[i])
						 		.except(new ProcessingError("Invalid choice: " + inputEBookFormats[i]));
		}
		  	  
		final Set<Book.EFormat> eBookFormatSet = new HashSet<Book.EFormat>();
		for(final Book.EFormat eFormat : eBookFormatParsed) {
			eBookFormatSet.add(eFormat);
		}
		
		final Book.Data data = new Book.Data(
				db.get(bookId.value()).getDateEntered(), 
				title.value(), 
				author.value(), 
				publisher.value(), 
				db.get(bookId.value()).isbn10,
				db.get(bookId.value()).isbn13,
				genre.value(), 
				description.value(),
				nbPages.value(), 
				weight.value(), 
				dimensions.value(), 
				thumbnail.value(), 
				cover.value(), 
				listPrice.value(),
				salePrice.value(), 
				wholesalePrice.value(), 
				numberOfBooks.value(),
				eBookFormatSet);
		System.out.println(db.get(bookId.value()).getDateEntered());
		return data;
	}
	    

	private static final Maybe<Book.EFormat[]> parse(final String[] inputs) {
		final Book.EFormat[] eformats = new Book.EFormat[inputs.length];
		
		for(int i = 0; i < inputs.length; i++) {
			final Maybe<Book.EFormat> eformat = Book.EFormat.parse(inputs[i]);
			
			if(eformat.isNull()) return Maybe.nothing();
			
			eformats[i] = eformat.value();
		}
		
		return Maybe.just(eformats);
	}
	
	private static final <A> Maybe<Set<A>> distinct(final A[] xs) {
		final Set<A> set = new HashSet<A>(xs.length);
		
		for(final A x : xs) {
			if(set.add(x)) continue;
			
			return Maybe.nothing();
		}
		
		return Maybe.just(set);
	}
	
	public static final Maybe<Double> parseDouble(final String input) {
		try {
			return Maybe.just(Double.parseDouble(input));
		} catch(final NumberFormatException ex) {
			return Maybe.nothing();
		}
	}
			
}
