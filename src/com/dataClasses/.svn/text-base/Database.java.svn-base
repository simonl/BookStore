package com.dataClasses;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.dataAccess.tables.Address;
import com.dataAccess.tables.BannerAd;
import com.dataAccess.tables.Book;
import com.dataAccess.tables.Book.EFormat;
import com.dataAccess.tables.Client;
import com.dataAccess.tables.Global;
import com.dataAccess.tables.Order;
import com.dataAccess.tables.Province;
import com.dataAccess.tables.Purchase;
import com.dataAccess.tables.Review;
import com.dataAccess.tables.RssFeed;
import com.dataAccess.tables.SmallAd;
import com.dataAccess.tables.Survey;
import com.dataAccess.tables.User;

/**
 * To use a Database, there are two methods:
 *   1. Database db = Database.connect(); Value value = doSomething(db); db.close(); ...
 *   2. Value value = Database.using(..boilerplate.. doSomething); ...
 *
 * The database contains the following tables:
 *   Address, Book, Client, EBook, Purchase, Review, Survey
 * Each of them has its corresponding class in dataAccess.tables
 * 
 * The Database object contains the following methods:
 *   get = Convert an ID into the corresponding table row
 *   fromISBN = Get the internal ID corresponding to a book's ISBN
 *   getAllGenres
 *   getAllEFormats
 *   put = Insert new row in the database
 *   
 *   allBooks
 *   getClientReviews
 *   getBookReviews
 *   getTextReviews
 *   getClientPurchases
 *   getBookPurchases
 *   
 *   Client actions:
 *   login = Convert a username and password into a capability to act on a user's behalf
 *   currentSurvey = Get the survey selected by the manager to be displayed on the front page
 *   lastBooks = Get the books that were most recently added to the database
 *   booksOnSale = Get the books whose sale price is lower than usual
 *   booksWhere = Retrieve the set of books satisfying a condition
 *   vote = Increment the count of the survey option being voted for
 *   review = make a review that will have to be approved by a manager
 *   checkout = Commit the purchase of a whole set of books in whatever formats
 *   
 *   Manager side:
 *   restricted = Get a capability to act as a manager, from a client capability
 *   promote = Grant manager privileges to a client account
 *   approve = Makes a book review visible on the book's page
 *   setCurrentSurvey = Change the survey being displayed on the main page
 *   
 * Also, since the class is still in development and not all features are currently implemented,
 *   methods are available to query the database yourself using any SQL statement (query, command).
 *   If you do so, it should only be temporary, and you should also tell me to make 
 *   a specialized method for it, so that we don't end up with SQL all over the codebase.
 *    
 */
public final class Database {
	
	private final Backend backend;
	private Global.Id global;
	
	private Database(final Backend backend, final Global.Id global) {
		this.backend = backend;
		this.global = global;
		
		this.getAddress = backend.getAddress;
		this.getClient = backend.getClient;
		this.getBook = backend.getBook;
		this.getReview = backend.getReview;
		this.getSurvey = backend.getSurvey;
		this.getOrder = backend.getOrder;
		this.getPurchase = backend.getPurchase;
		this.getProvince = backend.getProvince;
		this.getRssFeed = backend.getRssFeed;
		this.getBannerAd = backend.getBannerAd;
		this.getSmallAd = backend.getSmallAd;
	}
	public final void close() {
		backend.close();
	}
	public static final Database connect() throws CouldNotConnect {
		try {
			final Backend backend = Backend.connect(Authority.token);
			final Global.Id global = backend.referToGlobal(1).value();
			return new Database(backend, global);
		} catch (final SQLException e) {
			throw new CouldNotConnect(e);
		}
	}
	public static final Database connectOld() throws CouldNotConnect {
		try {
			final Backend backend = Backend.connectOld(Authority.token);
			final Global.Id global = backend.referToGlobal(1).value();
			return new Database(backend, global);
		} catch (final SQLException e) {
			throw new CouldNotConnect(e);
		}
	}
	public static interface Action<R, E extends Throwable> { public R perform(final Database db) throws E; }
	public static final <R, E extends Throwable> R using(final Action<R, E> action) throws CouldNotConnect, E {
		
		final Database db = connect();
		
		try {
			return action.perform(db);
		} finally {
			db.close();
		}
	}

	
	
	
	
	
	
	// Abstract types
	public static final class Authority {
		private Authority() {}
		
		private static final Authority token = new Authority();
	}
	public static final class Manager {
		private Manager() {}
		
		private static final Manager token = new Manager();
	}
	
	
	
	
	

	public final Set<Address.Data> getAddresses(final Set<Address.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getAddress);
	}
	public final Set<Book.Data> getBooks(final Set<Book.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getBook);
	}
	public final Set<Client.Data> getClients(final Set<Client.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getClient);
	}
	public final Set<User.Login> getLogins(final Set<User.Id> ids) throws SQLException {
		return Funcs.map(ids, getLogin);
	}
	public final Set<User.Data> getUsers(final Set<User.Authority> ids) throws SQLException {
		return Funcs.map(ids, getUser);
	}
	public final Set<Purchase.Data> getPurchases(final Set<Purchase.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getPurchase);
	}
	public final Set<Review.Data> getReviews(final Set<Review.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getReview);
	}
	public final Set<Survey.Data> getSurveys(final Set<Survey.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getSurvey);
	}
	public final Set<Order.Data> getOrders(final Set<Order.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getOrder);
	}
	public final Set<Province.Data> getProvinces(final Set<Province.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getProvince);
	}
	public final Set<BannerAd.Data> getBannerAds(final Set<BannerAd.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getBannerAd);
	}
	public final Set<SmallAd.Data> getSmallAds(final Set<SmallAd.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getSmallAd);
	}
	
	public final Throws<User.Id, User.Login, SQLException> getLogin =
	new Throws<User.Id, User.Login, SQLException>() {
		public User.Login apply(final User.Id id) throws SQLException {
			return backend.get(id).login;
		}
	};
	public final Throws<User.Authority, User.Data, SQLException> getUser =
	new Throws<User.Authority, User.Data, SQLException>() {
		public User.Data apply(final User.Authority user) throws SQLException {
			return backend.get(user.reference);
		}
	};

	public final List<Address.Data> getAddresses(final List<Address.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getAddress);
	}	
	public final List<Client.Data> getClients(final List<Client.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getClient);
	}
	public final List<User.Login> getLogins(final List<User.Id> ids) throws SQLException {
		return Funcs.map(ids, getLogin);
	}
	public final List<User.Data> getUsers(final List<User.Authority> ids) throws SQLException {
		return Funcs.map(ids, getUser);
	}
	public final List<Book.Data> getBooks(final List<Book.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getBook);
	}
	public final List<Purchase.Data> getPurchases(final List<Purchase.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getPurchase);
	}
	public final List<Review.Data> getReviews(final List<Review.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getReview);
	}	
	public final List<Survey.Data> getSurveys(final List<Survey.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getSurvey);
	}
	public final List<Order.Data> getOrders(final List<Order.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getOrder);
	}
	public final List<Province.Data> getProvinces(final List<Province.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getProvince);
	}
	public final List<BannerAd.Data> getBannerAds(final List<BannerAd.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getBannerAd);
	}
	public final List<SmallAd.Data> getSmallAds(final List<SmallAd.Id> ids) throws SQLException {
		return Funcs.map(ids, backend.getSmallAd);
	}
	
	
	
	
	
	
	

	public Address.Id put(final Address.Data data) throws SQLException {
		return backend.put(data);
	}
	public Client.Id put(final Client.Data data) throws SQLException {
		return backend.put(data);
	}
	public User.Authority put(final User.NewData newData) throws SQLException {
		final User.Data data = new User.Data(
				newData.clientID, 
				newData.login, 
				newData.password,
				false, 
				Maybe.<Book.Genre>nothing()
		);
		
		return new User.Authority(Authority.token, backend.put(data));
	}
	
	
	
	public final ResultSet queryUnique(final String queryString) throws SQLException, ResultNotUnique {
		return backend.queryUniqueUnsafe(queryString);
	}
	public final ResultSet query(final String queryString) throws SQLException {
		return backend.queryUnsafe(queryString);
	}
	public final void command(final String commandString) throws SQLException {
		backend.commandUnsafe(commandString);
	}
	public final int insert(String command) throws SQLException {
		Statement statement = backend.connection.createStatement();
		
		statement.execute(command, Statement.RETURN_GENERATED_KEYS);
		final ResultSet result = statement.getGeneratedKeys();
		
		result.next();
		return result.getInt(1);
	}


	public final PreparedStatement prepare(final String queryString, final Preparer preparer) throws SQLException {
		return backend.prepare(queryString, preparer);
	}
	public final <A> Set<A> query(final PreparedStatement statement, final Loader<A> loader) throws SQLException {
		return backend.query(statement, loader);
	}
	public final <A> List<A> queryOrdered(final PreparedStatement statement, final Loader<A> loader) throws SQLException {
		return backend.queryOrdered(statement, loader);
	}
	public final <A> A queryUnique(final PreparedStatement statement, final Loader<A> loader) throws ResultNotUnique, SQLException {
		return backend.queryUnique(statement, loader);
	}
	public final void command(final PreparedStatement statement) throws SQLException {
		backend.command(statement);
	}
	public final Integer create(final PreparedStatement statement) throws SQLException {
		return backend.create(statement);
	}
	

	

	
	
	
	
	
	
	/*
	 * Website stuff
	 */
	
	public final Set<Province.Id> allProvinces() throws SQLException {
		return backend.getProvinces("WHERE true", Preparers.empty);
	}
	public final Set<Province.Name> allProvinceNames() throws SQLException {
		return Funcs.map(backend.getProvinces("WHERE true", Preparers.empty), new Throws<Province.Id, Province.Name, SQLException>() {
			public Province.Name apply(final Province.Id id) throws SQLException {
				return get(id).name;
			}
		});
	}
	public final Maybe<Province.Id> fromName(final Province.Name name) throws SQLException {
		try {
			final Province.Id province = backend.getProvince(
					"WHERE name = ?", 
					Preparers.wrapper(Preparers.string).apply(name));
			
			return Maybe.just(province);
		} catch (final ResultNotUnique e) {
			return Maybe.nothing();
		}
	}
	
	public final BannerAd.Id getCurrentBannerAd() throws SQLException {
		return backend.get(global).currentBannerAd;
	}
	public final Set<SmallAd.Id> getCurrentSmallAds() throws SQLException {
		return backend.get(global).currentSmallAds;
	}
	
	
	public final Survey.Id currentSurvey() throws SQLException {
		return backend.get(global).currentSurvey;
	}
	public final com.dataAccess.tables.RssFeed.Id getCurrentFeed() throws SQLException {
		return backend.get(global).currentFeed;
	}
	public final Maybe<Book.Id> fromIsbn(final Book.Isbn13 isbn) throws SQLException {
		return bookWhere("isbn_13 = ?", Preparers.safeString(isbn));
	}
	public final Set<Book.Genre> getAllGenres() throws SQLException {
		final PreparedStatement statement = backend.prepare("SELECT DISTINCT genre FROM book", Preparers.empty);
		return backend.query(statement, new Loader<Book.Genre>() {
			public Book.Genre apply(final ResultSet row) throws SQLException {
				final String name = row.getString("genre");
				
				return Book.Genre.parse(name).value();
			} 			
		});
	}
	public final Set<Book.EFormat> getAllEFormats() throws SQLException {
		final PreparedStatement statement = backend.prepare("SELECT DISTINCT eformat FROM ebook", Preparers.empty);
		return backend.query(statement, new Loader<Book.EFormat>() {
			public EFormat apply(final ResultSet row) throws SQLException {
				final String name = row.getString("eformat");
				
				return Book.EFormat.parse(name).value();
			} 
		}); 
	}
	public final List<TextReviewData> getTextReviews(final Book.Id book) throws SQLException {
		final List<Review.Id> textReviews =
			backend.getOrderedReviews(
					"WHERE book_id = ?"
					+ " AND review_text IS NOT NULL AND status = 1"
					+ " ORDER BY created_at DESC", Preparers.key(book)); 
		
		return Funcs.map(textReviews, new Throws<Review.Id, TextReviewData, SQLException>() {
			@Override
			public TextReviewData apply(final Review.Id id) throws SQLException {
				final Review.Data data = get(id);
				final User.Login username = get(data.user);
				return new TextReviewData(username, data);
			} 
		});
	}
	public final RatingStats getRatingStats(final Book.Id book) throws SQLException {
		final String queryString =
			"SELECT ROUND(AVG(rating), 1) AS \"average\", "
			+ "COUNT(*) AS \"count\" FROM review "
			+ "WHERE book_id = ?";
		
		final PreparedStatement statement = backend.prepare(queryString, Preparers.key(book));
		
		final Loader<RatingStats> loader = new Loader<RatingStats>() {
			public RatingStats apply(final ResultSet row) throws SQLException {

				final BigDecimal average = row.getBigDecimal("average");
				final int count = row.getInt("count");
				
				return new RatingStats(average, count);
			} 
		};
		
		try {
			return backend.queryUnique(statement, loader);
		} catch (final ResultNotUnique e) {
			throw new SQLException(e);
		}
	}
	public final List<Book.Id> lastBooks(final int n) throws SQLException {
		return orderedBooksWhere("true ORDER BY date_entered DESC LIMIT ?", Preparers.integer.apply(n));
	}
	public final Set<Book.Id> relatedBooks(final Book.Id book, final int n) throws SQLException { 
		final Book.Data data = get(book);

		final Set<Book.Id> sameAuthor = search(new SearchInput(null, null, data.author.value, null, null));
		final Set<Book.Id> sameGenre = booksInGenre(data.genre);
		
		final Set<Book.Id> related = new HashSet<Book.Id>();
		
		for(final Book.Id id : sameAuthor) {
			if(related.size() >= (n / 2)) break; 
			if(id.equals(book)) continue;
			
			related.add(id);
		}
		
		for(final Book.Id id : sameGenre) {
			if(related.size() >= n) break;
			if(id.equals(book)) continue;
			
			related.add(id);
		}
		
		return related;
	}
	public final Set<Book.Id> booksOnSale() throws SQLException {
		return booksWhere("list_price > sale_price", Preparers.empty);
	}
	public final Set<Book.Id> booksOfInterest(final Book.Genre genre, final int n) throws SQLException {
		return booksWhere("genre = ? LIMIT " + n, Preparers.wrapper(Preparers.string).apply(genre));
	}
	public final List<Book.Id> bestSellers(final Book.Genre genre, final int n) throws SQLException {
		// SELECT id, (SELECT SUM(number_of_copies + electronic)
		//				FROM purchase WHERE book_id = book.id) AS total 
		//	FROM book WHERE genre = 'Fantasy' ORDER BY total DESC LIMIT 5;
		
		
		final Set<Book.Id> books = booksInGenre(genre);
		
		final Map<Book.Id, Set<Purchase.Id>> groups = new HashMap<Book.Id, Set<Purchase.Id>>();
		
		for(final Book.Id id : books) {
			groups.put(id, getBookPurchases(Manager.token, id));
		}
		
		final Map<Book.Id, Integer> sales = new HashMap<Book.Id, Integer>();
		
		for(final Entry<Book.Id, Set<Purchase.Id>> entry : groups.entrySet()) {			
			int total = 0;
			
			for(final Purchase.Id id : entry.getValue()) {
				final Purchase.Data data = get(id);
				
				final int value = data.numberOfCopies.value * (data.electronic ? 1 : 0);
				total += value;
			}
			
			sales.put(entry.getKey(), total);
		}
		
		final List<Book.Id> bestSellers = new ArrayList<Book.Id>(sales.keySet());
		Collections.sort(bestSellers, new Comparator<Book.Id>() {
			@Override
			public int compare(final Book.Id first, final Book.Id second) {
				return sales.get(second).compareTo(sales.get(first));
			} 
		});
		
		final int length = Math.min(n, bestSellers.size());

		return Collections.unmodifiableList(bestSellers.subList(0, length));
	}
	public final Set<Book.Id> booksInGenre(final Book.Genre genre) throws SQLException {
		return booksWhere("genre = ?", Preparers.wrapper(Preparers.string).apply(genre));
	}
	public final Set<Book.Id> search(final SearchInput input) throws SQLException {
		
		final String condition =
			(input.description == null ? "" : "description like ? AND ") +
            (input.title == null ? "" : "title like ? AND ") +
            (input.author == null ? "" : "author like ? AND ") +
            (input.publisher == null ? "" : "publisher like ? AND ") +
            (input.isbn == null ? "" : "isbn_13 like ? AND ") +
            "true"; 
		
		final Preparer preparers = Preparers.sequence(
			(input.description == null ? Preparers.empty : Preparers.string("%" + input.description + "%")),
            (input.title == null ? Preparers.empty : Preparers.string("%" + input.title + "%")),
            (input.author == null ? Preparers.empty : Preparers.string("%" + input.author + "%")),
            (input.publisher == null ? Preparers.empty : Preparers.string("%" + input.publisher + "%")),
            (input.isbn == null ? Preparers.empty : Preparers.string("%" + input.isbn + "%"))
        ); 
		
		return booksWhere(condition, preparers);
	}
	public final boolean vote(final Survey.Id survey, final Survey.Choice choice) throws SQLException {
		if(!get(survey).choices.value.contains(choice)) return false;
		
		final PreparedStatement statement = backend.prepare("UPDATE survey_choice SET votes = votes + 1 WHERE survey_id = ? AND choice = ?;", Preparers.empty);
		statement.setInt(1, survey.value);
		statement.setString(2, choice.value);
		
		backend.command(statement);
		
		return true;
	}
	public final Set<Book.Id> allBooks() throws SQLException {
		return booksWhere("true", Preparers.empty);
	}
	private final Maybe<Book.Id> bookWhere(final String condition, final Preparer preparer) throws SQLException {
		try {
			final Book.Id book = backend.getBook("WHERE being_sold = 1 AND " + condition, preparer);
			
			return Maybe.just(book);
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	private final Set<Book.Id> booksWhere(final String condition, final Preparer preparer) throws SQLException {
		return backend.getBooks("WHERE being_sold = 1 AND " + condition, preparer);
	}
	private final List<Book.Id> orderedBooksWhere(final String condition, final Preparer preparer) throws SQLException {
		return backend.getOrderedBooks("WHERE being_sold = 1 AND " + condition, preparer);
	}

	
	
	
	
	
	
	/*
	 * User section
	 */

	public final Maybe<User.Id> fromUsername(final User.Login username) throws SQLException {
		try {
			final User.Id client = backend.getUser("WHERE login = ?", 
					Preparers.wrapper(Preparers.string).apply(username));
			
			return Maybe.just(client);
		} catch (final ResultNotUnique e) {
			return Maybe.nothing();
		}		
	}
	public final Maybe<User.Authority> login(final User.Id user, final User.Password password) throws SQLException {
		final User.Authority userAuth = peek(Manager.token, user);
		
		if(get(userAuth).password.equals(password)) 
			return Maybe.just(userAuth);
		
		return Maybe.<User.Authority>nothing();
	}
	public final void changePassword(final User.Authority user, final User.Password newPassword) throws SQLException {
		final PreparedStatement statement = backend.prepare("UPDATE user SET password = ? WHERE id = ?", Preparers.empty);
		statement.setString(1, newPassword.value);
		statement.setInt(2, user.reference.value);

		backend.command(statement);
	}
	public final void changeProfile(final User.Authority user, final Client.Id newProfile) throws SQLException {
		final PreparedStatement statement = backend.prepare("UPDATE user SET client_id = ? WHERE id = ?", Preparers.empty);
		statement.setInt(1, newProfile.value);
		statement.setInt(2, user.reference.value);

		backend.command(statement);
	}
	public final Review.Id review(final User.Authority user, final Book.Id book, final Review.Rating rating, final Maybe<Review.Text> text) throws SQLException {
		return backend.put(new Review.Data(
				user.reference,
				book, 
				new Timestamp(new Date().getTime()), 
				rating, 
				text,
				Review.Status.PENDING));
	}
	public final void visit(final User.Authority client, final Book.Id book) throws SQLException {
		final Book.Genre genre = get(book).genre;
		
		final PreparedStatement statement = backend.prepare("UPDATE user SET last_genre = ? WHERE id = ?;", Preparers.empty);
		statement.setString(1, genre.value);
		statement.setInt(2, client.reference.value);

		backend.command(statement);
	}
	public final Maybe<Set<Purchase.Id>> checkout(final User.Authority user, final Cart cart) throws SQLException {
		
		// Validate that there are enough books in stock
		for(final Entry<Book.Id, Item> entry : cart.value.entrySet()) {
			final Book.Data data = get(entry.getKey());
			final Item item = entry.getValue();
			
			final int inStock = data.numberOfBooks.or(Nat.from(0).value()).value;
			final int demand = item.numberOfCopies.value;
			
			if(inStock < demand) return Maybe.nothing();
		}
		
		final Set<Purchase.Id> purchases = new HashSet<Purchase.Id>();
		
		try {
			for(final Entry<Book.Id, Item> entry : cart.value.entrySet()) {
				final Purchase.Id id = checkout(user, entry.getKey(), entry.getValue());
				
				purchases.add(id);
			}
		} catch(final SQLException ex) {
			rollbackCheckout(purchases);
			throw ex;
		}
		
		cart.value.clear();
		
		return Maybe.just(Collections.unmodifiableSet(purchases));
	}
	private final Purchase.Id checkout(final User.Authority user, final Book.Id book, final Item item) throws SQLException {
		final Book.Data data = get(book);

		final int demand = item.numberOfCopies.value;
		final Maybe<Integer> inStock = data.numberOfBooks.isNull() ?
				Maybe.<Integer>nothing() : 
				Maybe.just(data.numberOfBooks.value().value);
		
		final Purchase.Id id = put(Manager.token, new Purchase.Data(
			user.reference,
			book,
			data.salePrice,
			new Timestamp(new Date().getTime()), 
			item.numberOfCopies,
			item.electronic
		));
		
		if(!inStock.isNull() && demand > 0) {
			final PreparedStatement statement = 
				backend.prepare("UPDATE book SET number_of_books = number_of_books - ? WHERE id = ?",
						Preparers.sequence(Preparers.integer(demand), Preparers.key(book)));
		
			backend.command(statement);

			final Nat minimum = getMinimumNumberOfBooks(Manager.token);
			if(inStock.value() - demand < minimum.value) {
				final Maybe<Order.Id> order = getPendingOrder(Manager.token, book);
				if(order.isNull())
					placeOrder(Manager.token, book, minimum);
			}
		}
		
		return id;
	}
	private final void rollbackCheckout(final Set<Purchase.Id> purchases) throws SQLException {
		for(final Purchase.Id purchase : purchases) {
			final PreparedStatement statement = 
				backend.prepare("DELETE FROM book WHERE id = ?", Preparers.key(purchase));

			backend.command(statement);
		}
	}
	public final Set<Review.Id> getUserReviews(final User.Authority user) throws SQLException {
		return backend.getReviews("WHERE user_id = ?", Preparers.key(user.reference));
	}
	public final Set<Purchase.Id> getUserPurchases(final User.Authority user) throws SQLException {
		return backend.getPurchases("WHERE user_id = ?", Preparers.key(user.reference));
	}
	public final Set<Book.Id> getUserEBooks(final User.Authority user) throws SQLException {
		final Set<Book.Id> books = new HashSet<Book.Id>();
		
		for(final Purchase.Id purchase : getUserPurchases(user)) {
			final Purchase.Data data = get(purchase);
			
			if(data.electronic) books.add(data.book);
		}
		
		return Collections.unmodifiableSet(books);
	}
	
	
	
	
	
	
	
	/*
	 * Manager section
	 * 
	 */
	
	public final Maybe<Manager> restricted(final User.Authority user) throws SQLException {
		try {
			backend.getUser("WHERE id = ? AND manager = 1", Preparers.key(user.reference));
		
			return Maybe.just(Manager.token);
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final User.Authority peek(final Manager authority, final User.Id id) {
		return new User.Authority(Authority.token, id);
	}
	public final Set<User.Id> allUsers(final Manager authority) throws SQLException {
		return backend.getUsers("WHERE true", Preparers.empty);
	}
	public final void promote(final Manager authority, final User.Id newManager) throws SQLException {
		final PreparedStatement statement = 
			backend.prepare("UPDATE user SET manager = 1 WHERE id = ?;", Preparers.key(newManager));
		
		backend.command(statement);
	}
	public final void approve(final Manager authority, final Review.Id review) throws SQLException {
		final PreparedStatement statement =
			backend.prepare("UPDATE review SET status = 1 WHERE id = ?;", Preparers.key(review));

		backend.command(statement);
	}
	public final void reject(final Manager authority, final Review.Id review) throws SQLException {
		final PreparedStatement statement =
			backend.prepare("UPDATE review SET status = 2 WHERE id = ?;", Preparers.key(review));

		backend.command(statement);
	}
	public final void setSalePrice(final Manager authority, final Book.Id book, final Money price) throws SQLException {
		final PreparedStatement statement = 
			backend.prepare("UPDATE book SET sale_price = ? WHERE id = ?;", Preparers.empty);
		
		int i = 1;
		statement.setBigDecimal(i++, price.value);
		statement.setInt(i++, book.value);

		backend.command(statement);		
	}
	public final Nat getMinimumNumberOfBooks(final Manager authority) throws SQLException {
		return backend.get(global).minimumBooks;
	}
	public final void setMinimumNumberOfBooks(final Manager authority, final Nat minimum) throws SQLException {
		final Global.Data data = backend.get(global);
		
		backend.update(global, new Global.Data(
			data.currentSurvey, 
			data.currentFeed, 
			minimum,
			data.currentBannerAd, 
			data.currentSmallAds)
		);
	}
	

	public final void setCurrentSurvey(final Manager authority, final Survey.Id survey) throws SQLException {
		final Global.Data data = backend.get(global);
		
		backend.update(global, new Global.Data(
			survey, 
			data.currentFeed, 
			data.minimumBooks,
			data.currentBannerAd, 
			data.currentSmallAds)
		);
	}
	public final Set<Survey.Id> getAllSurveys(final Manager authority) throws SQLException {
		return backend.getSurveys("WHERE true", Preparers.empty);
	}
	public final Set<Survey.Id> getSurveysLike(final Manager authority, final String key) throws SQLException {
		return backend.getSurveys("WHERE question LIKE ?", Preparers.string("%" + key + "%"));
	}
	
	
	public final void setCurrentFeed(final Manager authority, final RssFeed.Id feed) throws SQLException {
		final Global.Data data = backend.get(global);
		
		backend.update(global, new Global.Data(
			data.currentSurvey, 
			feed, 
			data.minimumBooks,
			data.currentBannerAd, 
			data.currentSmallAds)
		);
	}
	public final Set<RssFeed.Id> getAllFeeds(final Manager authority) throws SQLException {
		return backend.getFeeds("WHERE true", Preparers.empty);
	}
	public final Set<RssFeed.Id> getFeedsLike(final Manager authority, final String key) throws SQLException {
		return backend.getFeeds("WHERE url LIKE ?", Preparers.string("%" + key + "%"));
	}
	
	public final void setCurrentBannerAd(final Manager authority, final BannerAd.Id banner) throws SQLException {
		final Global.Data data = backend.get(global);
		
		backend.update(global, new Global.Data(
			data.currentSurvey, 
			data.currentFeed, 
			data.minimumBooks,
			banner, 
			data.currentSmallAds)
		);
	}
	public final void setCurrentSmallAds(final Manager authority, final Set<SmallAd.Id> ads) throws SQLException {
		final Global.Data data = backend.get(global);

		backend.update(global, new Global.Data(
			data.currentSurvey, 
			data.currentFeed, 
			data.minimumBooks,
			data.currentBannerAd, 
			ads)
		);
	}
	
	public final Set<Book.Id> lowInventory(final Manager authority) throws SQLException {
		final Nat minimum = this.getMinimumNumberOfBooks(authority);
		
		return booksWhere("number_of_books < ?", Preparers.wrapper(Preparers.integer).apply(minimum));
	}
	public final Set<Order.Id> getPendingOrders(final Manager authority) throws SQLException {
		return backend.getOrders("WHERE received_on IS NULL", Preparers.empty);
	}
	public final Maybe<Order.Id> getPendingOrder(final Manager authority, final Book.Id book) throws SQLException {
		try {
			final Order.Id order = backend.getOrder("WHERE book_id = ? AND received_on IS NULL", 
					Preparers.key(book));
		
			return Maybe.just(order);
		} catch(final ResultNotUnique ex) {
			return Maybe.nothing();
		}
	}
	public final List<Order.Id> getReceivedOrders(final Manager authority, final Book.Id book) throws SQLException {
		return backend.getOrderedOrders("WHERE book_id = ? AND received_on IS NOT NULL ORDER BY received_on DESC",
				Preparers.key(book));
	}
	public final List<Order.Id> getReceivedOrders(final Manager authority, int n) throws SQLException {
		return backend.getOrderedOrders("WHERE received_on IS NOT NULL ORDER BY received_on DESC LIMIT ?", Preparers.integer.apply(n));
	}
	public final void receive(final Manager authority, final Order.Id order) throws SQLException {
		final Order.Data data = get(order);
		
		final PreparedStatement receiveOrder = backend.prepare("UPDATE book_order SET received_on = current_timestamp WHERE id = ?", Preparers.key(order));
		
		final PreparedStatement increaseStock = backend.prepare("UPDATE book SET number_of_books = number_of_books + ? WHERE id = ?", Preparers.empty);
		int i = 1;
		increaseStock.setInt(i++, data.numberOfCopies.value);
		increaseStock.setInt(i++, data.book.value);
		
		backend.command(receiveOrder);
		backend.command(increaseStock);
	}
	public final void placeOrder(final Manager authority, final Book.Id book, final Nat quantity) throws SQLException {
		put(authority, new Order.Data(
			book,
			new Timestamp(new Date().getTime()), 
			Maybe.<Timestamp>nothing(),
			quantity
		));
	}
	

	public final Maybe<Book.Id> fromIsbn(final Manager token, final Book.Isbn13 isbn) throws SQLException {
		try {
			final Book.Id id = backend.getBook("WHERE isbn_13 = ?", Preparers.safeString(isbn));
			
			return Maybe.just(id);
		} catch (ResultNotUnique e) {
			return Maybe.nothing();
		}
	}
	public final boolean isDiscontinued(final Manager authority, final Book.Id book) throws SQLException {
		final PreparedStatement statement = backend.prepare("SELECT being_sold FROM book WHERE id = ?", Preparers.key(book));
		try {
			return backend.queryUnique(statement, new Loader<Boolean>() {
				public Boolean apply(final ResultSet row) throws SQLException {
					return !row.getBoolean("being_sold");
				} 			
			});
		} catch (final ResultNotUnique e) {
			throw new SQLException(e);
		}
	}
	public final void discontinueBook(final Manager authority, final Book.Id book) throws SQLException {
		backend.command(backend.prepare(
				"UPDATE book SET being_sold = 0 WHERE id = ?", 
				Preparers.key(book)));
	}
	public final void publicizeBook(final Manager authority, final Book.Id book) throws SQLException {
		backend.command(backend.prepare(
				"UPDATE book SET being_sold = 1 WHERE id = ?", 
				Preparers.key(book)));
	}
	public final Set<Book.Id> getDiscontinuedBooks(final Manager authority) throws SQLException {
		return backend.getBooks("WHERE being_sold = 0", Preparers.empty);
	}
	public final Set<Review.Id> getPendingReviews(final Manager authority) throws SQLException {
		return backend.getReviews("WHERE status = 0", Preparers.empty);
	}
	public final Set<Purchase.Id> getBookPurchases(final Manager authority, final Book.Id book) throws SQLException {
		return backend.getPurchases("WHERE book_id = ?", Preparers.key(book));
	}

	
	

	
	
	
	
	
	
	
	/** Duplicates from backend */
	
	public final Address.Data get(final Address.Id id) throws SQLException { 
		return backend.get(id);
	}	
	public final Book.Data get(final Book.Id id) throws SQLException { 
		return backend.get(id);
	}	
	public final Client.Data get(final Client.Id id) throws SQLException { 
		return backend.get(id);
	}
	public final User.Login get(final User.Id id) throws SQLException { 
		return backend.get(id).login;
	}	
	public final User.Data get(final User.Authority id) throws SQLException { 
		return backend.get(id.reference);
	}	
	public final Purchase.Data get(final Purchase.Id id) throws SQLException { 
		return backend.get(id);
	}	
	public final Review.Data get(final Review.Id id) throws SQLException { 
		return backend.get(id);
	}	
	public final Survey.Data get(final Survey.Id id) throws SQLException { 
		return backend.get(id);
	}	
	public final RssFeed.Data get(final RssFeed.Id id) throws SQLException { 
		return backend.get(id);
	}	
	public final Order.Data get(final Order.Id id) throws SQLException { 
		return backend.get(id);
	}	
	public final Province.Data get(final Province.Id id) throws SQLException {
		return backend.get(id);
	}
	public final BannerAd.Data get(final BannerAd.Id id) throws SQLException {
		return backend.get(id);
	}
	public final SmallAd.Data get(final SmallAd.Id id) throws SQLException {
		return backend.get(id);
	}

	public final Throws<Address.Id, Address.Data, SQLException> getAddress;
	public final Throws<Client.Id, Client.Data, SQLException> getClient;
	public final Throws<Book.Id, Book.Data, SQLException> getBook;
	public final Throws<Survey.Id, Survey.Data, SQLException> getSurvey;
	public final Throws<Review.Id, Review.Data, SQLException> getReview;
	public final Throws<Order.Id, Order.Data, SQLException> getOrder;
	public final Throws<Province.Id, Province.Data, SQLException> getProvince;
	public final Throws<Purchase.Id, Purchase.Data, SQLException> getPurchase;
	public final Throws<RssFeed.Id, RssFeed.Data, SQLException> getRssFeed;
	public final Throws<BannerAd.Id, BannerAd.Data, SQLException> getBannerAd;
	public final Throws<SmallAd.Id, SmallAd.Data, SQLException> getSmallAd;
	
	public final Set<Address.Id> getAddresses(final String query, final Preparer preparer) throws SQLException {
		return backend.getAddresses(query, preparer);
	}
	public final Set<Client.Id> getClients(final String query, final Preparer preparer) throws SQLException {
		return backend.getClients(query, preparer);
	}
	public final Set<User.Id> getUsers(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getUsers(query, preparer);
	}
	public final Set<Book.Id> getBooks(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getBooks(query, preparer);
	}
	public final Set<Review.Id> getReviews(final String query, final Preparer preparer) throws SQLException {
		return backend.getReviews(query, preparer);
	}
	public final Set<Survey.Id> getSurveys(final String query, final Preparer preparer) throws SQLException {
		return backend.getSurveys(query, preparer);
	}
	public final Set<Purchase.Id> getPurchases(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getPurchases(query, preparer);
	}
	public final Set<RssFeed.Id> getFeeds(final String query, final Preparer preparer) throws SQLException {
		return backend.getFeeds(query, preparer);
	}
	public final Set<Order.Id> getOrders(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getOrders(query, preparer);
	}
	public final Set<BannerAd.Id> getBannerAds(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getBannerAds(query, preparer);
	}
	public final Set<SmallAd.Id> getSmallAds(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getSmallAds(query, preparer);
	}
	

	public final List<Address.Id> getOrderedAddresses(final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedAddresses(query, preparer);
	}
	public final List<Client.Id> getOrderedClients(final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedClients(query, preparer);
	}
	public final List<User.Id> getOrderedUsers(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedUsers(query, preparer);
	}
	public final List<Book.Id> getOrderedBooks(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedBooks(query, preparer);
	}
	public final List<Review.Id> getOrderedReviews(final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedReviews(query, preparer);
	}
	public final List<Survey.Id> getOrderedSurveys(final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedSurveys(query, preparer);
	}
	public final List<Purchase.Id> getOrderedPurchases(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedPurchases(query, preparer);
	}
	public final List<RssFeed.Id> getOrderedFeeds(final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedFeeds(query, preparer);
	}
	public final List<Order.Id> getOrderedOrders(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedOrders(query, preparer);
	}
	public final List<BannerAd.Id> getOrderedBannerAds(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedBannerAds(query, preparer);
	}
	public final List<SmallAd.Id> getOrderedSmallAds(final Manager authority, final String query, final Preparer preparer) throws SQLException {
		return backend.getOrderedSmallAds(query, preparer);
	}
	
	
	public User.Id put(final Manager authority, final User.Data data) throws SQLException {
		return backend.put(data);
	}
	public Book.Id put(final Manager authority, final Book.Data data) throws SQLException {
		return backend.put(data);
	}
	public Purchase.Id put(final Manager authority, final Purchase.Data data) throws SQLException {
		return backend.put(data);
	}
	public Review.Id put(final Manager authority, final Review.Data data) throws SQLException {
		return backend.put(data);
	}
	public Survey.Id put(final Manager authority, final Survey.Data data) throws SQLException {
		return backend.put(data);
	}
	public RssFeed.Id put(final Manager authority, final RssFeed.Data data) throws SQLException {
		return backend.put(data);
	}
	public Order.Id put(final Manager authority, final Order.Data data) throws SQLException {
		return backend.put(data);
	}
	public BannerAd.Id put(final Manager authority, final BannerAd.Data data) throws SQLException {
		return backend.put(data);
	}
	public SmallAd.Id put(final Manager authority, final SmallAd.Data data) throws SQLException {
		return backend.put(data);
	}
		
	
	public final Maybe<Address.Id> referToAddress(final Manager token, final int id) throws SQLException {
		return backend.referToAddress(id);
	}
	public final Maybe<Client.Id> referToClient(final Manager token, final int id) throws SQLException {
		return backend.referToClient(id);
	}
	public final Maybe<User.Id> referToUser(final Manager token, final int id) throws SQLException {
		return backend.referToUser(id);
	}
	public final Maybe<Book.Id> referToBook(final Manager token, final int id) throws SQLException {
		return backend.referToBook(id);
	}
	public final Maybe<Purchase.Id> referToPurchase(final Manager token, final int id) throws SQLException {
		return backend.referToPurchase(id);
	}
	public final Maybe<Survey.Id> referToSurvey(final Manager token, final int id) throws SQLException {
		return backend.referToSurvey(id);
	}
	public final Maybe<RssFeed.Id> referToFeed(final Manager token, final int id) throws SQLException {
		return backend.referToFeed(id);
	}
	public final Maybe<Order.Id> referToOrder(final Manager token, final int id) throws SQLException {
		return backend.referToOrder(id);
	}
	public final Maybe<BannerAd.Id> referToBannerAd(final Manager token, final int id) throws SQLException {
		return backend.referToBannerAd(id);
	}
	public final Maybe<SmallAd.Id> referToSmallAd(final Manager token, final int id) throws SQLException {
		return backend.referToSmallAd(id);
	}
	public final Maybe<Province.Id> referToProvince(final Manager token, final int id) throws SQLException {
		return backend.referToProvince(id);
	}
	

	public final void update(final Manager authority, final User.Id id, User.Data data) throws SQLException {
		backend.update(id, data);
	}
	public final void update(final Manager authority, final Book.Id id, Book.Data data) throws SQLException {
		backend.update(id, data);
	}
	public final void update(final Manager authority, final Review.Id id, Review.Data data) throws SQLException {
		backend.update(id, data);
	}
	public final void update(final Manager authority, final RssFeed.Id id, RssFeed.Data data) throws SQLException {
		backend.update(id, data);
	}
}

