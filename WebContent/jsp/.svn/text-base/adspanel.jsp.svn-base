<%-- **************************************** --%>
<%-- *                                      * --%>
<%-- *                                      * --%>
<%-- * Author:: Edward Gagnon, David        * --%>
<%-- *          Préseault                   * --%>
<%-- *                                      * --%>
<%-- **************************************** --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="adspanel" class="box ui-corner-ll" >
	<div id="adspanelHeader" class="boxheaders ui-corner-ll" >
		<img src="<c:url  value="/imgs/adsheader.png" />"  class="ui-corner-ll" />
	</div>
	<div class="slideshow"><%-- must supply a height and width for jquery-cycle to work properly --%>
		<c:forEach var="ad" items="${ currentAds }">
			<img src="<c:url value="/imgs/ads/${ ad.image }" />" width="196" height="60" />
		</c:forEach>
	</div>
</div>
<br />
