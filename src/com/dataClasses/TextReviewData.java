package com.dataClasses;

import java.sql.SQLException;
import java.sql.Timestamp;

import com.dataAccess.tables.Review;
import com.dataAccess.tables.User;

/**
 * @author Simon Langlois
 */
public final class TextReviewData {
	public final User.Login username;
	public final Timestamp createdAt;
	public final Review.Rating rating;
	public final Review.Text text;
	
	TextReviewData(final User.Login username, final Review.Data data) throws SQLException {
		this.username = username;
		this.createdAt = data.createdAt;
		this.rating = data.rating;
		this.text = data.reviewText.value();
	}

	public final User.Login getUsername() {
		return username;
	}

	public final Timestamp getCreatedAt() {
		return createdAt;
	}

	public final Review.Rating getRating() {
		return rating;
	}

	public final Review.Text getText() {
		return text;
	}
}