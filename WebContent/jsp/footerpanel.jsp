<!-- **************************************** -->
<!-- *                                      * -->
<!-- *                                      * -->
<!-- * Author:: David Préseault, Edward     * -->
<!-- *          Gagnon                      * -->
<!-- *                                      * -->
<!-- **************************************** -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div id="footer">
		<table border="0" width="100%">
		<tr>
		<td>
			MineBooks &copy; 2012 - By David, Edward, Simon and Evgueni
		</td>
		<td>
			&#124; <a href="<c:url value="/WelcomeServlet" />" >Home</a>&nbsp;&nbsp;-&nbsp;&nbsp;<a href="<c:url value="/ViewBooksServlet"/>">Books</a>&nbsp;&nbsp;-&nbsp;&nbsp;<a href="<c:url value="/HelpIndexServlet" />">Help</a>&nbsp;&nbsp;-&nbsp;&nbsp;<a href="<c:url value="/AboutUsServlet" />">About Us</a>
		</td>
		</tr>
		</table>
	</div>
	<br>
