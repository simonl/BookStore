package com.dataClasses;

public final class SearchInput {
	public final String description;
	public final String title;
	public final String author;
	public final String publisher;
	public final String isbn;
	
	public SearchInput(
			final String description,
			final String title,
			final String author,
			final String publisher,
			final String isbn) {
		this.description = description;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.isbn = isbn;
	}
	
	public boolean isNull(){
		if((this.description == null) && (this.title == null) && 
				(this.author == null) && (this.publisher == null) && (this.isbn == null)){
			return true;
		}
		return false;
		
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString(){
		return (this.description + this.author + this.publisher + this.isbn + this.title);
		
	}
}