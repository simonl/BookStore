<%-- ************************************************************************ --%>
<%-- *                                     			 						* --%>
<%-- * Author: David Préseault		        								* --%>
<%-- *                                      								* --%>
<%-- * This JSP page displays the cart contents and sub total, taxes and	* --%>
<%-- * total price. This also presents the user a form to fill out for		* --%>
<%-- * credit card information.	Once completed, user presses Confirm button.* --%>
<%-- *                                      								* --%>
<%-- ************************************************************************ --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="viewbook" class="contentbox ui-corner-all">
    <div id="viewbookHeader" class="contentheaders ui-corner-ll">
    	Checkout
    </div><br>
	<c:choose>
		<c:when test="${cart.size >= 7 }">
			<div style="width: 100%; height: 320px; overflow: auto;">
		</c:when>
		<c:otherwise>
			<div>
		</c:otherwise>
	</c:choose>

<%-- Display the cart items --%>
	<TABLE cellspacing="0" width="98%"
				style="text-align: center; margin: 0px auto;">
				<TR>
					<TH align="left">Title</TH>
					<TH>Type</TH>
					<TH>Price</TH>
					<TH>Quantity</TH>
					<TH>Total</TH>
				</TR>
				<tr>
					<td>&nbsp;</td>
				</tr>
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
					
					<c:if test="${ cart.value[entry.key].electronic }">
						<TR style="background-color:${bgcolor};" height="40px">
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
						
					<c:if test="${ cart.value[entry.key].numberOfCopies.value > 0 }">
						<TR style="background-color:${bgcolor};" height="40px">
							<TD width="40%" style="text-align: left;">${ entry.value.title }</TD>
							<TD>Paper</TD>
							<TD>${ entry.value.salePrice }</TD>
							<TD>${ cart.value[entry.key].numberOfCopies }</TD>
							<TD>${ entry.value.salePrice.value * cart.value[entry.key].numberOfCopies.value }</TD>
						</TR>
						
						<c:set var="counter" value="${ counter + 1 }"></c:set>
					</c:if>
				</c:forEach>
			</TABLE>
    </div>
<%-- Display the subtotal, tax, and total price. --%>
    	<p style="text-align:right;">Total: ${ cost } <br /> 
    	+ Taxes (${ taxRate }%): ${ total } <br />
    	<c:if test="${ !(empty secondTaxRate) }">
    		+ Taxes (${ secondTaxRate }%): ${ secondTotal }
    	</c:if>
    	</p>
    	<br /><hr style="border:1px black solid;"/><p style="text-align: center;font-weight:bold;font-size:16px;">Credit Card</p>
    	<c:if test="${ !(empty checkoutError) }">
    	<p><span style="color:yellow;margin-left:10px;">*** ${ checkoutError }</span></p><br />
    	</c:if>
<%-- Display the credit card information form --%>
    	<form method="post" action="<c:url  value="/ConfirmCheckoutServlet" />">
    	<table style="margin-left:10px;">
				<tr>
						<td><label for="ccType">Type: </label></td>
						<td><select name="ccType">
							<c:forEach var="type" items="${ cardTypes }">
								<option>${ type }</option>
							</c:forEach>
						</select>
						</td>
						</tr>
						<tr>
						<td><label for="ccNumber">Number: </label></td>
						<td><input type="text" name="ccNumber" /></td>
						</tr>
						<tr>
						<td><label for="ccExpirationMonth">Expiration month: </label></td>
						<td><select name="ccExpirationMonth">
							<c:forEach var="month" items="${ months }">
								<option>${ month }</option>
							</c:forEach>
						</select></td>
						</tr>
						<tr>
						<td><label for="ccExpirationYear">Expiration year: </label></td>
						<td><input type="text" name="ccExpirationYear" /></td>
						</tr>
						<tr>
						<td><label for="ccName">Name: </label></td>
						<td><input type="text" name="ccName" /></td>
						</tr>
		</table>
						
				<hr style="border:1px black solid;"/>
				<p style="text-align: center;">
    					<input type="image" src="imgs/confirm.png" />
							</form>
						</a>
				</p>
   
    	
</div>