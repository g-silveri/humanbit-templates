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

	<xsl:template name="calendar_module">

		<div class="calendar_module">
			<div class="calendar_List first-letter list-group row mb-6">
				<xsl:call-template name="calendar_month">
					<xsl:with-param name="index" select="1"/>
					<xsl:with-param name="month" select="$this-month"/>
					<xsl:with-param name="year" select="$this-year"/>
				</xsl:call-template>
			</div>
		</div>

	</xsl:template>

	<xsl:template name="horiz_calendar_module">

		<xsl:param name="from_today"/>

		<div class="horiz_calendar_module">
			<div class="calendar_button_container button_container d-flex flex-wrap align-items-center justify-content-between my-4 py-2">
				<button class="btn_chevron bg_color_first border-0 px-0">
					<i class="nav_calendar prev_cal chevron_calendar h1 color_white text-center border border-2 border_color_white rounded-circle fa-light fa-chevron-left m-0" data-url-calendar="{$root}/action/?action=calendar" data-url-month="{$root}/action/?action=month" data-month="#month_button" data-elem="#calendar_div" data-button="#btn_step_1"/>
				</button>
				<button id="month_button" data-year="{$this-year}" data-value="{$this-month}" class="btn_calendar small  text-uppercase btn_bg_first mx-md-4">
					<xsl:call-template name="GetMonthName">
						<xsl:with-param name="month" select="number($this-month)"/>
					</xsl:call-template>
					<xsl:text> </xsl:text><xsl:value-of select="$this-year"/>
				</button>
				<button class="btn_chevron bg_color_first border-0 px-0">
					<i class="nav_calendar next_cal chevron_calendar h1 color_white text-center border border-2 border_color_white rounded-circle fa-light fa-chevron-right m-0" data-url-calendar="{$root}/action/?action=calendar" data-url-month="{$root}/action/?action=month" data-month="#month_button" data-elem="#calendar_div" data-button="#btn_step_1"/>
				</button>
			</div>
			<div class="middle_container row justify-content-center align-self-center mx-auto mb-5">
				<ul class="day_of_week m-0 mb-3 p-0 pb-1 w-md-auto">
					<li class="li_date gotham h5  color_white opacity-75"><xsl:value-of select="/data/translate/entry[code='mon']/*[local-name() = $lanextended]"/></li>
					<li class="li_date gotham h5  color_white opacity-75"><xsl:value-of select="/data/translate/entry[code='tue']/*[local-name() = $lanextended]"/></li>
					<li class="li_date gotham h5  color_white opacity-75"><xsl:value-of select="/data/translate/entry[code='wed']/*[local-name() = $lanextended]"/></li>
					<li class="li_date gotham h5  color_white opacity-75"><xsl:value-of select="/data/translate/entry[code='thu']/*[local-name() = $lanextended]"/></li>
					<li class="li_date gotham h5  color_white opacity-75"><xsl:value-of select="/data/translate/entry[code='fri']/*[local-name() = $lanextended]"/></li>
					<li class="li_date gotham h5  color_white opacity-75"><xsl:value-of select="/data/translate/entry[code='sat']/*[local-name() = $lanextended]"/></li>
					<li class="li_date gotham h5  color_white opacity-75"><xsl:value-of select="/data/translate/entry[code='sun']/*[local-name() = $lanextended]"/></li>
				</ul>

				<div id="calendar_div" class="date_grid w-md-auto">
					<xsl:call-template name="calendar">
						<xsl:with-param name="from_today" select="$from_today"/>
						<xsl:with-param name="month" select="number($this-month)"/>
						<xsl:with-param name="year" select="number($this-year)"/>
					</xsl:call-template>
				</div>

			</div>
		</div>

	</xsl:template>

</xsl:stylesheet>
