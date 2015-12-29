/**
 * Author: David Preseault
 */
var div1;
var div2;
var div3;
var currentDivNum;
var totalReviews;

function nextDiv()
{
	if ((currentDivNum+3) <= totalReviews)
	{
		document.getElementById("numOfPage" + (currentDivNum/3)).style.fontWeight = "normal";
		document.getElementById("numOfPage" + (currentDivNum/3)).style.color = "white";
		if (document.getElementById("review" + (currentDivNum+1))) { div1.style.display = "none"; div1 = document.getElementById("review" + (currentDivNum+1)); div1.style.display = "block"; }
		if (document.getElementById("review" + (currentDivNum+2))) { div2.style.display = "none"; div2 = document.getElementById("review" + (currentDivNum+2)); div2.style.display = "block"; }
		if (document.getElementById("review" + (currentDivNum+3))) { div3.style.display = "none"; div3 = document.getElementById("review" + (currentDivNum+3)); div3.style.display = "block"; }
		currentDivNum+=3;
		document.getElementById("numOfPage" + currentDivNum/3).style.fontWeight = "bold";
		document.getElementById("numOfPage" + currentDivNum/3).style.color = "yellow";
	}
}

function prevDiv()
{
	if (currentDivNum>3)
	{
		document.getElementById("numOfPage" + (currentDivNum/3)).style.fontWeight = "normal";
		document.getElementById("numOfPage" + (currentDivNum/3)).style.color = "white";
		currentDivNum-=3;
		document.getElementById("numOfPage" + currentDivNum/3).style.fontWeight = "bold";
		document.getElementById("numOfPage" + currentDivNum/3).style.color = "yellow";
		if (document.getElementById("review" + (currentDivNum-2))) { div1.style.display = "none"; div1 = document.getElementById("review" + (currentDivNum-2)); div1.style.display = "block"; }
		if (document.getElementById("review" + (currentDivNum-1))) { div2.style.display = "none"; div2 = document.getElementById("review" + (currentDivNum-1)); div2.style.display = "block"; }
		if (document.getElementById("review" + currentDivNum)) { div3.style.display = "none"; div3 = document.getElementById("review" + currentDivNum); div3.style.display = "block"; }
	}
}
function goToPage(num)
{
	document.getElementById("numOfPage" + (currentDivNum/3)).style.fontWeight = "normal";
	document.getElementById("numOfPage" + (currentDivNum/3)).style.color = "white";
	var fetchDivNum = 3 * num;
	currentDivNum = fetchDivNum;
	document.getElementById("numOfPage" + num).style.fontWeight = "bold";
	document.getElementById("numOfPage" + num).style.color = "yellow";
	if (document.getElementById("review" + (fetchDivNum-2))) { div1.style.display = "none"; div1 = document.getElementById("review" + (fetchDivNum-2)); div1.style.display = "block"; }
	if (document.getElementById("review" + (fetchDivNum-1))) { div2.style.display = "none"; div2 = document.getElementById("review" + (fetchDivNum-1)); div2.style.display = "block"; }
	if (document.getElementById("review" + fetchDivNum)) { div3.style.display = "none"; div3 = document.getElementById("review" + fetchDivNum); div3.style.display = "block"; }
}
function lastDiv()
{
	goToPage(totalReviews);
}

function firstDiv()
{
	goToPage(1);
}
function init()
{
	div1 = document.getElementById("review1");
	div2 = document.getElementById("review2");
	div3 = document.getElementById("review3");
	currentDivNum = 3;
	totalReviews = document.getElementById("numberOfPagesValue").value;
	if (document.getElementById("numOfPage1")) { document.getElementById("numOfPage1").style.fontWeight = "bold"; document.getElementById("numOfPage1").style.color = "yellow"; }
}
addLoadEvent(init());