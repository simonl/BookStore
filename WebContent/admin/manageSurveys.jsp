<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="javascripts/addChoiceSurvey.js" type="text/javascript"></script>
<div class="contentbox ui-corner-ll">		

	<div class="contentheaders ui-corner-ll">Surveys</div>

	<div style="text-align:center" id="surveyManagement"  >
		<p>${surveyManagementError}</p>

		<div>
			<form style="display:inline;float:right;margin-right:5%" 
				  action="<c:url value="/SurveyManagementServlet" />" 
				  method="get">
				<input type="text" name="searchKey" placeholder="survey's question"/>
				<input type="Submit" value="Search" />
			</form>
		</div>
		
		<c:if test="${ empty param.searchKey }">
			<form action="<c:url value="/CreateNewSurveyServlet" />"
				name="createSurvey" method="post">
				<table style="border:1px solid black; width: 90%; margin: 5%; margin-top: 0%">
					<tr>
						<td>
							<table border="0" id="createSurveyChoices">
								<tr>
									<td style="padding: 2%" width="35%">
									<label for="question">Question:</label></td>
									<td width="25%"><input type="text" name="question" /></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="choice">Choice: </label></td>
									<td><input type="text" name="choice" /></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="choice">Choice: </label></td>
									<td><input type="text" name="choice" /></td>
									<td></td>
								</tr>
							</table> <input type="button" onclick="addChoice();" value="+Add Choice">
							<input type="Submit" value="Create new survey" /></td>
					</tr>
				</table>
			</form>
		</c:if>
		
		<table style="width:90%;margin:5%;margin-top:0%">
			<c:forEach var="survey" items="${surveys}">
				<tr>
					<td style="padding:2%;border-top:2px solid #6C8CD5;'">
						<H3>${ survey.value.question }</H3>
						
						<c:forEach var="choice" items="${survey.value.choices.value}">
							<p>${choice} (${ survey.value.votes.value[choice] })</p>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ survey.key.value != managerCurrentSurvey.value }">
								<form style="display:inline"
									  action="<c:url value="/ChangeCurrentSurveyServlet" />"
									  method="post">
									<input type="hidden" name="surveyId" value="${ survey.key }" />
									<input type="Submit" value="Set to current survey" />
								</form>
							</c:when>
							<c:otherwise>
								<button disabled="disabled" >Already is current survey</button>
							</c:otherwise>
						</c:choose>
					</td> 
				</tr>
			</c:forEach>
			
		</table>
	</div>
</div>
