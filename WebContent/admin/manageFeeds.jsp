<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%-- **************************************** --%>
<%-- *                                      * --%>
<%-- * Author: Simon Langlois               * --%>
<%-- *                                      * --%>
<%-- **************************************** --%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="contentbox ui-corner-ll">		

	<div class="contentheaders ui-corner-ll">RSS Feeds</div>

	<div style="text-align:center" id="surveyManagement"  >
		<p>${feedManagementError}</p>

		<div>
			<form style="display:inline;float:right;margin-right:5%" 
				  action="<c:url value="/FeedManagementServlet" />" 
				  method="get">
				<input type="text" name="searchKey" placeholder="feed's url"/>
				<input type="Submit" value="Search" />
			</form>
		</div>
		
		<c:if test="${ empty param.searchKey }">
			<form action="<c:url value="/CreateNewFeedServlet" />"
				name="createSurvey" method="post">
				<table border="1" style="width: 90%; margin: 5%; margin-top: 0%">
					<tr>
						<td>
							<label for="url">URL: </label>
							<input type="text" name="url" />
							<input type="Submit" value="Create new feed" />
						</td>
					</tr>
				</table>
			</form>
		</c:if>
		
		<table border="2" style="width:90%;margin:5%;margin-top:0%">
			<c:forEach var="feed" items="${feeds}">
				<tr>
					<td style="padding:2%">
						<H3>${ feed.value.url }</H3>
						<div class="rssFeed" feedURL="${ feed.value.url }"></div><BR/>
						<c:choose>
							<c:when test="${ feed.key.value != managerCurrentFeed.value }">
								<form style="display:inline"
									  action="<c:url value="/ChangeCurrentFeedServlet" />"
									  method="post">
									<input type="hidden" name="feedId" value="${ feed.key }" />
									<input type="Submit" value="Set to current survey" />
								</form>
							</c:when>
							<c:otherwise>
								<button disabled="disabled" >Already is current feed</button>
							</c:otherwise>
						</c:choose>
					</td> 
				</tr>
			</c:forEach>			
		</table>
	</div>
</div>
