/**
 * Author: David Preseault
 */
function addEBook()
{
	var tableId = document.getElementById('addEBookFormats'); 
	var newRow = tableId.insertRow(tableId.rows.length - 1);
	newRow.insertCell(0).innerHTML = '';
	newRow.insertCell(1).innerHTML = '<input type="text" name="eBookFormat" value="" size="2" /><input type=\"button\" value=\"X\" onclick="delEBook(this);"/>';
}
function delEBook(choice)
{
	var row = choice.parentNode.parentNode.rowIndex;
	document.getElementById('addEBookFormats').deleteRow(row);
}