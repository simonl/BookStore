<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
	  <div id="viewbook" class="contentbox ui-corner-ll">
	<c:import var="xslSheet" url="book.xsl"/>
	<x:transform doc="${xmlString}" xslt="${xslSheet}"/>

	<div id="relatedBooksDisplay">
		<p><span class="viewbookFields">Related Books:</span></p>
		<TABLE style="padding:5px; width:100%">
		<TR>
			<c:forEach var="recentBook" items="${ relatedBooks }">
				<TD style="text-align:center">
				<a href="<c:url  value="ViewBook?isbn=" />${recentBook.isbn13}" class="noUnderline" >
					<img src="<c:url  value="/bookImages/" />${recentBook.thumbnail}" title="${recentBook.title} by ${recentBook.author}" width=60 height=70/><BR>
<%-- 					${recentBook.title}<BR> --%>
<%-- 					<span id ="thumbBookAuthor">${recentBook.author}</span><BR> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${recentBook.listPrice.value == recentBook.salePrice.value}"> --%>
<!-- 							$${recentBook.listPrice} -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<span style="text-decoration:line-through;color:red"> -->
<!-- 								$${recentBook.listPrice} -->
<!-- 							</span> $${recentBook.salePrice} -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
				</a>
				</TD>
			</c:forEach>
			</TR> </TABLE>
			</div>
</div>
<p style="font-family:verdana;font-size:16px;text-decoration:underline;">Reviews</p>
<c:forEach var="r" items="${reviews}" varStatus="reviewCycle">
<c:if test="${(reviewCycle.count%3)==0}">
<c:set var="numOfPages" value="${numOfPages+1}"></c:set></c:if>
	<div id="review${reviewCycle.count}" style="margin-bottom:20px;<c:choose><c:when test="${reviewCycle.count > 3}">display:none;</c:when></c:choose>"
		class="reviewBox ui-corner-ll">
		<div id="reviewHeader" class="reviewheaders ui-corner-ll">
			<div style="float:left; margin-left: 6px;">${r.username}</div>
			<div style="float:right; margin-right: 6px;">
				<c:choose>
					<c:when test="${r.rating.value=='1'}">
						<c:set var="imgSrc" value="/imgs/woodpickaxe.png" scope="page" />
					</c:when>
					<c:when test="${r.rating.value=='2'}">
						<c:set var="imgSrc" value="/imgs/stonepickaxe.png" scope="page" />
					</c:when>
					<c:when test="${r.rating.value=='3'}">
						<c:set var="imgSrc" value="/imgs/ironpickaxe.png" scope="page" />
					</c:when>
					<c:when test="${r.rating.value=='4'}">
						<c:set var="imgSrc" value="/imgs/goldpickaxe.png" scope="page" />
					</c:when>
					<c:when test="${r.rating.value=='5'}">
						<c:set var="imgSrc" value="/imgs/diamondpickaxe.png" scope="page" />
					</c:when>
				</c:choose>
				<c:forEach var="i" begin="1" end="${r.rating.value}" step="1"
					varStatus="status">
					<img src=${pageContext.servletContext.contextPath}${imgSrc}
						title="Rating of ${r.rating}/5!" width="30px" />
				</c:forEach>
			</div>
		</div>
		<p style="margin-left: 8px;">${r.text}</p>
		<p align="right" style="margin-right: 8px;">
			<span class="viewbookFields">Reviewed on:</span> ${r.createdAt}
			</p>
	</div>
</c:forEach>
<c:if test="${totalReviews>0}"> 
<p style="font-family: verdana; font-size: 16px;">«<a href="javascript:void(0)" onclick="prevDiv();">Previouis Page</a>
 <c:forEach var="i" begin="1" end="${numOfPages}" step="1">
 | <a id="numOfPage${i}" href="javascript:void(0)" onclick="goToPage(${i});">${i}</a>
 </c:forEach>
  | <a href="javascript:void(0)" onclick="nextDiv();">Next Page</a>»</p>
  </c:if>
<c:choose>
	<c:when test="${ !session.loggedOnUser.isNull}">
		<br><p style="font-family: verdana; font-size: 16px;">Would you like
			to review this book?</p>
		<div id="review" style="text-align: center;"
			class="contentbox ui-corner-ll">
			<div id="reviewHeader" class="reviewheaders ui-corner-ll">
				Review this book</div>
			<form method="post" action="<c:url  value="/PostReviewServlet" />"
				name="reviewForm">
				<br>Rating of:
				<c:forEach var="i" begin="1" end="5" step="1" varStatus="status">
					<img
						src="${pageContext.servletContext.contextPath}/imgs/emptypickaxe.png"
						id="ratingImage${i}" onmouseover="hoverRating(${i});"
						onclick="document.reviewForm.rating.value='${i}'"
						title="Rating of ${i}/5!" width="30px" />
				</c:forEach>
				<br> ${ postReviewError } <br> <input type="hidden"
					name="isbn" value="${ book.isbn13 }" /> <input type="hidden"
					value="1" name="rating" />
				<textarea rows="10" cols="50" name="text"></textarea>
				<br> <br> <input type="submit" value="Review!" /> <input
					type="reset" />
			</form>
			<br>
		</div>
	</c:when>
	<c:otherwise>
		<p style="font-family: verdana; font-size: 16px;">You must be
			logged in to write a review</p>
	</c:otherwise>
</c:choose>	
<input type="hidden" id="numberOfPagesValue" value="${numOfPages * 3}" />
<script src="javascripts/reviewbook.js" type="text/javascript"></script>
<script src="javascripts/reviewCycle.js" type="text/javascript"></script>
