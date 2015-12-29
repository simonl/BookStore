<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="contentbox ui-corner-ll">
    <div class="contentheaders ui-corner-ll">
        ${displayString}
	</div>
	
	
	
	<form id="optionChooser" method="get" action="<c:url  value="/ShowSalesByClientReport" />" >
		<jsp:include page="/jsp/dateChooserPanel.jsp" /><br /><br />
		<c:forEach var="row" items="${clients.rows }" varStatus="status" >
			<c:choose>
				<c:when test="${status.index == 0 }">
					<input type="radio" name="client" value="${row.id}" checked="checked" >${row.first_name } ${row.last_name }</input><br />
				</c:when>
				<c:otherwise>
					<input type="radio" name="client" value="${row.id }" >${row.first_name } ${row.last_name }</input><br />
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
		<br /><br /><br />
		<fieldset><legend>Choose report type</legend>
		<input type="radio" name="option" value="sum" checked="checked" >Sum total sales for client</input>
		<input type="radio" name="option" value="list">List of all books sold by client</input><br /><br /><br /><br /><br />
		<input type="submit" name="submit" value="Next" class="" />
		</fieldset>
	</form>

	
</div>