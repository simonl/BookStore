<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="margin-botom:5%; text-align:center">
	<fieldset>
		<legend>Choose a Date:</legend>
		<form method="get" action="<c:url  value="/ChooseReportDatesServlet" />">
			${ reportDatesError }
    		<label name="startDateLabel" >Start Date: </label>
    		<input type="text" name="dateStart" id="dateStart" 
    			   class="uiDateChooser" placeholder="mm/dd/yyyy" 
    			   value="${ dateStart }" size="12" />
			<label name="endDateLabel" >End Date: </label>
			<input type="text" name="dateEnd" id="dateEnd" 
				   class="uiDateChooser" placeholder="mm/dd/yyyy"
				   value="${ dateEnd }" size="12" />
			<input type="submit" value="Report timespan" />
		</form>
	</fieldset>
</div>