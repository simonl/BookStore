<%-- **************************************** --%>
<%-- *                                      * --%>
<%-- *                                      * --%>
<%-- * Author:: David Préseault, Edward     * --%>
<%-- *          Gagnon, Simon Langlois      * --%>
<%-- *                                      * --%>
<%-- **************************************** --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>:: Welcome to the MineBooks online Bookstore!</title>
	<LINK REL="SHORTCUT ICON" HREF="favicon.ico">
	<%@ include file="/jsp/css.jsp" %>
</head>
<body>
	<div id="container"  class="ui-corner-ll" >
		<jsp:include page="/jsp/header.jsp" />
		<jsp:include page="/jsp/searchbar.jsp" />
		<div id="leftpanel-container" class="ui-corner-ll" >
			<jsp:include page="/jsp/navigationbar.jsp" />
			<c:choose>
        		<c:when test="${ session.surveyAnswered.isNull }">
        			<jsp:include page="/jsp/surveypanel.jsp" />
      			</c:when>
      			<c:otherwise>
	    			<jsp:include page="/jsp/surveyResultpanel.jsp" />
      			</c:otherwise>
      		</c:choose>
			<jsp:include page="/jsp/rsspanel.jsp" />
		</div>
		<div id="middle-container" class="ui-corner-ll">
			<jsp:include page="${ middleContainerPanelPath }" />
		</div>
		<div id="rightpanel-container" class="ui-corner-ll" >
			<c:choose>
        		<c:when test="${ session.loggedOnUser.isNull }">
        			<jsp:include page="/jsp/loginpanel.jsp" />
      			</c:when>
      			<c:otherwise>
	    			<jsp:include page="/jsp/memberpanel.jsp" />
      			</c:otherwise>
      		</c:choose>
			<jsp:include page="/jsp/topbook.jsp" />
			<jsp:include page="/jsp/adspanel.jsp" />			
		</div>
		<jsp:include page="/jsp/banner-footer.jsp" />
		<jsp:include page="/jsp/footerpanel.jsp" />
	</div>

<form method="get" action="<c:url  value="/ShowBooksMobileServlet" />" ><input type="submit" name="submit" value="Test Mobile" /></form>
</body>
<%@ include file="/jsp/javascripts.jsp" %>
</html>