<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="navbar_large">
        <div class="nav_partial">
				<nav class="container_humanbit_1_nav navbar navbar-expand-lg navbar-light row m-0 py-0" style="">
					<div class="menu-items_container row align-items-top align-items-lg-end justify-content-between container_max_1400">
						<div class="logo_header_container_mobile padding_humanbit_1_left">
							<a class="navbar-brand navbar-toggler col-6 m-0 ps-0" href="{$root}" title="milanosport home">
								<img class="ps-0 w-100" src="{$workspace}/static/images/logos/milanosport_LOGO_Orizzontale.svg" alt="milanosport" style=""/>
							</a>
						</div>
						<button class="navbar-toggler col-2 py-0 padding_humanbit_1_right d-flex align-items-top justify-content-end d-block d-lg-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon" style="float:right;"></span>
						</button>


							<!-- voci menu -->
							<div class="menu_items collapse navbar-collapse col-12 row align-items-end justify-content-between py-lg-4" id="navbarSupportedContent">
								<ul class="menu_items_internal navbar-nav col-12 col-lg-8 py-5 py-lg-0 mt-5 mt-lg-0" style="">
									<li class="landmark">
										<a href="{$root}/lista-corsi/corsi" title="Corsi">Corsi</a><span class="spit_line px-1 px-xl-1 px-xxl-3">|</span>
									</li>

									<!-- collapse impianti trigger -->
									<li class="landmark li-menu-impianti">
										<a class="trigger_collapse_menu" href="#collapse_impianti" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapse_impianti">Impianti</a><span class="spit_line px-1 px-xl-1 px-xxl-3">|</span>
									</li>

									<!-- collapse sport trigger -->
									<li class="landmark li-menu-sport">
										<a class="trigger_collapse_menu" href="#collapse_sport" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapse_sport">Sport</a><span class="spit_line px-1 px-xl-1 px-xxl-3">|</span>
									</li>


									<li class="landmark grey li-menu-locations">
										<a class="color_nineth" href="https://allianzcloud.it/" target="_blank" title="Affitta spazi">Allianz Cloud</a><span class="spit_line px-1 px-xl-1 px-xxl-3">|</span>
									</li>

									<!-- collapse acquista trigger -->
									<li class="landmark grey li-menu-buy">
										<a class="trigger_collapse_menu color_nineth" href="#collapse_buy" title="biglietteria" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapse_buy" >Acquista</a><span class="spit_line px-1 px-xl-1 px-xxl-3">|</span>
									</li>

									<li class="landmark">
										<a class="color_nineth" href="{$root}/istituzionali/orari-norme/" title="Corsi">Orari e info</a><span class="spit_line px-1 px-xl-1 px-xxl-3">|</span>
									</li>

									<li class="landmark">
										<a class="color_first" href="{$root}/lista-eventi" title="Corsi">Eventi</a><span class="spit_line px-1 px-xl-1 px-xxl-3">|</span>
									</li>

									<li class="landmark grey li-menu-cerca">
										<a class="color_first" href="{$root}/lista-news" title="">News</a>
									</li>

									<!-- logo -->
									<!-- <a class="navbar-brand-collapse collapse navbar-collapse" href="{$root}" title="milanosport home">
										<img src="{$workspace}/static/images/milanosport_old/img/logo.jpg" alt="milanosport" style="width:150px;padding-left:20px;margin-top:-22px;" />
									</a> -->
								</ul>


									<!-- logo nav internal -->
									<a class="logo_nav_internal desk d-none d-lg-block col-2" href="{$root}">
										<figure class="col-12 text-end">
											<img class="nav_logo hor_line_img w-75 mb-0" src="{$workspace}/static/images/logos/milanosport_LOGO_Orizzontale.svg">
												<xsl:if test="$current-page='home'"><xsl:attribute name="class">hor_line_img w-75 mb-0 opacity_0</xsl:attribute></xsl:if>
											</img>
										</figure>
									</a>

							</div>

					</div>
				</nav>

        </div>

		<div class="nav_menu_collapse">
			<!-- collapse impianti container -->
			<div id="collapse_impianti" class="collapse_menu collapse">
				<a id="menu-impianti" class="impianti_all d-block container_humanbit_1 py-4" href="{$root}/impianti" title="Impianti">
					<div class="container_max_1400_padding_r">
						<h3 class="text_transform_none text_decoration_none border_none"><span class="me-3">Tutti gli impianti</span><i class="fa-light fa-arrow-right-long"></i>
						</h3>
					</div>
				</a>

				<div class="impianti_list container_humanbit_1 py-5">
					<div class="container_max_1400_padding_r row">
						<div class="col-12 col-lg-4 pe-lg-3">
							<xsl:for-each select="/data/tipo-complessi/entry[tipo/@handle = 'piscina']">
								<xsl:variable name="idtipo" select="@id"/>
								<xsl:if test="count(/data/home-imp-list/tipo[@link-id = $idtipo]/entry)">
									<div class="col-12 pe-lg-4 pb-4 pb-lg-0">
											<h3 class="text_transform_none text_decoration_none col-12 py-2" style="color:{colore}"><xsl:value-of select="tipo"/></h3>
											<ul class="ps-0 mb-0">
												<xsl:for-each select="/data/home-imp-list/tipo[@link-id = $idtipo]">
													<xsl:for-each select="entry">
														<xsl:variable name="tipoco" select="tipo/item/@id"/>
														<li class="pool_list" style="">
															<a style="color:white" href="{$root}/impianto/{@id}/{nome/@handle}/{id-sistema}"><xsl:value-of select="nome"/></a>
														</li>
													</xsl:for-each>
												</xsl:for-each>
											</ul>

									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div class="col-12 col-lg-8 row pe-lg-3">
							<xsl:for-each select="/data/tipo-complessi/entry[tipo/@handle != 'piscina']">
								<xsl:variable name="idtipo" select="@id"/>
								<xsl:if test="count(/data/home-imp-list/tipo[@link-id = $idtipo]/entry)">
									<div class="col-12 col-lg-6 pe-lg-4 pb-4 pb-lg-0">
											<h3 class="text_transform_none text_decoration_none col-12 py-2" style="color:{colore}"><xsl:value-of select="tipo"/></h3>
											<ul class="ps-0 mb-0">
												<xsl:for-each select="/data/home-imp-list/tipo[@link-id = $idtipo]">
													<xsl:for-each select="entry">
														<xsl:variable name="tipoco" select="tipo/item/@id"/>
														<li class="pool_list" style="">
															<a style="color:white" href="{$root}/impianto/{@id}/{nome/@handle}/{id-sistema}"><xsl:value-of select="nome"/></a>
														</li>
													</xsl:for-each>
												</xsl:for-each>
											</ul>

									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				</div>
			</div>

			<!-- collapse sport container -->
			<div id="collapse_sport" class="collapse_menu collapse_sport collapse collapsing">
				<div class="impianti_list container_humanbit_1 py-5">
					<div class="container_max_1400_padding_r">
							<ul class="ps-0 mb-0 row sport_list">
								<xsl:for-each select="/data/sport/entry[position() &lt; 16]">
									<li class="sport_list_menu col-12 col-lg-4 pe-4 mb-3">
										<a class="link_title_sport_menu d-block" href="{$root}/sport/{@id}/{nome/@handle}/{id-sistema}"><h3 class="text_transform_none text_decoration_none text-center text-lg-start py-2 px-2" style="border-color:{colore}; color: white;"><xsl:value-of select="nome"/></h3></a>
										<a class="link_icon_sport_menu d-block" href="{$root}/sport/{@id}/{nome/@handle}/{id-sistema}">
										<figure class="icon_title_container area_container mx-auto mx-lg-0 icon_course align-self-end col-3 p-3 mt-4 mb-3" style="background-color:{colore};">
											<img class="w-100 mx-auto" src="{$workspacems}/uploads/{image/filename}"></img>
										</figure>
										</a>
										<!-- <figure class="icon_title_container area_container col-2 col-lg-1 p-3" style="background-color:{/data/dettaglio-sport/entry/colore};"> -->
									</li>
								</xsl:for-each>
							</ul>
					</div>
				</div>
			</div>

			<!-- collapse buy container -->
			<div id="collapse_buy" class="collapse_menu collapse">
				<div class="impianti_list">
					<div class="">
							<ul class="ps-0 mb-0 row sport_list">
								<li class="col-12 col-lg-12 mb-0" style="color: #0095D6;">
									<a href="https://milanosport.clappit.com/"><h3 class="container_humanbit_1 text_transform_none color_fourth bg_color_piscine d-block text_decoration_none py-4" style="height: auto;">Biglietteria piscine <i class="fa-light color_fourth fa-arrow-right-long"></i></h3></a>
								</li>
								<li class="col-12 col-lg-12 mb-0">
									<a href="{$root}/lista-corsi/corsi/"><h3 class="container_humanbit_1 text_transform_none color_fourth bg_color_fifth d-block text_decoration_none py-4" style="">Corsi<i class="fa-light color_fourth fa-arrow-right-long"></i></h3></a>
								</li>

								<li class="col-12 col-lg-12 mb-0">
									<a href="{$root}/corso/45/Campus/342"><h3 class="container_humanbit_1 text_transform_none color_fourth text_decoration_none bg_color_campus d-block py-4" style="">Campus<i class="fa-light color_fourth fa-arrow-right-long"></i></h3></a>
								</li>

								<li style="height: auto;" class="col-12 col-lg-12 mb-0">
									<a href="https://milanosport.clappit.com/corsi-fitness/showSeasonList.html" target="_blank"><h3 class="container_humanbit_1 text_transform_none text_decoration_none color_fourth bg_color_fitness_fitcard d-block py-4" style="">Tessere Fit<i class="fa-light fa-arrow-right-long color_fourth"></i></h3></a>
								</li>
							</ul>
					</div>
				</div>
			</div>
		</div>

	</xsl:template>
</xsl:stylesheet>
