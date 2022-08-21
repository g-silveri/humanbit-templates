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

	<xsl:template name="text_img_row_2_module">
		<xsl:param name="title"/>
		<xsl:param name="subtitle"/>
		<xsl:param name="abstract"/>
		<xsl:param name="imgname"/>

		<div class="text_img_row_2_module">

			<div class="space_home_row col-12 row mb-5">

				<xsl:choose>
					<xsl:when test="(position() mod 2) != 0">
						<div class="space_home_element space_home_img col-12 col-lg-7" style="background-image: url('{$workspace}/static/images/other/cassetta_mista.png');">
							<!-- <figure class="col-12 m-0 mb-3 mb-lg-0">
								<img class="w-100" src="{$root}/image/4/800/0/uploads/{$imgname}"></img>
							</figure> -->
						</div>

						<div class="space_home_element space_home_text col-12 col-lg-5">
							<figure class="col-6 m-0 mb-3 mb-lg-0 py-4">
								<!-- <img class="w-100" src="{$root}/image/4/800/0/uploads/{$imgname}"></img> -->
								<img class="w-100" src="{$workspace}/static/images/other/aranciaTONDASPICCHIOsabbia-01.png"></img>
							</figure>
							<div class="title_buttons">
								<h4 class="m-0 mb-3 small mb-lg-4"><xsl:value-of select="$title"/>05 | LA CASSETTA MISTA DI AGRUMI</h4>
								<h6 class="p_bold m-0 mb-3"><xsl:value-of select="$subtitle"/></h6>
								<!-- bottone da ciclare e dinamicizzare -->
								<a class="btn_bg_second d-block mb-2 col-12" style="">
									<div class="p-0 pe-2 d-inline" style="">
										<span class="never_text smaller">arance da tavola + limoni / cassetta 16 kg / € 29,90</span>
									</div>

									<!-- <i class="courses_icon btn_white fa-light fa-arrow-right-long float-end" style=""></i> -->
								</a>

								<!-- bottoni test statico da cancellare -->
								<a class="btn_bg_second d-block mb-2 col-12" style="">
									<div class="p-0 pe-2 d-inline" style="">
										<span class="never_text smaller">arance da tavola + limoni / cassetta 16 kg / € 39,90</span>
									</div>

									<!-- <i class="courses_icon btn_white fa-light fa-arrow-right-long float-end" style=""></i> -->
								</a>
								<a class="btn_bg_second d-block mb-2 col-12" style="">
									<div class="p-0 pe-2 d-inline" style="">
										<span class="never_text smaller">arance da tavola + limoni / cassetta 16 kg / € 89,90</span>
									</div>

									<!-- <i class="courses_icon btn_white fa-light fa-arrow-right-long float-end" style=""></i> -->
								</a>
								<a class="btn_bg_second d-block mb-2 col-12" style="">
									<div class="p-0 pe-2 d-inline" style="">
										<span class="never_text smaller">arance da tavola + limoni / cassetta 16 kg / € 124,90</span>
									</div>

									<!-- <i class="courses_icon btn_white fa-light fa-arrow-right-long float-end" style=""></i> -->
								</a>

								<a class="btn_bg_second width_content d-block mb-2 col-12" style="">
									<div class="p-0 pe-4 d-inline" style="">
										<span class="never_text smaller"><xsl:value-of select="/data/translate/entry[code = 'buy']/*[local-name() = $lanextended]"/></span>
									</div>

									<i class="courses_icon btn_white fa-light fa-citrus-slice float-end" style=""></i>
								</a>

							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="space_home_element space_home_text col-12 col-lg-5">
							<figure class="col-6 m-0 mb-3 mb-lg-0 py-4">
								<!-- <img class="w-100" src="{$root}/image/4/800/0/uploads/{$imgname}"></img> -->
								<img class="w-100" src="{$workspace}/static/images/other/aranciaTONDASPICCHIOsabbia-01.png"></img>
							</figure>
							<div class="title_buttons">
								<h4 class="m-0 mb-3 small mb-lg-4"><xsl:value-of select="$title"/>05 | LA CASSETTA MISTA DI AGRUMI</h4>
								<h6 class="p_bold m-0 mb-3"><xsl:value-of select="$subtitle"/></h6>
								<!-- bottone da ciclare e dinamicizzare -->
								<a class="btn_bg_second d-block mb-2 col-12" style="">
									<div class="p-0 pe-2 d-inline" style="">
										<span class="never_text smaller">arance da tavola + limoni / cassetta 16 kg / € 29,90</span>
									</div>

									<!-- <i class="courses_icon btn_white fa-light fa-arrow-right-long float-end" style=""></i> -->
								</a>

								<!-- bottoni test statico da cancellare -->
								<a class="btn_bg_second d-block mb-2 col-12" style="">
									<div class="p-0 pe-2 d-inline" style="">
										<span class="never_text smaller">arance da tavola + limoni / cassetta 16 kg / € 39,90</span>
									</div>

									<!-- <i class="courses_icon btn_white fa-light fa-arrow-right-long float-end" style=""></i> -->
								</a>
								<a class="btn_bg_second d-block mb-2 col-12" style="">
									<div class="p-0 pe-2 d-inline" style="">
										<span class="never_text smaller">arance da tavola + limoni / cassetta 16 kg / € 89,90</span>
									</div>

									<!-- <i class="courses_icon btn_white fa-light fa-arrow-right-long float-end" style=""></i> -->
								</a>
								<a class="btn_bg_second d-block mb-2 col-12" style="">
									<div class="p-0 pe-2 d-inline" style="">
										<span class="never_text smaller">arance da tavola + limoni / cassetta 16 kg / € 124,90</span>
									</div>

									<!-- <i class="courses_icon btn_white fa-light fa-arrow-right-long float-end" style=""></i> -->
								</a>

								<a class="btn_bg_second width_content d-block mb-2 col-12" style="">
									<div class="p-0 pe-4 d-inline" style="">
										<span class="never_text smaller"><xsl:value-of select="/data/translate/entry[code = 'buy']/*[local-name() = $lanextended]"/></span>
									</div>

									<i class="courses_icon btn_white fa-light fa-citrus-slice float-end" style=""></i>
								</a>

							</div>
						</div>
						<div class="space_home_element space_home_img col-12 col-lg-7" style="background-image: url('{$workspace}/static/images/other/cassetta_mista.png');">
							<!-- <figure class="col-12 m-0 mb-3 mb-lg-0">
								<img class="w-100" src="{$root}/image/4/800/0/uploads/{$imgname}"></img>
							</figure> -->
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>

		</div>

	</xsl:template>

</xsl:stylesheet>
