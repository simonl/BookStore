<%-- Author Evgeniy Li --%>
<%-- This page displays book and its information that you want to edit--%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="javascripts/reviewbook.js" type="text/javascript"></script>
<script src="javascripts/reviewCycle.js" type="text/javascript"></script>
<div id="viewbook" class="contentbox ui-corner-ll">
    <div id="viewbookHeader" class="contentheaders ui-corner-ll">
    Manager > Search Books
    </div><br>
    <br> 
    
    <table style="display:inline;float:right;margin-right:5%">
	    <tr>
	    	<td>
	    		<form action="<c:url  value="/EditBookServlet?isbn=${book.isbn13}" />" method="post">
			    	<input type="submit" value="Edit">
			    </form>
	    	</td>
	    	<td>
	    		<form action="<c:url value="/DeleteBookServlet?isbn=${ book.isbn13 }" />" method="post">
				    	<input type="submit" value="Delete">
				</form>
	    	</td>
	    </tr>
    </table>
    
    
    <br>    
    <a href="${pageContext.servletContext.contextPath}/bookImages/covers/${book.isbn13}.jpg" target="_self"><img id="thumbnail-image" src="${pageContext.servletContext.contextPath}/bookImages/thumbnails/${book.isbn13}.jpg" border="1" align="left" style="margin:8px;"/></a>
	<c:choose>
	    <c:when test="${empty book.eformats}"><c:set var="bookType" value="(Paper)"></c:set></c:when> 
		<c:otherwise><c:set var="bookType" value="(EBook)"></c:set></c:otherwise>
	</c:choose>
	<p style="font-weight:bold;font-size:16px;">${book.title} ${bookType}</p>
	<p><span class="viewbookFields">Author:</span> ${book.author}</p>
	
	<p><span class="viewbookFields">List price:</span> $${book.listPrice}  <span class="viewbookFields">Sale price:</span> $${book.salePrice}  <span class="viewbookFields"> Wholesale price:</span> $${book.wholesalePrice}
		    	
    	
<hr style="border:1px black solid;">
<p><span class="viewbookFields">Publisher:</span> ${book.publisher}</p>
<p><span class="viewbookFields">Genre:</span> ${book.genre}</p>
	<c:if test="${!empty book.eformats}">
		<p><span class="viewbookFields">EBook Formats Available:</span>
		<c:forEach var="eBookFormat" varStatus="status" items="${book.eformats}">${eBookFormat}<c:if test="${!status.last}">,</c:if>
		</c:forEach>
		</p>
	</c:if>
<p><span class="viewbookFields">Number of Pages:</span> ${book.numberOfPages}</p>
<p><span class="viewbookFields">ISBN 10:</span> ${book.isbn10}</p>
<p><span class="viewbookFields">ISBN 13:</span> ${book.isbn13}</p>
<p><span class="viewbookFields">Weight:</span> ${book.weight}g</p>
<p><span class="viewbookFields">Dimensions:</span> ${book.dimensions.length}cm x ${book.dimensions.width}cm x ${book.dimensions.height}cm</p>

    <p><span class="viewbookFields">Description:</span></p>
    <p class="viewbookDescription">${book.description}</p>
    <p><span class="viewbookFields">Reviews:</span> ${totalReviews}</p>
    <p><span class="viewbookFields">Number of books:</span> ${ book.numberOfBooks.isNull ? 0 : book.numberOfBooks.value }</p>
    	 <!--
			<div id="relatedBooksDisplay">
			<p><span class="viewbookFields">Related Books:</span></p>
			<TABLE style="padding:5px; width:100%">
			<TR>
			<c:forEach var="recentBook" items="${ relatedBooks }">
				<TD style="text-align:center">
				<a href="<c:url  value="ViewBook?isbn=" />${recentBook.isbn13}" class="noUnderline" >
					<img src="<c:url  value="/bookImages/" />${recentBook.thumbnail}" width=60 height=70/><BR>
					${recentBook.title}<BR>
					<span id ="thumbBookAuthor">${recentBook.author}</span><BR>
					<c:choose>
						<c:when test="${recentBook.listPrice.value == recentBook.salePrice.value}">
							$${recentBook.listPrice}
						</c:when>
						<c:otherwise>
							<span style="text-decoration:line-through;color:red">
								$${recentBook.listPrice}
							</span> $${recentBook.salePrice}
						</c:otherwise>
					</c:choose>
				</a>
				</TD>
			</c:forEach>
			</TR> </TABLE>
			</div>
		 -->
</div>

<c:if test="${!empty reviews}"><p style="font-family:verdana;font-size:16px;text-decoration:underline;">Reviews</p></c:if>
<c:forEach var="r" items="${reviews}" varStatus="reviewCycle">
<c:if test="${(reviewCycle.count%3)==0}"><c:set var="numOfPages" value="${numOfPages} | ${reviewCycle.count/3}"></c:set></c:if>
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
<!-- 
<p style="font-family: verdana; font-size: 16px;"><a href="javascript:void(0)" onclick="prevDiv();"> «Previouis Page </a>${numOfPages}<a href="javascript:void(0)" onclick="nextDiv();"> | Next Page»</a></p>
<c:choose>
	<c:when test="${!empty user}">
		<p style="font-family: verdana; font-size: 16px;">Would you like
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
 -->