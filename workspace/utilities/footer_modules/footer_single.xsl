<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="footer_single">

        <div class="footer_partial">

            <footer class="sizing_wrapper text-center color_white bg_color_second row align-items-center container_humanbit_1">

                <div class="footer_wrapper row justify-content-center col-12 m-0 py-5 container_max_width_1">
                    <!-- Box 1 (LOGO | SOCIALS) -->
                    <div class="box_1 col-12 row justify-content-center align-items-center border-bottom border-3 p-0 pb-5">
                        <figure class="logo_wrapper col-8 col-sm-6 col-md-4 col-xl-3 col-xxl-2 mb-5 mx-auto">
                            <img class="logo_primary img-fluid" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="Logo" />
                        </figure>

                        <div class="social_icons h2 color_logo_footer d-flex flex-wrap justify-content-center">
                            <i class="social_icon_spin fa-brands fa-youtube mx-2 px-1" />

                            <i class="social_icon_spin fa-brands fa-twitter mx-2 px-1" />

                            <i class="social_icon_spin fa-brands fa-slideshare mx-2 px-1" />

                            <i class="social_icon_spin fa-brands fa-linkedin mx-2 px-1" />
                        </div>
                    </div>

                    <!-- Box 2 (INSTITUTIONAL LEGAL) -->
                    <div class="box_2 d-flex flex-wrap justify-content-center align-items-top col-lg-12 pt-4">
                        <a class="service_link small fw_600 d-block d-sm-inline-block w-100 w-sm-auto order-0" href="{$root}/article/2608/privacy/?lan={$lan}" target="_blank">
                            <p class="service_text footer_fill d-inline-block w-auto">
                                Privacy Policy
                                <xsl:value-of select="/data/translate/entry[code='privacy']/*[local-name() = $lanextended]" />
                            </p>
                        </a>

                        <p class="copyright_text small color_white mx-sm-4 order-2 order-sm-1">
                            <bold>©</bold> 2022 Humanbit
                        </p>

                        <a class="service_link small fw_600 d-block d-sm-inline-block my-3 my-sm-0 w-100 w-sm-auto order-1 order-sm-2" href="{$root}/article/2608/terms/?lan={$lan}" target="_blank">
                            <p class="service_text footer_fill d-inline-block w-auto">
                                Terms &amp; Conditions
                                <xsl:value-of select="/data/translate/entry[code='terms_conditions']/*[local-name() = $lanextended]" />
                            </p>
                        </a>
                    </div>
                </div>

            </footer>

        </div>

    </xsl:template>

</xsl:stylesheet>
