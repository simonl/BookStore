package com.login;

import java.sql.SQLException;

import com.dataAccess.tables.Address;
import com.dataAccess.tables.Client;
import com.dataAccess.tables.Province;
import com.dataAccess.tables.User;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.servlets.Attributes;
import com.servlets.Closures;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * Servlet implementation class RegistrationServlet
 * @author Edward Gagnon, Simon Langlois
 */
public class RegistrationServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

	public static final Maybe<User.Authority> createUser(
			final Database db,
			final NewUserInputs input)
			throws SQLException {
		
		final Maybe<Client.Id> client = createClient(db, input.client, input.billing, input.shipping);

		final User.Builder userParsed = input.user.parseFields();
		
		if(!client.isNull())
			userParsed.clientID = Maybe.just(client);
				
		final Maybe<User.NewData> data = userParsed.build();

		if(data.isNull()) return Maybe.nothing();
		
		final Maybe<User.Authority> user = perform(insert(data.value()));
		
		return user;
	}
	
	public static final Maybe<Client.Id> createClient(
			final Database db,
			final Client.Input clientInput,
			final Address.Input billingInput,
			final Address.Input shippingInput) 
    		throws SQLException {

		final Client.Builder clientParsed = clientInput.parseFields();
		
		clientParsed.billingAddressID = createAddress(db, billingInput);
		clientParsed.shippingAddressID = createAddress(db, shippingInput);
		
		final Maybe<Client.Data> clientData = clientParsed.build();
		
		if(clientData.isNull()) return Maybe.nothing();
		
		final Maybe<Client.Id> client = perform(insert(clientData.value()));

		return client;
	}
	
	public static final Maybe<Address.Id> createAddress(
			final Database db, 
			final Address.Input input) {
		
		final Address.Builder parsed = input.parseFields();
		
		if(!input.province.isNull()) {
			final Maybe<Province.Name> name = Province.Name.parse(input.province.value());
			
			if(name.isNull()) return Maybe.nothing();
			
			try {
				parsed.province = db.fromName(name.value());
			} catch (final SQLException e) {
				return Maybe.nothing();
			} 
		}
		
		final Maybe<Address.Data> data = parsed.build();
		
		if(data.isNull()) return Maybe.nothing();
		
		final Maybe<Address.Id> address = perform(insert(data.value()));
		
		return address;
	}

	public static final NewUserInputs loadInputs(final Parameters parameters) {

		final User.Input userInput =
			new User.Input(
				parameters.get("loginName"),
				parameters.get("password")
			);

		final Client.Input clientInput =
			new Client.Input(
				parameters.get("firstName"),
				parameters.get("lastName"),
				parameters.get("homePhoneNumber"),
				parameters.get("cellPhoneNumber"),
				parameters.get("email")
			);		
		
		final Address.Input billingInput = 
			new  Address.Input(
				parameters.get("billingCity"),
				parameters.get("billingProvince"),
				parameters.get("billingPostalCode"),
				parameters.get("billingAddress")
			);
		
		final boolean same = !Maybe.from(parameters.get("same")).isNull();
		System.out.println("Checked for same: " + same);
		
		final Address.Input shippingInput = 
			same ? billingInput : new Address.Input(
				parameters.get("shippingCity"),
				parameters.get("shippingProvince"),
				parameters.get("shippingPostalCode"),
				parameters.get("shippingAddress")
			);

		System.out.println("Gathered input: ");
		System.out.println("\t" + userInput);
		System.out.println("\t" + clientInput);
		System.out.println("\t" + billingInput);
		System.out.println("\t" + shippingInput);
		
		return new NewUserInputs(userInput, clientInput, billingInput, shippingInput);
	}
	
    @Override
	public Conts.Cont body(
			final Database db,
			final Session session,
			final Parameters parameters) 
    		throws SQLException {

    	final NewUserInputs input = loadInputs(parameters);
    	final Maybe<User.Authority> user = createUser(db, input); 
    			
		System.out.println("User ID: " + user);
		
		if(user.isNull()) {

			final Attributes attributes = new Attributes();
			attributes.set("userInput", input.user);
			attributes.set("clientInput", input.client);
			attributes.set("shippingInput", input.shipping);
			attributes.set("billingInput", input.billing);
			System.out.println("Returned to registration form");
			
			attributes.set("displayString", "Registration");
			attributes.set("provinces", db.allProvinceNames());
			
			return Conts.display("/jsp/registrationpanel.jsp", attributes);
			
		} else {
			final User.Authority auth = user.value();
			
			session.loggedOnUser = Maybe.just(auth);

			System.out.println("Returned to success");
			
			return Conts.redirect(Closures.welcome);
		}
	}

	private static <R> Maybe<R> perform(final Database.Action<R, SQLException> action) {
		try {
			return Maybe.just(Database.using(action));
		} catch(final SQLException ex) {
			ex.printStackTrace();
			return Maybe.nothing();
		}
	}

	private static Database.Action<Address.Id, SQLException> insert(final Address.Data data) {
		return new Database.Action<Address.Id, SQLException>() {
			@Override
			public Address.Id perform(final Database db) throws SQLException {
				return db.put(data);
			}
		};
	}
	
	private static Database.Action<Client.Id, SQLException> insert(final Client.Data data) {
		
		return new Database.Action<Client.Id, SQLException>() {
			@Override
			public Client.Id perform(final Database db) throws SQLException {
				return db.put(data);
			}
		};
	}

	private static Database.Action<User.Authority, SQLException> insert(final User.NewData data) {
		return new Database.Action<User.Authority, SQLException>() {
			@Override
			public User.Authority perform(final Database db) throws SQLException {
				return db.put(data);
			}
		};
	}
}
