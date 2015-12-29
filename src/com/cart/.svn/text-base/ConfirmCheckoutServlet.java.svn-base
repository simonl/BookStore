package com.cart;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.MathContext;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;

import com.dataAccess.tables.Address;
import com.dataAccess.tables.Book;
import com.dataAccess.tables.Client;
import com.dataAccess.tables.Province;
import com.dataAccess.tables.Purchase;
import com.dataAccess.tables.Purchase.Id;
import com.dataAccess.tables.User;
import com.dataClasses.CreditCardType;
import com.dataClasses.Database;
import com.dataClasses.Func;
import com.dataClasses.Funcs;
import com.dataClasses.Maybe;
import com.dataClasses.Money;
import com.dataClasses.Month;
import com.dataClasses.Nat;
import com.dataClasses.Throws;
import com.mail.invoice.MailProperties;
import com.mail.invoice.MailSender;
import com.mail.invoice.data.MailConfigData;
import com.mail.invoice.data.MailMessageData;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

public class ConfirmCheckoutServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public Conts.Cont body(
			final Database db, 
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException {
			
		final Maybe<User.Authority> user = session.loggedOnUser;
		
		if(user.isNull())
			return Conts.error("checkoutError", "You are not logged on!");
		
		final Maybe<Client.Id> client = db.get(user.value()).clientID;

		if(client.isNull())
			return Conts.error("checkoutError", "You are not a client!");

		if(!validateCreditCard(parameters))
			return Conts.error("checkoutError", "Invalid credit card information!");
		
		final Address.Id billing = db.get(client.value()).billingAddressID;
		final Province.Id province = db.get(billing).province;
		final Province.Data provinceData = db.get(province);
		final Province.Rate taxRate = provinceData.taxRate;
		final Maybe<Province.Rate> secondTaxRate = provinceData.secondTaxRate;
		
		final Maybe<Set<Purchase.Id>> purchaseIds = db.checkout(user.value(), session.cart);
		
		if(purchaseIds.isNull()) 
			return Conts.error("checkoutError", "Demanding too many books");
		
		final Map<Purchase.Id, InvoiceRecord> purchases = Funcs.maps(purchaseIds.value(), new Throws<Purchase.Id, InvoiceRecord, SQLException>() {
			public InvoiceRecord apply(final Purchase.Id purchase) throws SQLException {
				final Purchase.Data data = db.get(purchase);
				final Book.Data book = db.get(data.book);
				
				return new InvoiceRecord(
					book,
					data.price,
					data.numberOfCopies,
					data.electronic
				);
			} 			
		});
		final Map<Purchase.Id, Money> totals = Funcs.maps(purchaseIds.value(), new Func<Purchase.Id, Money>() {
			public Money apply(final Purchase.Id id) {
				return itemTotal(purchases.get(id));
			} 
		});
		
		final Money cost = total(totals.values());
		final Money total = withTax(cost, taxRate);
		
		final Attributes attributes = new Attributes();
		attributes.set("purchases", purchases.entrySet());
		attributes.set("totals", totals);
		attributes.set("cost", cost);
		attributes.set("taxRate", taxRate);
		attributes.set("total", total.value.setScale(2,BigDecimal.ROUND_HALF_UP));
		Money secondTotal = null;
		if(!secondTaxRate.isNull()) {
			secondTotal = withTax(total, secondTaxRate.value());
			attributes.set("secondTaxRate", secondTaxRate.value());
			attributes.set("secondTotal", secondTotal.value.setScale(2,BigDecimal.ROUND_HALF_UP));
		}

		//-----------------------------------------EMAIL INVOICE-----------------------------------------
		
		String messageBody = "***********************\nMineBooks Book Store\n***********************\n\n";
		Client.Data clientData = db.get(client.value());
		messageBody += "Hello " + clientData.firstName + " " + clientData.lastName + ", \n";
		messageBody += "Thank you for your order!\n\n";
		messageBody += "Invoice: " + new Date() + "\n\n";

		Iterator<Purchase.Id> iterator = purchases.keySet().iterator();

		Address.Data billingInfo = db.get(billing);
		Address.Data shippingInfo = db.get(db.get(client.value()).shippingAddressID);
		
		attributes.set("clientName",clientData.firstName + " " + clientData.lastName);
		attributes.set("billingAddress", billingInfo);
		attributes.set("billingProvince", db.get(billingInfo.province).name.toString());
		attributes.set("shippingAddress", shippingInfo);
		attributes.set("shippingProvince", db.get(shippingInfo.province).name.toString());

		messageBody += "-------------Billing Information---------------\n\n";
		messageBody += "Address: " + billingInfo.address.toString() + "\n";
		messageBody += "City: " + billingInfo.city + "\n";
		messageBody += "Province: " + db.get(billingInfo.province).name.toString() + "\n";
		messageBody += "Postal Code: " + billingInfo.postalCode + "\n\n";
		
		messageBody += "-------------Shipping Information---------------\n\n";
		messageBody += "Address: " + shippingInfo.address.toString() + "\n";
		messageBody += "City: " + shippingInfo.city + "\n";
		messageBody += "Province: " + db.get(shippingInfo.province).name.toString() + "\n";
		messageBody += "Postal Code: " + shippingInfo.postalCode + "\n\n";
		messageBody += "-------------Purchased Items---------------\n\n";
		
		while (iterator.hasNext())
		{
			Purchase.Id purchaseId = iterator.next();
			InvoiceRecord purchaseData = purchases.get(purchaseId);
			if (purchaseData.electronic)
				messageBody += "- " + purchaseData.book.title + " - $" + purchaseData.price.toString() + " (EBOOK) = $" + purchaseData.price + "\n";
			if (purchaseData.numberOfCopies.value > 0)
				messageBody += "- " + purchaseData.book.title + " - $" + purchaseData.price.toString() + " x QTY " + purchaseData.numberOfCopies.toString() + " = $" + (purchaseData.electronic?totals.get(purchaseId).value.subtract(purchaseData.price.value):totals.get(purchaseId).value) + "\n";
		}
		messageBody += "\n";
		messageBody += "SubTotal: $" + cost.toString() + "\n";
		messageBody += "Tax: " + taxRate.value.toString() + "%\n";
		
		if(!secondTaxRate.isNull()) {
			messageBody += "Tax: " + secondTaxRate.value().toString() + "%\n";
			messageBody += "Total: $" + secondTotal.value.setScale(2,BigDecimal.ROUND_HALF_UP) + "\n";
		}
		else
			messageBody += "Total: $" + total.getValue().setScale(2,BigDecimal.ROUND_HALF_UP) + "\n";	
		
		messageBody += "______________________________________________\n";
		messageBody += "End of Invoice\n\n";
		messageBody += "Thank you for shopping at MineBooks Book Store! See you soon!";
		
		sendMail(messageBody,ConfirmCheckoutServlet.getUserEmail(db, session).value().toString());


		return Conts.display("/jsp/invoice.jsp", attributes);
	}
	
	private void sendMail(String messageBody, String emailAddr) {

		// Create object to manage properties
		final MailProperties mailProperties = new MailProperties();
		// Retrieve the properties
		final MailConfigData mailConfigData = mailProperties.loadProperties();

		if (mailConfigData == null) {
			System.out.println("There was a problem loading the mail \nproperties. Please correct");
		}
		else {
			// Create an object to send mail
			final MailSender mailSender = new MailSender(mailConfigData);
			MailMessageData mmd = new MailMessageData();
			mmd.setFromSender("invoice@MineBooks.com");
			mmd.setSubjectLine("MineBooks - Purchase Invoice " + new Date());
			mmd.setMessageDate(new Date());
			mmd.setMessageText(messageBody);
			ArrayList<String> toRecipients = new ArrayList<String>();
			toRecipients.add(emailAddr);
			mmd.setToRecipients(toRecipients);
			mailSender.sendMail(mmd);
		}
	}


	private boolean validateCreditCard(final Parameters parameters) {
		
		for(final String typeInput : parameters.get("ccType"))
		for(final String numberInput : parameters.get("ccNumber"))
		for(final String expirationMonthInput : parameters.get("ccExpirationMonth"))
		for(final String expirationYearInput : parameters.get("ccExpirationYear"))
		for(final String nameInput : parameters.get("ccName"))

		for(final CreditCardType type : CreditCardType.parse(typeInput))
		for(final Month expirationMonth : Month.parse(expirationMonthInput))				
		for(final Nat expirationYear : Nat.parse(expirationYearInput))
		for(final byte[] number : parseNumber(numberInput))
		for(final String name : Maybe.just(nameInput))
			
		{
			return type.validate(number);
		}	
		
		return false;
	}
	
	public static final Maybe<byte[]> parseNumber(final String numberInput) {
		final byte[] number = new byte[numberInput.length()];
		
		for(int i = 0; i < numberInput.length(); i++) {
			final char c = numberInput.charAt(i);
			
			if(!Character.isDigit(c))
				return Maybe.nothing();
			
			number[i] = (byte) (c - '0');
		}
		
		return Maybe.just(number);
	}

	public static final Money itemTotal(final Purchase.Data data) {
		final int number = data.numberOfCopies.value + (data.electronic ? 1 : 0);
		final BigDecimal itemTotal = data.price.value.multiply(new BigDecimal(number));
		
		return Money.from(itemTotal).value();
	}
	
	public static final Money itemTotal(final InvoiceRecord data) {
		final int number = data.numberOfCopies.value + (data.electronic ? 1 : 0);
		final BigDecimal itemTotal = data.price.value.multiply(new BigDecimal(number));
		
		return Money.from(itemTotal).value();
	}
	
	public static final Money withTax(final Money amount, final Province.Rate rate) {
		final BigDecimal extra = amount.value.multiply(rate.value);
		final BigDecimal total = amount.value.add(extra);
		return Money.from(total).value();
	}
	
	public static final Money total(final Set<Purchase.Data> purchases) {
		BigDecimal total = BigDecimal.ZERO;
		
		for(final Purchase.Data purchase : purchases) {
			total = total.add(itemTotal(purchase).value);
		}
		
		return Money.from(total).value();
	}

	public static final Money total(final Iterable<Money> amounts) {
		BigDecimal total = BigDecimal.ZERO;
		
		for(final Money amount : amounts) {
			total = total.add(amount.value);
		}
		
		return Money.from(total).value();
	}
	
	public static final Maybe<Client.Email> getUserEmail(final Database db, final Session session) throws SQLException {
		final Maybe<User.Authority> user = session.loggedOnUser;
		
		if(user.isNull()) return Maybe.nothing();
		
		final Maybe<Client.Id> client = db.get(user.value()).clientID;
		
		if(client.isNull()) return Maybe.nothing();
		
		final Client.Email email = db.get(client.value()).email;
		
		return Maybe.just(email);
	}
}
