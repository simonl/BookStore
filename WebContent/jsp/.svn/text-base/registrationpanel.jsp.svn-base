<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--*********************************************************************
     *                                                                  *
     *            Project Name: Registration panel                      *
     *                                                                  *
     *       Short Description: Displays the registration elements for  *
     *                          the website                             *
     *                                                                  *
     *            Programmer/s: Edward Gagnon                           *
     *                                                                  *
     *                    Date: February 08, 2012                       *
     *                                                                  *
     *               File Name: registrationpanel.jsp                   *
     *********************************************************************-->



<div class="contentbox ui-corner-ll">		
			<div class="contentheaders ui-corner-ll">
				Register Now!
			</div>
			
	<div id="registrationForm"  >
   		<form id="pageForm" method="post" name="pageForm" action="<c:url  value="/RegistrationServlet" />" autocomplete="off">
			<ul class="accordion" >
					<!--*********************************************************************
					     *                                                                  *
					     *            What is it?: Page 1 of 3                              *
					     *                                                                  *
					     *            Description: The personal information part            *
					     *                                                                  *
					     *                 Author: Edward Gagnon                            *
					     *                                                                  *
					     *********************************************************************-->
			 <li id="sf1"><h3><a href="#" class="hidden" ></a></h3><div id="slidingWindow" >
              <fieldset><legend>Step 1 of 3</legend>
              <table>
		  		  <tr>
		  			<td class="label"><label id="firstNameLabel" for="firstName" class="regularLabel" >First Name</label></td>
		  			<td class="field"><input id="firstName" name="firstName" placeholder="First Name" type="text" value="${clientInput.firstName}" minlength="2" maxlength="40" class="pageRequired required ui-corner-ll "  /></td>
		  			<td class="status"></td>
		  		  </tr>
		  		  <tr>
		  			<td class="label"><label id="lastNameLabel" for="lastName" class="regularLabel" >Last Name</label></td>
		  			<td class="field"><input id="lastName" name="lastName" placeholder="Last Name" type="text" value="${clientInput.lastName}" minlength="2" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="emailAddressLabel" for="email" class="regularLabel" >E-mail Address</label></td>
		  			<td class="field"><input id="email" name="email" placeholder="Email" type="text" value="${clientInput.email}" minlength="4" maxlength="100" class="pageRequired required email ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="homePhoneNumberLabel" for="homePhoneNumber" class="regularLabel" >Home Phone</label></td>
		  			<td class="field"><input id="homePhoneNumber" name="homePhoneNumber" placeholder="Home Phone" type="text" minlength="10" value="${clientInput.homePhoneNumber}" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="cellPhoneNumberLabel" for="email" class="regularLabel" >Cell Phone</label></td>
		  			<td class="field"><input id="cellPhoneNumber" name="cellPhoneNumber" placeholder="Cell Phone" type="text" minlength="10" value="${clientInput.cellPhoneNumber}" class="ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="loginNameLabel" for="loginName" class="regularLabel" >Login name</label></td>
		  			<td class="field"><input id="loginName" name="loginName" placeholder="Login" type="text" value="${userInput.login}" minlength="6" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
		  		  <tr>
		  			<td class="label"><label id="passwordLabel" for="password" class="regularLabel" >Password</label></td>
		  			<td class="field"><input id="password" name="password" placeholder="Password" type="password" value="${userInput.password}" minlength="6" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status">
		  				<div class="password-meter">
	
		  					<div class="password-meter-message">&nbsp;</div>
		  					<div class="password-meter-bg">
			  					<div class="password-meter-bar"></div>
		  					</div>
		  				</div>
					</td>
		  		  </tr>
		  		  <tr>
		  			<td class="label"><label id="password_confirmLabel" for="password_confirm" class="regularLabel" >Confirm Password</label></td>
		  			<td class="field"><input id="password_confirm" name="password_confirm" placeholder="Retype Password" type="password" minlength="6" maxlength="40" value="" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>

	  		  </table></fieldset>
			  <div class="buttonWrapper"><input name="formNext1" type="button" class="open1 nextbutton button" value="Next" alt="Next" title="Next" /></div>
			  </div></li>
			  		<!--*********************************************************************
					     *                                                                  *
					     *            What is it?: Page 2 of 3                              *
					     *                                                                  *
					     *            Description: The shipping address part                *
					     *                                                                  *
					     *                 Author: Edward Gagnon                            *
					     *                                                                  *
					     *                                                                  *
					     *********************************************************************-->
			  <li id="sf2"><h3><a href="#" class="hidden" ></a></h3><div id="slidingWindow" >
                  <fieldset><legend>Step 2 of 3</legend>
				  <table>
		  		  <tr>
		  			<td class="label"><label id="billingAddressLabel" for="billingAddress" class="regularLabel" >Billing Address</label></td>
		  			<td class="field"><input id="billingAddress" name="billingAddress" placeholder="Billing Address" type="text" value="${billingInput.address}" minlength="4" maxlength="60" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="CityLabel2" for="billingCity" class="regularLabel" >City</label></td>
		  			<td class="field"><input id="billingCity" name="billingCity" placeholder="City" type="text" value="${billingInput.city}" minlength="2" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="provinceLabel2" for="billingProvince" class="regularLabel" >Province</label></td>
		  			<td class="field"><select id="billingProvince" name="billingProvince" placeholder="Province" class="ui-corner-ll  required pageRequired" title="Select a province" value="${billingInput.province}" >
                        <option value=""> -Select- </option>
                        <c:forEach var="province" items="${ provinces }">
							<option value="${ province }" <c:if test="${billingData.province == province}">selected = "Selected"</c:if>>
								${ province }
							</option>
						</c:forEach>
					</select></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="postalCodeLabel2" for="billingPostalCode" class="regularLabel" >Postal Code</label></td>
		  			<td class="field"><input id="billingPostalCode" name="billingPostalCode" placeholder="Postal Code" type="text" value="${billingInput.postalCode}" minlength="6" maxlength="7" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  </table></fieldset>
				  <div class="buttonWrapper"><input name="formBack0" type="button" class="open0 prevbutton button" value="Back" alt="Back" title="Back" /> <input name="formNext2" type="button" class="open2 nextbutton button" value="Next" alt="Next" title="Next" /></div>
				  </div></li>
				  <!--*********************************************************************
				     *                                                                  *
				     *            What is it?: Page 3 of 3                              *
				     *                                                                  *
				     *            Description: The billing address part                 *
				     *                                                                  *
				     *                 Author: Edward Gagnon                            *
				     *                                                                  *
				     *********************************************************************-->
                  <li id="sf3"><h3><a href="#" class="hidden" ></a></h3><div id="slidingWindow" >
				  <fieldset><legend>Step 3 of 3</legend>
				  <fieldset>
					  <table>
					  <tr>
					  	<td colspan="1"><input type="checkbox" class="checkbox" id="same" name="same" value="true" /></td>
						<td colspan="2"><label id="sameLabel" for="same" >Use the same address as the shipping address for the billing address?</label></td>
					  </tr>
					  </table>
				  </fieldset>
				  <table>
		  		  <tr>
		  			<td class="label"><label id="shippingAddressLabel" for="shippingAddress" class="regularLabel" >Shipping Address</label></td>
		  			<td class="field"><input id="shippingAddress" name="shippingAddress" placeholder="Shipping Address" type="text" value="${shippingInput.address}" minlength="4" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="CityLabel" for="shippingCity" class="regularLabel" >City</label></td>
		  			<td class="field"><input id="shippingCity" name="shippingCity" placeholder="City" type="text" value="${shippingInput.city}" minlength="2" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="provinceLabel" for="shippingProvince" class="regularLabel" >Province</label></td>
		  			<td class="field"><select id="shippingProvince" name="shippingProvince" placeholder="Province" class="ui-corner-ll  pageRequired requried" title="Select a province" value="${shippingInput.province}">
                        <option value=""> -Select- </option>
						<c:forEach var="province" items="${ provinces }">
							<option value="${ province }" <c:if test="${billingData.province == province}">selected = "Selected"</c:if>>
								${ province }
							</option>
						</c:forEach>
					</select></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="postalCodeLabel" for="shippingPostalCode" class="regularLabel" >Postal Code</label></td>
		  			<td class="field"><input id="shippingPostalCode" name="shippingPostalCode" placeholder="Postal Code" type="text" value="${shippingInput.postalCode}" minlength="6" maxlength="7" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
					<td colspan="3"><label id="agreeLabel" for="agree" >In order to register, you must agree not to post inflamatory comments. Do you agree?</label></td>
				  </tr>
				  <tr>
					<td colspan="2"><input type="checkbox" class="checkbox pageRequired requred" id="agree" name="agree" /></td>
					<td class="status"></td>
				  </tr>
				  </table></fieldset>
				  <div class="buttonWrapper"><input name="formBack1" type="button" class="open1 prevbutton button ui-corner-ll" value="Previous" alt="Previous" title="Previous" /><input type="submit" id="submitRegistration" value="Submit" class="nextbutton button ui-corner-ll" id="submit" /></div>
				  </div></li> 
				</ul>
			</form>
      </div>
</div>