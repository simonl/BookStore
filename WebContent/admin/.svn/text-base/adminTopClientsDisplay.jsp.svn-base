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
		<tr><td>Client&nbsp;Name</td><td>Quantity</td><td>Worth</td></tr>
	<c:forEach var="row" items="${topClients.rows}" varStatus="status" >
			<tr><td>${row.name}</td><td>${row.number_of_copies }</td><td>$<fmt:formatNumber value="${row.Total_Sales}" minFractionDigits="2" maxFractionDigits="2" /></td></tr>
	</c:forEach> 
	</table>

	
	<form method="get" action="<c:url  value="/ShowReportMenuServlet" />" >
		<input type="submit" name="submit" value="Go to Main Menu" class="" />
	</form>
	
</div>