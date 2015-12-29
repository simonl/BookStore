package com.prezzo.testing;

import java.math.BigDecimal;
import java.util.Date;

public class TESTBookBean {

	private Date dateEntered = null;
	private String title = "";
	private String author = "";
	private String publisher = "";
	private String isbn_10 = "";
	private String isbn_13 = "";
	private String genre = "";
	private String description = "";
	private int number_of_pages = 0;
	private int weight = 0;
	private String dimensions = "";
	private String thumbnail = "";
	private String cover = "";
	private BigDecimal list_price = null;
	private BigDecimal sale_price = null;
	private BigDecimal wholesale_price = null;
	
	
	public TESTBookBean(Date dateEntered, String title, String author, String publisher,
			String isbn_10, String isbn_13, String genre, String description,
			int number_of_pages, int weight, String dimensions,
			String thumbnail, String cover, BigDecimal list_price,
			BigDecimal sale_price, BigDecimal wholesale_price) {
		super();
		this.dateEntered = dateEntered;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.isbn_10 = isbn_10;
		this.isbn_13 = isbn_13;
		this.genre = genre;
		this.description = description;
		this.number_of_pages = number_of_pages;
		this.weight = weight;
		this.dimensions = dimensions;
		this.thumbnail = thumbnail;
		this.cover = cover;
		this.list_price = list_price;
		this.sale_price = sale_price;
		this.wholesale_price = wholesale_price;
	}
	public TESTBookBean()
	{}

	public Date getDateEntered() {
		return dateEntered;
	}
	public void setDateEntered(Date date) {
		this.dateEntered = date;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getIsbn_10() {
		return isbn_10;
	}
	public void setIsbn_10(String isbn_10) {
		this.isbn_10 = isbn_10;
	}
	public String getIsbn_13() {
		return isbn_13;
	}
	public void setIsbn_13(String isbn_13) {
		this.isbn_13 = isbn_13;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getNumber_of_pages() {
		return number_of_pages;
	}
	public void setNumber_of_pages(int number_of_pages) {
		this.number_of_pages = number_of_pages;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getDimensions() {
		return dimensions;
	}
	public void setDimensions(String dimensions) {
		this.dimensions = dimensions;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public BigDecimal getList_price() {
		return list_price;
	}
	public void setList_price(BigDecimal list_price) {
		this.list_price = list_price;
	}
	public BigDecimal getSale_price() {
		return sale_price;
	}
	public void setSale_price(BigDecimal sale_price) {
		this.sale_price = sale_price;
	}
	public BigDecimal getWholesale_price() {
		return wholesale_price;
	}
	public void setWholesale_price(BigDecimal wholesale_price) {
		this.wholesale_price = wholesale_price;
	}

}
