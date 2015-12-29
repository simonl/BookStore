<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 
<script type="text/javascript">
var uriCourant = document.location.pathname;
</script> 
-->
<div id="surveypanel" class="box ui-corner-ll" style="text-align:left;">
			<div id="surveypanelHeader" class="boxheaders ui-corner-ll">
				<img src="<c:url  value="/imgs/surveyheader.png" />" class="ui-corner-ll"  />
			</div>
			
			<form action="<c:url  value="/SurveyResultServlet" />" method="post">
				<p> ${currentSurvey.question} </p>
				
				<c:forEach var="choice" items="${currentSurvey.choices.value}">
					<p> <input type="radio" name="answer" value="${choice}"> ${choice}</p>
				</c:forEach>
				<p> <input type="submit" value="Submit"> </p>
				<p> ${surveyMessage}</p>
			</form>
			
			</div>
	<br />