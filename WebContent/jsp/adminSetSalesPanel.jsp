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


    
<div id="welcome" class="contentbox ui-corner-ll">
    <div id="welcomeHeader" class="contentheaders ui-corner-ll">
        ${displayString}
    </div>
    
    	
    
    <div class="thumbContainer ui-corner-ll" >
    <div class="searchPanel">
			<form action="<c:url  value="/AdminShowSalesServlet" />" method="get" >
			<fieldset><legend>Search</legend>
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
					<tr>
						<td></td>
						<td>
							<input type="submit" value="Search" class="rightified" />
						</td>
						<td></td>
						
					</tr>
					
				</table>
				</fieldset>
			</form>
		</div>
		<br/><br/>
		<div id="booksDisplay">
	
			<div id="pager" ><!-- Top -->
			<c:forEach var="row" items="${books}" varStatus="status" >
			<c:if test="${status.index % 5 == 0 && !status.first && !status.last}"></div><!-- New Page --><div id="pager" ></c:if>
			
			<div id="sales" class="imageToggler canChangePrice ui-corner-ll"  >
				
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

			         		 <span id="thumbBookOriginalPrice" class="thumbBookOriginalPrice" >$${row.listPrice}</span><span id="thumbBookSalePrice" class="thumbBookSalePrice">$${row.salePrice}</span>
							<div id="SalesPriceCommandBar">
								<input type="hidden" id="isbn" name="isbn" value="${row.isbn13}" />
								<input type="hidden" id="locationISBN" name="locationISBN" value="<c:url  value="/AlterSalesServlet" />" />
			         		 	<label id="labelSalesPriceInput" >Sales Price in dollars</label><input type="text" id="salePriceInput" value="${row.salePrice}" /><input type="button" value="Change" class="buttonSetSalesPrice" /><input type="button" value="Reset" class="buttonResetSalesPrice" />
			         		</div>

			     </div>
			</div>
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