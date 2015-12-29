<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div id="memberpanel" class="box ui-corner-ll" >
			<div id="memberpanelHeader" class="boxheaders ui-corner-all" >
				<img src="<%= response.encodeURL(request.getContextPath() + "/imgs/memberheader.png") %>"  class="ui-corner-ll" />
			</div>
			<br>
			<p> 
			Welcome ${userPrivateData.login}!
			</p>
			<a href="<c:url  value="/ViewCartServlet" />" style="vertical-align:50%;"><img src="imgs/cart.png" width="35px" style="vertical-align:bottom;"/> View Cart (${cart.size} items)</a><br>
			<c:if test="${cart.size != 0}">
				<a href="<c:url value="/CheckoutCartServlet" />" >Checkout</a><br><br>
      		</c:if>
			<a href="<c:url value="/EBookDownloadPageServlet" />">My EBooks</a><br><br>
			<form action="<c:url  value="/LogoutServlet" />">
				<input type="submit" name="logoutBtn" value="Log Out" class="ui-corner-all" >
			</form>
		</div>
		<br>