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

	<xsl:template name="hero_html5_module">
		<div class="hero_html5_module">
			<div class="hero_rmg d-flex align-items-center justify-content-start">
				<div class="hero_rmg_div w-100">
					<video id="bg-video" class="video-js vjs-default-skin"
						 autoplay="autoplay" muted="muted" loop="loop" playsinline="playsinline" style="position:absolute;top:0;left:0;overflow:hidden;z-index:-998;">
						<source src='{$workspace}/static/videos/orange_1.mp4' type='video/mp4'/>
						<source src='{$workspace}/static/videos/orange_1.webm' type='video/webm'/>
						<source src="{$workspace}/static/videos/orange_1.ogv" type="video/ogg"/>
						<p class='vjs-no-js'>
						  To view this video please enable JavaScript, and consider upgrading to a web browser that
						  <a href='https://videojs.com/html5-video-support/' target='_blank'>supports HTML5 video</a>
						</p>
					</video>
					<div class="box_testo_hero col-12 d-flex align-items-center px-2 px-md-5">
						<div class="px-2">
							<h3 class="h4_home px-2 px-md-5 pt-3 pt-md-0 text-warning" style="font-size: 1.5rem;opacity: 0.6;"><xsl:value-of select="/data/translate/entry[code = 'holiday']/*[local-name() = $lan]"/>h3</h3>
							<h3 class="h3_home px-2 px-md-5 pt-3 pt-md-0 text-danger" style="font-weight:900"><xsl:value-of select="/data/translate/entry[code = 'holiday2']/*[local-name() = $lan]"/></h3>

							<h1 class="h1_home px-2 px-md-5 pt-3 pt-md-0">h1<xsl:value-of select="/data/home/entry/*[local-name() = $titlelan]"/></h1>
							<h2 class="h2_home px-2 px-md-5 mb-4">h2<xsl:value-of select="/data/home/entry/*[local-name() = $subtitlelan]"/></h2>
							<a class="chi_siamo px-2 px-md-5 scroll-to" href="#" data-target="#carousel_rgm_1"><xsl:value-of select="/data/translate/entry[code = 'whoam']/*[local-name() = $lan]"/><i class="fa fa-chevron-down ml-4" aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
			</div>
			</div>
	</xsl:template>





</xsl:stylesheet>
