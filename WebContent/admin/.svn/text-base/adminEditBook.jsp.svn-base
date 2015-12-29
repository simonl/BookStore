<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="javascripts/reviewbook.js" type="text/javascript"></script>
<script src="javascripts/reviewCycle.js" type="text/javascript"></script>
<script src="javascripts/addEBookFormats.js" type="text/javascript"></script>

<script type="text/javascript">
function check_other(option_selected) {
  if(option_selected == 'other') {
    document.getElementById('genre').style.display = 'block';
  } else {
    document.getElementById('genre').style.display = 'none';
  }
}
window.onload = function() {
  document.getElementById('genre').style.display = 'none';
}
</script>

<div id="viewbook" class="contentbox ui-corner-ll">
    <div id="viewbookHeader" class="contentheaders ui-corner-ll">
    Manager > Book Management 
    </div><br>
    
    <form action="<c:url  value="/AdminEditBookServlet" />" method="post" enctype="multipart/form-data">
    <p><span class="viewbookFields">Thumnail:</span><input type="file" name="thumbnail" value="${book.thumbnail}"></p>
    <p><span class="viewbookFields">Cover:</span><input type="file" name="cover" value="${book.cover}"></p> 
    <a href="${pageContext.servletContext.contextPath}/bookImages/covers/${book.isbn13}.jpg" target="_self"><img id="thumbnail-image" src="${pageContext.servletContext.contextPath}/bookImages/thumbnails/${book.isbn13}.jpg" border="1" align="left" style="margin:8px;"/></a>
	<p style="font-weight:bold; font-size:16px;">Title:<textarea rows="2" cols="25" name="title">${book.title}</textarea>${bookType}</p>
	<p><span class="viewbookFields">Author:</span> <input type="text" name="author" value="${book.author}"></p>
	 
	<table>
		<tr>
			<td>
				<span class="viewbookFields">List price:</span><input type="text" name="listPrice" value="${book.listPrice}" size="2">$			
			</td>
			<td>
				<span class="viewbookFields">Sale price:</span><input type="text" name="salePrice" value="${book.salePrice}" size="2">$			
			</td>
			<td>
				<span class="viewbookFields">Wholesale price:</span><input type="text" name="wholesalePrice" value="${book.wholesalePrice}" size="2">$
			</td>
		</tr>
	</table>
	    	
<hr style="border:1px black solid;">
<p><span class="viewbookFields">Publisher:</span><input type="text" name="publisher" value="${book.publisher}"></p>

<p><span class="viewbookFields">Genre:</span><select name="genre" onchange="check_other(this.options[this.selectedIndex].value);" >
											 	<c:forEach var="booksGenre" items="${allGenres}">
											 		<c:choose>
											 			<c:when test="${booksGenre == book.genre}">
											 				<option selected>${booksGenre}</option>
											 			</c:when>
											 			<c:otherwise>
															<option value="${book.genre}"> ${booksGenre}
											 			</c:otherwise>
											 		</c:choose>
											 	</c:forEach>
											 		<option value="other">Other
											 </select>
											 <input type="text" name="otherGenre" id="genre" />
											 </p>
	<c:if test="${!empty book.eformats}">
		<table id="addEBookFormats">
		<c:forEach var="eBookFormat" varStatus="status" items="${book.eformats}">
		<c:choose><c:when test="${status.first}">
		<tr><td><span class="viewbookFields">EBook Formats Available:</span></td><td><input type="text" name="eBookFormat" value="${eBookFormat}" size="2"></td></tr>
		</c:when><c:otherwise>
		<tr><td></td><td><input type="text" name="eBookFormat" value="${eBookFormat}" size="2"><input type="button" value="X" onclick="delEBook(this);"></td></tr>
		</c:otherwise>
		</c:choose>
		</c:forEach>
		<tr><td></td><td><input type="button" onclick="addEBook();" value="+Add EBook" /></td></tr>
	</table>
	</c:if>
<p><span class="viewbookFields">Number of Pages:</span><input type="text" name="numberOfPages" value="${book.numberOfPages}"></p>
<p><span class="viewbookFields">ISBN 10: ${book.isbn10}</span><input  id="isbn10" type="hidden" name="isbn10" value="${book.isbn10}"></p>
<p><span class="viewbookFields">ISBN 13: ${book.isbn13}</span><input id="isbn13" type="hidden" name="isbn13" value="${book.isbn13}"></p>
<p><span class="viewbookFields">Weight:</span><input type="text" name="weight" value="${book.weight}" size="4">g</p>
<p><span class="viewbookFields">Dimensions:</span>
	<!-- Dimensions<input type="text" name="dimensions" value="${book.dimensions}">  -->
	Length<input type="text" name="length" value="${book.dimensions.length}" size="3">cm x 
	Width<input type="text" name="width" value="${book.dimensions.width}" size="3">cm x
	Height<input type="text" name="height" value="${book.dimensions.height}" size="3">cm
</p>

    <p><span class="viewbookFields">Description:</span></p>
    <p class="viewbookDescription"><textarea rows="8" cols="50" name="description">${book.description}</textarea></p>
    <p><span class="viewbookFields">Number of Books:</span> 
    	<input type="checkbox" name="hasNumberOfBooks" ${ book.numberOfBooks.isNull ? null : "checked='checked'" } />
    	<input type="text" name="numberOfBooks" value="${ book.numberOfBooks.isNull ? 0 : book.numberOfBooks.value }">
    </p>
    <p><span class="viewbookFields">Reviews:</span> ${totalReviews}</p>
    <br>
    <input type="submit" value="Save changes"> <input style="display:inline;float:right;margin-right:5%" type="reset" value="Reset">
    <br>
    <br>
</form>
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
	
