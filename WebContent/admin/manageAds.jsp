<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="javascripts/addChoiceSurvey.js" type="text/javascript"></script>
<div class="contentbox ui-corner-ll">		

	<div class="contentheaders ui-corner-ll">Ads</div>

	<div style="text-align:center" id="surveyManagement"  >
		
		${ AdManagementError }
		
		<TABLE border="2" style="width:90%;margin:5%">
			<TR>
				<TH>Banners</TH>
				<TH>Setters</TH>
			</TR>
			<c:forEach var="banner" items="${ bannerAds }">
				<TR>
					<TD>
						<A style="width=50%" href="imgs/ads/${ banner.value.image }" >${ banner.value.image }</A>
					</TD>
					<TD>
						<FORM action="<c:url value="/SetCurrentBannerServlet" />" method="POST">
						<c:choose>
							<c:when test="${ banner.key != currentBannerAd }">
								<INPUT type="hidden" name="bannerId" value="${ banner.key }" />
								<INPUT type="submit" value="Set as current banner" />
							</c:when>
							<c:otherwise>
								<INPUT disabled="disabled" type="submit" value="Is the current banner" />
							</c:otherwise>
						</c:choose>
						</FORM>
					</TD>
				</TR>
			</c:forEach>
		</TABLE>
	<FORM action="<c:url value="/SetCurrentAdsServlet" />" method="POST">
		<TABLE border="2" style="width:90%;margin:5%;margin-top:0%">
			<TR>
				<TH>Ads</TH>
				<TH>
					<INPUT type="submit" value="Change current ads" />
				</TH>
			</TR>
			<c:forEach var="small" items="${ smallAds }">
				<TR>
					<TD>
						<IMG src="imgs/ads/${ small.value.image }" />
					</TD>
					<TD>
						<INPUT type="checkbox" name="ads" value="${ small.key }" 
							${ isCurrent[small.key] ? "checked=\"checked\"" : null }
						/>
					</TD>
				</TR>
			</c:forEach>
		</TABLE>
	</FORM>
	</div>
</div>
