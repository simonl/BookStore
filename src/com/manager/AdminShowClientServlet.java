package com.manager;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletException;

import com.cart.CheckoutCartServlet;
import com.cart.ConfirmCheckoutServlet;
import com.dataAccess.tables.Book;
import com.dataAccess.tables.Client;
import com.dataAccess.tables.Client.Data;
import com.dataAccess.tables.Client.Id;
import com.dataAccess.tables.Address;
import com.dataAccess.tables.Province;
import com.dataAccess.tables.Purchase;
import com.dataAccess.tables.User;
import com.dataAccess.tables.UserBean;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.dataClasses.Money;
import com.dataClasses.Nat;
import com.dataClasses.ResultNotUnique;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class AdminShowClientServlet
 */
public class AdminShowClientServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;

	public AdminShowClientServlet() { super(); }


	public final Cont body2(
			final Manager token,
			final Database db,
			final Session session,
			final Parameters parameters) 
			throws SQLException {

		for(final String inputId : parameters.get("userId"))
		for(final Nat numId : Nat.parse(inputId))
		for(final User.Id userId : db.referToUser(token, numId.value))
		{
			final User.Authority user = db.peek(token, userId);
			final User.Data userData = db.get(user);

			for(final Client.Id client : userData.clientID)
			{
				final Client.Data clientData = db.get(client);
				final Address.Data shippingData = db.get(clientData.shippingAddressID);
				final Address.Data billingData = db.get(clientData.billingAddressID);
				final Province.Data provinceData = db.get(billingData.province);
				
				final Set<Purchase.Id> purchases = db.getUserPurchases(user);
				Money total = ConfirmCheckoutServlet.total(db.getPurchases(purchases));
				total = ConfirmCheckoutServlet.withTax(total, provinceData.taxRate);
				if(!provinceData.secondTaxRate.isNull())
					total = ConfirmCheckoutServlet.withTax(total, provinceData.secondTaxRate.value());
				
				final Attributes attributes = new Attributes();
				attributes.set("userData", userData);
				attributes.set("clientData", clientData);
				attributes.set("shippingData", addressInput(db, shippingData));
				attributes.set("billingData", addressInput(db, billingData));
				attributes.set("Total_Purchase", total);
				attributes.set("userId", user.reference);
				
				attributes.set("displayString", "Edit Client");
				attributes.set("provinces", db.allProvinceNames());
				
				return Conts.display("/admin/adminShowClient.jsp", attributes);
			}
		}
	
		return Conts.error("Didn't return normally", "Didn't return normally");
	}

	public static final Address.Input addressInput(final Database db, final Address.Data data) throws SQLException {
		//System.out.println(Maybe.just(db.get(data.province).name.value));
		return new Address.Input(
			Maybe.just(data.city.value),
			Maybe.just(db.get(data.province).name.value),
			Maybe.just(data.postalCode.value),
			Maybe.just(data.address.value)
		);
	}
	
	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {

		Maybe<String> userIdMaybe = parameters.get("userId");
		String userId = userIdMaybe.isNull() ? userIdMaybe.or("") : userIdMaybe.getValue();
		//Check id's
		int clientID = 0;
		int userID = 0;
		int billingID = 0;
		int shippingID = 0;
		try {
			System.out.println("UserId = " + userId);
			userID = Integer.parseInt(userId);
			
			//Get the other id's
			ResultSet results = db.queryUnique("select COALESCE(sum(p.price * p.number_of_copies), 0) as 'Total_Purchase', c.id, u.login, u.password, u.id as 'userId', a1.id as 'billingId', a2.id as 'shippingId' FROM purchase p RIGHT OUTER JOIN user u ON (p.user_id = u.id) JOIN client c ON (u.client_id = c.id) JOIN address a1 ON (c.billing_address_id = a1.id) JOIN address a2 ON (c.shipping_address_id = a2.id) WHERE u.id = " + userId + " GROUP BY c.id, u.login, u.password, userId, billingId, shippingId;");

			
			clientID = results.getInt("id");
			billingID = results.getInt("billingId");
			shippingID = results.getInt("shippingId");
			
			System.out.println(clientID);
			System.out.println(billingID);
			System.out.println(shippingID);
			
			Maybe<Id> databaseClientId = db.referToClient(token, clientID);
			Maybe<com.dataAccess.tables.User.Id> databaseUserId = db.referToUser(token, userID);
			Maybe<com.dataAccess.tables.Address.Id> databaseBillingID = db.referToAddress(token, billingID);
			Maybe<com.dataAccess.tables.Address.Id> databaseShippingID = db.referToAddress(token, shippingID);
			
			Data clientData = null;
			if(!databaseClientId.isNull()){
				clientData = db.get(databaseClientId.getValue());
			}
			
			UserBean userData = new UserBean( results.getString("login"), results.getString("password"));
			
			com.dataAccess.tables.Address.Data billingData = null;
			if(!databaseBillingID.isNull()){
				billingData = db.get(databaseBillingID.getValue());
			}
			com.dataAccess.tables.Address.Data shippingData = null;
			if(!databaseShippingID.isNull()){
				shippingData = db.get(databaseShippingID.getValue());
			}
			
			System.out.println("Passed getting the data");
			
			final Attributes attributes = new Attributes();
			attributes.set("userData", userData);
			attributes.set("clientData", clientData);
			attributes.set("shippingData", addressInput(db, shippingData));
			attributes.set("billingData", addressInput(db, billingData));
			attributes.set("Total_Purchase", results.getDouble("Total_Purchase"));
			attributes.set("userId", userID);
			attributes.set("displayString", "Edit Client");
			attributes.set("provinces", db.allProvinceNames());
			
			return Conts.display("/admin/adminShowClient.jsp", attributes);
			
		} catch (NumberFormatException e) {
			System.out.println("Number format exception");
		} catch (ResultNotUnique e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		//We don't care what the tax rate is when we display the total purchases of a client.
//		Money total = Money.from(results.getBigDecimal("Total_Purchase")).value();
//		total = CheckoutCartServlet.withTax(total, provinceData.taxRate);
//		if(!provinceData.secondTaxRate.isNull())
//			total = CheckoutCartServlet.withTax(total, provinceData.secondTaxRate.value());
		
	
		return Conts.error("Didn't return normally", "Didn't return normally");
	}
}