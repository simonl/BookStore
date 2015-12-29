package com.dataAccess.tables;

import java.util.Set;

import com.dataClasses.Backend;
import com.dataClasses.Key;
import com.dataClasses.Nat;

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
