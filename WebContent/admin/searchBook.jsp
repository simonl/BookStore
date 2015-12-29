<%-- Author Evgeniy Li --%>
<%--form to search for a book --%>
<%--display for searched books after clicking on the search button the first time--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="contentbox ui-corner-ll">		

	<div class="contentheaders ui-corner-ll">Search Book</div>

	<div style="text-align:center" id="surveyManagement"  >


		<div>
			<form action="<c:url  value="/SearchBookServlet" />" method="get">
			<table border="0" width="100%">
			<tr>
			<td align="right"></td><td><input type="hidden" name="ok" value="ok"/></td>
			</tr><tr>
			<td align="right">Book Title:</td><td><input type="text" name="title" placeholder="Book Title" /></td>
			</tr><tr>
			<td align="right">Author:</td><td><input type="text" name="author" placeholder="Author" /></td>
			</tr><tr>
			<td align="right">Publisher:</td><td><input type="text" name="publisher" placeholder="Publisher" /></td>
			</tr><tr>
			<td align="right">ISBN 13 #:</td><td><input type="text" name="isbn" placeholder="ISBN 13 #" /></td>
			</tr>
			</table>
			<input type="submit" value="Search" />
			</form>
		</div>
		<br/><br/>
	
	
			<c:if test="${!empty ok}"> <%--test if the search button was clicked the first time --%>
					<div id="booksDisplay">	
						<div id="pager" ><!-- Top -->
						<c:forEach var="row" items="${books}" varStatus="status" >
						<c:if test="${status.index % 5 == 0 && !status.first && !status.last}"></div><!-- New Page --><div id="pager" ></c:if>
						
						<a href="<c:url  value="/AdminShowBookServlet?isbn=" />${row.isbn13}" class="noUnderline" >
						<div id="sales" class="imageToggler ui-corner-ll"  >
						 	<div id="bookScroll" >
						 		<c:choose>
						 			<c:when test="${!empty row.thumbnail && row.thumbnail != '' }">
						 				<img class="thumb" src="<c:url  value="/bookImages/" />${row.thumbnail}" />
						 			</c:when>
						 			<c:otherwise>
						 				<img class="thumb" src="<c:url  value="/bookImages/noImage.jpg" />" />
						 			</c:otherwise>
						 		</c:choose>
						 	</div>
						     <div id="bookInfo" >  
						         <p id="thumbBookTitle">${row.title}</p>
						         <p id="thumbBookAuthor">${row.author}</p>
						         <p id="thumbBookPublisher">${row.publisher}</p>
						         <table style="display:inline">
								    <tr>
								    	<td>
								    		<form action="<c:url  value="/EditBookServlet?isbn=${row.isbn13}" />" method="post">
										    	<input type="submit" value="Edit">
										    </form>
								    	</td>
								    	<td>
								    		<form action="<c:url value="/DeleteBookServlet?isbn=${row.isbn13 }" />" method="post">
				    							<input type="submit" value="Delete">
											</form>
								    	</td>
								    </tr>
							    </table>
						     </div>
						</div></a>
						</c:forEach>
						</div><!-- Bottom -->
				
					
					</div>
					<br /><br />
					<div id="navagationButtonPanel">
						<div class="nav"><input type="button" id="prev2" href="#" value=" < < < " /><input type="button"  id="next2" href="#" value=" > > > " /></div>
					</div>
			</c:if>
		
	</div>
	
</div>