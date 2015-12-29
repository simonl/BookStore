package com.dataClasses;

/**
 * @author Simon Langlois
 */
public final class Item { 
	public final Nat numberOfCopies;
	public final boolean electronic;
	
	public Item(final Nat numberOfCopies, final boolean electronic) {
		this.numberOfCopies = numberOfCopies;
		this.electronic = electronic;
	}
	
	public Nat getNumberOfCopies() {
		return this.numberOfCopies;
	}
	
	public boolean getElectronic() {
		return this.electronic;
	}
	
	public Item setNumberOfCopies(final Nat numberOfCopies) {
		return new Item(numberOfCopies, this.electronic);
	}
	
	public Item setElectronic(final boolean electronic) {
		return new Item(this.numberOfCopies, electronic);
	}
	
	public boolean equals(final Item other) {
		return numberOfCopies.equals(other.numberOfCopies) && electronic == other.electronic;
	}

    public static final Item empty = new Item(Nat.from(0).value(), false);
    
    public static final Item merge(final Item first, final Item second) {
    	final int numberOfCopies = first.numberOfCopies.value + second.numberOfCopies.value;
    	final Nat quantity = Nat.from(numberOfCopies).value();
    	return new Item(quantity, first.electronic || second.electronic);
    }
}