<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="footer_simple">

		<div class="footer_partial">

			<footer class="sizing_wrapper color_white bg_color_second row align-items-center mx-n3 py-4 container_humanbit_1">

                <div class="footer_wrapper row justify-content-between align-items-center col-7 col-sm-5 col-md-12 container_max_width_1">
                    <!-- Box left (LOGO) -->
                    <div class="box_1 col-12 col-md-4 mb-3 mb-md-0 px-3">
                        <figure class="logo_wrapper col-10 col-sm-12 col-md-8 col-lg-7 col-xl-6 col-xxl-4">
                            <img class="logo_primary img-fluid" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="Logo" />
                        </figure>
                    </div>

                    <!-- Box center (INSTITUTIONAL INFORMATION -->
                    <div class="box_2 copyright_container color_white col-12 col-md-4 row my-3 my-md-0 px-3">
                        <div class="inner_wrapper row col-12 col-md-12 col-lg-8 col-xl-7 col-xxl-5 mx-auto">
                            <p class="footer_text mb-2">Humanbit S.r.l</p>

                            <p class="footer_text">P.IVA 12251470964</p>
                        </div>
                    </div>

                    <!-- Box right (INSTITUTIONAL LEGAL) -->
                    <div class="box_3 color_white col-12 col-md-4 footer menu_footer_2 row px-3">
                        <div class="spacing_wrapper ms-md-auto w-auto">
                            <a class="service_link color_white d-block mb-2" href="mailto:info@humanbit.it">
								<i class="footer_icon fal fa-envelope align-middle me-2" />
								<p class="footer_text d-inline-block">info@humanbit.com</p>
							</a>

                            <div class="service_wrapper d-flex flex-wrap color_gray_footer my-0 ps-0">
                                <!-- <xsl:choose>
                                    <xsl:when test="lan='it'">
                                        <a class="service_link text-uppercase p-0" href="{$root}/workspace/uploads/privacy_policy.pdf" target="_blank">Privacy</a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <a class="service_link text-uppercase p-0" href="{$root}/workspace/uploads/humanbit-Privacy-en.pdf" target="_blank">Privacy</a>
                                    </xsl:otherwise>
                                </xsl:choose> -->

                                <p class="copyright_text">
									<bold>©</bold> 2022 Humanbit
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </footer>

		</div>

	</xsl:template>

</xsl:stylesheet>
