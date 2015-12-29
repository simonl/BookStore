package com.mail.invoice.data;

/**
 * The data bean for storing the mail configuration parameters
 * 
 * @author neon
 *
 */
public class MailConfigData {

	
	private String userName; 
	private String userEmailAddress;
	private String urlPOP3server;
	private String urlSMTPserver;
	private String loginPOP3server;
	private String passwordPOP3server; 
	private int portNumberPOP3;
	private int portNumberSMTP;
	private boolean isGmail;
	private boolean isSMTPAuth;
	
	/**
	 * Default Constructor
	 */
	public MailConfigData() {
		super();
		this.userName = "";
		this.userEmailAddress = "";
		this.urlPOP3server = "";
		this.urlSMTPserver = "";
		this.loginPOP3server = "";
		this.passwordPOP3server = "";
		this.portNumberPOP3 = 110;
		this.portNumberSMTP = 25;
		this.isGmail = false;
		this.isSMTPAuth = false;
		
	}
	
	/**
	 * @param userName
	 * @param userEmailAddress
	 * @param urlPOP3server
	 * @param urlSMTPserver
	 * @param loginPOP3server
	 * @param passwordPOP3server
	 * @param portNumberPOP3
	 * @param portNumberSMTP
	 * @param isGmail
	 */
	public MailConfigData(String userName, String userEmailAddress,
			String urlPOP3server, String urlSMTPserver, String loginPOP3server,
			String passwordPOP3server, int portNumberPOP3,
			int portNumberSMTP, boolean isGmail, boolean isSMTPAuth) {
		super();
		this.userName = userName;
		this.userEmailAddress = userEmailAddress;
		this.urlPOP3server = urlPOP3server;
		this.urlSMTPserver = urlSMTPserver;
		this.loginPOP3server = loginPOP3server;
		this.passwordPOP3server = passwordPOP3server;
		this.portNumberPOP3 = portNumberPOP3;
		this.portNumberSMTP = portNumberSMTP;
		this.isGmail = isGmail;
		this.isSMTPAuth = isSMTPAuth;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the userEmailAddress
	 */
	public String getUserEmailAddress() {
		return userEmailAddress;
	}

	/**
	 * @param userEmailAddress the userEmailAddress to set
	 */
	public void setUserEmailAddress(String userEmailAddress) {
		this.userEmailAddress = userEmailAddress;
	}

	/**
	 * @return the urlPOP3server
	 */
	public String getUrlPOP3server() {
		return urlPOP3server;
	}

	/**
	 * @param urlPOP3server the urlPOP3server to set
	 */
	public void setUrlPOP3server(String urlPOP3server) {
		this.urlPOP3server = urlPOP3server;
	}

	/**
	 * @return the uslSMTPserver
	 */
	public String getUrlSMTPserver() {
		return urlSMTPserver;
	}

	/**
	 * @param uslSMTPserver the uslSMTPserver to set
	 */
	public void setUrlSMTPserver(String urlSMTPserver) {
		this.urlSMTPserver = urlSMTPserver;
	}

	/**
	 * @return the loginPOP3server
	 */
	public String getLoginPOP3server() {
		return loginPOP3server;
	}

	/**
	 * @param loginPOP3server the loginPOP3server to set
	 */
	public void setLoginPOP3server(String loginPOP3server) {
		this.loginPOP3server = loginPOP3server;
	}

	/**
	 * @return the passwordPOP3server
	 */
	public String getPasswordPOP3server() {
		return passwordPOP3server;
	}

	/**
	 * @param passwordPOP3server the passwordPOP3server to set
	 */
	public void setPasswordPOP3server(String passwordPOP3server) {
		this.passwordPOP3server = passwordPOP3server;
	}

	/**
	 * @return the portNumberPOP3
	 */
	public int getPortNumberPOP3() {
		return portNumberPOP3;
	}

	/**
	 * @param portNumberPOP3 the portNumberPOP3 to set
	 */
	public void setPortNumberPOP3(int portNumberPOP3) {
		this.portNumberPOP3 = portNumberPOP3;
	}

	/**
	 * @return the portNumberSMTP
	 */
	public int getPortNumberSMTP() {
		return portNumberSMTP;
	}

	/**
	 * @param portNumberSMTP the portNumberSMTP to set
	 */
	public void setPortNumberSMTP(int portNumberSMTP) {
		this.portNumberSMTP = portNumberSMTP;
	}

	/**
	 * @return the isGmail
	 */
	public boolean isIsGmail() {
		return isGmail;
	}

	/**
	 * @param isGmail the isGmail to set
	 */
	public void setIsGmail(boolean isGmail) {
		this.isGmail = isGmail;
	}

	/**
	 * @return the isSMTPAuth
	 */
	public boolean isIsSMTPAuth() {
		return isSMTPAuth;
	}

	/**
	 * @param isSMTPAuth the isSMTPAuth to set
	 */
	public void setIsSMTPAuth(boolean isSMTPAuth) {
		this.isSMTPAuth = isSMTPAuth;
	}
	
	public void display() {
		
		System.out.println(
		"          userName: " + userName + "\n" +
		"  userEmailAddress: " + userEmailAddress + "\n" +
		"     urlPOP3server: " + urlPOP3server + "\n" +
		"     urlSMTPserver: " + urlSMTPserver + "\n" +
		"   loginPOP3server: " + loginPOP3server + "\n" +
		"passwordPOP3server: " + passwordPOP3server + "\n" +
		"    portNumberPOP3: " + portNumberPOP3 + "\n" +
		"    portNumberSMTP: " + portNumberSMTP + "\n" +
		"           isGmail: " + isGmail + "\n" +
		"        isSMTPAuth: " + isSMTPAuth);
	}
	
}
