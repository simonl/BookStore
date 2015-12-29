<!-- **************************************** -->
<!-- *                                      * -->
<!-- *                                      * -->
<!-- * Author:: David Préseault, Edward     * -->
<!-- *          Gagnon, Simon Langlois      * -->
<!-- *                                      * -->
<!-- **************************************** -->
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="welcome" class="contentbox ui-corner-ll">
    <div id="welcomeHeader" class="contentheaders ui-corner-ll">
        ${displayString}
    </div>
    
    <div class="thumbContainer ui-corner-ll" >
    
		<c:if test="${ !(empty booksOfInterest) }">
			<div id="booksofInterestDisplay">
			<H3>Books that might interest you:</H3>
			<TABLE>
			<TR>
			<c:forEach var="recentBook" items="${ booksOfInterest }">
				<TD>
				<a href="<c:url  value="ViewBook?isbn=" />${recentBook.isbn13}" class="noUnderline" >
					<img src="<c:url  value="/bookImages/" />${recentBook.thumbnail}" title="${recentBook.title} by ${recentBook.author}" width=60 height=70/><BR>
				</a>
				</TD>
			</c:forEach>
			</TR> </TABLE>
			</div>
		</c:if>
		
		<div id="bookSalesDisplay">	
			<div id="pager" ><!-- Top -->
			<c:forEach var="book" items="${booksOnSale}" varStatus="status" >
			<c:if test="${status.index % 3 == 0 && !status.first && !status.last}"></div><!-- New Page --><div id="pager" ></c:if>
			 
			<a href="<c:url  value="/ViewBook?isbn=" />${book.isbn13}" class="noUnderline" >
			<div id="sales" class="imageToggler ui-corner-ll"  >
			 	<div id="bookScroll" ><img class="thumb" src="<c:url  value="/bookImages/" />${book.thumbnail}" /></div>
			     <div id="bookInfo" >  
			         <p id="thumbBookTitle">${book.title}</p>
			         <p id="thumbBookAuthor">${book.author}</p>
			         <p id="thumbBookPublisher">${book.publisher}</p>
			         <div class="centered"><span id="thumbBookOriginalPrice">$${book.listPrice}</span><span id="thumbBookSalePrice">$${book.salePrice}</span></div>
			     </div>
			</div></a>
			</c:forEach>
			</div><!-- Bottom -->
	
		
		</div>
		<div id="navagationButtonPanel">
			<div class="nav"><input type="button" id="prev2" href="#" value=" < < < " /><input type="button"  id="next2" href="#" value=" > > > " /></div>
		</div>
	</div>
	<div id="overlay"></div>
 </div>
