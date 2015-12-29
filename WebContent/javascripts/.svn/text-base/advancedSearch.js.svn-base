/**
 * Author: David Preseault
 * Edited By Edward Gagnon
 */
var AdvsearchVisible = false;


function hideAdvSearchDiv() {
	document.getElementById('advancedSearch').style.visibility = "hidden";
	document.getElementById('searchBtnImage').src = "imgs/searchArrow.png";
	AdvsearchVisible = false;
}

function showAdvSearchDiv() {
	document.getElementById('advancedSearch').style.visibility = "visible";
	document.getElementById('searchBtnImage').src = "imgs/searchArrowUp.png";
	AdvsearchVisible = true;
}
function switchDisplay() {
	if (AdvsearchVisible == false)
	{
		showAdvSearchDiv();
	}
	else
	{
		hideAdvSearchDiv();
	}
}
function advInit() {
	document.getElementById('searchBtnImage').onclick = function(){ switchDisplay() ;};
	document.getElementById('advSearchLink').onclick = function(){ switchDisplay() ;};
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
addLoadEvent(advInit());