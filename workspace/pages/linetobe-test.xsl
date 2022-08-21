<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

	<xsl:include href="../utilities/default_template.xsl" />

	<xsl:template name="head">
	</xsl:template>

	<xsl:template name="page_structure">

		<section class="linetobe">
			<h1><xsl:value-of select="/data/article-linetobe/entry[position() = 1]/title-italian"/></h1>
			<h2><xsl:value-of select="/data/article-linetobe/entry[position() = 1]/subtitle-italian"/></h2>
			<xsl:for-each select="/data/article-linetobe/entry">
				<p class="w-100 my-4"><xsl:value-of select="body-italian"/></p>
			</xsl:for-each>
		</section>

	</xsl:template>

</xsl:stylesheet>
