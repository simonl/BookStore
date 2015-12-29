package com.cart;

import com.dataAccess.tables.Book;
import com.dataClasses.Money;
import com.dataClasses.Nat;

/** 
 * Similar to a Purchase.Data except it contains Book.Data instead of Book.Id
 * 
 * @author Simon Langlois
 */
public final class InvoiceRecord {
	public final Book.Data book;
	public final Money price;
	public final Nat numberOfCopies;
	public final boolean electronic;
	
	public InvoiceRecord(
			final Book.Data book,
			final Money price,
			final Nat numberOfCopies,
			final boolean electronic) {
		this.book = book;
		this.price = price;
		this.numberOfCopies = numberOfCopies;
		this.electronic = electronic;
	}

	public final Book.Data getBook() {
		return book;
	}

	public final Money getPrice() {
		return price;
	}

	public final Nat getNumberOfCopies() {
		return numberOfCopies;
	}

	public final boolean isElectronic() {
		return electronic;
	}
}