<%-- ************************************************************************ --%>
<%-- *                                     			 						* --%>
<%-- *	Author: David Préseault												* --%>
<%-- *                                      								* --%>
<%-- *	This JSP page displays the contents of the user's cart.				* --%>
<%-- *	If no entries present, displays no items.							* --%>
<%-- *	Cart is available to non-registered and registered users.			* --%>
<%-- *	Has the possibility of updating requested quantities.				* --%>
<%-- *	Has a checkout button only if user is logged in.					* --%>
<%-- *                                      								* --%>
<%-- ************************************************************************ --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="viewbook" class="contentbox ui-corner-ll">
	<div id="viewbookHeader" class="contentheaders ui-corner-ll">
		<img src="imgs/cart.png" width="35px"
			style="vertical-align: text-bottom;" />&nbsp;&nbsp;My Cart
	</div>
	<div>
	<br><p>${ checkoutError } ${ addToCartError }</p>
	<c:choose>
		<c:when test="${empty cartEntries }">
		<H3 style="text-align:center">You have no items in your cart.</H3>
		</c:when>
		<c:otherwise>
		<form action="<c:url value="/UpdateCartServlet" />" name="cartForm" method="POST">
			<TABLE cellspacing="0" width="98%"
				style="text-align: center; margin: 0px auto;">
				<TR>
					<TH></TH>
					<TH align="left">Title</TH>
					<TH>Type</TH>
					<TH>Price</TH>
					<TH>Quantity</TH>
					<TH>Total</TH>
				</TR>
				<tr>
					<td>&nbsp;</td>
				</tr>
<%-- Display the Cart --%>
				<c:set var="counter" value="0"></c:set>
				<c:forEach var="entry" items="${ cartEntries }" varStatus="status">
					<c:choose>
						<c:when test="${counter%2==0}">
							<c:set var="bgcolor" value="#06266F"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="bgcolor" value="#2A4480"></c:set>
						</c:otherwise>
					</c:choose>
<%-- If EBOOK, display 1 quantity and price + total --%>
					<c:if test="${ cart.value[entry.key].electronic }">
						<TR style="background-color:${bgcolor};" height="40px">
							<TD><input type="button" value="X" onClick="document.location.href = '<c:url value="/RemoveFromCartServlet"><c:param name="isbn" value="${entry.value.isbn13}" /><c:param name="electronic" value="true" /></c:url>'" title="Remove" /></TD>
							<TD width="40%" style="text-align: left;">${ entry.value.title }</TD>
							<TD>Electronic</TD>
							<TD>${ entry.value.salePrice }</TD>
							<TD></TD>
							<TD>${ entry.value.salePrice.value }</TD>
						</TR>
						
						<c:set var="counter" value="${ counter + 1 }"></c:set>
					</c:if>
				
					<c:choose>
						<c:when test="${counter%2==0}">
							<c:set var="bgcolor" value="#06266F"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="bgcolor" value="#2A4480"></c:set>
						</c:otherwise>
					</c:choose>					
<%-- If Paper, display Quantities and price + total --%>						
					<c:if test="${ cart.value[entry.key].numberOfCopies.value > 0 }">
						<TR style="background-color:${bgcolor};" height="40px">
							<TD><input type="button" value="X" onClick="document.location.href = '<c:url value="/RemoveFromCartServlet"><c:param name="isbn" value="${entry.value.isbn13}" /><c:param name="electronic" value="false" /></c:url>'" title="Remove" /></TD>
							<TD width="40%" style="text-align: left;">${ entry.value.title }</TD>
							<TD>Paper</TD>
							<TD>${ entry.value.salePrice }</TD>
							<TD><input type="text" maxlength="3" size="1" name="${entry.value.isbn13}" value="${ cart.value[entry.key].numberOfCopies }" /></TD>
							<TD>${ entry.value.salePrice.value * cart.value[entry.key].numberOfCopies.value }</TD>
						</TR>
						
						<c:set var="counter" value="${ counter + 1 }"></c:set>
					</c:if>
				</c:forEach>
			</TABLE>
			</form>
			<c:choose>
<%-- Check if user is logged in or not to display checkout button. --%>
				<c:when test="${ session.loggedOnUser.isNull }">
				<p style="text-align: center;">
					<a href="javascript:void(0)">
						<img src="imgs/updateqty.png" onclick="cartForm.submit();" title="Update Quantity" />
					</a>
				</p>
					<p style="text-align: center;">
						To checkout, you must login or
						<a href="<c:url  value="/RegistrationServlet" />">
							register
						</a>
					</p><br />
				</c:when>
				<c:otherwise>
					<p style="text-align: center;">
						<a href="javascript:void(0)">
							<img src="imgs/updateqty.png" onclick="cartForm.submit();" title="Update Quantity" />
						</a>
						<a href="<c:url  value="/CheckoutCartServlet" />">
							<img src="imgs/checkout.png" title="Proceed to Checkout" />
						</a>
					</p><br />
			</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	</div>
</div>