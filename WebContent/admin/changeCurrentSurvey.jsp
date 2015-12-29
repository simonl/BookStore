<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource dataSource="jdbc/g2w12"/>
<sql:query var="surveyQuestion" sql="select * from survey;"></sql:query> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change current survey</title>
<%@ include file="/jsp/javascripts.jsp" %>
</head>

<body>

	<c:import url="/admin/adminMenu.jsp" />
	${message}
	<div>
			<form action="<c:url  value="/ChangeCurrentSurveyServlet" />" method="post">
			<table border="2">
				<c:forEach var="question" items="${surveyQuestion.rows}">
				<tr> <td> 
						<p> <input type="radio" name="surveyId" value="${question.id}">(${question.id})   ${question.question} </p>
						
						<sql:query var="surveyChoice" sql="select * from survey_choice where survey_id = ${question.id};"></sql:query>
						
						<c:forEach var="choice" items="${surveyChoice.rows}">
						<p>      ${choice.choice}</p>
						</c:forEach>
						<input type="Submit" value="Change the current survey">
				</td> </tr>
				</c:forEach>
			</table>
			</form>
	</div>

</body>
</html>