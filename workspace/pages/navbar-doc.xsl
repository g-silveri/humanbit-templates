<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/footer_modules.xsl" />
<xsl:import href="../utilities/navbar_modules.xsl" />
<xsl:import href="../utilities/modules.xsl" />
<xsl:import href="../utilities/registration.xsl" />

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:param name="url-module"/>

<xsl:template match="/">
	<link href="{$workspace}/static/bessex/css/bessex_humanbit.css" rel="stylesheet" />
	<link href="{$workspace}/static/css/plugin.min.css" rel="stylesheet" />
	<link href="{$workspace}/static/css/style.css" rel="stylesheet" />
	<body class="bg_color_white">
		<div class="container_humanbit_overflow scrollbar_spacing" id="page">
			<xsl:choose>
				<xsl:when test="$url-module = 'navbarslidetop'">
					<xsl:call-template name="navbar_slide_top"/>
				</xsl:when>
				<xsl:when test="$url-module = 'navbarslideright'">
					<xsl:call-template name="navbar_slide_right"/>
				</xsl:when>
				<xsl:when test="$url-module = 'navbarslidebottom'">
					<xsl:call-template name="navbar_slide_bottom"/>
				</xsl:when>
				<xsl:when test="$url-module = 'navbarslideleft'">
					<xsl:call-template name="navbar_slide_left"/>
				</xsl:when>
				<xsl:when test="$url-module = 'navbargrowtop'">
					<xsl:call-template name="navbar_grow_top"/>
				</xsl:when>
				<xsl:when test="$url-module = 'navbargrowright'">
					<xsl:call-template name="navbar_grow_right"/>
				</xsl:when>
				<xsl:when test="$url-module = 'navbargrowbottom'">
					<xsl:call-template name="navbar_grow_bottom"/>
				</xsl:when>
				<xsl:when test="$url-module = 'navbargrowleft'">
					<xsl:call-template name="navbar_grow_left"/>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</body>
	<script src="{$workspace}/static/js/plugin.min.js"></script>
	<script src="{$workspace}/static/js/main.js?v1.06"></script>
	<script src="{$workspace}/static/js/main-humanbit.js?v1.06"></script>
	<script type="text/javascript" src="https://nibirumail.com/docs/scripts/nibirumail.cookie.min.js"></script>
	<script src="{$workspace}/static/js/preloader.js" />
</xsl:template>


</xsl:stylesheet>
