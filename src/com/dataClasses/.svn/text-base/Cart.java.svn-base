package com.dataClasses;

import java.util.HashMap;
import java.util.Map;

import com.dataAccess.tables.Book;

/**
 * @author Simon Langlois
 */
public final class Cart extends Wrapper<Map<Book.Id, Item>> {
	public Cart() {
		super(new HashMap<Book.Id, Item>());
	}
	
	public int getSize() {
		int size = 0;
		for(Item item: this.getValue().values()){
			if(item.numberOfCopies.value.intValue() > 0 && item.electronic)
				size += 2;
			else
				size++;
		}
		return size;
	}
}