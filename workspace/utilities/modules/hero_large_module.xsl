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

	<xsl:template name="hero_large_module">
		<div class="hero_large_module">
			<div class="container-slider position-relative">
				<div class="wrapper-arrows position-relative">
					<div class="slider slider-for-sogg">
						<!-- <div class="slide_img_large d-flex align-items-center justify-content-center" style="background-image: url('{$rootadsi}/workspace/uploads/{/data/com-dimora-commerciale-detail-media/entry/image/filename}');" data-img="{$rootadsi}/workspace/uploads/{/data/com-dimora-commerciale-detail-media/entry/image/filename}">
							<div class="hero_text col-auto text-center">
								<h1 class="nomeDimoraTestata color_white h1"><xsl:value-of select="/data/com-dimora-commerciale-detail/entry/*[local-name()=$titlelan]"/></h1>
								<h2 class="descrizioneDimoraTestata color_white h2"><xsl:value-of select="/data/com-dimora-commerciale-detail/entry/*[local-name()=$desclan]"/></h2>
							</div>
						</div> -->
						<div class="slide_img_large d-flex align-items-end">
							<xsl:attribute name="style">
								<xsl:choose>
									<xsl:when test="/data/com-dimora-commerciale-detail-media/entry[thumbnail = 'Yes'][image/filename]">background-image: url('<xsl:value-of select="$rootadsi"/>/workspace/uploads/<xsl:value-of select="/data/com-dimora-commerciale-detail-media/entry[thumbnail = 'Yes']/image/filename"/>');</xsl:when>
									<xsl:otherwise>
										<xsl:if test="/data/com-dimora-commerciale-detail-media/entry[thumbnail = 'Yes'][image-path]">background-image: url('<xsl:value-of select="$root"/>/workspace/uploads/<xsl:value-of select="/data/com-dimora-commerciale-detail-media/entry[thumbnail = 'Yes']/image-path"/>');</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>

								<h1 class="dimora_detail_name container_adsi_com"><xsl:value-of select="/data/com-dimora-commerciale-detail/entry/*[local-name()=$titlelan]"/></h1>


						</div>
						<!-- <div class="slide_img_large" style="background-image: url('https://picsum.photos/300/200?random=3');" data-img="https://picsum.photos/300/200?random=3"></div>
						<div class="slide_img_large" style="background-image: url('https://picsum.photos/300/200?random=4');" data-img="https://picsum.photos/300/200?random=4"></div>
						<div class="slide_img_large" style="background-image: url('https://picsum.photos/300/200?random=5');" data-img="https://picsum.photos/300/200?random=5"></div>
						<div class="slide_img_large" style="background-image: url('https://picsum.photos/300/200?random=6');" data-img="https://picsum.photos/300/200?random=6"></div>
						<div class="slide_img_large" style="background-image: url('https://picsum.photos/300/200?random=7');"></div>
						<div class="slide_img_large" style="background-image: url('https://picsum.photos/300/200?random=8');"></div>
						<div class="slide_img_large" style="background-image: url('https://picsum.photos/300/200?random=9');"></div>
						<div class="slide_img_large" style="background-image: url('https://picsum.photos/300/200?random=10');"></div> -->
					</div>

					<!-- <i class="slick-prev-sogg fa-solid fa-chevron-left align-middle" />
					<i class="slick-next-sogg fa-solid fa-chevron-right align-middle" /> -->
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
