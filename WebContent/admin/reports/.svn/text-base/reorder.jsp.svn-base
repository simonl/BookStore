<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- **************************************** --%>
<%-- *                                      * --%>
<%-- * Author: Simon Langlois               * --%>
<%-- *                                      * --%>
<%-- **************************************** --%>

	<H3 style="text-align:center">Low Inventory (&lt; ${ minimum })</H3>	
	<P>Number of books: ${ differentBooks }</P>
	<P>Missing stock: ${ missingBooks }</P>				
	<table border="1" style="text-align:center">
		<tr>
			<th>Title (link)</th>
			<th>ISBN 13</th>
			<th>Quantity</th>
		</tr>
		<c:forEach var="book" items="${lowInventory}">
		<tr>
			<td>
				<A href="<c:url value="/OrderManagementServlet?searchKey=${ book.isbn13 }" />">
					${ book.title }
				</A>
			</td>
			<td>${ book.isbn13 }</td>
			<td>${ book.numberOfBooks.value }</td> 
		</tr>
		</c:forEach>			
	</table>
	
