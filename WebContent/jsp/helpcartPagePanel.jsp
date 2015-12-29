<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="helpPanel"  class="contentbox ui-corner-ll"  style="" > 
	<div class="contentheaders ui-corner-ll">
	       Help - ${displayString}
	</div><br />

	<div>
        <img class="helpImage" alt="" src="<c:url value="/imgs/help/helpCart.png" />"  />
        
		<p class="paragraph" >
		<b class="paragraphStarter" >W</b>hen you view your cart, a list of all the books you want buy are listed here. Other information is presented to you such as the quantity of an item you want to buy or it's type. Press the "X" button in the list to remove that item from your cart.
		</p><br style="clear: both" />


		<img class="helpImage" alt="" src="<c:url value="/imgs/checkout.png" />"  />
		<p class="paragraph" >
		<b class="paragraphStarter" >P</b>ress this button when you want to buy the selected books.
		</p><br style="clear: both" />
		
		<img class="helpImage" alt="" src="<c:url value="/imgs/updateqty.png" />"  />
		<p class="paragraph" >
		<b class="paragraphStarter" >T</b>he update quantity button allows you to change the quantity of books to buy.
		</p><br style="clear: both" />
		
		</div>
		<form action="<c:url  value="/HelpIndexServlet" />" style="clear: both;">
		<br /><br /><br />
		<input type="submit" value="Return" style="font-size: 150%; float: right;" class="rightSubmit" />
		</form>
		<br style="clear: both" /><!-- Makes the main container grow to size. -->
</div>