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
	<xsl:variable name="rootadsi">https://associazionedimorestoricheitaliane.it</xsl:variable>

	<xsl:template name="slide_imgs_inside_card_module">
		<div class="slide_imgs_inside_card_module col-12 col-md-6 col-lg-4 link_product mb-4 pe-sm-2 pe-lg-4">

			<div class="slider_img mb-0 mb-lg-0 slide_hero_home">
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
					<!-- <div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('{$workspace}/static/images/other/img_test_3');"></div> -->
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
			</div>
			<div class="hero_text col-auto text-start col-10">
				<h6 class="small my-0">Titolo evento</h6>
				<p class="small mt-0 mb-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod</p>
			</div>
			<div class="date_and_icon">
				<time class="date_card_event_home day small mt-0">
					2
					<xsl:call-template name="day">
						<xsl:with-param name="date" select="date/date/start"/>
					</xsl:call-template>
				</time>
				<time class="date_card_event_home month text-uppercase small mt-0">
					<xsl:call-template name="month">
						<xsl:with-param name="date" select="date/date/start"/>
					</xsl:call-template>
				</time>
				<time class="date_card_event_home year small mt-0">
					<xsl:call-template name="year">
						<xsl:with-param name="date" select="date/date/start"/>
					</xsl:call-template>
					2022
				</time>
				<a class="link_modal_event float-end" data-bs-toggle="modal" data-bs-target="#modal_event"><i class="fa-thin fa-arrows-maximize"></i></a>
			</div>
		</div>

		<!-- test statico (cancellare dopo aver dinamicizzato) -->
		<div class="slide_imgs_inside_card_module col-12 col-md-6 col-lg-4 link_product mb-4 pe-sm-2 pe-lg-4">
			<div class="slider_img mb-0 mb-lg-0 slide_hero_home">
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('{$workspace}/static/images/other/img_test_4');"></div>
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('{$workspace}/static/images/other/img_test_2');"></div>
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
			</div>
			<div class="hero_text col-auto text-start col-10">
				<h6 class="small my-0">Titolo evento</h6>
				<p class="small mt-0 mb-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod</p>
			</div>
			<div class="date_and_icon">
				<time class="date_card_event_home day small mt-0">
					2
					<xsl:call-template name="day">
						<xsl:with-param name="date" select="date/date/start"/>
					</xsl:call-template>
				</time>
				<time class="date_card_event_home month text-uppercase small mt-0">
					<xsl:call-template name="month">
						<xsl:with-param name="date" select="date/date/start"/>
					</xsl:call-template>
				</time>
				<time class="date_card_event_home year small mt-0">
					<xsl:call-template name="year">
						<xsl:with-param name="date" select="date/date/start"/>
					</xsl:call-template>
					2022
				</time>
				<a class="link_modal_event float-end" data-bs-toggle="modal" data-bs-target="#modal_event"><i class="fa-thin fa-arrows-maximize"></i></a>
			</div>
		</div>

		<div class="slide_imgs_inside_card_module col-12 col-md-6 col-lg-4 link_product mb-4 pe-sm-2 pe-lg-4">
			<div class="slider_img mb-0 mb-lg-0 slide_hero_home">
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('{$workspace}/static/images/other/img_test_1.png');"></div>
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('{$workspace}/static/images/other/img_test_3');"></div>
					<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
			</div>
			<div class="hero_text col-auto text-start col-10">
				<h6 class="small my-0">Titolo evento</h6>
				<p class="small mt-0 mb-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod</p>
			</div>
			<div class="date_and_icon">
				<time class="date_card_event_home day small mt-0">
					2
					<xsl:call-template name="day">
						<xsl:with-param name="date" select="date/date/start"/>
					</xsl:call-template>
				</time>
				<time class="date_card_event_home month text-uppercase small mt-0">
					<xsl:call-template name="month">
						<xsl:with-param name="date" select="date/date/start"/>
					</xsl:call-template>
				</time>
				<time class="date_card_event_home year small mt-0">
					<xsl:call-template name="year">
						<xsl:with-param name="date" select="date/date/start"/>
					</xsl:call-template>
					2022
				</time>
				<a class="link_modal_event float-end" data-bs-toggle="modal" data-bs-target="#modal_event"><i class="fa-thin fa-arrows-maximize"></i></a>
			</div>


		</div>
	</xsl:template>



</xsl:stylesheet>
