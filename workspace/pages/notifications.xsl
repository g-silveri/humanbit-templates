<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

	<xsl:include href="../utilities/default_template.xsl" />

	<xsl:template name="head">
	</xsl:template>

	<xsl:template name="page_structure">
		<div class="notifications_partial">
			<xsl:for-each select="/data/push-notifications/entry">
				<xsl:call-template name="push_notifications"/>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>
