/**
 * @author David Preseault
 * 
 * This javascript will allow hovering effects on post review box
 */

/**
 * Adds hovering effcts over images when rating a book.
 */
function hoverRating(ratingNum){
	var pickaxeArray = new Array("imgs/woodpickaxe.png","imgs/stonepickaxe.png","imgs/ironpickaxe.png","imgs/goldpickaxe.png","imgs/diamondpickaxe.png");
	for (var i=1 ; i <= ratingNum ; i++) {
		document.getElementById("ratingImage" + i).src = pickaxeArray[ratingNum-1];
	}
	for (var i=ratingNum+1 ; i <= 5 ; i++) {
		document.getElementById("ratingImage" + i).src = "imgs/emptypickaxe.png";
	}
	document.reviewForm.rating.value=ratingNum;
}
/**
 * Makes sure the first rating possible is 1 (wood image).
 */
function firstPickaxeWood()
{
	if (document.getElementById("ratingImage1"))
		document.getElementById("ratingImage1").src = "imgs/woodpickaxe.png";
}
//addLoadEvent Author: Simon Willison
//Solution to multiple window.onloads from different scripts
function addLoadEvent(func) {
	  var oldonload = window.onload;
	  if (typeof window.onload != 'function') {
	    window.onload = func;
	  } else {
	    window.onload = function() {
	      if (oldonload) {
	        oldonload();
	      }
	      func();
	    };
	   }
}
addLoadEvent(firstPickaxeWood());