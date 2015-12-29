package com.dataClasses;

import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.dataAccess.tables.Address;
import com.dataAccess.tables.BannerAd;
import com.dataAccess.tables.Book;
import com.dataAccess.tables.Client;
import com.dataAccess.tables.Global;
import com.dataAccess.tables.Order;
import com.dataAccess.tables.Province;
import com.dataAccess.tables.Purchase;
import com.dataAccess.tables.Review;
import com.dataAccess.tables.RssFeed;
import com.dataAccess.tables.SmallAd;
import com.dataAccess.tables.Survey;
import com.dataAccess.tables.Tables;
import com.dataAccess.tables.User;
import com.manager.orders.OrderManagementServlet;

public final class Backend {
	
	public final Connection connection;
	
	private Backend(final Connection connection) {
		this.connection = connection;
	}
	public final void close() {
		try {
			connection.close();
		} catch(final SQLException ex) {
			ex.printStackTrace();
		}
	}
	public static final Backend connect(final Database.Authority authority) throws CouldNotConnect {
		try {
		// Obtain environment naming context
		   Context initCtx = new InitialContext();
		   Context envCtx = (Context) initCtx.lookup("java:comp/env");
		// Look up data source
		   DataSource ds = (DataSource) envCtx.lookup("jdbc/g2w12");
		// Allocate and use a connection from the pool
		   return new Backend(ds.getConnection());
		} catch (final NamingException ex) {
			throw new CouldNotConnect(ex);
		} catch (final SQLException ex) {
			throw new CouldNotConnect(ex);
		}
	}
	public static final Backend connectOld(final Database.Authority authority) throws CouldNotConnect {
		try {		
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		
			final Connection connection = DriverManager.getConnection(
					"jdbc:mysql://waldo.dawsoncollege.qc.ca:3306",
					"g2w12",
					"bird3table");
			
			final Statement statement = connection.createStatement();
			
			statement.execute("USE g2w12;");
			
			return new Backend(connection);
			
		} catch(final SQLException ex) {
			throw new CouldNotConnect(ex);
		} catch (InstantiationException ex) {
			throw new CouldNotConnect(ex);
		} catch (IllegalAccessException ex) {
			throw new CouldNotConnect(ex);
		} catch (ClassNotFoundException ex) {
			throw new CouldNotConnect(ex);
		}	
	}
	


	public static final class Authority {
		private Authority() {}
		
		private static final Authority token = new Authority();
	}

	private static final Func<Integer, Address.Id> address = new Func<Integer, Address.Id>() {
		public final Address.Id apply(final Integer value) {
			return new Address.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, Client.Id> client = new Func<Integer, Client.Id>() {
		public final Client.Id apply(final Integer value) {
			return new Client.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, User.Id> user = new Func<Integer, User.Id>() {
		public final User.Id apply(final Integer value) {
			return new User.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, Book.Id> book = new Func<Integer, Book.Id>() {
		public final Book.Id apply(final Integer value) {
			return new Book.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, Review.Id> review = new Func<Integer, Review.Id>() {
		public final Review.Id apply(final Integer value) {
			return new Review.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, Survey.Id> survey = new Func<Integer, Survey.Id>() {
		public final Survey.Id apply(final Integer value) {
			return new Survey.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, Purchase.Id> purchase = new Func<Integer, Purchase.Id>() {
		public final Purchase.Id apply(final Integer value) {
			return new Purchase.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, RssFeed.Id> rssFeed = new Func<Integer, RssFeed.Id>() {
		public final RssFeed.Id apply(final Integer value) {
			return new RssFeed.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, Order.Id> order = new Func<Integer, Order.Id>() {
		public final Order.Id apply(final Integer value) {
			return new Order.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, Global.Id> global = new Func<Integer, Global.Id>() {
		public final Global.Id apply(final Integer value) {
			return new Global.Id(Authority.token, value);
		}
	};
	private static final Func<Integer, Province.Id> province = new Func<Integer, Province.Id>() {
		public Province.Id apply(final Integer value) {
			return new Province.Id(Authority.token, value);
		} 
	};
	private static final Func<Integer, BannerAd.Id> bannerAd = new Func<Integer, BannerAd.Id>() {
		public BannerAd.Id apply(final Integer value) {
			return new BannerAd.Id(Authority.token, value);
		} 
	};
	private static final Func<Integer, SmallAd.Id> smallAd = new Func<Integer, SmallAd.Id>() {
		public SmallAd.Id apply(final Integer value) {
			return new SmallAd.Id(Authority.token, value);
		} 
	};
	
	

	public final Throws<Address.Id, Address.Data, SQLException> getAddress =
	new Throws<Address.Id, Address.Data, SQLException>() {
		public final Address.Data apply(final Address.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<Client.Id, Client.Data, SQLException> getClient =
	new Throws<Client.Id, Client.Data, SQLException>() {
		public final Client.Data apply(final Client.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<User.Id, User.Data, SQLException> getUser =
	new Throws<User.Id, User.Data, SQLException>() {
		public final User.Data apply(final User.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<Book.Id, Book.Data, SQLException> getBook =
	new Throws<Book.Id, Book.Data, SQLException>() {
		public final Book.Data apply(final Book.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<Review.Id, Review.Data, SQLException> getReview =
	new Throws<Review.Id, Review.Data, SQLException>() {
		public final Review.Data apply(final Review.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<Survey.Id, Survey.Data, SQLException> getSurvey =
	new Throws<Survey.Id, Survey.Data, SQLException>() {
		public final Survey.Data apply(final Survey.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<Purchase.Id, Purchase.Data, SQLException> getPurchase =
	new Throws<Purchase.Id, Purchase.Data, SQLException>() {
		public final Purchase.Data apply(final Purchase.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<RssFeed.Id, RssFeed.Data, SQLException> getRssFeed =
	new Throws<RssFeed.Id, RssFeed.Data, SQLException>() {
		public final RssFeed.Data apply(final RssFeed.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<Order.Id, Order.Data, SQLException> getOrder =
	new Throws<Order.Id, Order.Data, SQLException>() {
		public final Order.Data apply(final Order.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<Global.Id, Global.Data, SQLException> getGlobal =
	new Throws<Global.Id, Global.Data, SQLException>() {
		public final Global.Data apply(final Global.Id id) throws SQLException {
			return get(id);
		}
	};
	public final Throws<Province.Id, Province.Data, SQLException> getProvince =
	new Throws<Province.Id, Province.Data, SQLException>() {
		public Province.Data apply(final Province.Id id) throws SQLException {
			return get(id);
		}		
	};
	public final Throws<BannerAd.Id, BannerAd.Data, SQLException> getBannerAd =
	new Throws<BannerAd.Id, BannerAd.Data, SQLException>() {
		public BannerAd.Data apply(final BannerAd.Id id) throws SQLException {
			return get(id);
		}		
	};
	public final Throws<SmallAd.Id, SmallAd.Data, SQLException> getSmallAd =
	new Throws<SmallAd.Id, SmallAd.Data, SQLException>() {
		public SmallAd.Data apply(final SmallAd.Id id) throws SQLException {
			return get(id);
		}		
	};
	
		
	private final <A> A getData(final Tables table, final Key id, Loader<A> loader) throws SQLException {
		try {
			final PreparedStatement statement = 
				prepare("SELECT * FROM " + table.name + " WHERE id = ?",
					Preparers.key(id));
			
			return queryUnique(statement, loader);
		} catch (final ResultNotUnique e) {
			throw new RuntimeException(e);
		}
	}
	private final <A> Set<A> getWhere(final Tables table, final String field, final Key id, final Loader<A> loader) throws SQLException {
		final PreparedStatement statement = prepare("SELECT * FROM " + table.name + " WHERE " + field + " = ?", 
				Preparers.key(id));
		
		return query(statement, loader);
	}

	private static final Book.EFormat loadEFormat(final ResultSet row) throws SQLException {
		final String name = row.getString("eformat");
		
		return Book.EFormat.parse(name).value();
	}
	private static final Entry<Survey.Choice, Nat> loadChoice(final ResultSet row) throws SQLException {
		final String choice = row.getString("choice");
		final int votes = row.getInt("votes");
		
		return OrderManagementServlet.entry(
			Survey.Choice.parse(choice).value(),
			Nat.from(votes).value()
		);
	}

	private static final Address.Data loadAddress(final ResultSet row) throws SQLException {
		return new Address.Data(
			Address.City.parse(row.getString("city")).value(),
			new Province.Id(Authority.token, row.getInt("province")),
			Address.PostalCode.parse(row.getString("postal_code")).value(),
			Address.Location.parse(row.getString("address")).value()
		);
	}
	private static final Book.Data loadBook(final Set<Book.EFormat> eformats, final ResultSet row) throws SQLException {
		final Maybe<Long> numberOfBooksLong = Maybe.from((Long) row.getObject("number_of_books"));
		final Maybe<Nat> numberOfBooks = numberOfBooksLong.isNull() ? 
				Maybe.<Nat>nothing() :
				Nat.from(numberOfBooksLong.value().intValue());
		
		return new Book.Data(
			row.getTimestamp("date_entered"),
			Book.Title.parse(row.getString("title")).value(),
			Book.Author.parse(row.getString("author")).value(),
			Book.Publisher.parse(row.getString("publisher")).value(),
			Book.Isbn10.parse(row.getString("isbn_10")).value(),
			Book.Isbn13.parse(row.getString("isbn_13")).value(),
			Book.Genre.parse(row.getString("genre")).value(),
			Book.Description.parse(row.getString("description")).value(),
			Nat.from(row.getInt("number_of_pages")).value(),
			Nat.from(row.getInt("weight")).value(),
			Book.Dimensions.parse(row.getString("dimensions")).value(),
			Book.Thumbnail.parse(row.getString("thumbnail")).value(),
			Book.Cover.parse(row.getString("cover")).value(),
			Money.from(row.getBigDecimal("list_price")).value(),
			Money.from(row.getBigDecimal("sale_price")).value(),
			Money.from(row.getBigDecimal("wholesale_price")).value(),
			numberOfBooks,
			eformats
		);
	}
	private static final Client.Data loadClient(final ResultSet row) throws SQLException {			
		return new Client.Data(
			new Address.Id(Authority.token, row.getInt("shipping_address_id")),
			new Address.Id(Authority.token, row.getInt("billing_address_id")),
			Client.FirstName.parse(row.getString("first_name")).value(),
			Client.LastName.parse(row.getString("last_name")).value(),
			Client.PhoneNumber.parse(row.getString("home_phone")).value(),
			Client.PhoneNumber.parse(row.getString("cell_phone")).value(),
			Client.Email.parse(row.getString("email")).value()
		);
	}
	private static final User.Data loadUser(final ResultSet row) throws SQLException {
		final Maybe<Integer> id = Maybe.from((Integer) row.getObject("client_id"));

		final Maybe<String> lastG = Maybe.from(row.getString("last_genre"));
		final Maybe<Book.Genre> lastGenre = 
			lastG.isNull() ? Maybe.<Book.Genre>nothing() :
				Maybe.just(Book.Genre.parse(lastG.value()).value());
			
		return new User.Data(
			id.isNull() ? Maybe.<Client.Id>nothing() : Maybe.just(new Client.Id(Authority.token, id.value().intValue())),
			User.Login.parse(row.getString("login")).value(),
			User.Password.parse(row.getString("password")).value(),
			row.getBoolean("manager"),
			lastGenre
		);
	}
	private static final Purchase.Data loadPurchase(final ResultSet row) throws SQLException {
		return new Purchase.Data(
			new User.Id(Authority.token, row.getInt("user_id")),
			new Book.Id(Authority.token, row.getInt("book_id")),
			Money.from(row.getBigDecimal("price")).value(),
			row.getTimestamp("purchased_on"),
			Nat.from(row.getInt("number_of_copies")).value(),
			row.getBoolean("electronic")
		);
	}
	private static final Review.Data loadReview(final ResultSet row) throws SQLException {
		final Maybe<String> text = Maybe.from(row.getString("review_text"));
		final Maybe<Review.Text> mtext = text.isNull() ? 
				Maybe.<Review.Text>nothing() : 
				Review.Text.parse(text.value());
		
		return new Review.Data(
			new User.Id(Authority.token, row.getInt("user_id")),
			new Book.Id(Authority.token, row.getInt("book_id")),
			row.getTimestamp("created_at"),
			Review.Rating.from(row.getInt("rating")).value(),
			text.isNull() ? mtext : Maybe.just(mtext.value()),
			Review.Status.from(row.getInt("status")).value()
		);
	}
	private static final Survey.Data loadSurvey(final Set<Entry<Survey.Choice, Nat>> entries, final ResultSet surveyRow) throws SQLException {
		final Map<Survey.Choice, Nat> votes = new HashMap<Survey.Choice, Nat>();
		
		for(final Entry<Survey.Choice, Nat> entry : entries) {
			votes.put(entry.getKey(), entry.getValue());
		}
		final Set<Survey.Choice> choices = votes.keySet();
				
		return new Survey.Data(
			Authority.token,
			Survey.Question.parse(surveyRow.getString("question")).value(),
			Survey.Choices.from(choices).value(),
			new Survey.Votes(Authority.token, votes)
		);
	}
	private static final RssFeed.Data loadFeed(final ResultSet row) throws SQLException {
		try {
			return new RssFeed.Data(
				new URL(row.getString("url"))
			);
		} catch (final MalformedURLException e) {
			throw new SQLException(e);
		}
	}
	private static final Order.Data loadOrder(final ResultSet row) throws SQLException {
		final Maybe<Timestamp> receivedOn = Maybe.from(row.getTimestamp("received_on"));

		return new Order.Data(
			new Book.Id(Authority.token, row.getInt("book_id")), 
			row.getTimestamp("ordered_on"), 
			receivedOn,
			Nat.from(row.getInt("quantity")).value()
		);
	}
	private static final Global.Data loadGlobal(final Set<SmallAd.Id> currentSmallAds, final ResultSet row) throws SQLException {		
		return new Global.Data(
			new Survey.Id(Authority.token, row.getInt("current_survey")),
			new RssFeed.Id(Authority.token, row.getInt("current_feed")),
			Nat.from(row.getInt("minimum_books")).value(),
			new BannerAd.Id(Authority.token, row.getInt("banner_ad")),
			currentSmallAds
		);
	}
	private static final SmallAd.Id loadCurrentSmallAd(final ResultSet row) throws SQLException {
		return smallAd.apply(row.getInt("small_ad_id"));
	}
	private static final Province.Data loadProvince(final ResultSet row) throws SQLException {
		
		final Maybe<BigDecimal> second = Maybe.from(row.getBigDecimal("second_tax_rate"));
		
		return new Province.Data(
			Province.Name.parse(row.getString("name")).value(),
			Province.Rate.from(row.getBigDecimal("tax_rate")).value(),
			second.isNull() ? Maybe.<Province.Rate>nothing() : Province.Rate.from(second.value())
		);
	}
	private static final BannerAd.Data loadBannerAd(final ResultSet row) throws SQLException {
		return new BannerAd.Data(
			BannerAd.Image.parse(row.getString("image")).value()
		);
	}
	private static final SmallAd.Data loadSmallAd(final ResultSet row) throws SQLException {
		return new SmallAd.Data(
			SmallAd.Image.parse(row.getString("image")).value()
		);
	}

	private static final Loader<Book.EFormat> loadEFormat = new Loader<Book.EFormat>() {
		public Book.EFormat apply(final ResultSet row) throws SQLException {
			return loadEFormat(row);
		}
	};
	private static final Loader<Entry<Survey.Choice, Nat>> loadChoice = new Loader<Entry<Survey.Choice, Nat>>() {
		public Entry<Survey.Choice, Nat> apply(final ResultSet row) throws SQLException {
			return loadChoice(row);
		}
	};
	private static final Loader<Address.Data> loadAddress = new Loader<Address.Data>() {
		public Address.Data apply(final ResultSet row) throws SQLException {
			return loadAddress(row);
		}
	};
	private static final Loader<Client.Data> loadClient = new Loader<Client.Data>() {
		public Client.Data apply(final ResultSet row) throws SQLException {
			return loadClient(row);
		}
	};
	private static final Loader<User.Data> loadUser = new Loader<User.Data>() {
		public User.Data apply(final ResultSet row) throws SQLException {
			return loadUser(row);
		}
	};
	private static final Loader<Book.Data> loadBook(final Set<Book.EFormat> eformats) {
		return  new Loader<Book.Data>() {
			public final Book.Data apply(final ResultSet row) throws SQLException {
				return loadBook(eformats, row);
			}
		};
	}
	private static final Loader<Review.Data> loadReview = new Loader<Review.Data>() {
		public Review.Data apply(final ResultSet row) throws SQLException {
			return loadReview(row);
		}
	};
	private static final Loader<Survey.Data> loadSurvey(final Set<Entry<Survey.Choice, Nat>> entries) {
		return new Loader<Survey.Data>() {
			public Survey.Data apply(final ResultSet row) throws SQLException {
				return loadSurvey(entries, row);
			}
		};
	}
	private static final Loader<RssFeed.Data> loadFeed = new Loader<RssFeed.Data>() {
		public RssFeed.Data apply(final ResultSet row) throws SQLException {
			return loadFeed(row);
		}
	};
	private static final Loader<Purchase.Data> loadPurchase = new Loader<Purchase.Data>() {
		public Purchase.Data apply(final ResultSet row) throws SQLException {
			return loadPurchase(row);
		}
	};
	private static final Loader<Order.Data> loadOrder = new Loader<Order.Data>() {
		public Order.Data apply(final ResultSet row) throws SQLException {
			return loadOrder(row);
		}
	};
	private static final Loader<Global.Data> loadGlobal(final Set<SmallAd.Id> currentSmallAds) {
		return new Loader<Global.Data>() {
			public Global.Data apply(final ResultSet row) throws SQLException {
				return loadGlobal(currentSmallAds, row);
			}
		};
	}
	private static final Loader<SmallAd.Id> loadCurrentSmallAd = new Loader<SmallAd.Id>() {
		public SmallAd.Id apply(final ResultSet row) throws SQLException {
			return loadCurrentSmallAd(row);
		}
	};
	private static final Loader<Province.Data> loadProvince = new Loader<Province.Data>() {
		public Province.Data apply(final ResultSet row) throws SQLException {
			return loadProvince(row);
		}
	};
	private static final Loader<BannerAd.Data> loadBannerAd = new Loader<BannerAd.Data>() {
		public BannerAd.Data apply(final ResultSet row) throws SQLException {
			return loadBannerAd(row);
		}
	};
	private static final Loader<SmallAd.Data> loadSmallAd = new Loader<SmallAd.Data>() {
		public SmallAd.Data apply(final ResultSet row) throws SQLException {
			return loadSmallAd(row);
		}
	};

	
	
	public final Address.Data get(final Address.Id address) throws SQLException { 
		return getData(Tables.ADDRESS, address, loadAddress);
	}
	public final Client.Data get(final Client.Id client) throws SQLException {
		return getData(Tables.CLIENT, client, loadClient);
	}
	public final User.Data get(final User.Id user) throws SQLException {
		return getData(Tables.USER, user, loadUser);
	}
	public final Book.Data get(final Book.Id book) throws SQLException { 
		final Set<Book.EFormat> eformats = getWhere(Tables.EBOOK, "book_id", book, loadEFormat);
		return getData(Tables.BOOK, book, loadBook(eformats));
	}
	public final Purchase.Data get(final Purchase.Id purchase) throws SQLException { 
		return getData(Tables.PURCHASE, purchase, loadPurchase);
	}
	public final Review.Data get(final Review.Id review) throws SQLException {
		return getData(Tables.REVIEW, review, loadReview);
	}
	public final Survey.Data get(final Survey.Id survey) throws SQLException {
		final Set<Entry<Survey.Choice, Nat>> entries = getWhere(Tables.SURVEY_CHOICE, "survey_id", survey, loadChoice);
		return getData(Tables.SURVEY, survey, loadSurvey(entries));
	}	
	public final RssFeed.Data get(final RssFeed.Id feed) throws SQLException {
		return getData(Tables.RSS_FEED, feed, loadFeed);
	}
	public final Order.Data get(final Order.Id order) throws SQLException {
		return getData(Tables.ORDER, order, loadOrder);
	}
	public final Global.Data get(final Global.Id global) throws SQLException {
		final Set<SmallAd.Id> currentSmallAds = getWhere(Tables.CURRENT_SMALL_AD, "global_id", global, loadCurrentSmallAd);
		
		return getData(Tables.GLOBAL_DATA, global, loadGlobal(currentSmallAds));
	}
	public final Province.Data get(final Province.Id province) throws SQLException {
		return getData(Tables.PROVINCE, province, loadProvince);
	}
	public final BannerAd.Data get(final BannerAd.Id province) throws SQLException {
		return getData(Tables.BANNER_AD, province, loadBannerAd);
	}
	public final SmallAd.Data get(final SmallAd.Id province) throws SQLException {
		return getData(Tables.SMALL_AD, province, loadSmallAd);
	}

	private static final Preparer prepare(final Address.Data data) {
		return Preparers.sequence(
			Preparers.safeString(data.city),
			Preparers.key(data.province),
			Preparers.safeString(data.postalCode),
			Preparers.safeString(data.address)
		);
	}
	private static final Preparer prepare(final Client.Data data) {
		return Preparers.sequence(
			Preparers.key(data.shippingAddressID),
			Preparers.key(data.billingAddressID),
			Preparers.safeString(data.firstName),
			Preparers.safeString(data.lastName),
			Preparers.safeString(data.homePhoneNumber),
			Preparers.safeString(data.cellPhoneNumber),
			Preparers.safeString(data.email)
		);
	}
	private static final Preparer prepare(final User.Data data) {
		return Preparers.sequence(
			Preparers.safeString(data.login),
			Preparers.safeString(data.password),
			Preparers.bool(data.manager),
			Preparers.maybe(Preparers.<Client.Id>key()).apply(data.clientID),
			Preparers.maybe(Preparers.<Book.Genre>safeString()).apply(data.lastGenre)
		);
	}
	private static final Preparer prepare(final Book.EFormat eformat, final Book.Id book) {
		return Preparers.sequence(
			Preparers.key(book),
			Preparers.safeString(eformat)
		);
	}
	private static final Preparer prepare(final Survey.Choice choice, final Survey.Id survey) {
		return Preparers.sequence(
			Preparers.key(survey),
			Preparers.safeString(choice)
		);
	}
	private static final Preparer prepare(final Survey.Data data) {
		return Preparers.sequence(
			Preparers.safeString(data.question)
		);
	}
	private static final Preparer prepare(final Review.Data data) {
		return Preparers.sequence(
			Preparers.key(data.user),
			Preparers.key(data.book),
			Preparers.timestamp(data.createdAt),
			Preparers.wrapper(Preparers.integer).apply(data.rating),
			Preparers.maybe(Preparers.<Review.Text>safeString()).apply(data.reviewText),
			Preparers.integer(data.status.code)
		);
	}
	private static final Preparer prepare(final Purchase.Data data) {
		return Preparers.sequence(
			Preparers.key(data.user),
			Preparers.key(data.book),
			Preparers.wrapper(Preparers.bigDecimal).apply(data.price),
			Preparers.timestamp(data.purchasedOn),
			Preparers.wrapper(Preparers.integer).apply(data.numberOfCopies),
			Preparers.bool(data.electronic)
		);
	}
	private static final Preparer prepare(final Book.Data data) {
		return Preparers.sequence(
			Preparers.timestamp(data.dateEntered),
			Preparers.safeString(data.title),
			Preparers.safeString(data.author),
			Preparers.safeString(data.publisher),
			Preparers.safeString(data.isbn10),
			Preparers.safeString(data.isbn13),
			Preparers.safeString(data.genre),
			Preparers.safeString(data.description),
			Preparers.wrapper(Preparers.integer).apply(data.numberOfPages),
			Preparers.wrapper(Preparers.integer).apply(data.weight),
			Preparers.string(data.dimensions.toString()),
			Preparers.safeString(data.thumbnail),
			Preparers.safeString(data.cover),
			Preparers.wrapper(Preparers.bigDecimal).apply(data.listPrice),
			Preparers.wrapper(Preparers.bigDecimal).apply(data.salePrice),
			Preparers.wrapper(Preparers.bigDecimal).apply(data.wholesalePrice),
			Preparers.maybe(Preparers.<Integer, Nat>wrapper(Preparers.integer)).apply(data.numberOfBooks)
		);
	}
	private static final Preparer prepare(final RssFeed.Data data) {
		return Preparers.sequence(
			Preparers.string(data.url.toString())
		);
	}
	private static final Preparer prepare(final Order.Data data) {
		return Preparers.sequence(
			Preparers.key(data.book),
			Preparers.timestamp(data.orderedOn),
			Preparers.maybe(Preparers.timestamp).apply(data.receivedOn),
			Preparers.wrapper(Preparers.integer).apply(data.numberOfCopies)
		);
	}
	private static final Preparer prepare(final Global.Data data) {
		return Preparers.sequence(
			Preparers.key(data.currentSurvey),
			Preparers.key(data.currentFeed),
			Preparers.wrapper(Preparers.integer).apply(data.minimumBooks),
			Preparers.key(data.currentBannerAd)
		);		
	}
	private static final Preparer prepare(final Global.Id global, final SmallAd.Id ad) {
		return Preparers.sequence(
			Preparers.key(global),
			Preparers.key(ad)
		);
	}
	private static final Preparer prepare(final Province.Data data) {
		return Preparers.sequence(
			Preparers.safeString(data.name),
			Preparers.wrapper(Preparers.bigDecimal).apply(data.taxRate),
			Preparers.maybe(Preparers.<BigDecimal, Province.Rate>wrapper(Preparers.bigDecimal)).apply(data.secondTaxRate)
		);		
	}
	private static final Preparer prepare(final BannerAd.Data data) {
		return Preparers.sequence(
			Preparers.safeString(data.image)
		);		
	}
	private static final Preparer prepare(final SmallAd.Data data) {
		return Preparers.sequence(
			Preparers.safeString(data.image)
		);		
	}

	
	public Address.Id put(final Address.Data data) throws SQLException {
		return usingPreparedInsert(Tables.ADDRESS, prepare(data), address);
	}
	public Client.Id put(final Client.Data data) throws SQLException {
		return usingPreparedInsert(Tables.CLIENT, prepare(data), client);
	}
	public User.Id put(final User.Data data) throws SQLException {
		return usingPreparedInsert(Tables.USER, prepare(data), user);
	}
	public Book.Id put(final Book.Data data) throws SQLException {
		final Book.Id id = usingPreparedInsert(Tables.BOOK, prepare(data), book);
		
		for(final Book.EFormat eformat : data.eformats) {
			usingPreparedInsert(Tables.EBOOK, prepare(eformat, id), book);
		}
		
		return id;
	}
	public Purchase.Id put(final Purchase.Data data) throws SQLException {
		return usingPreparedInsert(Tables.PURCHASE, prepare(data), purchase);
	}
	public Review.Id put(final Review.Data data) throws SQLException {
		return usingPreparedInsert(Tables.REVIEW, prepare(data), review);
	}
	public Survey.Id put(final Survey.Data data) throws SQLException {
		final Survey.Id id = usingPreparedInsert(Tables.SURVEY, prepare(data), survey);
		
		for(final Survey.Choice choice : data.choices.value) {
			usingPreparedInsert(Tables.SURVEY_CHOICE, prepare(choice, id), survey /* ignored */);
		}
		
		return id;
	}
	public RssFeed.Id put(final RssFeed.Data data) throws SQLException {
		return usingPreparedInsert(Tables.RSS_FEED, prepare(data), rssFeed);
	}
	public Order.Id put(final Order.Data data) throws SQLException {
		return usingPreparedInsert(Tables.ORDER, prepare(data), order);
	}
	public Global.Id put(final Global.Data data) throws SQLException {
		return usingPreparedInsert(Tables.GLOBAL_DATA, prepare(data), global);
	}
	public Province.Id put(final Province.Data data) throws SQLException {
		return usingPreparedInsert(Tables.PROVINCE, prepare(data), province);
	}
	public BannerAd.Id put(final BannerAd.Data data) throws SQLException {
		return usingPreparedInsert(Tables.BANNER_AD, prepare(data), bannerAd);
	}
	public SmallAd.Id put(final SmallAd.Data data) throws SQLException {
		return usingPreparedInsert(Tables.SMALL_AD, prepare(data), smallAd);
	}
	
	

	private final PreparedStatement preparedInsert(final Tables table) throws SQLException {
		return connection.prepareStatement(
				"INSERT INTO " + table.name + stringTuple(table.fields)
				+ " VALUES " + stringTuple(Arrays.asList(repeat("?", table.fields.size()))),
			Statement.RETURN_GENERATED_KEYS);
	}
	private final <K extends Key> K usingPreparedInsert(final Tables table, final Preparer preparer, final Func<Integer, K> toKey) throws SQLException {
		final PreparedStatement statement = preparedInsert(table);
		
		preparer.prepare(1, statement);
		
		statement.executeUpdate();
		final ResultSet result = statement.getGeneratedKeys();
		
		result.next();
		return toKey.apply(result.getInt(1));
	}
	private static final String stringTuple(final List<String> fields) {
		String tuple = "(";
		
		int i = 0;
		if(i < fields.size()) {
			tuple += fields.get(i);
			i++;
			
			while(i < fields.size()) {
				tuple += ", " + fields.get(i);
				i++;
			}
		}
		
		tuple += ")";
		
		return tuple;
	}
	private static final String[] repeat(final String x, final int n) {
		final String[] xs = new String[n];
		for(int i = 0; i < n; i++)
			xs[i] = x;
		return xs;
	}
	
	
	public final ResultSet queryUniqueUnsafe(final String queryString) throws SQLException, ResultNotUnique {
		final ResultSet result = queryUnsafe(queryString);
		
		if(!result.next()) throw new ResultNotUnique("Too few");
		if(!result.isLast()) throw new ResultNotUnique("Too many");
		
		return result;
	};
	public final ResultSet queryUnsafe(final String queryString) throws SQLException {
		final Statement statement = connection.createStatement();
		
		return statement.executeQuery(queryString);
	}
	public final void commandUnsafe(final String commandString) throws SQLException {
		final Statement statement = connection.createStatement();
		
		statement.execute(commandString);
	}

	public final PreparedStatement prepare(final String queryString, final Preparer preparer) throws SQLException {
		final PreparedStatement statement = connection.prepareStatement(queryString);
		preparer.prepare(1, statement);
		return statement;
	}
	public final <A> Set<A> query(final PreparedStatement statement, final Loader<A> loader) throws SQLException {
		final ResultSet result = statement.executeQuery();
		
		final Set<A> xs = new HashSet<A>();
		
		while(result.next()) {
			xs.add(loader.apply(result));
		}
		
		return Collections.unmodifiableSet(xs);
	}
	public final <A> List<A> queryOrdered(final PreparedStatement statement, final Loader<A> loader) throws SQLException {
		final ResultSet result = statement.executeQuery();
		
		final List<A> xs = new ArrayList<A>();
		
		while(result.next()) {
			xs.add(loader.apply(result));
		}
		
		return Collections.unmodifiableList(xs);
	}
	public final <A> A queryUnique(final PreparedStatement statement, final Loader<A> loader) throws ResultNotUnique, SQLException {
		final ResultSet result = statement.executeQuery();
		
		if(!result.next()) throw new ResultNotUnique("Too few");
		if(!result.isLast()) throw new ResultNotUnique("Too many");
		
		return loader.apply(result);
	}
	public final void command(final PreparedStatement statement) throws SQLException {
		statement.execute();
	}
	public final Integer create(final PreparedStatement statement) throws SQLException {
		statement.execute();
		
		final ResultSet keys = statement.getGeneratedKeys();
		
		keys.next();
		
		return keys.getInt(1);
	}
	
	
	private static final Loader<Integer> loadId = new Loader<Integer>() {
		public Integer apply(final ResultSet row) throws SQLException {
			return row.getInt("id");
		}
	};

	private final Set<Integer> getRows(final Tables table, final String query, final Preparer preparer) throws SQLException {
		final PreparedStatement statement = prepare("SELECT id FROM " + table.name + " " + query, preparer);
		
		return query(statement, loadId);
	}
	public final Set<Address.Id> getAddresses(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.ADDRESS, query, preparer), address);
	}
	public final Set<Client.Id> getClients(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.CLIENT, query, preparer), client);
	}
	public final Set<User.Id> getUsers(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.USER, query, preparer), user);
	}
	public final Set<Book.Id> getBooks(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.BOOK, query, preparer), book);
	}
	public final Set<Review.Id> getReviews(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.REVIEW, query, preparer), review);
	}
	public final Set<Survey.Id> getSurveys(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.SURVEY, query, preparer), survey);
	}
	public final Set<Purchase.Id> getPurchases(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.PURCHASE, query, preparer), purchase);
	}
	public final Set<RssFeed.Id> getFeeds(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.RSS_FEED, query, preparer), rssFeed);
	}
	public final Set<Order.Id> getOrders(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.ORDER, query, preparer), order);
	}
	public final Set<Global.Id> getGlobals(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.GLOBAL_DATA, query, preparer), global);
	}
	public final Set<Province.Id> getProvinces(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.PROVINCE, query, preparer), province);
	}
	public final Set<BannerAd.Id> getBannerAds(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.BANNER_AD, query, preparer), bannerAd);
	}
	public final Set<SmallAd.Id> getSmallAds(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getRows(Tables.SMALL_AD, query, preparer), smallAd);
	}
	


	private final List<Integer> getOrderedRows(final Tables table, final String query, final Preparer preparer) throws SQLException {
		final PreparedStatement statement = prepare("SELECT id FROM " + table.name + " " + query, preparer);
		
		return queryOrdered(statement, loadId);
	}
	public final List<Address.Id> getOrderedAddresses(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.ADDRESS, query, preparer), address);
	}
	public final List<Client.Id> getOrderedClients(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.CLIENT, query, preparer), client);
	}
	public final List<User.Id> getOrderedUsers(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.USER, query, preparer), user);
	}
	public final List<Book.Id> getOrderedBooks(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.BOOK, query, preparer), book);
	}
	public final List<Review.Id> getOrderedReviews(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.REVIEW, query, preparer), review);
	}
	public final List<Survey.Id> getOrderedSurveys(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.SURVEY, query, preparer), survey);
	}
	public final List<Purchase.Id> getOrderedPurchases(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.PURCHASE, query, preparer), purchase);
	}
	public final List<RssFeed.Id> getOrderedFeeds(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.RSS_FEED, query, preparer), rssFeed);
	}
	public final List<Order.Id> getOrderedOrders(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.ORDER, query, preparer), order);
	}
	public final List<Global.Id> getOrderedGlobals(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.GLOBAL_DATA, query, preparer), global);
	}
	public final List<Province.Id> getOrderedProvinces(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.PROVINCE, query, preparer), province);
	}
	public final List<BannerAd.Id> getOrderedBannerAds(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.BANNER_AD, query, preparer), bannerAd);
	}
	public final List<SmallAd.Id> getOrderedSmallAds(final String query, final Preparer preparer) throws SQLException {
		return Funcs.map(getOrderedRows(Tables.SMALL_AD, query, preparer), smallAd);
	}
	
	
	public final Integer getRow(final Tables table, final String query, final Preparer preparer) throws SQLException, ResultNotUnique {
		final PreparedStatement statement = prepare("SELECT id FROM " + table.name + " " + query, preparer);
		
		return queryUnique(statement, loadId);
	}
	public final Address.Id getAddress(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new Address.Id(Authority.token, getRow(Tables.ADDRESS, query, preparer));
	}
	public final Client.Id getClient(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new Client.Id(Authority.token, getRow(Tables.CLIENT, query, preparer));
	}
	public final User.Id getUser(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new User.Id(Authority.token, getRow(Tables.USER, query, preparer));
	}
	public final Book.Id getBook(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new Book.Id(Authority.token, getRow(Tables.BOOK, query, preparer));
	}
	public final Review.Id getReview(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new Review.Id(Authority.token, getRow(Tables.REVIEW, query, preparer));
	}
	public final Survey.Id getSurvey(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new Survey.Id(Authority.token, getRow(Tables.SURVEY, query, preparer));
	}
	public final Purchase.Id getPurchase(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new Purchase.Id(Authority.token, getRow(Tables.PURCHASE, query, preparer));
	}
	public final RssFeed.Id getFeed(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new RssFeed.Id(Authority.token, getRow(Tables.RSS_FEED, query, preparer));
	}
	public final Order.Id getOrder(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new Order.Id(Authority.token, getRow(Tables.ORDER, query, preparer));
	}
	public final Global.Id getGlobal(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new Global.Id(Authority.token, getRow(Tables.GLOBAL_DATA, query, preparer));
	}
	public final Province.Id getProvince(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new Province.Id(Authority.token, getRow(Tables.PROVINCE, query, preparer));
	}
	public final BannerAd.Id getBannerAd(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new BannerAd.Id(Authority.token, getRow(Tables.BANNER_AD, query, preparer));
	}
	public final SmallAd.Id getSmallAd(final String query, final Preparer preparer) throws ResultNotUnique, SQLException {
		return new SmallAd.Id(Authority.token, getRow(Tables.SMALL_AD, query, preparer));
	}

	

	private final void exists(final Tables table, final int id) throws SQLException, ResultNotUnique {
		getRow(table, "WHERE id = ?", Preparers.key(new Key(Authority.token, id) { }));
	}
	public final Maybe<Address.Id> referToAddress(final int id) throws SQLException {
		try {
			exists(Tables.ADDRESS, id);
			
			return Maybe.just(new Address.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<Client.Id> referToClient(final int id) throws SQLException {
		try {
			exists(Tables.CLIENT, id);

			return Maybe.just(new Client.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<User.Id> referToUser(final int id) throws SQLException {
		try {
			exists(Tables.USER, id);

			return Maybe.just(new User.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<Book.Id> referToBook(final int id) throws SQLException {
		try {
			exists(Tables.BOOK, id);

			return Maybe.just(new Book.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<Purchase.Id> referToPurchase(final int id) throws SQLException {
		try {
			exists(Tables.PURCHASE, id);

			return Maybe.just(new Purchase.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<Review.Id> referToReview(final int id) throws SQLException {
		try {
			exists(Tables.REVIEW, id);

			return Maybe.just(new Review.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<Survey.Id> referToSurvey(final int id) throws SQLException {
		try {
			exists(Tables.SURVEY, id);

			return Maybe.just(new Survey.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<RssFeed.Id> referToFeed(final int id) throws SQLException {
		try {
			exists(Tables.RSS_FEED, id);

			return Maybe.just(new RssFeed.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<Order.Id> referToOrder(final int id) throws SQLException {
		try {
			exists(Tables.ORDER, id);

			return Maybe.just(new Order.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<Global.Id> referToGlobal(final int id) throws SQLException {
		try {
			exists(Tables.GLOBAL_DATA, id);

			return Maybe.just(new Global.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<Province.Id> referToProvince(final int id) throws SQLException {
		try {
			exists(Tables.PROVINCE, id);

			return Maybe.just(new Province.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<BannerAd.Id> referToBannerAd(final int id) throws SQLException {
		try {
			exists(Tables.BANNER_AD, id);

			return Maybe.just(new BannerAd.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final Maybe<SmallAd.Id> referToSmallAd(final int id) throws SQLException {
		try {
			exists(Tables.SMALL_AD, id);

			return Maybe.just(new SmallAd.Id(Authority.token, id));
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}


	public final void update(final Address.Id id, Address.Data data) throws SQLException {
		usingPreparedUpdate(Tables.ADDRESS, id, prepare(data));
	}
	public final void update(final Client.Id id, Client.Data data) throws SQLException {
		usingPreparedUpdate(Tables.CLIENT, id, prepare(data));
	}
	public final void update(final User.Id id, User.Data data) throws SQLException {
		usingPreparedUpdate(Tables.USER, id, prepare(data));
	}
	public final void update(final Book.Id id, Book.Data data) throws SQLException {
		usingPreparedUpdate(Tables.BOOK, id, prepare(data));
		
		final PreparedStatement statement = prepare("DELETE FROM " + Tables.EBOOK.name + " WHERE book_id = ?", Preparers.key(id));
		command(statement);
		
		for(final Book.EFormat eformat : data.eformats) {
			usingPreparedInsert(Tables.EBOOK, prepare(eformat, id), book /* ignored */);
		}
	}
	public final void update(final Purchase.Id id, Purchase.Data data) throws SQLException {
		usingPreparedUpdate(Tables.PURCHASE, id, prepare(data));
	}
	public final void update(final Review.Id id, Review.Data data) throws SQLException {
		usingPreparedUpdate(Tables.REVIEW, id, prepare(data));
	}
	public final void update(final Survey.Id id, Survey.Data data) throws SQLException {
		usingPreparedUpdate(Tables.SURVEY, id, prepare(data));

		final PreparedStatement statement = prepare("DELETE FROM " + Tables.SURVEY_CHOICE.name + " WHERE survey_id = ?", Preparers.key(id));
		command(statement);
		
		for(final Survey.Choice choice : data.choices.value) {
			usingPreparedInsert(Tables.SURVEY_CHOICE, prepare(choice, id), survey /* ignored */);
		}
	}
	public final void update(final RssFeed.Id id, RssFeed.Data data) throws SQLException {
		usingPreparedUpdate(Tables.RSS_FEED, id, prepare(data));
	}
	public final void update(final Order.Id id, Order.Data data) throws SQLException {
		usingPreparedUpdate(Tables.ORDER, id, prepare(data));
	}
	public final void update(final Global.Id id, Global.Data data) throws SQLException {
		usingPreparedUpdate(Tables.GLOBAL_DATA, id, prepare(data));
		
		final PreparedStatement statement = prepare("DELETE FROM " + Tables.CURRENT_SMALL_AD.name + " WHERE global_id = ?", Preparers.key(id));
		command(statement);
		
		for(final SmallAd.Id ad : data.currentSmallAds) {
			usingPreparedInsert(Tables.CURRENT_SMALL_AD, prepare(id, ad), smallAd /* ignored */);
		}
	}
	public final void update(final Province.Id id, Province.Data data) throws SQLException {
		usingPreparedUpdate(Tables.PROVINCE, id, prepare(data));
	}
	public final void update(final BannerAd.Id id, BannerAd.Data data) throws SQLException {
		usingPreparedUpdate(Tables.BANNER_AD, id, prepare(data));
	}
	public final void update(final SmallAd.Id id, SmallAd.Data data) throws SQLException {
		usingPreparedUpdate(Tables.SMALL_AD, id, prepare(data));
	}
	

	private final PreparedStatement preparedUpdate(final Tables table, final Key id) throws SQLException {
		return connection.prepareStatement("UPDATE " + table.name + " SET " + sets(table.fields) + " WHERE id = ?");
	}
	private final void usingPreparedUpdate(final Tables table, final Key id, final Preparer preparer) throws SQLException {
		final PreparedStatement statement = preparedUpdate(table, id);
		
		Preparers.sequence(preparer, Preparers.key(id)).prepare(1, statement);
		
		statement.executeUpdate();
	}
	private final static String sets(final List<String> fields) {
		String result = "";
		
		int i = 0;
		if(i < fields.size()) {
			result += fields.get(i) + " = ?";
			i++;
		} while(i < fields.size()) {
			result += ", ";
			result += fields.get(i) + " = ?";
			i++;
		}
		
		return result;
	}

	private final void delete(final Tables table, final Key id) throws SQLException {
		final PreparedStatement statement = prepare("DELETE FROM " + table.name + " WHERE id = ?", Preparers.key(id));
		
		command(statement);
	}

	public final void delete(final Address.Id id) throws SQLException {
		delete(Tables.ADDRESS, id);
	}
	public final void delete(final Client.Id id) throws SQLException {
		delete(Tables.CLIENT, id);
	}
	public final void delete(final User.Id id) throws SQLException {
		delete(Tables.USER, id);
	}
	public final void delete(final Book.Id id) throws SQLException {
		delete(Tables.BOOK, id);
	}
	public final void delete(final Review.Id id) throws SQLException {
		delete(Tables.REVIEW, id);
	}
	public final void delete(final Survey.Id id) throws SQLException {
		delete(Tables.SURVEY, id);
	}
	public final void delete(final Purchase.Id id) throws SQLException {
		delete(Tables.PURCHASE, id);
	}
	public final void delete(final RssFeed.Id id) throws SQLException {
		delete(Tables.RSS_FEED, id);
	}
	public final void delete(final Order.Id id) throws SQLException {
		delete(Tables.ORDER, id);
	}
	public final void delete(final Global.Id id) throws SQLException {
		delete(Tables.GLOBAL_DATA, id);
	}
	public final void delete(final Province.Id id) throws SQLException {
		delete(Tables.PROVINCE, id);
	}
	public final void delete(final BannerAd.Id id) throws SQLException {
		delete(Tables.BANNER_AD, id);
	}
	public final void delete(final SmallAd.Id id) throws SQLException {
		delete(Tables.SMALL_AD, id);
	}
}
