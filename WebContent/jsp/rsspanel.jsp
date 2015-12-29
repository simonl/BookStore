<!-- **************************************** -->
<!-- *                                      * -->
<!-- *                                      * -->
<!-- * Author:: Edward Gagnon, Simon        * -->
<!-- *          Langlois, David Préseault   * -->
<!-- *                                      * -->
<!-- **************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div id="rsspanel" class="box ui-corner-ll" >
			<div id="rsspanelHeader" class="boxheaders ui-corner-ll">
				<img src="<c:url  value="/imgs/rssheader.png" />"  class="ui-corner-ll" />
			</div>
            <div class="rssFeed" feedURL="${ currentFeed.url }"></div>
		</div>
		<br />
