<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="url-capitolo"/>
	<xsl:param name="url-tipo"/>
	<xsl:param name="url-sotto"/>
	<xsl:param name="url-email2"/>
	<xsl:param name="url-code"/>
	<xsl:param name="url-change"/>
	<xsl:param name="url-test"/>
	<xsl:param name="url-page"/>
	<xsl:param name="url-new"/>
	<xsl:param name="url-richiesta"/>
	<xsl:param name="categoria"/>
	<xsl:param name="url-iddata"/>

	<!-- #################################################################################################### -->

	<xsl:template name="slide_hero_home_module">
		<xsl:param name="title"/>
		<xsl:param name="abstract"/>
		<xsl:param name="body"/>
		<xsl:param name="color"/>
		<xsl:param name="subtitle"/>
		<xsl:param name="imgname"/>
		<xsl:param name="img"/>

		<div class="slide_hero_home_module">
				<div class="hero_home slide_hero_home" data-count="{count(/data/slider-home/entry)}">
					<xsl:for-each select="/data/slider-home/entry">
						<!-- <div class="slide_item" style="background-image: url('{$root}/image/4/1920/0/uploads/{image/filename}');"> -->
						<div class="slide_item" style="background-image: url('{$root}/image/4/800/0/uploads/{$imgname}')">
							<div class="velo d-flex align-items-center h-100 w-100 d-flex">
								<xsl:choose>
									<xsl:when test="position() = 1">
										<div class="container_allianz_3 w-100">
											<h1 class="title_sliders fx_matrix_doc_ready fx_matrix_doc_ready_left h1 col-8 mx-auto col-lg-7 col-xl-6 col-xxl-6 mx-lg-0 text-center text-lg-start m-0 py-3 pt-6">
												<xsl:value-of select="*[local-name() = $titlelan]" />
											</h1>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="container_allianz_3 w-100">
											<h3 class="title_sliders h1 col-8 mx-auto col-lg-7 col-xxl-6 mx-lg-0 text-center text-lg-start m-0 py-3 pt-6">
												<xsl:value-of select="*[local-name() = $titlelan]" />
											</h3>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
	</xsl:template>



	<xsl:template name="slide_hero_home_module_old">
		<div class="slide_hero_home_module_old">
			<div class="wrapper-arrows position-relative slider-for-home">
				<div class="slider slider-nav bottom-0">
					<div class="slide_item">
						<xsl:choose><xsl:when test="position() = 1"></xsl:when><xsl:otherwise></xsl:otherwise></xsl:choose>
						<div class="d-block col-sm-12 col-md-6 col-lg-4" style="float:left;"><xsl:if test="position()!=1"><xsl:attribute name="style"></xsl:attribute></xsl:if>
							<div class="title-sport">
								<xsl:variable name="sport" select="sport/item/@id"/>
								<h2><a href="#" title="{$title}" style="background-color:{$color}"><xsl:value-of select="$title"/></a></h2>
							</div>
							<p class="sport-abstract">
								<xsl:choose>
									<xsl:when test="$abstract != ''">
										<xsl:copy-of select="$abstract"/>&#160;(...)
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="$body != ''">
											<xsl:copy-of select="substring($body,1,150)"/><xsl:copy-of select="substring-before(substring($body,151),' ')"/>&#160;(...)
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</p>
							<div class="info-sport" style=""><a href="#" title="{$title}">INFO&#160;&#160;&#160;ACQUISTA</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>




</xsl:stylesheet>
