<!-- **************************************** -->
<!-- *                                      * -->
<!-- *   Date:: March 14th, 2012            * -->
<!-- *                                      * -->
<!-- * Author:: Edward Gagnon               * -->
<!-- *                                      * -->
<!-- **************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="adminAllowDenyReviews" class="contentbox ui-corner-ll">
    <div id="welcomeHeader" class="contentheaders ui-corner-ll">
        ${displayString}
	</div>
    
    <c:forEach var="review" varStatus="status" items="${reviews}" >
    <div class="AdminReviews" style="border: 1px black solid; padding: 5px;" >
    	<input type="hidden" id="id" value="${review.key}" />
    	<p id="PostedBy" >User:&nbsp;&nbsp;${review.value.user.value }</p><p id="TimePosted">Posted at:&nbsp;&nbsp;${review.value.createdAt}</p>
    	<div id="Rating">
            	<span>
            	<c:choose>
					<c:when test="${review.value.rating.value==5}"><c:set var="imgSrc" value="/imgs/diamondpickaxe.png" scope="page" /></c:when>
					<c:when test="${review.value.rating.value>=4}"><c:set var="imgSrc" value="/imgs/goldpickaxe.png" scope="page" /></c:when>
					<c:when test="${review.value.rating.value>=3}"><c:set var="imgSrc" value="/imgs/ironpickaxe.png" scope="page" /></c:when>
					<c:when test="${review.value.rating.value>=2}"><c:set var="imgSrc" value="/imgs/stonepickaxe.png" scope="page" /></c:when>
					<c:when test="${review.value.rating.value>=1}"><c:set var="imgSrc" value="/imgs/woodpickaxe.png" scope="page" /></c:when>
				</c:choose>
				<c:forEach var="img" begin="1" end="${review.value.rating.value}" step="1" varStatus ="status">
					<img src=${pageContext.servletContext.contextPath}${imgSrc}  width="30px" style="vertical-align:text-bottom;" /> 
				</c:forEach>
				</span>
		</div>
        <fieldset><legend>Review Text</legend>
        	<p id="ReviewText" >${review.value.reviewText.value } </p>
        </fieldset>
        <div style="text-align: center;" ><input id="Approving" type="button" value="Approve" /><input id="Deny" type="button" value="Deny" /></div>
    </div>
    </c:forEach>
</div>