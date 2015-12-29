package com.view.book;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.dataAccess.tables.Book;
import com.dataAccess.tables.Review;
import com.dataAccess.tables.User;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.servlets.Parameters;
import com.servlets.ProcessingError;
import com.servlets.ProcessingServlet;
import com.servlets.Session;

/**
 * @author Simon Langlois
 */
public class PostReviewServlet extends ProcessingServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void body(
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException, ProcessingError {
		
		final ProcessingError insufficientData = new ProcessingError("postReviewError", "Insufficient data!");
		
		final String ratingInput = parameters.get("rating").except(insufficientData);
		final String isbnInput = parameters.get("isbn").except(insufficientData);
		final String textInput = parameters.get("text").except(insufficientData);
		final User.Authority user = session.loggedOnUser.except(insufficientData);
		
		final ProcessingError invalidData = new ProcessingError("postReviewError", "Invalid data!");
		
		final Review.Rating rating = Review.Rating.parse(ratingInput).except(invalidData);
		final Book.Isbn13 isbn = Book.Isbn13.parse(isbnInput).except(invalidData);
		final Maybe<Review.Text> text = parseText(textInput).except(invalidData);
		
		final Book.Id book = db.fromIsbn(isbn).except(invalidData);
		 
		@SuppressWarnings("unused")
		final Review.Id review = db.review(user, book, rating, text);
		
	}
	
	private static final Maybe<Maybe<Review.Text>> parseText(final String textInput) {
		if(textInput.length() == 0) return Maybe.just(Maybe.<Review.Text>nothing());
		
		final Maybe<Review.Text> text = Review.Text.parse(textInput);
		
		if(text.isNull()) return Maybe.nothing();
		
		return Maybe.just(text);
	}

}
