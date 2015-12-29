/**
 * Author: David Preseault
 */

function addChoice()
{
	var newRow = document.getElementById('createSurveyChoices').insertRow(-1);
	newRow.insertCell(0).innerHTML = '<label for=\"choice\">Choice: </label>';
	newRow.insertCell(1).innerHTML = '<input type="text" name="choice" />';
	newRow.insertCell(2).innerHTML = '<input type=\"button\" value=\"X\" onclick="delChoice(this);"/>'; 
}
function delChoice(choice)
{
	var row = choice.parentNode.parentNode.rowIndex;
	document.getElementById('createSurveyChoices').deleteRow(row);
}