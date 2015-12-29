<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%-- **************************************** --%>
<%-- *                                      * --%>
<%-- * Author: Simon Langlois               * --%>
<%-- *                                      * --%>
<%-- **************************************** --%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="javascripts/addChoiceSurvey.js" type="text/javascript"></script>
<div class="contentbox ui-corner-ll">		

	<div class="contentheaders ui-corner-ll">Orders</div>

	<div style="text-align:center" id="surveyManagement"  >
		<p>${orderManagementError}</p>

		<div>
			<form style="display:inline;float:right;margin-right:5%" 
				  action="<c:url value="/OrderManagementServlet" />" 
				  method="get">
				<input type="text" name="searchKey" placeholder="book's isbn"/>
				<input type="Submit" value="Search" />
			</form>
		</div>
		
		<c:choose>
		<c:when test="${ empty book }">
			<table border="1" style="width: 90%; margin: 5%; margin-top: 0%">
				<tr>
					<td>
						<H3>Place order when number of books goes below:</H3>
						<form action="<c:url value="/ChangeMinimumBooksServlet" />" 
							name="changeMinimumBooks" method="post">
							<input type="text" name="minimum" value="${ minimum }" />
							<input type="submit" value="Set minimum" />
						</form>
					</td>
				</tr>
			</table>
			
			<H3>Current Orders</H3>						
			<table border="2" style="width:90%;margin:5%;margin-top:0%">
				<c:forEach var="order" items="${currentOrders}">
					<tr>
						<td style="padding:2%">
							<H3>
							<A href="<c:url value="/OrderManagementServlet?searchKey=${ currentBooks[order].isbn13 }" />">
								${ currentBooks[order].title }
							</A>
							</H3>
							<p>Ordered on: ${ currentDatas[order].orderedOn }</p>
							<p>Quantity: ${ currentDatas[order].numberOfCopies }</p>
							<form action="<c:url value="/ReceiveOrderServlet" />"
								name="createOrder" method="post">
								<input type="hidden" name="orderId" value="${ order }" />
								<input type="submit" value="Receive order" />
							</form>
						</td> 
					</tr>
				</c:forEach>			
			</table>
			
			<H3>Previous Orders</H3>						
			<table border="2" style="width:90%;margin:5%;margin-top:0%">
				<c:forEach var="order" items="${previousOrders}">
					<tr>
						<td style="padding:2%"><H3>
							<A href="<c:url value="/OrderManagementServlet?searchKey=${ order.value.isbn13 }" />">
								${ order.value.title }
							</A>
							</H3>
							<P>Time: ${ order.key.orderedOn } to ${ order.key.receivedOn.value }</P>
							<P>Quantity: ${ order.key.numberOfCopies }</P>
						</td> 
					</tr>
				</c:forEach>			
			</table>
		</c:when>

		<c:when test="${ !(empty book) }">
			<table border="1" style="width: 90%; margin: 5%; margin-top: 0%">
				<tr>
					<td>
						<H3>
						<A href="<c:url value="/OrderManagementServlet?searchKey=${ bookData.isbn13 }" />">
							${ bookData.title }
						</A>
						</H3>
						<P>In stock: ${ bookData.numberOfBooks.value }</P>
						<c:choose>
						<c:when test="${ empty current }">
							<form action="<c:url value="/CreateNewOrderServlet" />"
								name="createOrder" method="post">
								<input type="hidden" name="bookId" value="${ book }" />
								<label for="quantity">Quantity: </label>
								<input type="text" name="quantity" />
								<input type="submit" value="Place order" />
							</form>
						</c:when>
						<c:otherwise>
							<p>Ordered on: ${ currentData.orderedOn }</p>
							<p>Quantity: ${ currentData.numberOfCopies }</p>
							<form action="<c:url value="/ReceiveOrderServlet" />"
								name="createOrder" method="post">
								<input type="hidden" name="orderId" value="${ current }" />
								<input type="submit" value="Receive order" />
							</form>
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
			
			<H3>Previous Orders</H3>						
			<table border="2" style="width:90%;margin:5%;margin-top:0%">
				<c:forEach var="order" items="${previousOrders}">
					<tr>
						<td style="padding:2%">
							<P>Time: ${ order.orderedOn } to ${ order.receivedOn.value }</P>
							<P>Quantity: ${ order.numberOfCopies }</P>
						</td> 
					</tr>
				</c:forEach>			
			</table>
		</c:when>
		</c:choose>
		
	</div>
</div>
