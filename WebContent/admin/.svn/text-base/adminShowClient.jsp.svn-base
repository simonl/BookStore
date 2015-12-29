<!-- **************************************** -->
<!-- *                                      * -->
<!-- *   Date: Claimed on April 5th 2012    * -->
<!-- *                                      * -->
<!-- * Author: Edward Gagnon                * -->
<!-- *                                      * -->
<!-- **************************************** -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="contentbox ui-corner-ll">		 
			<div class="contentheaders ui-corner-ll">
				${displayString}
			</div>
			
	<div id="adminEditRegistration"  >
   		<form id="pageForm" method="post" name="pageForm" action="<c:url  value="/AdminEditClientServlet" />" autocomplete="off">

	 		<input type="hidden" name="userId" value="${userId}" />
	 		<div>
	 		<H2>${clientData.firstName} ${clientData.lastName} has bought $<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2">${Total_Purchase}</fmt:formatNumber> worth of books</H2>
	 		</div>

			 <div id="slidingWindow" >
              <fieldset><legend>Client Info</legend>
              <table>
		  		  <tr>
		  			<td class="label"><label id="firstNameLabel" for="firstName" class="regularLabel" >First Name</label></td>
		  			<td class="field"><input id="firstName" name="firstName" placeholder="First Name" type="text" value="${clientData.firstName}" minlength="2" maxlength="40" class="pageRequired required ui-corner-ll "  /></td>
		  			<td class="status"></td>
		  		  </tr>
		  		  <tr>
		  			<td class="label"><label id="lastNameLabel" for="lastName" class="regularLabel" >Last Name</label></td>
		  			<td class="field"><input id="lastName" name="lastName" placeholder="Last Name" type="text" value="${clientData.lastName}" minlength="2" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="emailAddressLabel" for="email" class="regularLabel" >E-mail Address</label></td>
		  			<td class="field"><input id="email" name="email" placeholder="Email" type="text" value="${clientData.email}" minlength="4" maxlength="100" class="pageRequired required email ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="homePhoneNumberLabel" for="homePhoneNumber" class="regularLabel" >Home Phone</label></td>
		  			<td class="field"><input id="homePhoneNumber" name="homePhoneNumber" placeholder="Home Phone" type="text" minlength="10" value="${clientData.homePhoneNumber}" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="cellPhoneNumberLabel" for="email" class="regularLabel" >Cell Phone</label></td>
		  			<td class="field"><input id="cellPhoneNumber" name="cellPhoneNumber" placeholder="Cell Phone" type="text" minlength="10" value="${clientData.cellPhoneNumber}" class="ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
<!-- 				  <tr> -->
<!-- 		  			<td class="label"><label id="loginNameLabel" for="loginName" class="regularLabel" >Login name</label></td> -->
<%-- 		  			<td class="field"><input id="loginName" name="loginName" placeholder="Login" type="text" value="${userData.login}" minlength="6" maxlength="40" class="pageRequired required ui-corner-ll " /></td> --%>
<!-- 		  			<td class="status"></td> -->
<!-- 		  		  </tr> -->
<!-- 		  		  <tr> -->
<!-- 		  			<td class="label"><label id="passwordLabel" for="password" class="regularLabel" >Password</label></td> -->
<%-- 		  			<td class="field"><input id="password" name="password" placeholder="Password" type="password" value="${userData.password}" minlength="6" maxlength="40" class="pageRequired required ui-corner-ll " /></td> --%>
<!-- 		  			<td class="status"> -->

<!-- 					</td> -->
<!-- 		  		  </tr> -->


	  		  </table></fieldset>
			  
			  </div>
			  <div id="slidingWindow" >
                  <fieldset><legend>Billing Information</legend>
				  <table>
		  		  <tr>
		  			<td class="label"><label id="billingAddressLabel" for="billingAddress" class="regularLabel" >Billing Address</label></td>
		  			<td class="field"><input id="billingAddress" name="billingAddress" placeholder="Billing Address" type="text" value="${billingData.address}" minlength="4" maxlength="60" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="CityLabel2" for="billingCity" class="regularLabel" >City</label></td>
		  			<td class="field"><input id="billingCity" name="billingCity" placeholder="City" type="text" value="${billingData.city}" minlength="2" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr> 
				  <tr>
		  			<td class="label"><label id="provinceLabel2" for="billingProvince" class="regularLabel" >Province</label></td>
		  			<td class="field"><select id="billingProvince" name="billingProvince" placeholder="Province" class="ui-corner-ll  required pageRequired" title="Select a province" value="${billingData.province}" >
                        <option value=""> -Select- </option>
                        <c:forEach var="province" items="${ provinces }" varStatus="status" >
							<option value="${ province }" <c:if test="${billingData.province == province}">selected = "Selected"</c:if>>
								${ province }
							</option>
						</c:forEach>
					</select></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="postalCodeLabel2" for="billingPostalCode" class="regularLabel" >Postal Code</label></td>
		  			<td class="field"><input id="billingPostalCode" name="billingPostalCode" placeholder="Postal Code" type="text" value="${billingData.postalCode}" minlength="6" maxlength="7" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  </table></fieldset>
				  </div>
                  <div id="slidingWindow" >
				  <fieldset><legend>Shipping Information</legend>
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
		  			<td class="field"><input id="shippingAddress" name="shippingAddress" placeholder="Shipping Address" type="text" value="${shippingData.address}" minlength="4" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="CityLabel" for="shippingCity" class="regularLabel" >City</label></td>
		  			<td class="field"><input id="shippingCity" name="shippingCity" placeholder="City" type="text" value="${shippingData.city}" minlength="2" maxlength="40" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="provinceLabel" for="shippingProvince" class="regularLabel" >Province</label></td>
		  			<td class="field"><select id="shippingProvince" name="shippingProvince" placeholder="Province" class="ui-corner-ll  pageRequired requried" title="Select a province" value="${shippingData.province}">
                        <option value=""> -Select- </option>
                        <c:forEach var="province" items="${ provinces }" varStatus="status">
							<option value="${ province }" <c:if test="${shippingData.province == province}">selected = "Selected"</c:if>>
								${ province }
							</option>
						</c:forEach>
					</select></td>
		  			<td class="status"></td>
		  		  </tr>
				  <tr>
		  			<td class="label"><label id="postalCodeLabel" for="shippingPostalCode" class="regularLabel" >Postal Code</label></td>
		  			<td class="field"><input id="shippingPostalCode" name="shippingPostalCode" placeholder="Postal Code" type="text" value="${shippingData.postalCode}" minlength="6" maxlength="7" class="pageRequired required ui-corner-ll " /></td>
		  			<td class="status"></td>
		  		  </tr>

				  </table></fieldset>
				  <div class="buttonWrapper"><input type="submit" id="submitRegistration" value="Commit" class="nextbutton button ui-corner-ll" id="submit" /></div>
				  </div>
			</form>
      </div>
</div>

