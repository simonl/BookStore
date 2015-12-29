<!-- **************************************** -->
<!-- *                                      * -->
<!-- *                                      * -->
<!-- * Author:: Edward Gagnon               * -->
<!-- *                                      * -->
<!-- **************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="noDatabase" class="contentbox ui-corner-ll">
    <div id="noDatabaseHeader" class="contentheaders ui-corner-ll">
        Oops! The database is under maintenance.
    </div>
    <div style="text-align: center;">
    	<img alt="" src="<c:url  value="/imgs/data_bsod.gif" />"><br />
    	${ stackTrace }
    </div>
 </div>
