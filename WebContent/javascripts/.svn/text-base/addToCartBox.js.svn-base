/**
 * @author David Preseault
 * 
 * This javascript is responsible for adding functionality to viewbook
 * purchasing section (Add to cart). This js will handle all client-side
 * validation when adding a book, and will also handle information to
 * display such as if book is available in paper, ebook, or both with
 * their respective checkboxes and text boxes.
 * 
 * This javascript file is purely for display and functionality purposes.
 * Adding to cart is not processed here, but form submitted when validated.
 */

var qtyLeft;
var divObj;

/**
 * This function is called when user clicks on Add To Cart button.
 * Will handle validation and return errors on screen if present, if not
 * it will submit the form.
 */
function purchaseBook()
{
	var purchaseForm = document.getElementById('purchaseForm');
	var elecChkBox = document.getElementById('chkElectronic');
	var noc = document.getElementById('noc');
	var paperChkBox = document.getElementById('chkPaper');
	var errorMsg = document.getElementById('errorMsg');
	var pattern = new RegExp("[0-9]");
	if (elecChkBox != null && paperChkBox != null)
	{
		if (!paperChkBox.checked && !elecChkBox.checked)
		{
			errorMsg.innerHTML = 'Please select type of book';
			return;
		}
		else 
		{
			if (paperChkBox.checked)
			{
				if (pattern.test(noc.value))
				{
					if (noc.value > qtyLeft)
					{
						errorMsg.innerHTML = 'Only ' + qtyLeft + ' left in stock!';
						return;
					}
					else if (noc.value <= 0)
					{
						errorMsg.innerHTML = 'Quantity cannot be 0';
						return;
					}
					else
					{
						purchaseForm.innerHTML += '<input type="hidden" name="electronic" value="' + elecChkBox.checked + '"/>';
						purchaseForm.innerHTML += '<input type="hidden" name="numberOfCopies" value="' + noc.value + '"/>';
					}
				}
				else 
				{
					errorMsg.innerHTML = 'Quantity not a valid number';
					return;
				}
			}
			else
			{
				purchaseForm.innerHTML += '<input type="hidden" name="electronic" value="' + elecChkBox.checked + '"/>';
				purchaseForm.innerHTML += '<input type="hidden" name="numberOfCopies" value="0"/>';
			}
		}
	}
	else
	{
		if (noc != null)
		{
			if (noc.value > qtyLeft)
			{
				errorMsg.innerHTML = 'Only ' + qtyLeft + ' left in stock!';
				return;
			}
			else if (noc.value <= 0)
			{
				errorMsg.innerHTML = 'Quantity cannot be 0';
				return;
			}
			else
			{
				purchaseForm.innerHTML += '<input type="hidden" name="electronic" value="false"/>';
				purchaseForm.innerHTML += '<input type="hidden" name="numberOfCopies" value="' + noc.value + '"/>';
			}
		}
		else
		{
			purchaseForm.innerHTML += '<input type="hidden" name="electronic" value="true"/>';
			purchaseForm.innerHTML += '<input type="hidden" name="numberOfCopies" value="0"/>';
		}
	}

	purchaseForm.submit();
}
/**
 * This function will display to the user if book is available as
 * an ebook, paper or both, and will prepare the form to be written
 * to the HTML. (Form depends on what book type is).
 * 
 * @param isbn Book ISBN
 * @param isElectronic
 * @param isPaper
 * @param qty Quantity Left In Stock
 */
function addToCart(isbn, isElectronic, isPaper, qty)
{
	divObj = document.getElementById('addToCartBox');
	var outOfStock = false;
	if (qty == 0) { outOfStock = true; }
	qtyLeft = qty;
	var finalBoxLayout = '<form method="POST" id="purchaseForm" action="AddToCartServlet">' +
	'<input type="hidden" name="isbn" value="' + isbn + '" />' +
	'<table border="0">' +
	'<tr>';

	if (isElectronic == true && isPaper == true)
	{
		if (outOfStock)
		{ 
			finalBoxLayout += '<td>Paper: Out Of Stock!</td></tr>';
			finalBoxLayout += '<td>E-Book: <span style="color:#00FF00;font-weight:bold;">Available</span></td></tr>';
		}
		else
		{
			finalBoxLayout += '<td><input type="checkbox" id="chkElectronic"/><label for="chkElectronic">E-Book</label></td>' +
			'</tr>' +
			'<tr>' +
			'<td><input type="checkbox" id="chkPaper" name="paper" /><label for="chkPaper">Paper</label><input onkeypress="checkPaperCheckbox();" type="text" id="noc" maxlength="3" size="2" value="0" >Qty&nbsp;&nbsp;&nbsp;&nbsp;' + qty + ' books remaining</td></tr>';
		}
	}
	else if (isPaper == true)
	{
		if (outOfStock) 
			finalBoxLayout += '<td>Paper: Out Of Stock!</td></tr>';
		else
			{
				finalBoxLayout += '<td><input type="text" id="noc" maxlength="3" size="2" value="0" >Qty&nbsp;&nbsp;&nbsp;&nbsp;' + qty + ' books remaining</td></tr>';
			}
	}
	finalBoxLayout += '<tr>' +
	'<td><a href="javascript:void(0)"><img id="submitBtn" src="imgs/addToCart.png" onclick="purchaseBook();" /></a></td>' +
	'</tr>' +
	'<tr><td id="errorMsg" style="color:#FFCC00;"></td></tr>' +
	'</table>' +
	'</form>';
	divObj.innerHTML = finalBoxLayout;
} 

/**
 * When called, will check the paper checkbox
 */
function checkPaperCheckbox()
{
	document.getElementById('chkPaper').checked = true;
}