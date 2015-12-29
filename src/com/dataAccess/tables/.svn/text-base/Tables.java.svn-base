package com.dataAccess.tables;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @author Simon Langlois
 */
public enum Tables {
	
	ADDRESS("address", new String[] {
		"city", 
		"province", 
		"postal_code", 
		"address"
	}),
	
	BOOK("book", new String[] {
		"date_entered", 
		"title", 
		"author", 
		"publisher",
		"isbn_10",
		"isbn_13",
		"genre",
		"description",
		"number_of_pages",
		"weight", 
		"dimensions",
		"thumbnail",
		"cover",
		"list_price", 
		"sale_price", 
		"wholesale_price", 
		"number_of_books" 
	}),
	
	CLIENT("client", new String[] {
		"shipping_address_id",
		"billing_address_id",
		"first_name",
		"last_name",
		"home_phone",
		"cell_phone",
		"email"
	}),
	
	USER("user", new String[] { 
		"login", 
		"password",
		"manager",
		"client_id",
		"last_genre"
	}),
	
	EBOOK("ebook", new String[] {
		"book_id",
		"eformat"
	}),
	
	PURCHASE("purchase", new String[] {
		"user_id",
		"book_id",
		"price",
		"purchased_on",
		"number_of_copies",
		"electronic"
	}),
	
	ORDER("book_order", new String[] { 
		"book_id",
		"ordered_on",
		"received_on",
		"quantity"
	}),
	
	REVIEW("review", new String[] {
		"user_id", 
		"book_id", 
		"created_at",
		"rating",
		"review_text",
		"status" 
	}),
	
	SURVEY("survey", new String[] { 
		"question"
	}),
	
	SURVEY_CHOICE("survey_choice", new String[] { 
		"survey_id",
		"choice"
	}),
	
	RSS_FEED("rss_feed", new String[] { 
		"url"
	}),

	GLOBAL_DATA("global_data", new String[] { 
		"current_survey",
		"current_feed",
		"minimum_books",
		"banner_ad"
	}),
	
	PROVINCE("province", new String[] { 
		"name",
		"tax_rate",
		"second_tax_rate"
	}),

	BANNER_AD("banner_ad", new String[] { 
		"image"
	}),
	
	SMALL_AD("small_ad", new String[] { 
		"image"
	}),
	
	CURRENT_SMALL_AD("current_small_ad", new String[] { 
		"global_id",
		"small_ad_id"
	});
	
	
	
	public final String name;
	public final List<String> fields;
	
	private Tables(final String name, final String[] fields) {
		this.name = name;
		this.fields = Collections.unmodifiableList(Arrays.asList(fields));
	}
}
