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
		<h3>Total value of the list price: <b>$<fmt:formatNumber value="${listValue}" minFractionDigits="2" maxFractionDigits="2" /></b></h3><br />
		<h3>Total value of the wholesale price: <b>$<fmt:formatNumber value="${wholeValue}" minFractionDigits="2" maxFractionDigits="2" /></b></h3><br />
		<tr><td>Book&nbsp;Title</td><td>Quantity</td><td>List&nbsp;Price&nbsp;Worth</td><td>Wholesale&nbsp;Price&nbsp;Worth</td></tr>
	<c:forEach var="row" items="${stock.rows}" varStatus="status" >
		<c:choose>
			<c:when test="${row.inventory == -1 }">
				<tr><td>${row.title}</td><td>N/A</td><td>N/A</td><td>N/A</td></tr>
			</c:when>
			<c:otherwise>
				<tr><td>${row.title}</td><td>${row.inventory }</td><td>$<fmt:formatNumber value="${row.listValue}" minFractionDigits="2" maxFractionDigits="2" /></td><td>$<fmt:formatNumber value="${row.wholeValue}" minFractionDigits="2" maxFractionDigits="2" /></td></tr>
			</c:otherwise>
		</c:choose>
	</c:forEach> 
	</table>

	
	<form method="get" action="<c:url  value="/ShowReportMenuServlet" />" >
		<input type="submit" name="submit" value="Go to Main Menu" class="" />
	</form>
	
</div>