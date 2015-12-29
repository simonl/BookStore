/**
 * 
 */
package com.mail.invoice;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

import com.mail.invoice.data.MailConfigData;
import com.mail.invoice.data.MailMessageData;

/**
 * @author neon
 * 
 */
public class MailSender {

	private final static boolean DEBUG = false;

	private MailConfigData mailConfigData;

	public MailSender(MailConfigData mailConfigData) {
		this.mailConfigData = mailConfigData;

	}

	/**
	 * Decide whether to use smtp or gmail
	 * 
	 * @param mmd
	 *            the MailMessageData
	 */
	public boolean sendMail(MailMessageData mmd) {
		boolean retVal = true;

		if (mailConfigData.isIsGmail()) {
			retVal = gmailSend(mmd);
		} else {
			retVal = smtpSend(mmd);
		}
		return retVal;
	}

	/**
	 * Sent the message to a plain SMTP server like Waldo
	 * 
	 * @param mmd
	 *            the MailMessageData to send
	 * @return success or failure
	 */
	private boolean smtpSend(MailMessageData mmd) {
		boolean retVal = true;
		Session session = null;

		try {
			// Create a properties object
			Properties smtpProps = new Properties();

			// Add mail configuration to the properties
			smtpProps.put("mail.transport.protocol", "smtp");

			smtpProps.put("mail.smtp.host", mailConfigData.getUrlSMTPserver());
			smtpProps.put("mail.smtp.port", mailConfigData.getPortNumberSMTP());

			if (mailConfigData.isIsSMTPAuth()) {
				smtpProps.put("mail.smtp.auth", "true");
				Authenticator auth = new SMTPAuthenticator();
				session = Session.getInstance(smtpProps, auth);
			} else
				session = Session.getDefaultInstance(smtpProps, null);

			// Display the conversation between the client and server
			if (DEBUG)
				session.setDebug(true);

			// Create a new message
			MimeMessage msg = new MimeMessage(session);

			// Set the single from field
			msg.setFrom(new InternetAddress(mailConfigData
					.getUserEmailAddress()));

			// Set the To, CC, and BCC from their ArrayLists
			for (String emailAddress : mmd.getToRecipients())
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						emailAddress, false));

			if (mmd.getCcRecipients() != null)
				for (String emailAddress : mmd.getCcRecipients())
					msg.addRecipient(Message.RecipientType.CC,
							new InternetAddress(emailAddress, false));

			if (mmd.getBccRecipients() != null)
				for (String emailAddress : mmd.getBccRecipients())
					msg.addRecipient(Message.RecipientType.BCC,
							new InternetAddress(emailAddress, false));

			// Set the subject
			msg.setSubject(mmd.getSubjectLine());

			// Set the message body
			msg.setText(mmd.getMessageText());

			// Set some other header information
			msg.setHeader("X-Mailer", "Comp Sci Tech Mailer");
			msg.setSentDate(new Date());

			if (mailConfigData.isIsSMTPAuth()) {
				Transport transport = session.getTransport();
				transport.connect();
				transport.sendMessage(msg, msg
						.getRecipients(Message.RecipientType.TO));
				transport.close();
			} else
				Transport.send(msg);

		} catch (NoSuchProviderException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"There is no server at the SMTP address.",
					"SMTP-NoSuchProviderException", JOptionPane.ERROR_MESSAGE);
			retVal = false;
		} catch (AddressException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"There is an error in a recipient's address.",
					"SMTP-AddressException", JOptionPane.ERROR_MESSAGE);
			retVal = false;
		} catch (MessagingException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"There is a problem with the message.",
					"SMTP-MessagingException", JOptionPane.ERROR_MESSAGE);
			retVal = false;
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"There has been an unknown error.",
					"SMTP-UnknownException", JOptionPane.ERROR_MESSAGE);
			retVal = false;
		}
		return retVal;
	}

	private class SMTPAuthenticator extends javax.mail.Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			String username = mailConfigData.getLoginPOP3server();
			String password = mailConfigData.getPasswordPOP3server();
			System.out.println(username + "\t" + password);
			return new PasswordAuthentication(username, password);
		}
	}

	/**
	 * Sent the message to a Gmail account
	 * 
	 * @param mmd
	 *            the MailMessageData to send
	 * @return success or failure
	 */
	public boolean gmailSend(MailMessageData mmd) {
		boolean retVal = true;
		Transport transport = null;

		try {
			// Create a properties object
			Properties smtpProps = new Properties();

			// Add mail configuration to the properties
			smtpProps.put("mail.transport.protocol", "smtps");
			smtpProps.put("mail.smtps.host", mailConfigData.getUrlSMTPserver());
			smtpProps.put("mail.smtps.auth", "true");
			smtpProps.put("mail.smtps.quitwait", "false");

			// Create a mail session
			Session mailSession = Session.getDefaultInstance(smtpProps);

			// Display the conversation between the client and server
			if (DEBUG)
				mailSession.setDebug(true);

			// Instantiate the transport object
			transport = mailSession.getTransport();

			// Create a new message
			MimeMessage msg = new MimeMessage(mailSession);

			// Set the To, CC, and BCC from their ArrayLists
			for (String emailAddress : mmd.getToRecipients())
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						emailAddress, false));

			if (mmd.getCcRecipients() != null)
				for (String emailAddress : mmd.getCcRecipients())
					msg.addRecipient(Message.RecipientType.CC,
							new InternetAddress(emailAddress, false));

			if (mmd.getBccRecipients() != null)
				for (String emailAddress : mmd.getBccRecipients())
					msg.addRecipient(Message.RecipientType.BCC,
							new InternetAddress(emailAddress, false));

			// Set the subject line
			msg.setSubject(mmd.getSubjectLine());
			// Set the message body
			msg.setText(mmd.getMessageText());

			// Set some other header information
			msg.setHeader("X-Mailer", "Comp Sci Tech Mailer");
			msg.setSentDate(new Date());

			// Connect and authenticate to the server
			transport.connect(mailConfigData.getUrlSMTPserver(), mailConfigData
					.getPortNumberSMTP(), mailConfigData.getLoginPOP3server(),
					mailConfigData.getPasswordPOP3server());

			// Send the message
			transport.sendMessage(msg, msg.getAllRecipients());

			// Close the connection
			transport.close();

		} catch (NoSuchProviderException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"There is no server at the SMTP address.",
					"Gmail-NoSuchProviderException", JOptionPane.ERROR_MESSAGE);
			retVal = false;
		} catch (AddressException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"There is an error in a recipient's address.",
					"Gmail-AddressException", JOptionPane.ERROR_MESSAGE);
			retVal = false;
		} catch (MessagingException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"There is a problem with the message.",
					"Gmail-MessagingException", JOptionPane.ERROR_MESSAGE);
			retVal = false;
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"There has been an unknown error.",
					"Gmail-UnknownException", JOptionPane.ERROR_MESSAGE);
			retVal = false;
		}
		return retVal;
	}

}

/*
 * Settings for well known mail providers
 * 
 * Yahoo Incoming Mail Server - pop.mail.yahoo.com (POP3 - port 110) Outgoing
 * Mail Server - smtp.mail.yahoo.com (SMPTP - port 25)
 * 
 * Google GMail Incoming Mail Server - pop.gmail.com (POP3S SSL enabled, port
 * 995) Outgoing Mail Server - gmail.com (SMPTS SSL enabled, port 465)
 */

