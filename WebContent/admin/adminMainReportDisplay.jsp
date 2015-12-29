<!-- **************************************** -->
<!-- *                                      * -->
<!-- *   Date: Claimed on April 5th 2012    * -->
<!-- *                                      * -->
<!-- * Author: Edward Gagnon                * -->
<!-- *                                      * -->
<!-- **************************************** -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div id="adminMainReportDisplay" class="contentbox ui-corner-ll">
    <div class="contentheaders ui-corner-ll">
        ${displayString}
	</div>
<!-- 	<fieldset><legend>Choose a Report</legend> -->
	<form id="search" action="<c:url  value="/ReportChooserServlet" />" method="get">
		

		<fieldset><legend>Choose a Report Type</legend>
			<input type="radio" name="reportOption" value="totalSales" >Total Sales</input><br />
			<input type="radio" name="reportOption" value="SalesByClient" >Sales by Client</input><br />
			<input type="radio" name="reportOption" value="SalesByAuthor" >Sales by Author</input><br />
			<input type="radio" name="reportOption" value="SalesByPublisher" >Sales by Publisher</input><br />
			<input type="radio" name="reportOption" value="TopSellers" >Top Sellers</input><br />
			<input type="radio" name="reportOption" value="TopClients" >Top Clients</input><br />
			<input type="radio" name="reportOption" value="ZeroSales" >Zero Sales</input><br />
			<input type="radio" name="reportOption" value="ReorderReport" >Reorder Report</input><br />
			<input type="radio" name="reportOption" value="StockReport" >Stock Report</input><br />
		</fieldset>
<!-- 		<label name="" ></label><input type="text" name="" id="" class="" placeholder="" /><br /> -->
		<input type="submit" name="submit" value="Search" class="rightify" />
	</form>
<!-- 	</fieldset><br /><br /><br /><br /> -->
	
	
</div>

