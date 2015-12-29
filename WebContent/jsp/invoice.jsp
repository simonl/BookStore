<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="viewbook" class="contentbox ui-corner-all">
	<div id="viewbookHeader" class="contentheaders ui-corner-ll">
		Invoice</div>
	<br>
	<p>Dear ${ clientName }, an E-Mail of this transaction has been sent to you!</p>

	<c:choose>
		<c:when test="${cart.size >= 7 }">
			<div style="width: 100%; height: 320px; overflow: auto;">
		</c:when>
		<c:otherwise>
			<div>
		</c:otherwise>
	</c:choose>

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
		<c:forEach var="purchase" items="${ purchases }">
			<c:choose>
				<c:when test="${counter%2==0}">
					<c:set var="bgcolor" value="#06266F"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="bgcolor" value="#2A4480"></c:set>
				</c:otherwise>
			</c:choose>

			<c:if test="${ purchase.value.electronic }">
				<TR style="background-color:${bgcolor};" height="40px">
					<TD width="40%" style="text-align: left;">${
						purchase.value.book.title }</TD>
					<TD>Electronic</TD>
					<TD>$${ purchase.value.price }</TD>
					<TD></TD>
					<TD>$${ purchase.value.price }</TD>
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

			<c:if test="${ purchase.value.numberOfCopies.value > 0 }">
				<TR style="background-color:${bgcolor};" height="40px">
					<TD width="40%" style="text-align: left;">${
						purchase.value.book.title }</TD>
					<TD>Paper</TD>
					<TD>$${ purchase.value.price }</TD>
					<TD>${ purchase.value.numberOfCopies }</TD>
					<TD><c:choose>
							<c:when test="${purchase.value.electronic}">
							$${ totals[purchase.key].value - purchase.value.price.value }
							</c:when>
							<c:otherwise>
							$${ totals[purchase.key] }
							</c:otherwise>
						</c:choose></TD>
				</TR>

				<c:set var="counter" value="${ counter + 1 }"></c:set>
			</c:if>
		</c:forEach>
	</TABLE>
	<br />
	<br />
	</div>
<table
	style="float: right; text-align: right; margin-right: 7px;">
	<tr>
		<td style="font-weight: bold;">Sub Total:</td>
		<td>&nbsp;&nbsp;&nbsp;</td>
		<td>$${ cost }</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">+ Taxes:</td>
		<td></td>
		<td>${ taxRate }%</td>
	</tr>
	<c:choose>
		<c:when test="${ empty secondTaxRate }">
			<tr></tr>
			<tr>
				<td style="font-weight: bold;">Total:</td>
				<td></td>
				<td>$${ total }</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td style="font-weight: bold;">+ Taxes:</td>
				<td></td>
				<td>${ secondTaxRate }%</td>
			</tr>
			<tr></tr>
			<tr>
				<td style="font-weight: bold;">Total:</td>
				<td></td>
				<td>$${ secondTotal }</td>
			</tr>
		</c:otherwise>
	</c:choose>
	</table>
	<div style="clear: both;"></div>
	</div>
	<br />
	<div id="viewbook" class="contentbox ui-corner-all">
		<div id="viewbookHeader" class="contentheaders ui-corner-ll">
			Billed To</div>
		<br />
		<table border="0" style="margin-left:7px;">
			<tr>
				<td style="font-weight:bold;">Address:</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>${ billingAddress.address }</td>
			</tr>
			<tr>
				<td style="font-weight:bold;">City:</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>${ billingAddress.city }</td>
			</tr>
			<tr>
				<td style="font-weight:bold;">Province:</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>${ billingProvince }</td>
			</tr>
			<tr>
				<td style="font-weight:bold;">Postal Code:</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>${ billingAddress.postalCode }</td>
			</tr>
		</table>
		<br />
	</div>
	<br />
	<div id="viewbook" class="contentbox ui-corner-all">
		<div id="viewbookHeader" class="contentheaders ui-corner-ll">
			Shipping To</div>
			<br />
			<table border="0" style="margin-left:7px;">
			<tr>
				<td style="font-weight:bold;">Address:</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>${ shippingAddress.address }</td>
			</tr>
			<tr>
				<td style="font-weight:bold;">City:</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>${ shippingAddress.city }</td>
			</tr>
			<tr>
				<td style="font-weight:bold;">Province:</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>${ shippingProvince }</td>
			</tr>
			<tr>
				<td style="font-weight:bold;">Postal Code:</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>${ shippingAddress.postalCode }</td>
			</tr>
		</table>
		<br />
</div>