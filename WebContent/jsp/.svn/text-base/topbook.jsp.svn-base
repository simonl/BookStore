<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div id="topbookspanel" class="box ui-corner-ll">
			<div id="topbookspanelHeader" class="boxheaders ui-corner-ll">
				<img src="<%= response.encodeURL(request.getContextPath() + "/imgs/topbooksheader.png")%>" class="ui-corner-ll"  />
			</div>
			
			<c:forEach var="recentBook" items="${recentBooks}">
				<a href="<c:url  value="ViewBook?isbn=" />${recentBook.isbn13}" class="noUnderline" >
				<p> 
					<img src="<c:url  value="/bookImages/" />${recentBook.thumbnail}" width=60 height=70/>
					<br/>${recentBook.title}
					<br/> <span id ="thumbBookAuthor">${recentBook.author}</span>
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
				</p>
				</a>
			</c:forEach>
			
		</div>
		<br />