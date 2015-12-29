package com.dataClasses;

import java.math.BigDecimal;

public final class RatingStats {
	public final BigDecimal average;
	public final int count;
	
	public RatingStats(final BigDecimal average, final int count) {
		this.average = average;
		this.count = count;
	}
}