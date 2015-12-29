package com.prezzo.testing;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class TESTClientDataDBAccess {
	private static final String IP = "waldo.dawsoncollege.qc.ca";
	private static final String TableName = "g2w12";
	private Connection connect;
	private Statement statement;
	private ResultSet resultSet;
	private Connection connection;
	private static final String user = "g2w12";
	private static final String password = "bird3table";

	public TESTClientDataDBAccess() {
		super();
	}

	/**
	 * Given a url such as:
	 * <p>
	 * "jdbc:mysql://localhost:3306/g2w12?user=g2w12&password=bird3table"; open
	 * the data base
	 * 
	 * @param url
	 *            The database address, user id, and password
	 * @return True if the database opens otherwise false
	 */
	public boolean openDB() {
		boolean success = true;
		// Load the driver to allow connection to the database

		success = createConnection();
		return success;
	}

	public boolean createConnection() {
		boolean success = true;
		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://" + IP + ":3306/" + TableName;
			connect = DriverManager.getConnection(url, user, password);
			statement = connect.createStatement();
			statement.execute("USE " + TableName + ";");
		} catch (Exception sqlex) {
			sqlex.printStackTrace();
			success = false;
		}
		return success;
	}

	public TESTClientBean getClientBean(String username) {
		TESTClientBean clientBean = new TESTClientBean();

		try {
			PreparedStatement statement = connect
					.prepareStatement("SELECT * FROM client WHERE login = ?;");
			statement.setString(1, username);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				// id is column index 1
				// clientBean.setBillingAddressID(new
				// Address(result.getInt(2)));
				// clientBean.setShippingAddressID(new
				// Address(result.getInt(3)));
				clientBean.setTitle(result.getString(4));
				clientBean.setFirstName(result.getString(5));
				clientBean.setLastName(result.getString(6));
				clientBean.setHomePhoneNumber(result.getString(7));
				clientBean.setCellPhoneNumber(result.getString(8));
				clientBean.setEmail(result.getString(9));
				clientBean.setUsername(result.getString(10));
				clientBean.setPassword(result.getString(11));
				clientBean.setManager(result.getBoolean(12));
				// 13 will be lastGenre?
			}
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		}
		return clientBean;
	}

	public TESTBookBean getBookBean(int bookId) {
		TESTBookBean bookBean = new TESTBookBean();

		try {
			PreparedStatement statement = connect
					.prepareStatement("SELECT * FROM book WHERE id = ?;");
			statement.setInt(1, bookId);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				// id is column index 1
				bookBean.setDateEntered(result.getDate(2));
				bookBean.setTitle(result.getString(3));
				bookBean.setAuthor(result.getString(4));
				bookBean.setPublisher(result.getString(5));
				bookBean.setIsbn_10(result.getString(6));
				bookBean.setIsbn_13(result.getString(7));
				bookBean.setGenre(result.getString(8));
				bookBean.setDescription(result.getString(9));
				bookBean.setNumber_of_pages(result.getInt(10));
				bookBean.setWeight(result.getInt(11));
				bookBean.setDimensions(result.getString(12));

				bookBean.setThumbnail(result.getString(13));
				bookBean.setCover(result.getString(14));
				bookBean.setList_price(new BigDecimal(result.getDouble(15)));
				bookBean.setSale_price(new BigDecimal(result.getDouble(16)));
				bookBean.setWholesale_price(new BigDecimal(result.getDouble(17)));
				// Wondering if number of books should go here or have a
				// Inventory Table with bookid and quantity

			}
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		}
		return bookBean;
	}

	/**Gets the books on sale. 
	 * @return
	 * 		An array list of all the books whose sale prices are lower than the list price. The array list will never be null.
	 */
	public ArrayList<TESTBookBean> getSalesBooksBean() {
		TESTBookBean bookBean = new TESTBookBean();
		ResultSet result;
		ArrayList<TESTBookBean> books = new ArrayList<TESTBookBean>();

		try {
			//Prepare the statement
			PreparedStatement statement = connect
					.prepareStatement("SELECT * FROM book WHERE list_price > sale_price;");
			//Execute the query;
			result = statement.executeQuery();
			while (result.next()) {
				//Create a new reference pointer to not interfere with the previous pointer.
				bookBean = new TESTBookBean();
				// id is column index 1
				bookBean.setDateEntered(result.getDate(2));
				bookBean.setTitle(result.getString(3));
				bookBean.setAuthor(result.getString(4));
				bookBean.setPublisher(result.getString(5));
				bookBean.setIsbn_10(result.getString(6));
				bookBean.setIsbn_13(result.getString(7));
				bookBean.setGenre(result.getString(8));
				bookBean.setDescription(result.getString(9));
				bookBean.setNumber_of_pages(result.getInt(10));
				bookBean.setWeight(result.getInt(11));
				bookBean.setDimensions(result.getString(12));

				bookBean.setThumbnail(result.getString(13));
				bookBean.setCover(result.getString(14));
				bookBean.setList_price(new BigDecimal(result.getDouble(15)));
				bookBean.setSale_price(new BigDecimal(result.getDouble(16)));
				bookBean.setWholesale_price(new BigDecimal(result.getDouble(17)));
				//Add the bookBean to the list
				books.add(bookBean);

			}
		} catch (SQLException sqlex) {
			System.out.println("There was a problem while connecting to the server.");
			sqlex.printStackTrace();
		}
		return books;
	}

	public static final class BadUsername extends Exception {
	}

	public static final class BadPassword extends Exception {
	}

	public boolean login(String username, String password) throws BadUsername,
			BadPassword {
		boolean success = false;
		System.out.println("login=" + username + " and pass=" + password);
		try {
			PreparedStatement statement = connect
					.prepareStatement("SELECT password FROM client WHERE login = ?;");
			statement.setString(1, username);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				if (result.getString("password").equals(password))
					success = true;
				else
					throw new BadPassword();
			} else
				throw new BadUsername();

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return success;
	}

	public void closeDB() {
		try {
			if (connect != null) {
				connect.close();
			}
		} catch (SQLException sqlex) {
		}
	}
}
