<%-- ************************************************************************ --%>
<%-- *                                     			 						* --%>
<%-- *	Author: David Préseault												* --%>
<%-- *	This panel is the login panel, responsible for displaying two text	* --%>
<%-- *	fields, one of	which is user's username and the other is user's	* --%>
<%-- *	password.															* --%>
<%-- *	It provides a log in button and a view cart link for users who are	* --%>
<%-- *	adding to their Cart whom are NOT registered users yet.				* --%>
<%-- *  It also displays a Register Now link for users that want to register* --%>
<%-- *	themselves with the site and sends them to the appropriate page.	* --%>
<%-- *                                     			 						* --%>
<%-- ************************************************************************ --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="loginpanel" class="box ui-corner-ll">
	<div id="loginpanelHeader" class="boxheaders ui-corner-ll">
		<img src="<c:url  value="/imgs/loginheader.png" />"
			class="ui-corner-ll" />
	</div>
	<br>
	<p>${loginError}</p>
	<form method="post" action="<c:url  value="/LoginServlet" />"
		class="ui-corner-all">
		<input type="text" size="20" name="username" placeholder="Username"
			value="${param['username']}"> <input type="password"
			size="20" name="password" placeholder="Password"
			class="ui-corner-ll"> <input type="submit" name="loginBtn"
			value="Login" class="ui-corner-all"> <br>
		Not a member?<br>
		<a href="<c:url  value="/RegistrationServlet" />">Register now!</a><br>
		<br>
	</form>
	<a href="<c:url  value="/ViewCartServlet" />" style="vertical-align:50%;"><img src="imgs/cart.png" width="35px" style="vertical-align:bottom;"/> View Cart
		(${cart.size} items)</a><br><br>
</div>
<br>