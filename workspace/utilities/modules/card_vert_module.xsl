<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="card_vert_module">
		<xsl:param name="img"/>
		<div class="card_vert_module col-12 col-lg-4 pe-md-5 mb-4 mb-lg-6">
			<div class="card_vert_container d-block col-12 text-center h-100">
				<a class="d-block col-12 text-center a_card" href="#">
					<div class="card_header mb-4 d-flex align-items-top justify-content-center" style="background-image: url('{$workspace}/uploads/{$img}');">
						<div class="square_data">
							<time class="date_card_vert_home day d-block mb-1 mt-0">
								<xsl:call-template name="day">
									<xsl:with-param name="date" select="date"/>
								</xsl:call-template>
							</time>
							<time class="date_card_vert_home month d-block mb-1 mt-0">
								<xsl:call-template name="month_label">
									<xsl:with-param name="date" select="date"/>
								</xsl:call-template>
							</time>
							<time class="date_card_vert_home year d-block mb-1 mt-0">
								<xsl:call-template name="year">
									<xsl:with-param name="date" select="date"/>
								</xsl:call-template>
							</time>
						</div>
					</div>
					<time class="time_card_vert_home d-block mb-3"><xsl:value-of select="date/@time"/></time>
					<h6 class="title_vert_card h6 m-0 mb-4 col-8 col-xl-9 mx-auto d-block text-uppercase">
						<xsl:value-of select="*[local-name() = $titlelan]"/>
					</h6>
					<p class="btn_white_blue small go_vert d-inline-block text-uppercase p-2 mb-4 mt-0">
						<xsl:value-of select="/data/translate/entry[code = 'send']/*[local-name() = $lanextended]"/>
					</p>
				</a>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
