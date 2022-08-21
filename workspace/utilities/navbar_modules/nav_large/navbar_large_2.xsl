<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="navbar_large">
        <div class="nav_partial">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid navbar_humanbit navbar_full align-items-center justify-content-between">
                    <div class="menu_humanbit container_humanbit_1 row align-items-center justify-content-between mx-0 py-0 w-100 d-flex">
                        <button class="navbar-toggler col-4 px-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fad fa-bars d-block text-start"></i>
                        </button>
                        <a class="col-4" href="{$root}/{$lanurl}">
                            <figure class="logo_header_container p-0 m-0 mx-auto">
                                <img class="logo_header" src="{$workspace}/static/images/logos/logo_humanbit.png"></img>
                            </figure>
                        </a>
                        <div class="nav_right align-items-center justify-content-between row col-4" style="color: white;">
                            <xsl:choose>
                                <xsl:when test="$lan = 'it'">
                                    <a class="col-2 mb-1 nav-link d-inline text-uppercase pb-0 text-white" href="{$current-url}/?lan=en"><span class="circle_blue">EN</span></a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a class="col-2 mb-1 nav-link d-inline text-uppercase pb-0 text-white" href="{$current-url}/?lan=it"><span class="circle_blue">IT</span></a>
                                </xsl:otherwise>
                            </xsl:choose>
                            <a class="ps-3 col-6" href="{$root}/{$lanurl}">
                                <span style="color: white;">area riservata (tt)</span><i style="color:white;" class="ps-2 fal fa-unlock text-end"></i>
                            </a>
                            <a class="ps-3 col-4 d-inline mb-1" href="{$root}/{$lanurl}">
                                <figure class="logo_nav_right p-0 m-0">
                                    <img class="w-100" src="{$workspace}/static/images/logos/logo_humanbit_scuro.png"></img>
                                </figure>
                            </a>
                        </div>
                        <!-- voci menu -->
                        <div class="navbar_collapse_humanbit navbar-collapse collapse" id="navbarSupportedContent">
                            <div class="menu_items container_humanbit_1 mx-0 align-items-center text-right text-lg-start">
                                <div class="header_menu_items  mb-3 mt-0 mb-lg-0 row align-items-center">
                                    <!-- <a class="col-4 ms-lg-3" href="{$root}/{$lanurl}">
                                        <figure class="logo_header_container p-0 m-0">
                                            <img class="logo_header" src="{$workspace}/static/images/logos/logo_humanbit.png"></img>
                                        </figure>
                                    </a> -->
                                    <button class="btn_close navbar-toggler text-start col-1 px-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                        <!-- <i class="fad fa-bars d-block text-end"></i> -->
                                        <i class="fal fa-times"></i>
                                    </button>
                                </div>

                                <ul class="navbar-nav mr-auto col-12 col-lg-4 ps-lg-4 py-12 ml-0 ms-lg-5 mb-3 mt-0 mb-lg-0">
                                    <li style="padding-right: 0em;" class="border-bottom nav-item ms-lg-3 pt-3 pb-2">
                                        <a id="" class="nav-link text-capitalize py-0 pr-0 show-search"  href="{$root}/{$lanurl}"><xsl:if test="($current-page = 'index')"><xsl:attribute name="class">nav-link text-capitalize py-0 pr-0 active_link</xsl:attribute></xsl:if>Home</a>
                                    </li>
                                    <li style="padding-right: 0em;" class="nav-item border_bottom_humanbit  ms-lg-3  pt-3 pb-2">
                                        <a id="" class="nav-link text-capitalize py-0 pr-0" href="{$root}/calendar/{$lanurl}"><xsl:if test="$current-page = 'events'"><xsl:attribute name="class">nav-link text-capitalize py-0 pr-0 active_link</xsl:attribute></xsl:if>Eventi(tt)</a>
                                    </li>
                                    <li style="padding-right: 0em;" class="nav-item border_bottom_humanbit  ms-lg-3  pt-3 pb-2">
                                        <a id="" class="nav-link text-capitalize py-0 pr-0" href="{$root}/space/{$lanurl}"><xsl:if test="$current-page = 'events'"><xsl:attribute name="class">nav-link text-capitalize py-0 pr-0 active_link</xsl:attribute></xsl:if>L'impianto(tt)</a>
                                    </li>
                                    <li style="padding-right: 0em;" class="nav-item border_bottom_humanbit  ms-lg-3  pt-3 pb-2">
                                        <a id="" class="nav-link text-capitalize py-0 pr-0" href="{$root}/institutional/{$lanurl}"><xsl:if test="$current-page = 'events'"><xsl:attribute name="class">nav-link text-capitalize py-0 pr-0 active_link</xsl:attribute></xsl:if>Chi siamo(tt)</a>
                                    </li>
                                    <li style="padding-right: 0em;" class="nav-item border_bottom_humanbit  ms-lg-3  pt-3 pb-2">
                                        <a id="" class="nav-link text-capitalize py-0 pr-0" href="{$root}/contact/{$lanurl}"><xsl:if test="$current-page = 'events'"><xsl:attribute name="class">nav-link text-capitalize py-0 pr-0 active_link</xsl:attribute></xsl:if>Contatti(tt)</a>
                                    </li>
                                    <li style="padding-right: 0em;" class="nav-item border_bottom_humanbit  ms-lg-3  pt-3 pb-2">
                                        <a id="" class="nav-link res_area text-capitalize py-0 pr-0" href="{$root}/{$lanurl}"><xsl:if test="$current-page = 'events'"><xsl:attribute name="class">nav-link text-capitalize py-0 pr-0 active_link</xsl:attribute></xsl:if>Area riservata organizzatori(tt)</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </xsl:template>
</xsl:stylesheet>