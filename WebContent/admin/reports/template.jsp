<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="contentbox ui-corner-ll">
    <div class="contentheaders ui-corner-ll">
        ${displayString}
	</div>
	<div style="padding:2%">
	<jsp:include page="/admin/adminReportDisplayRequiredInfoPanel.jsp" />	
	<jsp:include page="/admin/reports/dateChooser.jsp" />
	<jsp:include page="${ middleReportContainerPanelPath }" />
	</div>
</div>