<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div id="surveypanel" class="box ui-corner-ll" style="text-align:left;">
			<div id="surveypanelHeader" class="boxheaders ui-corner-ll">
				<img src="<c:url  value="/imgs/surveyheader.png" />" class="ui-corner-ll"  />
			</div>
			<p>${surveyData.question}</p>
			<div id="surveyContainer" >
				<c:forEach var="choice" items="${surveyData.choices.value}">
					<p>${choice} || ${percentages[choice]}%
					<div id="surveyBar" style="width:${percentages[choice]}%";></div>
					</p>
				</c:forEach>
				Number of votes: ${sumVotes}
			</div>
</div>
<br />