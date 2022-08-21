<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

	<xsl:include href="../utilities/default_template.xsl" />

	<xsl:template name="head">
	</xsl:template>

	<xsl:template name="page_structure">

		<div class="home_partial">

			<xsl:call-template name="modal_credits_module" />
			<div class="container_humanbit_1">
				<div class="container_max_width_1 py-5 mb-5">
					<main class="row justify-content-between py-5">
						<div class="col-12 col-lg-6 container_max_width_">
							<a class="doc_link h3 color_sixth d-block mb-3" href="{$root}/humanbit-doc">Documentazione Humanbit</a>

							<a class="doc_link h3 color_sixth d-block mb-3" href="{$root}/linetobe-test">Test Linetobe</a>

							<a class="doc_link h3 color_sixth d-block" href="{$root}/spid-test">Test SPID</a>
						</div>

						<div class="sidebar text-lg-end fw_600 row justify-content-end align-content-start col-12 col-lg-6">
							<a class="anchor_tag d-block mb-2" href="#modules">
								<span class="reg_fill d-inline-block">
									Modules - Cards and Rows
								</span>
							</a>

							<a class="anchor_tag d-block mb-2" href="#slides">
								<span class="reg_fill d-inline-block">
									Modules - Slides
								</span>
							</a>

							<a class="anchor_tag d-block" href="#modalsAndForms">
								<span class="reg_fill d-inline-block">
									Modals &amp; Forms
								</span>
							</a>
						</div>
					</main>
				</div>
			</div>


			<!-- Modules -->
			<div id="modules">
				<h2 class="col-12 py-4 text-center color_white bg_color_second mb-6">Modules</h2>
			</div>

			<div class="container_humanbit_1">
				<div class="container_max_width_1 py-5 mb-5">
					<!-- card horizontal module -->
					<h5 class="col-12 py-1 text-center bg_color_third mb-5" style="color: white;">card_horiz_module (horizontal card with text image and button)</h5>
					<xsl:for-each select="/data/article/entry">
						<xsl:variable name="idArticle" select="@id"/>
						<xsl:call-template name="card_horiz_module">
							<xsl:with-param name="img" select="/data/article-media/entry[article/item/@id = $idArticle]/image/filename"/>
						</xsl:call-template>
					</xsl:for-each>
				</div>
			</div>

			<div class="container_humanbit_1">
				<div class="container_max_width_1 row py-5">
					<!-- card vertical module -->
					<h5 class="col-12 py-1 text-center bg_color_third mb-5" style="color: white;">card_vert_module (vertical card with background image)</h5>
					<xsl:for-each select="/data/article/entry">
						<xsl:variable name="idArticle" select="@id"/>
						<xsl:call-template name="card_vert_module">
							<xsl:with-param name="img" select="/data/article-media/entry[article/item/@id = $idArticle]/image/filename"/>
						</xsl:call-template>
					</xsl:for-each>
				</div>
			</div>


			<div class="container_humanbit_1">
				<div class="container_max_width_1 py-5 mb-5">
					<!-- text img row -->
					<h5 class="col-12 py-1 text-center bg_color_third mb-5" style="color: white;">text_img_row_module (alternate positioned text image row with cicled paddings and button)</h5>

					<xsl:for-each select="/data/article/entry">
						<xsl:variable name="idArticle" select="@id"/>
						<xsl:call-template name="text_img_row_module">
							<xsl:with-param name="title" select="*[local-name() = $titlelan]"/>
							<xsl:with-param name="subtitle" select="*[local-name() = $subtitlelan]"/>
							<xsl:with-param name="abstract" select="*[local-name() = $abslan]"/>
							<xsl:with-param name="imgname" select="/data/article-media/entry[article/item/@id = $idArticle]/image/filename"/>
						</xsl:call-template>
					</xsl:for-each>
				</div>
			</div>

			<div class="container_humanbit_1">
				<div class="container_max_width_1 py-5 mb-5">
					<!-- text img row -->
					<h5 class="col-12 py-1 text-center bg_color_third mb-5" style="color: white;">hero html 5 (da dinamicizzare)</h5>
						<xsl:variable name="idArticle" select="@id"/>

						<xsl:call-template name="hero_html5_module">
							<xsl:with-param name="title" select="*[local-name() = $titlelan]"/>
							<xsl:with-param name="subtitle" select="*[local-name() = $subtitlelan]"/>
							<xsl:with-param name="abstract" select="*[local-name() = $abslan]"/>
							<xsl:with-param name="imgname" select="/data/article-media/entry[article/item/@id = $idArticle]/image/filename"/>
						</xsl:call-template>
				</div>
			</div>

			<div id="slides" class="container_humanbit_1">
				<div class="container_max_width_1 row py-5">
					<!-- slide selection image module -->
					<h5 class="col-12 py-1 text-center bg_color_third mb-5" style="color: white;">Slide selection image module 1 (immagini da dinamicizzare: devono corrispondere all'articolo giusto)</h5>
					<xsl:call-template name="slide_selection_module_image_1">
						<xsl:with-param name="nodecont" select="'article'"/>
						<xsl:with-param name="nodemedia" select="'article-media'"/>
					</xsl:call-template>
				</div>
			</div>

			<div class="container_humanbit_1">
				<div class="container_max_width_1 row py-5">
					<!-- slide selection image module -->
					<h5 class="col-12 py-1 text-center bg_color_third mb-5" style="color: white;">slide_imgs_inside_card_module (*da dinamicizzare)</h5>

					<div class="event_gallery_container col-12 row py-4">
						<xsl:call-template name="slide_imgs_inside_card_module">
							<xsl:with-param name="nodecont" select="'article'"/>
							<xsl:with-param name="nodemedia" select="'article-media'"/>
						</xsl:call-template>
					</div>
				</div>

				<!-- modal img -->
				<div class="modal_event_news">

					<div class="modal modal_slider_image fade" id="modal_event">

						<div class="modal-dialog mt-0">

							<div class="modal-content">

								<div class="modal-body">
									<div class="modal-header mt-0 mb-2">
										<button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"><i class="fa-light fa-xmark"></i></button>
									</div>

									<div class="slider_img mb-0 mb-lg-0 slide_hero_home">
										<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
										<!-- <div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('{$workspace}/static/images/other/interno3.png');"></div> -->
										<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
										<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>
										<div class="container_img_product_slider slide_item bottom-0 mb-3" style="background-image: url('https://picsum.photos/300/200?random=2');"></div>>

										<!-- <button class="slick-prev prev slick-arrow" aria-label="Previous" type="button" aria-disabled="false" style=""></button>
										<button class="slick-next next  slick-arrow" aria-label="Next" type="button" style="" aria-disabled="false"></button> -->
									</div>

									<div class="col-12 modal_title_container text-center">
										<h2 class="modal_event_title small d-inline pe-2">Titolo evento<time class="d-inline-block small text-uppercase modal_event_time ps-3">22 marzo 2022</time></h2>
									</div>
								</div>

							</div>

						</div>

					</div>

				</div>
			</div>

			<div class="container_humanbit_1">
				<div class="container_max_width_1 row py-5">
					<!-- slide selection no image module -->
					<h5 class="col-12 py-1 text-center bg_color_third mb-5" style="color: white;">Slide selection no image module</h5>
					<xsl:call-template name="slide_selection_module_noimage">
						<xsl:with-param name="nodecont" select="'article'"/>
					</xsl:call-template>
				</div>
			</div>

			<div class="container_humanbit_1">
				<div class="container_max_width_1 row py-5">
					<!-- slide selection image module -->
					<h5 class="col-12 py-1 text-center bg_color_third mb-5" style="color: white;">Slide selection image module 2 (*da dinamicizzare e stilizzare)</h5>
					<xsl:call-template name="slide_selection_module_image_2">
						<xsl:with-param name="nodecont" select="'article'"/>
						<xsl:with-param name="nodemedia" select="'article-media'"/>
					</xsl:call-template>
				</div>
			</div>


			<div class="container_humanbit_1">
				<div class="container_max_width_1 row py-5">
					<!-- slide hero home module -->
					<h5 class="col-12 py-1 text-center bg_color_third mb-5" style="color: white;">Slide hero home module (*da sistemare)</h5>

					<xsl:for-each select="/data/article/entry">
						<xsl:call-template name="slide_hero_home_module">
							<xsl:with-param name="title" select="*[local-name() = $titlelan]"/>
							<xsl:with-param name="color" select="color"/>
							<xsl:with-param name="abstract" select="*[local-name() = $abslan]"/>
							<!-- <xsl:with-param name="body" select="*[local-name() = $bodylan]"/> -->
						</xsl:call-template>
					</xsl:for-each>
				</div>
			</div>


			<!-- Modals and Forms -->
			<div id="modalsAndForms">
				<h2 class="col-12 py-4 text-center color_white bg_color_second mb-5">Modals and Forms</h2>
			</div>

			<div class="container_humanbit_1">

				<div class="container_max_width_1 py-5 mb-5">
					<!-- Registration modals -->
					<h5 class="col-12 text-center bg_color_third mb-5 py-1" style="color: white;">Registration modals</h5>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#loginModal">
						Login
					</button>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#registerModal">
						Registration
					</button>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#pwChangeModal">
						Change password
					</button>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#forgotModal">
						Forgot password
					</button>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#forgotSuccessModal">
						Forgot password (SUCCESS)
					</button>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#forgotErrorModal">
						Forgot password (ERROR)
					</button>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#msgSuccessModal">
						Service message (SUCCESS)
					</button>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#msgErrorModal">
						Service message (ERROR)
					</button>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#newsletterB2cModal">
						Newsletter B2C
					</button>

					<h5 class="text-center color_white bg_color_third col-12 mt-10 mb-5 py-1">Other modals</h5>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn_bg_first me-2 mb-3" data-bs-toggle="modal" data-bs-target="#modal_credits">
						Credits
					</button>



					<!-- Registration forms -->
					<h5 class="text-center bg_color_third col-12 mt-10 mb-5 py-1" style="color: white;">Register form</h5>

					<xsl:call-template name="register" />

					<h5 class="text-center bg_color_third col-12 mt-10 mb-5 py-1" style="color: white;">Change Form</h5>

					<xsl:call-template name="change_pw" />

					<h5 class="text-center bg_color_third col-12 mt-10 mb-5 py-1" style="color: white;">Address Form</h5>

					<xsl:call-template name="address" />

					<h5 class="text-center bg_color_third col-12 mt-10 mb-5 py-1" style="color: white;">Newsletter magazine form</h5>

					<xsl:call-template name="newsletter_magazine" />

					<!-- Form date example -->
					<h5 class="text-center bg_color_third col-12 mt-10 mb-5 py-1" style="color: white;">Form elements</h5>

					<!-- Date input -->
					<div class="form_date row">
						<div class="input_date_wrapper col-12 col-lg-6 col-xl-3 mb-4 pe-lg-3">
							<label class="date_label d-block mb-2">Data d'inizio servizio:</label>

							<input class="date_input h5 border-0 w-100" name="fields[angel-start]" type="date" required="required" style="cursor: text;" />
						</div>

						<div class="input_date_wrapper col-12 col-lg-6 col-xl-3 mb-4 ps-lg-3">
							<label class="date_label d-block mb-2">Data di check-in:</label>

							<input class="date_input h5 border-0 w-100" name="fields[check-in]" type="date" required="required" style="cursor: text;" />
						</div>
					</div>

					<!-- File input -->
					<div class="input_file">
						<label for="formFile" class="form-label label mb-2">Default file input example</label>

						<input class="form-control" id="formFile" type="file" />
					</div>
				</div>

			</div>

			<!-- Back to top -->
			<a class="back_top d-flex" href="#">
				<i class="fa-solid fa-arrow-up-from-line m-auto" />
			</a>
		</div>


	</xsl:template>

</xsl:stylesheet>
