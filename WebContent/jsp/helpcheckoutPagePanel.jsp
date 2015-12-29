<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="helpPanel"  class="contentbox ui-corner-ll"  style="" > 
	<div class="contentheaders ui-corner-ll">
	       Help - ${displayString}
	</div><br />

	<div>
        <img class="helpImage" alt="" style="width:50%"
        	src="<c:url value="/imgs/help/helpCheckout.png" />"  />
		<p class="paragraph" >
		<b class="paragraphStarter" >T</b>his is the final step in the process of acquiring more books.
		</p><br />
		<p class="paragraph" >
		<b class="paragraphStarter" >Y</b>ou will find on this page an overview of the books you
			 are going to purchase and how much it is going to cost you.
		</p><br />
		<p class="paragraph" >
		<b class="paragraphStarter" >T</b>o finalize your purchase, you must also enter you credit card information.
			 We do not hold onto this sensitive information, so you will have to enter it every time.
		</p><br />
		<p class="paragraph" >
		<b class="paragraphStarter" >U</b>pon confirmation, you will be sent an email detailing the purchase you just made.
		</p><br />
		<p class="paragraph" >
		<b class="paragraphStarter" >Warning. </b> We do not offer any refund, so you will never see the money that you spend on this page ever again.
		</p><br />
		
		</div>
		<form action="<c:url  value="/HelpIndexServlet" />" style="clear: both;">
		<br /><br /><br />
		<input type="submit" value="Return" style="font-size: 150%; float: right;" class="rightSubmit" />
		</form>
		<br style="clear: both" /><!-- Makes the main container grow to size. -->
</div>