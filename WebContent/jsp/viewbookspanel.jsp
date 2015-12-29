<!-- **************************************** -->
<!-- *                                      * -->
<!-- *                                      * -->
<!-- * Author:: Edward Gagnon, Simon        * -->
<!-- *          Langlois                    * -->
<!-- *                                      * -->
<!-- **************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    
<div id="welcome" class="contentbox ui-corner-ll">
    <div id="welcomeHeader" class="contentheaders ui-corner-ll">
        ${displayString}
    </div>
    
    <div class="thumbContainer ui-corner-ll" >
    
		<c:if test="${ bestSellers != null }">
			<div id="bestSellersDisplay">
			<H3>Best sellers in this category:</H3>
			<TABLE> 
			<TR>
			<c:forEach var="recentBook" items="${ bestSellers }">
				<TD>
				<a href="<c:url  value="ViewBook?isbn=" />${recentBook.isbn13}" class="noUnderline" >
					<img src="<c:url  value="/bookImages/" />${recentBook.thumbnail}" title="${recentBook.title} by ${recentBook.author}" width=60 height=70/><BR>
				</a>
				</TD>
			</c:forEach>
			</TR> </TABLE>
			</div>
		</c:if>
    
		<c:if test="${ empty books }">
			<H3 style="text-align:center">There are no books satisfying your query</H3>
		</c:if>
		
		<div id="booksDisplay">	
			<div id="pager" ><!-- Top -->
			<c:forEach var="row" items="${books}" varStatus="status" >
			<c:if test="${status.index % 5 == 0 && !status.first && !status.last}"></div><!-- New Page --><div id="pager" ></c:if>
			
			<a href="<c:url  value="/ViewBook?isbn=" />${row.isbn13}" class="noUnderline" >
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
			         <c:choose>
			         	<c:when test="${row.listPrice.value > row.salePrice.value}">
			         		 <div class="centered"><span id="thumbBookOriginalPrice">$${row.listPrice}</span><span id="thumbBookSalePrice">$${row.salePrice}</span></div>
			         	</c:when>
			         	<c:otherwise>
			         		 <div class="centered"><span id="thumbBookSalePrice">$${row.listPrice}</span></div>
			         	</c:otherwise>
			         </c:choose>
			     </div>
			</div></a>
			</c:forEach>
			</div><!-- Bottom -->
	
		
		</div>
		<br /><br />
		<div id="navagationButtonPanel">
			<div class="nav"><input type="button" id="prev2" href="#" value=" < < < " /><input type="button"  id="next2" href="#" value=" > > > " /></div>
		</div>
	</div>
	<div id="overlay"></div>
 </div>
