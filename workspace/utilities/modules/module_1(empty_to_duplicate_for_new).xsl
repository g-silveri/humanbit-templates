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

	<!-- when you call the template whatch wich parameter expexts (xsl:param subito sotto i tempalte) and pass them on call template

		ex:

		template:
		<xsl:template name="module_1">
			<xsl:param name="nodecont"/>
			<xsl:param name="nodemedia"/>
		</xsl:template>

		call template:
		<xsl:call-template name="module_1">
			<xsl:with-param name="nodecont" select="'(nme_data_source)'"/>
			<xsl:with-param name="nodemedia" select="'(nme_data_source)'" />
		</xsl:for-each> -->


	<!-- module 1 -->

	<xsl:template name="module_1">
		<xsl:param name="nodecont"/>
		<xsl:param name="nodemedia"/>
		<div class="slide_selection_module">
			<div class="position-relative mb-6 viewport">
				<div class="wrapper-arrows position-relative slider-for-home">
					<div class="slider slider-nav bottom-0 pb-5">
						<xsl:for-each select="/data/*[local-name() = $nodecont]/entry">
							<a class="link_product" href="#">
								<!-- {$root}/product/{$idproduct}/{$lanurl} -->
								<div class="container_product pb-3">
									<div class="link_product_container">
										<xsl:choose>
											<xsl:when test="/data/*[local-name() = $nodemedia]/entry[image/filename]">
												<div class="container_img_product_slider" style="background-image: url('{$root}/image/4/400/0/uploads/{/data/*[local-name() = $nodemedia]/entry/image/filename}');"></div>
											</xsl:when>
											<xsl:otherwise>
												<div class="container_img_product_slider" style="background-image: url('{$root}/image/4/400/0/static/bootstrap/images/img_standard_dimore.jpg');"></div>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="hero_text col-auto text-start ps-3 pe-3">
										<h4 class="nomeproductTestata text-start h6 mb-2 color_white"><xsl:value-of select="*[local-name() = $titlelan]"/></h4>
										<p class="p_small mt-0"><xsl:value-of select="*[local-name() = $abslan]"/></p>
									</div>
								</div>
							</a>
						</xsl:for-each>
					</div>
					<i class="slickdsi-prev fa-solid fa-chevron-left align-middle"></i>
					<i class="slickdsi-next fa-solid fa-chevron-right align-middle"></i>
				</div>

			</div>
		</div>
	</xsl:template>


</xsl:stylesheet>
