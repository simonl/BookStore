<!--   ************************************ -->
<!--   *                                  * -->
<!--   *                                  * -->
<!--   * Author:: Edward Gagnon           * -->
<!--   *                                  * -->
<!--   ************************************ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div id="adminShowClients" class="contentbox ui-corner-ll">
    <div id="welcomeHeader" class="contentheaders ui-corner-ll">
        ${displayString}
	</div>
	${ ShowClientError }
	<fieldset><legend>Search for user:</legend>
	<form id="search" action="<c:url  value="/AdminSearchClientsServlet" />" method="get">
		<label name="searchUserForFirstNameLabel" >First Name:</label><input type="text" name="searchUserForFirstName" id="searchUserForFirstName" class="searchInput" placeholder="Search First Name" /><br />
		<label name="searchUserForLastNameLabel" >Last Name:</label><input type="text" name="searchUserForLastName" id="searchUserForLastName" class="searchInput" placeholder="Search Last Name" /><br />
		<label name="searchUserForLoginNameLabel" >Login Name:</label><input type="text" name="searchUserForLoginName" id="searchUserForLoginName" class="searchInput" placeholder="Search Login Name" /><br />
		<input type="submit" name="submit" value="Search" />
	</form>
	</fieldset><br /><br /><br /><br />
	   
	<div id="clients">
	 <c:forEach var="client" varStatus="status" items="${users.rows}" >
	 	<div style="border: 1px black solid; padding: 0; height:25px;">
	 	<form id="${client.id}" action="<c:url  value="/AdminShowClientServlet" />" method="get" style="">
	 	
<%-- 	 		<input type="hidden" name="clientId" value="${client.id}" /> --%>
	 			<input type="hidden" name="userId" value="${client.id}" />
<%-- 	 		<input type="hidden" name="billingId" value="${client.billingId}" /> --%>
<%-- 	 		<input type="hidden" name="shippingId" value="${client.shippingId}" /> --%>
<%-- 	 		<input type="hidden" name="Total_Purchase" value="${client.Total_Purchase}" /> --%>
<%-- 	 		<input type="hidden" name="firstName" value="${client.first_name}" /> --%>
<%-- 	 		<input type="hidden" name="lastName" value="${client.last_name}" /> --%>
<%-- 	 		<input type="hidden" name="homePhoneNumber" value="${client.home_phone}" /> --%>
<%-- 	 		<input type="hidden" name="cellPhoneNumber" value="${client.cell_phone}" /> --%>
<%-- 	 		<input type="hidden" name="email" value="${client.email}" /> --%>
<%-- 	 		<input type="hidden" name="billingCity" value="${client.billing_city}" /> --%>
<%-- 	 		<input type="hidden" name="billingProvince" value="${client.billing_province}" /> --%>
<%-- 	 		<input type="hidden" name="billingPostalCode" value="${client.billing_postal_code}" /> --%>
<%-- 	 		<input type="hidden" name="billingAddress" value="${client.billing_address}" /> --%>
<%-- 	 		<input type="hidden" name="shippingCity" value="${client.shipping_city}" /> --%>
<%-- 	 		<input type="hidden" name="shippingProvince" value="${client.shipping_province}" /> --%>
<%-- 	 		<input type="hidden" name="shippingPostalCode" value="${client.shipping_postal_code}" /> --%>
<%-- 	 		<input type="hidden" name="shippingAddress" value="${client.shipping_address}" /> --%>
<%-- 	 		<input type="hidden" name="loginName" value="${client.login}" /> --%>
<%-- 	 		<input type="hidden" name="password" value="${client.password}" /> --%>
	 		
	 		<div class="inline" style=" margin: 0; padding: 0;" >
	 			<p  style="display: inline; float: left; margin: 0; padding: 0px 10px;"><b>Name:</b> ${client.login} </p><input type="submit" name="submit" value="Edit" style="float:right;" />
	 		</div>
	 	</form>
	 	</div>
	 </c:forEach>
 	</div>
	
</div>
