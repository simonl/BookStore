package com.dataAccess.tables;

import java.util.Set;

import com.dataClasses.Backend;
import com.dataClasses.Key;
import com.dataClasses.Nat;

/**  
 * Defines types and classes related to the database table with the same name
 * There is a separation between the ID, which refers to a row, and the other fields in a row
 * Each database field get its own abstract data type and parsing/validating constructor
 * 
 * The Global.Data objects have a field that contains a set of small ads, 
 *   which differs from the database representation
 *   
 * @author Simon Langlois
 */
public class Global {
	
	public static final class Id extends Key {
		public Id(final Backend.Authority authority, int id) {
			super(authority, id);
		}
	}
	
	public static final class Data {
		public final Survey.Id currentSurvey;
		public final RssFeed.Id currentFeed;
		public final Nat minimumBooks;
		public final BannerAd.Id currentBannerAd;
		public final Set<SmallAd.Id> currentSmallAds;
		
		public Data(
				final Survey.Id currentSurvey,
				final RssFeed.Id currentFeed,
				final Nat minimumBooks,
				final BannerAd.Id currentBannerAd,
				final Set<SmallAd.Id> currentSmallAds) {
			this.currentSurvey = currentSurvey;
			this.currentFeed = currentFeed;
			this.minimumBooks = minimumBooks;
			this.currentBannerAd = currentBannerAd;
			this.currentSmallAds = currentSmallAds;
		}
	}
}
