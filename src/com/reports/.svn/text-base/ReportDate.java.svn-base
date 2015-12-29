package com.reports;

import java.sql.Date;
import java.util.Calendar;

import com.dataClasses.Maybe;

/**
 * A helper class for date manipulations
 * @author Edward Gagnon
 * @version March 23rd, 2012
 *
 */
public class ReportDate {
	//Instance Variables
	private java.util.Date uStartDate = null;
	private java.util.Date uEndDate = null;
	private java.sql.Date sStartDate = null;
	private java.sql.Date sEndDate = null;
	private String startDateString = null;
	private String endDateString = null;
	
	/**Default Constructor
	 * @param startDate
	 * 		The beginning date. Must follow the mm/dd/yyyy format.
	 * @param endDate
	 *		The ending date. Must follow the mm/dd/yyyy format. 		
	 * @throws IllegalArgumentException
	 * 			Thrown if any of the arguments are null, of an incorrect format, or if the start date is after the end date.
	 */
	public ReportDate(String startDate, String endDate) throws IllegalArgumentException{

		createReportDate(startDate, endDate);
	}
	
	/**
	 * Another Constructor
	 * @param startDate
	 * @param endDate
	 * @throws IllegalArgumentException
	 */
	public ReportDate(Maybe<String> startDate, Maybe<String> endDate) throws IllegalArgumentException{
		if(startDate.isNull() || endDate.isNull()){
			//throw new IllegalArgumentException("The start date or the end date is null.");
			createReportDate(Calendar.getInstance().getTime().toString(), Calendar.getInstance().getTime().toString());
		}
		else
			createReportDate(startDate.getValue(), endDate.getValue());
	}
	
	/**
	 * Called by the constructor. Used to create this object.
	 * @param startDate
	 * @param endDate
	 */
	private void createReportDate(String startDate, String endDate){
		//Check if the parameters are valid
		if(startDate == null || endDate == null || startDate.length() == 0 || endDate.length() == 0){
			//throw new IllegalArgumentException("The dates specified are not within the permissible range.");
			uStartDate = Calendar.getInstance().getTime();
			uEndDate = Calendar.getInstance().getTime();
			uEndDate.setTime(uEndDate.getTime() + 1);
			
		}
		else{
			//Set the Date objects
			uStartDate = getTime(startDate);
			uEndDate = getTime(endDate);
		}

		
		
		//Check if the Date objects are null.
		if(uStartDate == null || uEndDate == null){
			//throw new IllegalArgumentException("The startTime or endTime is null.");
			uStartDate = Calendar.getInstance().getTime();
			uEndDate = Calendar.getInstance().getTime();
			uEndDate.setTime(uEndDate.getTime() + 1);
		}
		
		//Check if the start date is after the end date
		if(uStartDate.after(uEndDate))
			throw new IllegalArgumentException("The startTime is after the end date.");
		
		

		sStartDate = new Date(uStartDate.getTime());
		sEndDate = new Date(uEndDate.getTime());
		
		this.startDateString = sStartDate.toString();
		this.endDateString = sEndDate.toString();
		
		System.out.println(startDateString);
		System.out.println("Sql end date = " + endDateString);
	}
	
	/**
	 * @return
	 */
	public java.util.Date getUtilStartDate() {
		return uStartDate;
	}

	/**
	 * @return
	 */
	public java.util.Date getUtilEndDate() {
		return uEndDate;
	}

	/**
	 * @return
	 */
	public java.sql.Date getSqlStartDate() {
		return sStartDate;
	}

	/**
	 * @return
	 */
	public java.sql.Date getSqlEndDate() {
		return sEndDate;
	}

	/**
	 * @return
	 */
	public String getStartDateString() {
		return startDateString;
	}

	/**
	 * @return
	 */
	public String getEndDateString() {
		return endDateString;
	}

	/**
	 * Converts a string to a Date object.
	 * @param dateToParse
	 * 		The time to parse - must follow the dd/mm/yy structure.
	 * @return
	 * 		returns an object of type date. If an error occurred, then null is returned.
	 */
	private java.util.Date getTime(String dateToParse){
		try {
			Calendar calendar = Calendar.getInstance();
			int day = 0;
			int month = 0; 
			int year = 0;
			String[] dateSplited = dateToParse.split("/");
			if(dateSplited.length != 3)
				return null;
			day = Integer.parseInt(dateSplited[1]);
			month = Integer.parseInt(dateSplited[0]) - 1; //Stupid calender month is 0 based while the rest isn't
			year = Integer.parseInt(dateSplited[2]);
			System.out.println("Day = " + day + "\nmonth = " + month + "\nyear = " + year);
			calendar.set(year, month, day);
			java.util.Date time = calendar.getTime();
			System.out.println(time.toString());
			return time;
		} catch (NumberFormatException e) {
			return null;
		}
	}
}
