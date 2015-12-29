<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="helpPanel"  class="contentbox ui-corner-ll"  style="" > 
	<div class="contentheaders ui-corner-ll">
	       Help - ${displayString}
	</div><br />

	<div>
        <img class="helpImage" alt="" src="<c:url value="/imgs/help/helpViewBook1.png" />"  />
		<p class="paragraph" >
		<b class="paragraphStarter" >V</b>iewing books and clicking the "Add to Cart" button is easy! Clicking the "Add to Cart" button makes you a winner! It adds a book to your cart! That's good! Try it now! 
		</p><br />
		
		<p class="paragraph" >
		<b class="paragraphStarter" >T</b>his page allows you to view specific details about the book that interests you. The details for the books are located below and to the right of the image. 
		</p><br />

		<p class="paragraph" >
		<b class="paragraphStarter" >R</b>elated books are shown at the bottom of the book panel. These books are categorized the same as the book being viewed. 
		</p><br />

		<p class="paragraph" >
		<b class="paragraphStarter" >Y</b>ou can read reviews that people have written below the book-specific details. You can also see the average rating of the book beside the image at the top of the page. 
		</p><br />
		<br style="clear: both" />
		<img class="helpImage" alt="" src="<c:url value="/imgs/help/helpViewBook2.png" />"  />
		<p class="paragraph" >
		<b class="paragraphStarter" >I</b>f you are logged in, you can write a review in the panel provided at the bottom of the page. In this panel, you have to rate the book. Writing a review is optional. 
		</p><br />
		
		</div>
		<form action="<c:url  value="/HelpIndexServlet" />" style="clear: both;">
		<br /><br /><br />
		<input type="submit" value="Return" style="font-size: 150%; float: right;" class="rightSubmit" />
		</form>
		<br style="clear: both" /><!-- Makes the main container grow to size. -->
</div>