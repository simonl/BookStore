<%-- **************************************** --%>
<%-- *                                      * --%>
<%-- *                                      * --%>
<%-- * Author:: Edward Gagnon, Simon        * --%>
<%-- *          Langlois, David Préseault   * --%>
<%-- *                                      * --%>
<%-- **************************************** --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="searchbar">
	<div id="searchbarTop">
		<P>
		<form name="searchform" method="get" action="<c:url  value="/SearchResultServlet" />">
			<input type="text" placeholder="Search for book's title"  name="title" size="30" />
			<input type="submit" src="<c:url  value="/imgs/searchBtn.png" />" value="Search" /> 
			<a id="advSearchLink" href="javascript:void(0)">Advanced</a>
			<img id="searchBtnImage" src="<c:url  value="/imgs/searchArrow.png" />" width="20" style="vertical-align:sub;" />
		</form>
		</P>
	</div>
	<jsp:include page="/jsp/advancedSearch.jsp" />
</div>
