package com.mail.invoice;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import javax.annotation.Resource;
import javax.swing.JOptionPane;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.mail.invoice.data.MailConfigData;

/**
 * Read or write mail properties
 * 
 * @author neon
 */
public class MailProperties {

	private String propFileName;
	private Properties prop = null;

	/**
	 * Constructor
	 */
	public MailProperties() {
		super();
		//SMTP properties
		this.propFileName = "MailConfig.properties";
		
		// Gmail properties
		//this.propFileName = "GMailConfig.properties";
		
		prop = new Properties();
		
	}

	/**
	 * Load the properties into the MailConfig object
	 * 
	 * @return if successful or not
	 */
	public MailConfigData loadProperties() {

		MailConfigData mailConfigData = new MailConfigData();

		InputStream propFileStream = this.getClass().getClassLoader().getResourceAsStream(propFileName);

		// File must exist
		if (propFileStream != null) {
			try {
				prop.load(propFileStream);
				propFileStream.close();
				
				// Store the properties in a mailConfigData object
				mailConfigData.setUserName(prop.getProperty("userName"));
				mailConfigData.setUserEmailAddress(prop
						.getProperty("userEmailAddress"));
				mailConfigData.setUrlPOP3server(prop.getProperty("urlPOP3server"));
				mailConfigData.setUrlSMTPserver(prop.getProperty("urlSMTPserver"));
				mailConfigData.setLoginPOP3server(prop
						.getProperty("loginPOP3server"));
				mailConfigData.setPasswordPOP3server(prop
						.getProperty("passwordPOP3server"));
				mailConfigData.setPortNumberPOP3(Integer.parseInt(prop
						.getProperty("portNumberPOP3")));
				mailConfigData.setPortNumberSMTP(Integer.parseInt(prop
						.getProperty("portNumberSMTP")));

				// parseBoolean returns false if the string is not "true"
				// so no need for an exception handler
				mailConfigData.setIsGmail(Boolean.parseBoolean(prop
						.getProperty("isGmail")));

				mailConfigData.setIsSMTPAuth(Boolean.parseBoolean(prop
						.getProperty("isSMTPAuth")));
				
			} catch (FileNotFoundException e) {
				JOptionPane.showMessageDialog(null,
						"The properties file has not been found.",
						"Missing Properties File", JOptionPane.ERROR_MESSAGE);
				mailConfigData = null;
				e.printStackTrace();
			} catch (IOException e) {
				JOptionPane.showMessageDialog(null,
						"There was an error reading the Properties file.",
						"Properties File Read Error", JOptionPane.ERROR_MESSAGE);
				mailConfigData = null;
				e.printStackTrace();
			}
		} else
			mailConfigData = null;

		return mailConfigData;
	}

	/**
	 * Write the contents of the MailConfig object to the properties file
	 *
	 * @param mailConfigData
	 * @return success or failure
	 */
	public boolean writeProperties(MailConfigData mailConfigData) {
		boolean retVal = true;

		prop.setProperty("userName", mailConfigData.getUserName());
		prop.setProperty("userEmailAddress", mailConfigData.getUserEmailAddress());
		prop.setProperty("urlPOP3server", mailConfigData.getUrlPOP3server());
		prop.setProperty("urlSMTPserver", mailConfigData.getUrlSMTPserver());
		prop.setProperty("loginPOP3server", mailConfigData.getLoginPOP3server());
		prop.setProperty("passwordPOP3server", mailConfigData.getPasswordPOP3server());
		prop.setProperty("portNumberPOP3", "" + mailConfigData.getPortNumberPOP3());
		prop.setProperty("portNumberSMTP", "" + mailConfigData.getPortNumberSMTP());
		prop.setProperty("isGmail", Boolean.toString(mailConfigData.isIsGmail()));
		prop.setProperty("isGmail", Boolean.toString(mailConfigData.isIsSMTPAuth()));

		FileOutputStream propFileStream = null;
		File propFile = new File(propFileName);
		try {
			propFileStream = new FileOutputStream(propFile);
			prop.store(propFileStream, "-- MailConfig Properties --");
			propFileStream.close();
		} catch (FileNotFoundException e) {
			JOptionPane.showMessageDialog(null,
					"The properties file has not been found.",
					"Missing Properties File", JOptionPane.ERROR_MESSAGE);
			retVal = false;
			e.printStackTrace();
		} catch (IOException e) {
			JOptionPane.showMessageDialog(null,
					"There was an error writing the Properties file.",
					"Properties File Write Error", JOptionPane.ERROR_MESSAGE);
			retVal = false;
			e.printStackTrace();
		}
		return retVal;
	}

	/**
	 * Diagnostic method to display the properties
	 */
	public void displayProperties() {
		prop.list(System.out);
	}

}
