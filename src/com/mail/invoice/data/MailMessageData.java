
package com.mail.invoice.data;

import java.util.ArrayList;
import java.util.Date;

/**
 * The data bean for storing the mail message parameters
 * 
 * @author neon
 *
 */
public class MailMessageData {
	
	private String fromSender;
	private ArrayList<String> toRecipients; 
	private ArrayList<String> ccRecipients; 
	private ArrayList<String> bccRecipients;
	private String subjectLine;
	private String messageText;
	private Date messageDate;

	/**
	 * Default Constructor 
	 */
	public MailMessageData() {
		super();
		this.toRecipients = null;
		this.ccRecipients = null;
		this.bccRecipients = null;
		this.subjectLine = "";
		this.messageText = "";
	}
	
	/**
	 * @param toRecipients
	 * @param ccRecipients
	 * @param bccRecipients
	 * @param subjectLine
	 * @param messageText
	 */
	public MailMessageData(ArrayList<String> toRecipients,
			ArrayList<String> ccRecipients, ArrayList<String> bccRecipients,
			String subjectLine, String messageText) {
		super();
		this.toRecipients = toRecipients;
		this.ccRecipients = ccRecipients;
		this.bccRecipients = bccRecipients;
		this.subjectLine = subjectLine;
		this.messageText = messageText;
	}

	/**
	 * @return the fromSender
	 */
	public String getFromSender() {
		return fromSender;
	}

	/**
	 * @param fromSender the fromSender to set
	 */
	public void setFromSender(String fromSender) {
		this.fromSender = fromSender;
	}

	/**
	 * @return the toRecipients
	 */
	public ArrayList<String> getToRecipients() {
		return toRecipients;
	}

	/**
	 * @param toRecipients the toRecipients to set
	 */
	public void setToRecipients(ArrayList<String> toRecipients) {
		this.toRecipients = toRecipients;
	}

	/**
	 * @return the ccRecipients
	 */
	public ArrayList<String> getCcRecipients() {
		return ccRecipients;
	}

	/**
	 * @param ccRecipients the ccRecipients to set
	 */
	public void setCcRecipients(ArrayList<String> ccRecipients) {
		this.ccRecipients = ccRecipients;
	}

	/**
	 * @return the bccRecipients
	 */
	public ArrayList<String> getBccRecipients() {
		return bccRecipients;
	}

	/**
	 * @param bccRecipients the bccRecipients to set
	 */
	public void setBccRecipients(ArrayList<String> bccRecipients) {
		this.bccRecipients = bccRecipients;
	}

	/**
	 * @return the subjectLine
	 */
	public String getSubjectLine() {
		return subjectLine;
	}

	/**
	 * @param subjectLine the subjectLine to set
	 */
	public void setSubjectLine(String subjectLine) {
		this.subjectLine = subjectLine;
	}


	/**
	 * @return the messageText
	 */
	public String getMessageText() {
		return messageText;
	}


	/**
	 * @param messageText the messageText to set
	 */
	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

	/**
	 * @return the messageDate
	 */
	public Date getMessageDate() {
		return messageDate;
	}

	/**
	 * @param messageDate the messageDate to set
	 */
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
}
