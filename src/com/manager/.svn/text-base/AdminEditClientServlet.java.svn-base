package com.manager;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.jsp.jstl.sql.ResultSupport;

import com.dataAccess.tables.Client;
import com.dataAccess.tables.Client.Data;
import com.dataAccess.tables.Client.Id;
import com.dataAccess.tables.Province;
import com.dataAccess.tables.Province.Name;
import com.dataAccess.tables.User;
import com.dataAccess.tables.UserBean;
import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.dataClasses.Nat;
import com.dataClasses.ResultNotUnique;
import com.login.NewUserInputs;
import com.login.RegistrationServlet;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class AdminEditClientServlet
 */
public class AdminEditClientServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditClientServlet() {
        super();
    }

    public static final Cont smaller(
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
    		
    		final NewUserInputs input = RegistrationServlet.loadInputs(parameters);
    		final Maybe<Client.Id> mClient = RegistrationServlet.createClient(db, input.client, input.billing, input.shipping); 

    		for(final Client.Id client : mClient) 
    		{
    			db.changeProfile(user, client);
    			
    			return Conts.redirect(session.lastPage);
    		}
    		
			return Conts.error("clientEditError", "Invalid profile information");
    	}
    	
		return Conts.error("clientEditError", "Invalid user ID");
    }

	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {


		Maybe<String> userIdMaybe = parameters.get("userId");

		Maybe<String> firstNameMaybe = parameters.get("firstName");
		Maybe<String> lastNameMaybe = parameters.get("lastName");
		Maybe<String> homePhoneNumberMaybe = parameters.get("homePhoneNumber");
		Maybe<String> cellPhoneNumberMaybe = parameters.get("cellPhoneNumber");
		Maybe<String> emailMaybe = parameters.get("email");
		Maybe<String> billingCityMaybe = parameters.get("billingCity");
		Maybe<String> billingProvinceMaybe = parameters.get("billingProvince");
		Maybe<String> billingPostalCodeMaybe = parameters.get("billingPostalCode");
		Maybe<String> billingAddressMaybe = parameters.get("billingAddress");
		Maybe<String> shippingCityMaybe = parameters.get("shippingCity");
		Maybe<String> shippingProvinceMaybe = parameters.get("shippingProvince");
		Maybe<String> shippingPostalCodeMaybe = parameters.get("shippingPostalCode");
		Maybe<String> shippingAddressMaybe = parameters.get("shippingAddress");
		
		String userId = userIdMaybe.isNull() ? userIdMaybe.or("") : userIdMaybe.getValue();
		String firstName = firstNameMaybe.isNull() ? firstNameMaybe.or("") : firstNameMaybe.getValue();
		String lastName = lastNameMaybe.isNull() ? lastNameMaybe.or("") : lastNameMaybe.getValue();
		String homePhoneNumber = homePhoneNumberMaybe.isNull() ? homePhoneNumberMaybe.or("") : homePhoneNumberMaybe.getValue();
		String cellPhoneNumber = cellPhoneNumberMaybe.isNull() ? cellPhoneNumberMaybe.or("") : cellPhoneNumberMaybe.getValue();
		String email = emailMaybe.isNull() ? emailMaybe.or("") : emailMaybe.getValue();
		String billingCity = billingCityMaybe.isNull() ? billingCityMaybe.or("") : billingCityMaybe.getValue();
		String billingProvince = billingProvinceMaybe.isNull() ? billingProvinceMaybe.or("") : billingProvinceMaybe.getValue();
		String billingPostalCode = billingPostalCodeMaybe.isNull() ? billingPostalCodeMaybe.or("") : billingPostalCodeMaybe.getValue();
		String billingAddress = billingAddressMaybe.isNull() ? billingAddressMaybe.or("") : billingAddressMaybe.getValue();
		String shippingCity = shippingCityMaybe.isNull() ? shippingCityMaybe.or("") : shippingCityMaybe.getValue();
		String shippingProvince = shippingProvinceMaybe.isNull() ? shippingProvinceMaybe.or("") : shippingProvinceMaybe.getValue();
		String shippingPostalCode = shippingPostalCodeMaybe.isNull() ? shippingPostalCodeMaybe.or("") : shippingPostalCodeMaybe.getValue();
		String shippingAddress = shippingAddressMaybe.isNull() ? shippingAddressMaybe.or("") : shippingAddressMaybe.getValue();
		
		

		
		
		//Check id's
		int oldClientID = 0;
		int userID = 0;
		int oldBillingID = 0;
		int oldShippingID = 0;
		try {
			System.out.println("UserId = " + userId);
			userID = Integer.parseInt(userId);
			
			//Get the other id's
			ResultSet results = db.queryUnique("select c.id, c.first_name, c.last_name, c.home_phone, c.cell_phone, c.email, a1.city as 'billing_city', a1.province as 'billing_province', a1.postal_code as 'billing_postal_code', a1.address as 'billing_address', a2.city as 'shipping_city', a2.province as 'shipping_province', a2.postal_code as 'shipping_postal_code', a2.address as 'shipping_address', u.login, u.password, u.id as 'userId', a1.id as 'billingId', a2.id as 'shippingId' from user u JOIN client c ON (u.client_id = c.id) JOIN address a1 ON (c.shipping_address_id = a1.id) JOIN address a2 ON (c.billing_address_id = a2.id) WHERE u.id = " + userId + ";");
			ResultSet shippingProvinceResult = db.queryUnique("Select province.id from province where province.name = '" + shippingProvince + "';");
			ResultSet billingProvinceResult = db.queryUnique("Select province.id from province where province.name = '" + billingProvince + "';");
			int shippingId = shippingProvinceResult.getInt("id");
			int billingId = billingProvinceResult.getInt("id");
			
			
			oldClientID = results.getInt("id");
			oldBillingID = results.getInt("billingId");
			oldShippingID = results.getInt("shippingId");
			int oldBillingProvinceId = results.getInt("billing_province");
			int oldShippingProvinceId = results.getInt("shipping_province");
			
			Maybe<Id> databaseClientId = db.referToClient(token, oldClientID);
			Maybe<com.dataAccess.tables.User.Id> databaseUserId = db.referToUser(token, userID);
			Maybe<com.dataAccess.tables.Address.Id> databaseBillingID = db.referToAddress(token, oldBillingID);
			Maybe<com.dataAccess.tables.Address.Id> databaseShippingID = db.referToAddress(token, oldShippingID);
			
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
			
			//Check the client data to see if something has changed
			boolean clientInfoIsDifferent = false;
			if(!clientData.firstName.value.equals(firstName)) clientInfoIsDifferent = true;
			if(!clientData.lastName.value.equals(lastName)) clientInfoIsDifferent = true;
			if(!clientData.homePhoneNumber.value.equals(homePhoneNumber)) clientInfoIsDifferent = true;
			if(!clientData.cellPhoneNumber.value.equals(cellPhoneNumber)) clientInfoIsDifferent = true;
			if(!clientData.email.value.equals(email)) clientInfoIsDifferent = true;
			
			boolean billingAddressInfoIsDifferent = false;
			if(!billingData.address.value.equals(billingAddress))billingAddressInfoIsDifferent = true;
			if(!billingData.city.value.equals(billingCity))billingAddressInfoIsDifferent = true;
			if(!billingData.postalCode.value.equals(billingPostalCode))billingAddressInfoIsDifferent = true;
			if(oldBillingProvinceId != billingId)billingAddressInfoIsDifferent = true;
			
			boolean shippingAddressInfoIsDifferent = false;
			if(!shippingData.address.value.equals(shippingAddress))shippingAddressInfoIsDifferent = true;
			if(!shippingData.city.value.equals(shippingCity))shippingAddressInfoIsDifferent = true;
			if(!shippingData.postalCode.value.equals(shippingPostalCode))shippingAddressInfoIsDifferent = true;
			if(oldShippingProvinceId != shippingId)shippingAddressInfoIsDifferent = true;
			
			System.out.println("Old shipping id = " + oldShippingProvinceId);
			System.out.println("Shipping id = " + shippingId);
			System.out.println("Old billing id = " + oldBillingProvinceId);
			System.out.println("Billing id = " + billingId);
			

			if(shippingAddressInfoIsDifferent){
				System.out.println("Shipping is different");
				oldShippingID = db.insert("Insert into address (city, province, address, postal_code) values ('" + shippingCity + 
						"', '" + shippingId + 
						"', '" + shippingAddress +
						"', '" + shippingPostalCode + 
						"');");
				System.out.println("Shipping has changed");
			}
			
			
			if(billingAddressInfoIsDifferent){
				System.out.println("Billing is different");
				oldBillingID = db.insert("Insert into address (city, province, address, postal_code) values ('" + billingCity + 
						"', '" + billingId + 
						"', '" + billingAddress +
						"', '" + billingPostalCode + 
						"');");
				System.out.println("Billing has changed");
			}
			
			if(clientInfoIsDifferent || billingAddressInfoIsDifferent || shippingAddressInfoIsDifferent){
				System.out.println("Client is different");
				db.command("UPdate client set first_name = '" + firstName + 
						"', last_name = '" + lastName +
						"', cell_phone = '" + cellPhoneNumber + 
						"', home_phone = '" + homePhoneNumber + 
						"', email = '" + email + 
						"', shipping_address_id = " + oldShippingID + 
						", billing_address_id = " + oldBillingID + 
						" where id = " + oldClientID +
						";");
				System.out.println("Client has changed");
			}
			
			final Attributes attributes = new Attributes();
            ResultSet clientsResults = db.query("select  * from user where client_id is not null;");
          
            attributes.set("users", ResultSupport.toResult(clientsResults));
			return Conts.display("/admin/adminShowClients.jsp", attributes);
			
			
		} catch (NumberFormatException e) {
			System.out.println("Number format exception");
		} catch (ResultNotUnique e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}



}
