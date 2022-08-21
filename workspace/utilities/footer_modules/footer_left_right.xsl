<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="footer_left_right">

		<div class="footer_partial">

            <footer class="sizing_wrapper color_white bg_color_second row align-items-center container_humanbit_1">

                <div class="footer_wrapper row justify-content-between col-12 m-0 py-4 container_max_width_1">
                    <!-- Box left (LOGO | INSTITUTIONAL INFORMATION) -->
                    <div class="footer_left text-center text-lg-start row justify-content-between align-items-top col-12 col-lg-7 border-bottom border-bottom-lg-0 p-0">
                        <div class="box_1 col-12 col-md-6 mb-5 mb-lg-0 pe-md-4">
                            <figure class="logo_wrapper col-7 col-sm-6 col-md-9 col-lg-10 col-xl-7 col-xxl-6 mx-auto mx-lg-0 mb-4 pb-md-2">
                                <img class="logo_primary img-fluid" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="Logo" />
                            </figure>

                            <p class="inner_wrapper mb-2">
                                <i class="footer_icon fas fa-map-marked me-2" />
                                <span class="footer_text">Via Cavour, 256 - 00184 Roma</span>
                            </p>

                            <a class="inner_wrapper color_white d-block mb-2" href="tel:+39066833714">
                                <i class="footer_icon fad fa-phone-alt me-2" />
                                <p class="footer_text d-inline-block">Tel. +39 06 6833714</p>
                            </a>

                            <a class="inner_wrapper color_white d-block mb-2" href="mailto:info@humanbit.it">
                                <i class="footer_icon fal fa-envelope me-2" />
                                <p class="footer_text d-inline-block">info@humanbit.it</p>
                            </a>

                            <p class="footer_text">
                                P.IVA 03662671001
                            </p>
                        </div>

                        <div class="box_2 col-12 col-md-6 mb-4 mb-lg-0 pe-lg-4 ps-md-4 ps-lg-0">
                            <figure class="logo_wrapper col-7 col-sm-6 col-md-9 col-lg-10 col-xl-7 col-xxl-6 mx-auto mx-lg-0 mb-4 pb-md-2">
                                <img class="logo_secondary img-fluid" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="Logo" />
                            </figure>

                            <a class="social_link h3 color_white d-inline-block mb-1 pe-3" data-bs-toggle="modal" data-bs-target="#creditsa">
                                <i class="social_icon fa-brands fa-facebook align-middle" />
                            </a>

                            <a class="social_link h3 color_white d-inline-block mb-1 pe-3" data-bs-toggle="modal" data-bs-target="#creditsa">
                                <i class="social_icon fab fa-instagram-square align-middle" />
                            </a>

                            <a class="social_link h3 color_white d-inline-block mb-1 pe-3" data-bs-toggle="modal" data-bs-target="#creditsa">
                                <i class="social_icon fab fa-twitter-square align-middle" />
                            </a>

                            <a class="social_link h3 color_white d-inline-block mb-1 pe-3" data-bs-toggle="modal" data-bs-target="#creditsa">
                                <i class="social_icon fa-brands fa-linkedin align-middle" />
                            </a>

                            <a class="social_link h3 color_white d-inline-block mb-1" data-bs-toggle="modal" data-bs-target="#creditsa">
                                <i class="social_icon fa-brands fa-youtube align-middle" />
                            </a>
                        </div>
                    </div>

                    <!-- Box right (INSTITUTIONAL LEGAL) -->
                    <div class="footer_right text-center text-lg-end row justify-content-center justify-content-lg-end align-content-end col-12 col-lg-5 mt-4 mt-lg-0">
                        <div class="menu_footer_2 d-flex flex-wrap justify-content-center justify-content-lg-end col-12 m-0 mb-2 p-0">
                            <xsl:choose>
                                <xsl:when test="lan='it'">
                                    <a class="service_link text-uppercase color_white" href="{$root}/workspace/uploads/privacy_policy.pdf" target="_blank">Privacy</a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a class="service_link text-uppercase color_white" href="{$root}/workspace/uploads/humanbit-Privacy-en.pdf" target="_blank">Privacy</a>
                                </xsl:otherwise>
                            </xsl:choose>

                            <span class="px-2">|</span>

                            <a class="service_link text-uppercase color_white" href="{$root}/article/290318/cookie/{$lanurl}" target="_blank">
                                Cookies
                            </a>

                            <span class="px-2">|</span>

                            <a class="service_link text-uppercase color_white" data-bs-toggle="modal" data-bs-target="#modal_credits">
                                Credits
                            </a>
                        </div>

                        <p class="copyright_text mt-2">
                            <bold>©</bold> 2022 Humanbit
                        </p>
                    </div>
                </div>

            </footer>

        </div>

	</xsl:template>

</xsl:stylesheet>
