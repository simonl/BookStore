<!-- **************************************** -->
<!-- *                                      * -->
<!-- *   Date: Claimed on April 5th 2012    * -->
<!-- *                                      * -->
<!-- * Author: Edward Gagnon                * -->
<!-- *                                      * -->
<!-- **************************************** -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="helpPanel"  class="contentbox ui-corner-ll"  style="" > 
	<div class="contentheaders ui-corner-ll">
	      ${displayString}
	</div><br />

	<div>
        
		<p class="paragraph"  style="text-align: center;" >
		<b class="paragraphStarter">Y</b>ou've tried to navigate to a page that doesn't exist! 
		</p><br style="clear: both" />

		<img class="helpImage" alt="" src="<c:url value="/imgs/data_bsod.gif" />"  />
		
		</div>
		<form action="<c:url  value="/WelcomeServlet" />" style="clear: both;">
		<br /><br /><br />
		<input type="submit" value="Return" style="font-size: 150%; float: right;" class="rightSubmit" />
		</form>
		<br style="clear: both" /><!-- Makes the main container grow to size. -->
</div>