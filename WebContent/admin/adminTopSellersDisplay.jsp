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
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="contentbox ui-corner-ll">
    <div class="contentheaders ui-corner-ll">
        ${displayString}
	</div>
	<jsp:include page="/admin/adminReportDisplayRequiredInfoPanel.jsp" />
	

	<table border="1" style="width: 100%;" >
		<tr><td>Book&nbsp;Title</td><td>Quantity</td><td>Worth</td><td colspan="2" >Publisher</td></tr>
	<c:forEach var="row" items="${topSellers.rows}" varStatus="status" >
			<tr><td>${row.title}</td><td>${row.number_of_copies }</td><td>$<fmt:formatNumber value="${row.Total_Sales}" minFractionDigits="2" maxFractionDigits="2" /></td><td colspan="2">${row.publisher}</td></tr>
	</c:forEach> 
	</table>

	
	<form method="get" action="<c:url  value="/ShowReportMenuServlet" />" >
		<input type="submit" name="submit" value="Go to Main Menu" class="" />
	</form>
	
</div>