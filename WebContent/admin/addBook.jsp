<%-- Author Evgeniy Li --%>
<%-- this page allows to add a new book on the database for manager --%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="javascripts/addEBookFormats.js" type="text/javascript"></script>

<%--Script used to display an input box of genre is other --%>
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


<%--Form to add a book --%>
<div class="contentbox ui-corner-ll">		

	<div class="contentheaders ui-corner-ll">Add Book</div>
	
		<div style="text-align:center" id="surveyManagement">
		
			<div >
					<form action="<c:url  value="/AddBookServlet" />" method="post" enctype="multipart/form-data">
							<p> Enter book information: </p>
							<table style="text-align:left;margin-left:10px;">
							<tr> 
								<td>Title :</td> 
								<td><input type="text" name="title" value="${title}"> ${messageTitle}</td>
							</tr>
							<tr>
								<td>Author :</td>
								<td> <input type="text" name="author" value="${author}"> ${messageAuthor}</td>
							</tr>
							<tr>
								<td>Publisher :</td>
								<td><input type="text" name="publisher" value="${publisher}">${messagePublisher}</td>
							</tr>
							<tr>
								<td>ISBN 10 number :</td>
								<td><input id="isbn10" type="text" name="isbn10" placeholder="1111111111" value="${isbn10}"> ${messageIsbn10}</td>
							</tr>
							<tr>
								<td>ISBN 13 number :</td>
								<td><input id="isbn13" type="text" name="isbn13" placeholder="111-1111111111" value="${isbn13}"> ${messageIsbn13}</td>
							</tr>
							<tr>
								<td>Genre :</td>
								<td>
									<select onchange="check_other(this.options[this.selectedIndex].value);" name="genre">
										<c:forEach var="booksGenre" items="${allGenres}">
											<option value="${booksGenre}"> ${booksGenre}
										</c:forEach>
											<option value="other">Other
									</select>
									<input type="text" name="otherGenre" id="genre" value="${genre}"/> ${messageGenre}
								</td>
								
							</tr>
							<tr>
								<td>Description :</td>
								<td><textarea rows="8" cols="50" name="description" value="${description}"></textarea></td>
							</tr>
							<tr>
								<td>Number of pages :</td>
								<td><input type="text" name="numberofpages" value="${numberOfPages}">${messageNumberOfPages}</td>
							</tr>
							<tr>
								<td>Weight :</td>
								<td><input type="text" name="weight" value="${weight}">${messageWeight}</td>
							</tr>
							<tr>
								<td>Dimensions : </td>
								<td> Length <input type="text" name="length" placeholder="10.0" size="2" value="${length}">cm x Width<input type="text" name="width" placeholder="10.0" size="2" value="${width}">cm x Height<input type="text" name="height" placeholder="10.0" size="2" value="${height}">cm </td>
								${messageDimensions}
							</tr>
							<tr>
								<td></td>
								<td>${messageDimensions}</td>
							</tr>
							<tr>
							 	<td>Thumbnail :</td>
							 	<td><input type="file" name="thumbnail"></td>
							</tr>
							<tr>
							 	<td>Cover :</td>
							 	<td><input type="file" name="cover"></td>
							</tr>
							<tr>
							 	<td>List price :</td>
							 	<td><input type="text" name="listprice" value="${listPrice}"> ${messageListPrice}</td>
							</tr>
							<tr>
							 	<td>Sale price :</td>
							 	<td><input type="text" name="saleprice" value="${salePrice}"> ${messageSalePrice} ${messagePrice}</td>
							</tr>
							<tr>
							 	<td>Wholesale price :</td>
							 	<td><input type="text" name="wholesaleprice" value="${wholesalePrice}"> ${messageWholesalePrice}</td>
							</tr>
							<tr>
							 	<td>Number of books :</td>
							 	<td><input type="text" name="numberofbooks" value="${numberOfBooks}"> ${messageNumberOfBooks}</td>
							</tr>
						</table>
						<table id="addEBookFormats" style="text-align:left;margin-left:10px;">
							 	<tr>
							 		<td>EBook formats: &nbsp;&nbsp;&nbsp;&nbsp;</td>
							 	</tr>
							 	<tr>
							 		<td></td>
							 	</tr>
							 	<tr>
							 		<td></td>
							 		<td><input type="button" onclick="addEBook();" value="+Add EBook" /></td>
							 	</tr>
						</table>
						<br />
						<input type="submit" value="Add Book">
						<br /><br />
				</form>
			</div>
	</div>
</div>