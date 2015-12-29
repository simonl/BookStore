//****************************************
//*                                      *
//*                                      *
//* Author:: Edward Gagnon               *
//*                                      *
//****************************************

var loggedin = false;
var timestamp = 0;
var t = 0;
var hiddenMenu;
var mouseLeaveTimer;
var imageTimer;
var imagePath = '';

$(document).ready(
		function() {
			
			$('.homeButton').button();
			
			$( ".uiDateChooser" ).datepicker();

			$('#Approving, #Deny').click(function(e){
				//alert('clicked');
				var $parent = $(this).parent().parent();
				var rId = $parent.find('#id').val();
				var url = "AdminDecideReviewServlet";
				var appDeny = $(this).val().toLowerCase();
				//alert(appDeny);
				$.post( url, 
						{ 	reviewId: rId,
							reviewDecision: appDeny
							
						},
					      function( data ) {
							//alert(data);
							if( $( data ).find( 'success' ).text() === "true"){
								$parent.hide('slow', function(){
									$parent.remove();
								});
							}
							else{
								updateTips($parent, 'showTip', "Error - " + $( data ).find( 'errorMessage' ).text());
							}
					      }
					    )
					    .success(function() { 
					    	//alert("Second success"); 
					    	})
					    .error(function() { 
					    	//alert("Second error"); 
					    	})
					    .complete(function() { 
					    	//alert("Second complete"); 
					    	});
				return false;
			});
			
 
			//reload the image every minute
			//imageTimer = setInterval(function(){reloadImage($('#headerGif'));},60000);
//			$('#headerImage').click(function(){
//				reloadImage($('#headerGif'));
//			});
			
			$('#headerImage').mousedown(function(){
				$('#headerGif').css('display', 'inherit');
			});
			
			$('#headerImage').mouseleave(function(){
				
				if(imagePath.length == 0){
					imagePath =  $('#headerGif').attr('src');
				}
				//alert(imagePath);
				
				var image = new Image();
				image.src = imagePath;
				 $('#headerGif').attr('src', image.src);
				
				
				var timeout = setTimeout(function(){
					
					 $('#headerGif').css('display', 'none'); 
					},4000);
			});
			


//			/*
//			//Create the sub menu
//			$('.hasSubLevel').mouseover(function(e){
//				//http://api.jquery.com/toggle/
//				clearTimeout(mouseLeaveTimer);
//				mouseLeaveTimer = null;
//				if($('.sub-level').css('display') == 'none'){
//					$('.sub-level').css("position", 'absolute');
//					$('.sub-level').css("left", e.pageX - 10);
//					$('.sub-level').css("top", e.pageY - 10);
//					$('.sub-level').toggle();
//					$('.sub-level').css('z-index', "10000");
//				}
//				return false;
//		
//			});
//			//Clear display-leave timer
//			$('.sub-level').mouseenter(function(){
//				clearTimeout(mouseLeaveTimer);
//				mouseLeaveTimer = null;
//			});
//			//Add a leave timer so that the menu doesn't disappear when other Dom objects get focus.
//			$('.sub-level').mouseleave(function(){
//				removeMenu($(this));
//			});
//			
//			//Detach the sublevel menu and attach it to the main body. Allows to place relative to the window pane.
//			hiddenMenu = $('.sub-level').detach();
//			hiddenMenu.appendTo('body');
//			hiddenMenu.hide();
//			hiddenMenu = null;
//
//			*/

			var accordion = $('.accordion').accordion({
				icons : false,
				header : 'h3'
			});



			//Masks
			$("#homePhoneNumber").mask("(999) 999-9999");
			$("#cellPhoneNumber").mask("(999) 999-9999");
			$("#shippingPostalCode").mask("a9a9a9");
			$("#billingPostalCode").mask("a9a9a9");
			$('#isbn10').mask('999999999*');
			$('#isbn13').mask('999-9999999999');
			$('.uiDateChooser').mask('99/99/9999');


			$("#same").click(
					function(e) {

						if ($("#same").prop("checked") == true) {
							$("#shippingAddress").val(
									$("#billingAddress").val());
							$("#shippingProvince").val(
									$("#billingProvince").val());
							$("#shippingCity").val($("#billingCity").val());
							$("#shippingPostalCode").val(
									$("#billingPostalCode").val());

							$('#shippingAddress').attr('disabled', true);
							$('#shippingProvince').attr('disabled', true);
							$('#shippingCity').attr('disabled', true);
							$('#shippingPostalCode').attr('disabled', true);
						} else {
							$('#shippingAddress').removeAttr('disabled');
							$('#shippingProvince').removeAttr('disabled');
							$('#shippingCity').removeAttr('disabled');
							$('#shippingPostalCode').removeAttr('disabled');
						}

			});

			var current = 0;

			$.validator.addMethod("pageRequired", function(value, element) {
				function match(index) {
					return current == index
							&& $(element).parents("#sf" + (index + 1)).length;
				}
				if (match(0) || match(1) || match(2)) {
					return !this.optional(element);
				}
				return "dependency-mismatch";
			}, $.validator.messages.required);

			// validate signup form on keyup and submit
			var validator1 = $("#pageForm").validate({
				rules : {
					password : {
						required : true
					},
					password_confirm : {
						required : true,
						equalTo : "#password"
					}
				},

				// the errorPlacement has to take the table layout into account
				errorPlacement : function(error, element) {
					error.prependTo(element.parent().next());
					updateTips(element, null, null);
				},
				onkeyup : false,
				onblur : false,
				success : function(label) {
					label.html("&nbsp;").addClass("checked");
				}
			});

			// back buttons do not need to run validation
			$("#sf2 .prevbutton").click(function() {
				accordion.accordion("activate", 0);
				current = 0;
			});
			$("#sf3 .prevbutton").click(function() {
				accordion.accordion("activate", 1);
				current = 1;
			});
			// these buttons all run the validation, overridden by specific
			// targets above
			$(".open2").click(function() {
				if (validator1.form()) {

					accordion.accordion("activate", 2);
					current = 2;
				}
			});
			$(".open1").click(function() {
				if (validator1.form()) {
					accordion.accordion("activate", 1);
					current = 1;
				}
			});
			$(".open0").click(function() {
				if (validator1.form()) {
					accordion.accordion("activate", 0);
					current = 0;
				}
			});
			
			// Each .rssFeed div element has a feedURL attribute
			// This code should replace the content of each of these div
			//  with the RSS feed from the URL found in their respective feedURL
			var feedNodes = $('.rssFeed');	
			for(var i = 0; i < feedNodes.length; i++) {
				var node = feedNodes[i];
				var url = node.getAttribute("feedURL");
				var singleton = feedNodes.constructor(node);
				
				singleton.rssfeed(url, {}, function(e) {
					$(e).find('div.rssBody').vTicker({
						showItems : 1,
						speed: 1000,
						pause: 100000
					});
				});
			}
			
			$('#bookSalesDisplay').cycle({
				fx:     'fade',
				speed:  'fast',
				timeout: 12000,
				next:   '#next2',
				prev:   '#prev2',
				pause : 1
			});
			
			$('#booksDisplay').cycle({
				fx:     'scrollVert',
				speed:  'slow',
				timeout: 0,
				next:   '#next2',
				prev:   '#prev2'
			});
			

			// Cycle through the images
			$('.slideshow').cycle({
				fx : 'scrollDown', // choose your transition type, ex: fade,
									// scrollUp, shuffle, etc...
				speed : 2000,
				timeout : 10000,
				random : true,
				pause : 1
			});
			
			//Display default image if images weren't loaded correctly
//			$('.thumb').load(function(){	
//			}).error(function(){
//				var path = window.location.pathname.replace(/\/[^\/]*$/, '');
//				//alert(path);
//				var index = path.indexOf('/', 1);
//				//alert(index);
//				if(index <= 0){
//					path = path + "/";
//				}
//				else
//					path = path.substring(0, index) + '/';
//				//alert(path + 'bookImages/thumbnails/noImage.jpg');
//				var image = new Image();
//				image.src = path + 'bookImages/thumbnails/noImage.jpg';
//				$(this).attr('src', image.src);
//				image = null;
//			});
			 
			$('.buttonResetSalesPrice').click(function(e){
				var $parent = $(this).parent();
				var isbn13 = $parent.find( '#isbn' ).val();
				var $salesPrice = $parent.find( '#salePriceInput' );
				var $salesPriceDisplayElement = $parent.parent().find('.thumbBookSalePrice');
				var originalPriceDisplayElement = $parent.parent().find('.thumbBookOriginalPrice').html().replace('$', '');
				var url = "AlterSalesServlet";
				$.post( url, 
						{ 	isbn: isbn13,
							bookSalesPrice: originalPriceDisplayElement
							
						},
					      function( data ) {
							if( $( data ).find( 'success' ).text() == "true"){
								$salesPriceDisplayElement.text("$" + originalPriceDisplayElement);
								$salesPrice.val(originalPriceDisplayElement);
								updateTips($spanElement, 'ui-state-highlight');
							}
							else{
								var $salesInputElement = $parent.find( '#salePriceInput' );
								updateTips($salesInputElement, 'showTip', "Error - " + $( data ).find( 'errorMessage' ).text());
							}
						
					      }
					    )
					    .success(function() { 
					    	//alert("Second success"); 
					    	})
					    .error(function() { 
					    	//alert("Second error"); 
					    	})
					    .complete(function() { 
					    	//alert("Second complete"); 
					    	});
				return false;
			});
			
			//$("#salePriceInput").mask("[0-9]");
			$('.buttonSetSalesPrice').click(function(e){
				var $parent = $(this).parent();
				var isbn13 = $parent.find( '#isbn' ).val();
				var salesPrice = $parent.find( '#salePriceInput' ).val();
				var url = "AlterSalesServlet";
				$.post( url, 
						{ 	isbn: isbn13,
							bookSalesPrice: salesPrice
							
						},
					      function( data ) {
							if( $( data ).find( 'success' ).text() == "true"){
								var $spanElement = $parent.parent().find('.thumbBookSalePrice');
								$spanElement.text("$" + salesPrice);
								updateTips($spanElement, 'ui-state-highlight');
							}
							else{
								var $salesInputElement = $parent.find( '#salePriceInput' );
								updateTips($salesInputElement);
								updateTips($salesInputElement, 'showTip', "Error - " + $( data ).find( 'errorMessage' ).text());
							}
					      }
					    )
					    .success(function() { 
					    	//alert("Second success"); 
					    	})
					    .error(function() { 
					    	//alert("Second error"); 
					    	})
					    .complete(function() { 
					    	//alert("Second complete"); 
					    	});
				return false;
			});
			 
			
			
			function etrim(x) {
				return x.replace(/^\s*/, "").replace(/\s*$/, "");
			}
			

			// Changes the appearence of the text field object supplied.
			function updateTips(obj, classToAdd, textError) {
				if(classToAdd == null || classToAdd == '')
					classToAdd = 'inputError';
				obj.addClass(classToAdd);
				if(textError == null || textError == '') 
					textError = 'Error - Incorrect input here';
				obj.attr('title', textError);
				obj.tooltip({
					track: true,
					delay: 0,
					showURL: false,
					opacity: 1,
					fixPNG: true,
					showBody: " - ",
					extraClass: "fancy",
					top: -15,
					left: 5
				});
				setTimeout(function() {
					obj.removeClass(classToAdd);
					obj.removeAttr('title');
					obj.tooltip(false);
				}, 10000);
			}

			// Validates if a text field has the correct amount of characters
			// If it doesn't then the "ui-state-error" class is added to the dom
			// Object, making it appear red
			// A tool text tip is added to the text field
			// preconditions - the dom object must be a text field as a .val()
			// method is used.
			function checkLength(domObject, nameOfField, min, max) {
				if (domObject.val().length > max
						|| domObject.val().length < min) {
					domObject.addClass("ui-state-error");
					updateTips(n);
					return false;
				} else {
					return true;
				}
			}

			// Checks if a dom object has the same pattern as the regular
			// expression string supplied.
			function checkRegexp(domObject, regexp, ctr) {
				if (!(regexp.test(domObject.val()))) {
					domObject.addClass("ui-state-error");
					updateTips(ctr);
					return false;
				} else {
					return true;
				}
			}
			
			//Reloads an image
			function reloadImage(domObject){
				domObject.css('display', 'inherit');
				if(imagePath.length == 0){
					imagePath = domObject.attr('src');
				}
				alert(imagePath);
				
				var image = new Image();
				image.src = imagePath;
				domObject.attr('src', image.src);
				
				
				var timeout = setTimeout(function(){
					
					domObject.css('display', 'none'); 
					},4100);
			}
			
			function getRootWebPath(){
				var newURL = window.location.protocol + "//" + window.location.host; //+ window.location.pathname;
				var path = window.location.pathname.replace(/\/[^\/]*$/, '');
				//alert(path);
				var index = path.indexOf('/', 1);
				//alert(index);
				if(index <= 0){
					path = path + "/";
				}
				else
					path = path.substring(0, index) + '/';
				//alert(newURL);;
				return newURL;
			}
			
			function preload(images) {
			    if (document.images) {
			        var i = 0;
			        var imageArray = new Array();
			        imageArray = images.split(',');
			        var imageObj = new Image();
			        for(i=0; i<=imageArray.length-1; i++) {
			            //document.write('<img src="' + imageArray[i] + '" />');// Write to page (uncomment to check images)
			            imageObj.src=imageArray[i];
			        }
			    }
			}


});
