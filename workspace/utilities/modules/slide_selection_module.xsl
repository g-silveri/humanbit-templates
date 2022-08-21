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
		<xsl:template name="slide_selection_module_image">
			<xsl:param name="nodecont"/>
			<xsl:param name="nodemedia"/>
		</xsl:template>

		call template:
		<xsl:call-template name="slide_selection_module_image">
			<xsl:with-param name="nodecont" select="'(nme_data_source)'"/>
			<xsl:with-param name="nodemedia" select="'(nme_data_source)'" />
		</xsl:for-each> -->


	<!-- slide selection module image 1 -->
	<xsl:template name="slide_selection_module_image_1">
		<xsl:param name="nodecont"/>
		<xsl:param name="nodemedia"/>
		<div class="slide_selection_module">
			<div class="slider_img position-relative mb-0 mb-lg-0">
				<div class="wrapper-arrows position-relative slider-for-home">
					<div class="slider slider-nav bottom-0 pb-5">
						<xsl:for-each select="/data/*[local-name() = $nodecont]/entry">
							<xsl:variable name="idproduct" select="@id"/>
							<a class="link_product pe-sm-2 pe-lg-3 pb-4 pb-lg-0" href="#">
								<!-- {$root}/product/{$idproduct}/{$lanurl} -->
								<div class="container_product pb-0">
									<div class="link_product_container">
										<xsl:choose>
											<xsl:when test="/data/*[local-name() = $nodemedia]/entry[image/filename]">
												<div class="container_img_product_slider mb-4" style="background-image: url('{$root}/image/4/400/0/uploads/{/data/*[local-name() = $nodemedia]/entry/image/filename}');">

													<div class="info_sport border_color_white px-3 py-2">
														<span title="{nome}">INFO</span>
													</div>
												</div>
											</xsl:when>
											<xsl:otherwise>
												<div class="container_img_product_slider mb-4" style="background-image: url('{$root}/image/4/400/0/static/bootstrap/images/img_standard_dimore.jpg');"></div>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<div class="hero_text col-auto text-start">
										<h4 class="nomeproductTestata text-start h6 mb-2 border_color_black pb-2 mb-2"><xsl:value-of select="*[local-name()= $titlelan]"/></h4>
										<div class="caratteristiche col-12">
											<p class="small text-uppercase mb-1"><xsl:value-of select="*[local-name()= $abslan]"/></p>
										</div>
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

	<!-- slide selection module image 2 -->

	<xsl:template name="slide_selection_module_image_2">
		<xsl:param name="nodecont"/>
		<xsl:param name="nodemedia"/>
		<div class="slide_selection_module">
			<div class="slider_img_2 position-relative mb-6 viewport">
				<div class="wrapper-arrows position-relative slider-for-home">
					<div class="slider slider-nav bottom-0 pb-5">
						<xsl:for-each select="/data/*[local-name() = $nodecont]/entry">
							<a class="link_product pe-sm-2 pe-lg-3" href="#">
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


	<!-- slide selection module no image -->

	<xsl:template name="slide_selection_module_noimage">
		<xsl:param name="nodecont"/>
		<div class="slide_selection_module">
			<div class="slider_no_img position-relative">
				<div class="wrapper-arrows position-relative slider-for-home">
					<div class="slider slider-nav bottom-0">
						<xsl:for-each select="/data/*[local-name() = $nodecont]/entry">
							<a class="slider_no_img_card row py-4 me-sm-2 viewport me-lg-3" href="#">
								<div class="container_product pb-3">
									<div class="hero_text col-auto text-start px-3">
										<div class="nomeproductTestata col-12 row align-items-end justify-content-between border-color-white pb-3 mb-5">
											<h4 class="text-start col-9 h6 color_white"><xsl:value-of select="*[local-name()= $titlelan]"/></h4>
										</div>
										<p class="small text_product mt-0 mb-4"><xsl:copy-of select="*[local-name()= $abslan]"/></p>
									</div>
								</div>
								<div class="info_buy_home_courses_container info-sport px-3" style="">
									<div class="buy_home_courses color_third border_color_white d-inline-block py-2 px-3" style="">
										<span class="p-0 pe-2" style="">INFO E ACQUISTA</span><i class="courses_icon btn_white fa-light fa-arrow-right-long" style=""></i>
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
