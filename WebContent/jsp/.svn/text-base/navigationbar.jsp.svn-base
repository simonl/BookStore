<!-- **************************************** -->
<!-- *                                      * -->
<!-- *                                      * -->
<!-- * Author:: Edward Gagnon               * -->
<!-- *                                      * -->
<!-- **************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div id="navpanel" class="box ui-corner-ll" style="text-align:left;">
			<div id="navpanelHeader" class="boxheaders ui-corner-ll">
				<img src="<c:url  value="/imgs/navheader.png" />"  class="ui-corner-ll" />
			</div>
			<div id="menu">
					<ul class="makeMenu">
						<li id="noStyle"><a href="<c:url  value="/WelcomeServlet" />"  class="ui-corner-ll" >Home</a></li>
						<li><a href="<c:url  value="/ViewBooksServlet"  />"   class="hasSubLevel ui-corner-ll" >Books</a>
							<ul class="ui-corner-ll" ><li><a href="<c:url  value="/ViewBooksServlet"  />"  class="ui-corner-ll" >All Genres</a>
								<c:forEach var="genre" items="${allGenres}" varStatus="status" >
									<li><a href="<c:url  value='/ViewBooksServlet?genre=${genre}' />" class="ui-corner-ll" >${genre}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li><a href="<c:url  value="/HelpIndexServlet" />" class="ui-corner-ll" >Help</a></li>
						<li><a href="<c:url  value="/AboutUsServlet" />" class="ui-corner-ll" >About Us</a></li>
						<c:if test="${userPrivateData.manager}">
						<li class="ui-corner-ll"><a href="<c:url  value="#"  />"   class="hasSubLevel ui-corner-ll" >Manager</a>
									<ul class="ui-corner-ll" >
										  <li><a href="<c:url  value="#"  />"   class="hasSubLevel ui-corner-ll" >Client Management</a>
											<ul class="ui-corner-ll">
												<li class="ui-corner-ll"><a href="#">Add Clients</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/AdminSearchClientsServlet" />">Alter Clients</a></li>
											</ul>
										  </li>
										  <li class="ui-corner-ll"><a href="<c:url  value="#"  />"   class="hasSubLevel ui-corner-ll" >Book Management</a>
											<ul class="ui-corner-ll">
												<li class="ui-corner-ll"><a href="<c:url  value="/SearchBookServlet" />">Search Books</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/DiscontinuedBooksServlet" />">Discontinued Books</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/AdminShowAddBookForm" />">Add Books</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/AdminShowSalesServlet" />">Set Sales</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/AdminShowReviewsServlet" />">Allow/Deny Reviews</a></li>
											</ul>
										  </li>
										  <li class="ui-corner-ll">
										  	<a href="<c:url value="/SurveyManagementServlet" />">Surveys</a>
										  </li>
										  <li class="ui-corner-ll"><a href="<c:url  value="/ShowReportMenuServlet"  />"   class="hasSubLevel ui-corner-ll" >Reports</a>
											<ul class="ui-corner-ll">
												<li class="ui-corner-ll"><a href="<c:url  value="/ShowTotalSalesReports" />">Total Sales</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/SalesByClientDateChooser" />">Sales by Client</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/SalesByAuthorDateChooser" />">Sales by Author</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/SalesByPublisherDateChooser" />">Sales by Publisher</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/TopSellersDateChooser" />">Top Sellers</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/TopClientsDateChooser" />">Top Clients</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/ZeroSalesDateChooser" />">Zero Sales</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/ShowReorderReport" />">Reorder Report</a></li>
												<li class="ui-corner-ll"><a href="<c:url  value="/StockReportServlet" />">Stock Report</a></li>
											</ul>
										  </li>
										  <li class="ui-corner-ll">
										  	<a href="<c:url value="/FeedManagementServlet" />">RSS Feeds</a>
										  </li>
										  <li class="ui-corner-ll">
										  	<a href="<c:url value="/OrderManagementServlet" />">Orders</a>
										  </li>
										  <li class="ui-corner-ll">
										  	<a href="<c:url value="/AdsManagementServlet"  />">Ads</a>
										  </li>
								  </ul>
						</li>
						</c:if>
					</ul>
			</div>
		</div>
		<br>
