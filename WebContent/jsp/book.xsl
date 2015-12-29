<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns="http://www.w3.org/TR/REC-html40">
<xsl:output method="html"/>   
<xsl:template match="/">
<html>
  <body>
  <xsl:for-each select="books/book">
    <div id="viewbookHeader" class="contentheaders ui-corner-ll">
    Books > Genre > <xsl:value-of select="genre"/>
    </div><br />
    <a target="_self"><xsl:attribute name="href"><xsl:value-of select="bookCoverSrc"/></xsl:attribute><img id="thumbnail-image" border="1" align="left" style="margin:8px;"><xsl:attribute name="src"><xsl:value-of select="bookThumbnailSrc"/></xsl:attribute></img></a>
	<p style="font-weight:bold;font-size:16px;"><xsl:value-of select="title"/>  <xsl:value-of select="typeOfBook"/></p>
	<p><span class="viewbookFields">Author: </span><xsl:value-of select="author"/></p>
	<div id="addToCartBox">
		<script src="javascripts/addToCartBox.js" type="text/javascript"></script>
		<script>addToCart('<xsl:value-of select="isbn13"/>',<xsl:value-of select="isElectronic"/>,<xsl:value-of select="isPaper"/>,<xsl:value-of select="numberOfBooks"/>);</script>
	</div>
	<p><span class="viewbookFields">Price: </span>
	<xsl:value-of select="price/sale"/><span style="text-decoration:line-through;color:red;"><xsl:value-of select="price/list"/></span>
	<span class="viewbookFields"><xsl:value-of select="rating/text"/></span><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
	<img width="30px" style="vertical-align:text-bottom;" ><xsl:attribute name="src"><xsl:value-of select="rating/imageSrc"/></xsl:attribute><xsl:attribute name="style"><xsl:value-of select="rating/image1"/></xsl:attribute></img> 
	<img width="30px" style="vertical-align:text-bottom;" ><xsl:attribute name="src"><xsl:value-of select="rating/imageSrc"/></xsl:attribute><xsl:attribute name="style"><xsl:value-of select="rating/image2"/></xsl:attribute></img>
	<img width="30px" style="vertical-align:text-bottom;" ><xsl:attribute name="src"><xsl:value-of select="rating/imageSrc"/></xsl:attribute><xsl:attribute name="style"><xsl:value-of select="rating/image3"/></xsl:attribute></img> 
	<img width="30px" style="vertical-align:text-bottom;" ><xsl:attribute name="src"><xsl:value-of select="rating/imageSrc"/></xsl:attribute><xsl:attribute name="style"><xsl:value-of select="rating/image4"/></xsl:attribute></img>
	<img width="30px" style="vertical-align:text-bottom;" ><xsl:attribute name="src"><xsl:value-of select="rating/imageSrc"/></xsl:attribute><xsl:attribute name="style"><xsl:value-of select="rating/image5"/></xsl:attribute></img>
	<hr style="border:1px black solid;"/></p>
<table border="0" style="margin-left:3px;border-spacing: 0px 10px;">
<tr>
<td><span class="viewbookFields">Publisher:</span></td>
<td><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text></td>
<td><xsl:value-of select="publisher"/></td>
</tr>
<tr>
<td><span class="viewbookFields">Genre:</span></td>
<td></td>
<td><xsl:value-of select="genre"/></td>
</tr>
<tr>
<td><span class="viewbookFields">EBook Formats Available:</span></td>
<td></td>
<td><xsl:value-of select="eformats"/></td>
</tr>
<tr>
<td><span class="viewbookFields">Number of Pages:</span></td>
<td></td>
<td><xsl:value-of select="numberOfPages"/></td>
</tr>
<tr>
<td><span class="viewbookFields">ISBN 10:</span></td>
<td></td>
<td><xsl:value-of select="isbn10"/></td>
</tr>
<tr>
<td><span class="viewbookFields">ISBN 13:</span></td>
<td></td>
<td><xsl:value-of select="isbn13"/></td>
</tr>
<tr>
<td><span class="viewbookFields">Weight:</span></td>
<td></td>
<td><xsl:value-of select="weight"/>g</td>
</tr>
<tr>
<td><span class="viewbookFields">Dimensions:</span></td>
<td></td>
<td><xsl:value-of select="length"/>cm x <xsl:value-of select="width"/>cm x <xsl:value-of select="height"/>cm</td>
</tr>
</table>
    <p><span class="viewbookFields">Description:</span></p>
    <p class="viewbookDescription"><xsl:value-of select="description"/></p>
    <p><span class="viewbookFields">Reviews:</span> <xsl:value-of select="totalReviews"/></p>
	</xsl:for-each>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

