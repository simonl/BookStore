<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<h3>Total sales: <b>$<fmt:formatNumber value="${totalSalesWithinTimeLimitResult}" minFractionDigits="2" maxFractionDigits="2" /></b></h3>
	<table border="1" style="width: 100%;" >
		<tr>
			<td>Title</td>
			<td>Quantity</td>
			<td>Sold</td>
			<td>Cost</td>
			<td>Profit</td>
			<td colspan="2" >Purchased&nbsp;Date</td>
		</tr>
		<c:forEach var="row" items="${listSalesWithinTimeLimitResult.rows}" varStatus="status" >
				<tr>
					<td>${row.Title }</td>
					<td>${row.number_of_copies }</td>
					<td>$<fmt:formatNumber  value="${row.Purchase}" minFractionDigits="2" maxFractionDigits="2" /></td>
					<td>$<fmt:formatNumber  value="${row.Cost}" minFractionDigits="2" maxFractionDigits="2" /></td>
					<td>$<fmt:formatNumber  value="${row.Profit}" minFractionDigits="2" maxFractionDigits="2" /></td>
					<td colspan="2">${row.Purchased_on}</td>
				</tr>
		</c:forEach>
	</table>
