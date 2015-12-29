<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- **************************************** --%>
<%-- *                                      * --%>
<%-- * Author: Simon Langlois               * --%>
<%-- *                                      * --%>
<%-- **************************************** --%>

<div id="viewbook" class="contentbox ui-corner-all">

    <div id="viewbookHeader" class="contentheaders ui-corner-ll">
    	Your EBooks
    </div>

	<div style="text-align:center" id="downloadEbooks"  >
		<p>${ EBookDownloadError }</p>
	    <c:choose>
	    <c:when test="${ empty books }">
	    	<H3>You do not possess any ebooks</H3>
	    </c:when>
	    <c:otherwise>
		    <TABLE border="1" style="width: 90%; margin: 5%; margin-top: 0%">
		    	<TR>
		    		<TH>Title</TH>
		    		<TH>Formats</TH>
		    		<TH></TH>
		    	</TR>
		    	<c:forEach var="book" items="${ books }">
		    	<form method="get" action="<c:url value="/DownloadEBookServlet" />" >
		    		<TR>
		    			<TD>${ data[book].title }</TD>
		    			<TD>
		    				<select name="eformat" placeholder="Format" class="ui-corner-ll  pageRequired requried" title="Select a format">
		                        <c:forEach var="eformat" items="${ data[book].eformats }">
									<option value="${ eformat }">
										${ eformat }
									</option>
								</c:forEach>
							</select>
		    			</TD>
		    			<TD>
		    				<input type="hidden" name="isbn" value="${ data[book].isbn13 }" />
		    				<input type="submit" value="Download" />
		    			</TD>
		    		</TR>
		    	</form>
		    	</c:forEach>
		    </TABLE>
	    </c:otherwise>
	    </c:choose>
	</div>
</div>