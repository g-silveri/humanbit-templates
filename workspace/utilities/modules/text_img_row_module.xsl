<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="url-email"/>
	<xsl:param name="url-tab"/>
	<xsl:param name="member-id"/>
	<xsl:param name="url-lan"/>
	<xsl:param name="url-category"/>
	<xsl:param name="url-activation"/>
	<xsl:param name="url-profile-login"/>
	<xsl:param name="page-types"/>
	<xsl:param name="url-reg"/>
	<xsl:param name="cookie-pass"/>
	<xsl:param name="url-change"/>
	<xsl:param name="url-code"/>
	<xsl:param name="url-test"/>
	<xsl:param name="url-event"/>
	<xsl:param name="url-prov"/>
	<xsl:param name="url-region"/>
	<xsl:param name="url-success"/>
	<xsl:param name="url-successnews"/>
	<xsl:param name="member-role"/>
	<xsl:param name="url-emailchange"/>
	<xsl:param name="url-recovery"/>
	<xsl:param name="url-booked"/>
	<xsl:param name="title"/>
	<xsl:param name="id"/>
	<xsl:variable name="lan">
		<xsl:choose>
			<xsl:when test="$url-lan = 'en'">en</xsl:when>
			<xsl:otherwise>it</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lanurl">
		<xsl:choose>
			<xsl:when test="$url-lan = 'en'">?lan=en</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lanexp">
		<xsl:choose>
			<xsl:when test="$url-lan = 'en'">english</xsl:when>
			<xsl:otherwise>italian</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lanextended">
		<xsl:choose>
			<xsl:when test="$url-lan != ''">
				<xsl:value-of select="$url-lan"/>
			</xsl:when>
			<xsl:otherwise>it</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="titlelan">title-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="metatitlelan">meta-title-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="metadesclan">meta-description-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="namelan">name-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="namegrouplan">name-sezione-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="subtitlelan">subtitle-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="bodytitlelan">body-title-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="bodylan">body-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="asidetitlelan">aside-title-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="asidebodylan">aside-body-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="distrettititlelan">distretti-title-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="distrettibodylan">distretti-body-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="desclan">description-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="abslan">abstract-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="questionlan">question-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="answerlan">answer-<xsl:value-of select="$lanexp"/></xsl:variable>
	<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
	<!-- The following variable and its respective value must be replaced with the current project's data. -->
	<xsl:variable name="root">https://humanbit.com</xsl:variable>

	<!-- #################################################################################################### -->

	<xsl:template name="text_img_row_module">
		<xsl:param name="title"/>
		<xsl:param name="subtitle"/>
		<xsl:param name="abstract"/>
		<xsl:param name="imgname"/>

		<div class="text_img_row_module">

			<div class="space_home_row col-12 row align-items-center mb-5">
				<xsl:choose>
					<xsl:when test="(position() mod 2) != 0">
						<div class="space_home_element space_home_text col-12 col-lg-5 ">
							<h5 class="h4 text-uppercase m-0 mb-2 mb-lg-3"><xsl:value-of select="$title"/></h5>
							<h6 class="p_bold m-0 mb-3"><xsl:value-of select="$subtitle"/></h6>
							<p class="m-0 mb-4 mb-lg-6"><xsl:value-of select="$abstract"/></p>
							<a class="txt_img_row_btn d-inline-block roboto color_third text-end text-uppercase border border_color_third mt-4 py-3 px-5" href="#">
								<span class="small d-block mb-2"><xsl:value-of select="/data/translate/entry[code = 'send']/*[local-name() = $lanextended]"/></span>
								<i class="fa-light fa-arrow-right-long d-block h3 text-end"></i>
							</a>
						</div>

						<div class="space_home_element space_home_img col-12 col-lg-7">
							<figure class="col-12 m-0 mb-3 mb-lg-0">
								<img class="w-100" src="{$root}/image/4/800/0/uploads/{$imgname}"></img>
							</figure>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="space_home_element space_home_img col-12 col-lg-7">
							<figure class="col-12 m-0 mb-3 mb-lg-0">
								<img class="w-100" src="{$root}/image/4/800/0/uploads/{$imgname}"></img>
							</figure>
						</div>

						<div class="space_home_element space_home_text col-12 col-lg-5 ">
							<h5 class="h4 text-uppercase m-0 mb-2 mb-lg-3"><xsl:value-of select="$title"/></h5>
							<h6 class="p_bold m-0 mb-3"><xsl:value-of select="$subtitle"/></h6>
							<p class="m-0 mb-4 mb-lg-6"><xsl:value-of select="$abstract"/></p>
							<a class="txt_img_row_btn d-inline-block roboto color_third text-end text-uppercase border border_color_third mt-4 py-3 px-5" href="#">
								<span class="small d-block mb-2"><xsl:value-of select="/data/translate/entry[code = 'send']/*[local-name() = $lanextended]"/></span>
								<i class="fa-light fa-arrow-right-long d-block h3 text-end"></i>
							</a>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>

		</div>

	</xsl:template>

</xsl:stylesheet>
