<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

	<xsl:include href="../utilities/default_template.xsl" />

	<xsl:param name="url-action"/>
	<xsl:param name="url-month"/>
	<xsl:param name="url-year"/>

<xsl:template match="/">
	<xsl:choose>
		<xsl:when test="$url-action = 'month'">
			<xsl:call-template name="GetMonthName">
				<xsl:with-param name="month" select="number($url-month)"/>
			</xsl:call-template>
			<xsl:text> </xsl:text><xsl:value-of select="$url-year"/>
		</xsl:when>
		<xsl:when test="$url-action = 'calendar'">
			<xsl:call-template name="calendar">
				<xsl:with-param name="month" select="number($url-month)"/>
				<xsl:with-param name="year" select="number($url-year)"/>
			</xsl:call-template>
		</xsl:when>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
