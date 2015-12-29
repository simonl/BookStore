<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="contentbox ui-corner-ll">
    <div class="contentheaders ui-corner-ll">
        ${displayString}
	</div>
	<jsp:include page="/admin/adminReportDisplayRequiredInfoPanel.jsp" />
	
	
	<c:choose>
		<c:when test="${option == 'sum' }">
			<h3>Total sales within specified range of dates: <b>$<fmt:formatNumber value="${authorTotals}" minFractionDigits="2" maxFractionDigits="2" /></b></h3>
		</c:when>
		<c:otherwise>
		<h3>Total sales by author within specified range of dates: <b>$<fmt:formatNumber value="${authorTotals}" minFractionDigits="2" maxFractionDigits="2" /></b></h3>
			<table border="1" style="width: 100%;" >
				<tr><td>Title of Book</td><td>Unit Sale Price</td><td>Quantity</td><td>Worth</td><td colspan="2" >Purchased&nbsp;Date</td></tr>
			<c:forEach var="row" items="${authorBooks.rows}" varStatus="status" >
					<tr><td>${row.title }</td><td>${row.price}</td><td>${row.number_of_copies }</td><td>$<fmt:formatNumber value="${row.totals}" minFractionDigits="2" maxFractionDigits="2" /></td><td colspan="2">${row.purchased_on}</td></tr>
			</c:forEach> 
			</table>
		</c:otherwise>
	</c:choose>
	
	<form method="get" action="<c:url  value="/ShowReportMenuServlet" />" >
		<input type="submit" name="submit" value="Go to Main Menu" class="" />
	</form>
	
</div>