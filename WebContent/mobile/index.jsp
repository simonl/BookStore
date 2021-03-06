<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>:: Welcome to the MineBooks online Bookstore!</title>
	<LINK REL="SHORTCUT ICON" HREF="favicon.ico">
	<%@ include file="/jsp/css.jsp" %>
</head>
<body>





<!-- **************************************** -->
<!-- *                                      * -->
<!-- *                                      * -->
<!-- * Author:: Edward Gagnon,              * -->
<!-- *                                      * -->
<!-- *                                      * -->
<!-- **************************************** -->

    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    
<div id="containerMobile" >
<a href="<c:url  value="/ShowBooksMobileServlet" />"  class="homeButton ui-icon ui-icon-home" style="float: left; margin: 2px;"  ></a>
    <div id="mobile" class="contentheadersMobile ui-widget-header ">
        ${displayString}
    </div>
    
    <div id="searchbar" style="display:inline;">
    
	<div id="searchbarTop">
	
		<P>
		
		<form name="searchform" method="get" action="<c:url  value="/ShowBooksMobileServlet" />">
			<input type="text" placeholder="Search for book's title"  name="title" size="30" />
			<input type="submit" src="<c:url  value="/imgs/searchBtn.png" />" value="Search" /> 
		</form>
		</P>
	</div>
</div><br /><br /><br />
<br />

    
    
    <div class="thumbContainerMobile" >
    
		<c:if test="${ bestSellers != null }">
			<div id="bestSellersDisplayMobile">
			<H3>Best sellers in this category:</H3>
			<TABLE> 
			<TR>
			<c:forEach var="recentBook" items="${ bestSellers }">
				<TD>
				<a href="<c:url  value="ViewBook?isbn=" />${recentBook.isbn13}" class="noUnderline" >
					<img src="<c:url  value="/bookImages/" />${recentBook.thumbnail}" title="${recentBook.title} by ${recentBook.author}" width=40 height=40/><BR>
				</a>
				</TD>
			</c:forEach>
			</TR> </TABLE>
			</div>
		</c:if>
		
		<div id=navigationButtonPanelMobile>
			<div class="nav"><input type="button" id="prev2" href="#" value=" < < < " /><input type="button"  id="next2" href="#" value=" > > > " /></div>
		</div><br /> <br /><br /> <br />
    
		<c:if test="${ empty books }">
			<H3 style="text-align:center">There are no books satisfying your query</H3>
		</c:if>
		
		<div id="booksDisplay">	
			<div id="pager" ><!-- Top -->
			<c:forEach var="row" items="${books}" varStatus="status" >
			<c:if test="${status.index % 4 == 0 && !status.first && !status.last}"></div><!-- New Page --><div id="pager" ></c:if>
			
<%-- 			<a href="<c:url  value="/ViewBook?isbn=" />${row.isbn13}" class="noUnderline" > --%>
			<div class="salesMobile"   >
			<table><tr>
			 	<td id="bookScrollMobile" >
			 		<c:choose>
			 			<c:when test="${!empty row.thumbnail && row.thumbnail != '' }">
			 				<img class="thumbMobile" src="<c:url  value="/bookImages/" />${row.thumbnail}" />
			 			</c:when>
			 			<c:otherwise>
			 				<img class="thumbMobile" src="<c:url  value="/bookImages/noImage.jpg" />" />
			 			</c:otherwise>
			 		</c:choose>
			 	</td>
			     <td id="bookInfoMobile" >${row.title}<br />
			    		         
			    	<c:choose>
			         	<c:when test="${row.listPrice.value > row.salePrice.value}">
			         		 <div class="centered"><span id="thumbBookOriginalPriceMobile">$${row.listPrice}</span><span id="thumbBookSalePriceMobile">$${row.salePrice}</span></div>
			         	</c:when>
			         	<c:otherwise>
			         		 <div class="centered"><span id="thumbBookSalePriceMobile">$${row.listPrice}</span></div>
			         	</c:otherwise>
			         </c:choose></td></tr>
			</table>
			</div>
<!-- 			</a> -->
			</c:forEach>
			</div><!-- Bottom -->
	
		
		</div>
		<br /><br />

	</div>
 </div>


<%@ include file="/jsp/javascripts.jsp" %>
</body>
</html>