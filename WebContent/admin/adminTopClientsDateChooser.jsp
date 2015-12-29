<!-- **************************************** -->
<!-- *                                      * -->
<!-- *   Date: Claimed on April 5th 2012    * -->
<!-- *                                      * -->
<!-- * Author: Edward Gagnon                * -->
<!-- *                                      * -->
<!-- **************************************** -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="contentbox ui-corner-ll">
    <div class="contentheaders ui-corner-ll">
        ${displayString}
	</div>
	
	
	
	<form id="optionChooser" method="get" action="<c:url  value="/TopClientsSellersReport" />" >
		<jsp:include page="/jsp/dateChooserPanel.jsp" /><br /><br />
		<input type="submit" name="submit" value="Next" class="" />
	</form>

	
</div>