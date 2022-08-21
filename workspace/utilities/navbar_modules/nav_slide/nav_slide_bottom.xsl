<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="navbar_slide_bottom">

        <div class="nav_partial">

            <nav class="nav_slide_bottom navbar scrollbar_spacing">

                <div class="navbar_container_full container_humanbit_1 color_white container-fluid row justify-content-between align-items-center py-0">

                    <!-- Navbar. <<IN>> -->

                    <!-- Navbar toggler. -->
                    <!-- Add or remove the class `.d-none` at the end of this level depending on the desired model. -->
                    <div class="menu_navbar container_max_width_1 row justify-content-between align-items-center">
                        <!-- Toggler and logo. -->
                        <!-- Avoid changing the columns! -->
                        <div class="menu_box box_left color_white row justify-content-start align-items-center col-auto col-lg-3">
                            <div class="toggle_wrapper col-1 me-4 me-xl-5">
                                <!-- Change `data-bs-target` and `aria-controls` values to the `id` of the intended collapse. -->
                                <button class="btn_toggler_open navbar-toggler border-0 align-middle p-0 w-auto collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarBasicContent" aria-controls="navbarBasicContent" aria-expanded="false" aria-label="Toggle navigation" id="navTogglerBasic">
                                    <span class="span_toggler color_white" />
                                    <span class="span_toggler color_white" />
                                    <span class="span_toggler color_white" />
                                </button>
                            </div>

                            <!-- Uncomment block for extra slot version. -->
                            <!-- <a class="menu_box box_center color_white row justify-content-center align-items-center col-auto" href="{$root}/{$lanurl}">
                                <figure class="figure_logo">
                                    <img class="img_logo img-fluid" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="Logo" />
                                </figure>
                            </a> -->
                        </div>

                        <!-- Comment block for extra slot version. -->
                        <!-- Avoid changing the columns! -->
                        <a class="menu_box box_center color_white row justify-content-center align-items-center col-auto col-md-4 me-auto mx-sm-auto" href="{$root}/{$lanurl}">
                            <figure class="figure_logo text-center mx-auto">
                                <img class="img_logo img-fluid" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="Logo" />
                            </figure>
                        </a>

                        <!-- Uncomment block for extra slot version. -->
                        <!-- Avoid changing the columns! -->
                        <!-- <div class="menu_box box_center nav_extra_wrapper text-center col-12 col-lg-auto mx-auto order-1 order-lg-0 mt-4 mt-lg-0">
                            <p class="nav_extra_content h3 fw_300">Primiero San Martino di Castrozza</p>
                        </div> -->

                        <!-- Buttons row. -->
                        <!-- Avoid changing the columns! -->
                        <div class="menu_box box_right text-uppercase color_white row justify-content-end align-items-center col-auto col-lg-3 order-0 order-lg-1">
                            <!-- Uncomment div if the cart collapse is being used. -->
                            <!-- <button class="menu_link circle_1 menu_steps color_white me-2 me-md-3 collapsed" type="button" id="optionCounter" data-bs-toggle="collapse" data-bs-target="#menuOptions" aria-controls="menuOptions" aria-expanded="false" aria-label="Toggle cart">0</button> -->

                            <xsl:choose>
                                <xsl:when test="$lan = 'it'">
                                    <a class="menu_link circle_1 text-uppercase color_white" href="{$current-url}/?lan=en">
                                        EN
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a class="menu_link circle_1 text-uppercase color_white" href="{$current-url}/?lan=it">
                                        IT
                                    </a>
                                </xsl:otherwise>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$member-id != ''">
                                    <a class="menu_link ms-2 ms-md-3" href="{$root}/profile/{$lanurl}">
                                        <i class="icon_profile color_white fa-solid fa-user" />
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <button class="login_modal circle_1 ms-2 ms-md-3" data-bs-toggle="modal" data-bs-target="#login">
                                        <i class="icon_profile color_white fa-solid fa-user" />
                                    </button>
                                </xsl:otherwise>
                            </xsl:choose>

                            <a class="menu_link_sponsor d-none d-xl-block ps-4 col-4" href="{$root}/{$lanurl}">
                                <figure class="figure_logo figure_logo_sponsor">
                                    <img class="img_logo img_logo_sponsor img-fluid" src="{$workspace}/static/images/logos/logo_humanbit.png" />
                                </figure>
                            </a>
                        </div>
                    </div>

                    <!-- Navbar extra large. -->
                    <!-- Add or remove the class `.d-none` at the end of this level depending on the desired model. -->
                    <div class="menu_navbar container_max_width_1 row justify-content-between align-items-center d-none">
                        <!-- Toggler and logo. -->
                        <!-- Avoid changing the columns! -->
                        <div class="menu_box box_left color_white row justify-content-start align-items-center col-auto col-lg-3 col-xl-2">
                            <div class="toggle_wrapper d-block d-xl-none col-1 me-4 me-xl-5">
                                <!-- Change `data-bs-target` and `aria-controls` values to the `id` of the intended collapse. -->
                                <button class="btn_toggler_open navbar-toggler border-0 align-middle p-0 w-auto collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSectionsContent" aria-controls="navbarSectionsContent" aria-expanded="false" aria-label="Toggle navigation" id="navTogglerSections">
                                    <span class="span_toggler color_white" />
                                    <span class="span_toggler color_white" />
                                    <span class="span_toggler color_white" />
                                </button>
                            </div>

                            <a class="menu_box box_center color_white row justify-content-center align-items-center col-auto" href="{$root}/{$lanurl}">
                                <figure class="figure_logo">
                                    <img class="img_logo img-fluid" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="Logo" />
                                </figure>
                            </a>
                        </div>

                        <!-- Menu items. -->
                        <!-- Avoid changing the columns! -->
                        <div class="menu_box box_center d-none d-xl-flex row justify-content-start align-self-end col-12 col-xl-8 order-1 order-xl-0 mt-4 mt-xl-0">

                            <ul class="menu_items navbar-nav flex-row flex-wrap col-auto">
                                <li class="landmark text-center d-flex align-items-end">
                                    <a class="menu_item color_white px-1 opacity-100-hover" href="{$root}/lista-corsi/corsi" title="Courses">Courses</a>

                                    <span class="vbar px-1 px-xxl-3">|</span>
                                </li>

                                <!-- Collapse Impianti trigger. -->
                                <li class="landmark text-center d-flex align-items-end li_menu_installations">
                                    <a class="menu_item color_white px-1 opacity-100-hover" href="#collapseInstallations" role="button" title="Installations" data-bs-toggle="collapse" aria-expanded="false" aria-controls="collapseInstallations">Installations</a>

                                    <span class="vbar px-1 px-xxl-3">|</span>
                                </li>

                                <!-- Collapse Sport trigger. -->
                                <li class="landmark text-center d-flex align-items-end li_menu_sport">
                                    <a class="menu_item color_white px-1 opacity-100-hover" href="#collapseSport" role="button" title="Sport" data-bs-toggle="collapse" aria-expanded="false" aria-controls="collapseSport">Sport</a>

                                    <span class="vbar px-1 px-xxl-3">|</span>
                                </li>

                                <!-- Collapse Acquista trigger. -->
                                <li class="landmark text-center d-flex align-items-end gray li_menu_buy">
                                    <a class="menu_item color_third px-1 opacity-100-hover" href="#collapseBuy" role="button" title="Ticket office" data-bs-toggle="collapse" aria-expanded="false" aria-controls="collapseBuy">Purchase</a>

                                    <span class="vbar px-1 px-xxl-3">|</span>
                                </li>

                                <li class="landmark text-center d-flex align-items-end">
                                    <a class="menu_item color_third px-1 opacity-100-hover" href="{$root}/istituzionali/orari-norme/" title="Timetables and info">Info</a>

                                    <span class="vbar px-1 px-xxl-3">|</span>
                                </li>

                                <li class="landmark text-center d-flex align-items-end">
                                    <a class="menu_item color_eighth px-1 opacity-100-hover" href="{$root}/lista-eventi" title="Events">Events</a>

                                    <span class="vbar px-1 px-xxl-3">|</span>
                                </li>

                                <li class="landmark text-center d-flex align-items-end gray li_menu_cerca">
                                    <a class="menu_item color_eighth px-1 opacity-100-hover" href="{$root}/lista-news" title="News">News</a>
                                </li>
                            </ul>

                        </div>

                        <!-- Buttons row. -->
                        <!-- Avoid changing the columns! -->
                        <div class="menu_box box_right text-uppercase color_white row justify-content-end align-items-center col-auto col-lg-3 col-xl-2 order-0 order-xl-1 ms-auto">
                            <!-- Uncomment div if the cart collapse is being used. -->
                            <!-- <button class="menu_link circle_1 menu_steps color_white me-2 me-md-3 collapsed" type="button" id="optionCounter" data-bs-toggle="collapse" data-bs-target="#menuOptions" aria-controls="menuOptions" aria-expanded="false" aria-label="Toggle cart">0</button> -->

                            <xsl:choose>
                                <xsl:when test="$lan = 'it'">
                                    <a class="menu_link circle_1 text-uppercase color_white" href="{$current-url}/?lan=en">
                                        EN
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a class="menu_link circle_1 text-uppercase color_white" href="{$current-url}/?lan=it">
                                        IT
                                    </a>
                                </xsl:otherwise>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$member-id != ''">
                                    <a class="menu_link ms-2 ms-md-3" href="{$root}/profile/{$lanurl}">
                                        <i class="icon_profile color_white fa-solid fa-user" />
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <button class="login_modal circle_1 ms-2 ms-md-3" data-bs-toggle="modal" data-bs-target="#login">
                                        <i class="icon_profile color_white fa-solid fa-user" />
                                    </button>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
					</div>

                    <!-- Navbar. <<OUT>> -->


                    <!-- Collapse. <<IN>> -->

                    <!-- Collapse navbar background. -->
                    <!-- `.col-*` classes should match the ones on the `.collapse_contents` div in use for animation effect. -->
                    <div class="cont_ghost_bg nav_ghost_bg col-12 position-fixed top-0 start-0" />

                    <!-- Collapse (basic). -->
                    <!-- If inner `width` is changed with `.col-*` classes, simply remove `background-color` from this level`. -->
                    <div class="menu_collapse bg_color_second navbar-collapse collapse" id="navbarBasicContent">

                        <!-- Sets dimension and compensates for the hidden scrollbar with padding. -->
                        <div class="collapse_wrapper scrollbar_spacing h-auto min-vw-100 mw-100">

                            <!-- Centers content vertically and keeps dimensions set on higher levels. -->
                            <!--
                                To change overall `width`:
                                1. Replace `.w-100` with `.col-*` classes.
                                2. Add `.p*-*-0` according to the chosen breakpoint.
                                3. Set the block's top level parent's `background-color` to `transparent`.
                                4. Assign `background-color` to the following level.
                            -->
                            <div class="collapse_contents row align-items-center container_humanbit_1 py-0 w-100">

                                <!-- Controls `width`, fixes `max-width` (as `mw-100` breaks layout) and positions content horizontally. -->
                                <div class="basic container_sizing container_max_width_1 row justify-content-between align-items-start">

                                    <!-- Edit only from this point onwards. -->

                                    <div class="collapse_nav navbar-nav row flex-row col-12 col-lg-6 py-4 pe-lg-4">
                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 show-search" href="{$root}/{$lanurl}">
                                            <xsl:if test="($current-page = 'index')">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Home
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/calendar/{$lanurl}">
                                            <xsl:if test="$current-page = 'events'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Eventi
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/space/{$lanurl}">
                                            <xsl:if test="$current-page = 'plant'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            L'Impianto
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/institutional/{$lanurl}">
                                            <xsl:if test="$current-page = 'institutional'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Chi Siamo
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/contact/{$lanurl}">
                                            <xsl:if test="$current-page = 'contacts'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Contatti
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/profile/{$lanurl}">
                                            <xsl:if test="$current-page = 'profile'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Area Riservata
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>
                                    </div>

                                    <div class="collapse_nav navbar-nav row flex-row col-12 col-lg-6 py-4 ps-lg-4">
                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 show-search" href="{$root}/{$lanurl}">
                                            <xsl:if test="($current-page = 'index')">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Home
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/calendar/{$lanurl}">
                                            <xsl:if test="$current-page = 'events'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Eventi
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/space/{$lanurl}">
                                            <xsl:if test="$current-page = 'events'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            L'Impianto
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/institutional/{$lanurl}">
                                            <xsl:if test="$current-page = 'events'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Chi Siamo
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/contact/{$lanurl}">
                                            <xsl:if test="$current-page = 'events'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Contatti
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>

                                        <a class="collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0" href="{$root}/{$lanurl}">
                                            <xsl:if test="$current-page = 'events'">
                                                <xsl:attribute name="class">collapse_link nav-link h2 text-uppercase border-bottom border-2 py-2 pe-0 active_link</xsl:attribute>
                                            </xsl:if>

                                            Area Riservata
                                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                        </a>
                                    </div>

                                    <!-- Edit only from this point backwards. -->

                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- Collapse (sections). -->
                    <!-- If inner `width` is changed with `.col-*` classes, simply remove `background-color` from this level`. -->
                    <div class="menu_collapse navbar-collapse collapse" id="navbarSectionsContent">

                        <!-- Sets dimension and compensates for the hidden scrollbar with padding. -->
                        <div class="collapse_wrapper scrollbar_spacing h-auto min-vw-100 mw-100">

                            <!-- Centers content vertically and keeps dimensions set on higher levels. -->
                                <!-- To change overall `width`:
                                1. Replace `.w-100` with `.col-*` classes.
                                2. Add `.p*-*-0` according to the chosen breakpoint.
                                3. Set the block's top level parent's `background-color` to `transparent`.
                                4. Assign `background-color` to the following level. -->
                            <div class="collapse_contents bg_color_second row align-items-center container_humanbit_1 col-12 col-lg-9 pe-lg-0">

                                <!-- Controls `width`, fixes `max-width` (as `mw-100` breaks layout) and positions content horizontally. -->
                                <div class="sections container_sizing container_max_width_1 row justify-content-between align-items-start">

                                    <!-- Edit only from this point onwards. -->

                                    <div class="collapse_nav navbar-nav row flex-row justify-content-between mb-4">
                                        <div class="wrapper_outer row align-items-center col-12 pt-5 pb-4 border-bottom">
                                            <div class="wrapper_inner text-sm-end text-md-start align-self-start col-12 col-md-6 my-3">
                                                <h3 class="collapse_title h5">
                                                    Ti stai trasferendo in una nuova città?
                                                    <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                                </h3>

                                                <p class="collapse_body p fw_200 about_us mt-3">
                                                    Affidati a noi, troveremo insieme la casa perfetta per te.
                                                    <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                                </p>
                                            </div>

                                            <div class="wrapper_inner d-flex flex-wrap justify-content-start justify-content-sm-end align-items-center col-12 col-md-6 col-lg-5 ps-md-4 ps-lg-3">
                                                <a class="collapse_link h2 text-uppercase btn_bg_third btn_reverse my-3 my-md-2 w-auto" href="{$root}/landing-user/?lan={$lan}">
                                                    Come funziona?
                                                    <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                                </a>

                                                <a class="collapse_link h2 text-uppercase btn_color_white my-3 my-md-2 ms-3 w-auto" href="{$root}/landing-user/?lan={$lan}">
                                                    FAQ
                                                </a>
                                            </div>
                                        </div>

                                        <div class="wrapper_outer col-12 col-md-8 navbar-nav row flex-row border-end-md border-bottom mb-md-4 py-4 pe-md-4">
                                            <div class="wrapper_inner align-self-start col-12 mb-4">
                                                <h3 class="collapse_title h5">
                                                    Sei un'azienda e vuoi organizzare il tuo campus?
                                                    <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                                </h3>
                                            </div>

                                            <a class="collapse_link h2 text-uppercase btn_color_white border border-2 me-3 mb-2 w-auto" href="{$root}/institutional/41439/partner/{$lanurl}">
                                                Chi lavora con noi
                                                <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                            </a>

                                            <a class="collapse_link h2 text-uppercase btn_color_white border border-2 mb-2 w-auto" href="{$root}/landing-campus/{$lanurl}">
                                                Il campus
                                                <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                            </a>
                                        </div>

                                        <div class="wrapper_outer navbar-nav row flex-row col-12 col-md-4 mb-4 py-4 justify-content-md-center border-bottom">
                                            <div class="wrapper_inner align-self-center col-12 mb-4">
                                                <h3 class="collapse_title h5 text-sm-end text-md-center">
                                                    O un'agenzia?
                                                    <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                                </h3>
                                            </div>

                                            <a class="collapse_link h2 text-uppercase btn_color_white align-self-end border border-2 mb-2 ms-sm-auto ms-md-0 w-auto" href="{$root}/institutional/41439/partner/{$lanurl}">
                                                Collaboriamo!
                                                <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                            </a>
                                        </div>

                                        <div class="wrapper_outer row align-items-center col-12 border-bottom mb-4 pb-4">
                                            <div class="wrapper_inner align-self-start col-12 col-md-6 my-3">
                                                <h3 class="collapse_title h5 mb-2">
                                                    Sei un proprietario di appartamento?
                                                    <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                                </h3>

                                                <p class="collapse_body p fw_200 about_us mt-3">
                                                    Con noi puoi affittare il tuo appartamento in modo semplice, veloce e sicuro
                                                    <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                                </p>
                                            </div>

                                            <div class="wrapper_inner d-flex flex-wrap col-12 col-md-5 align-items-center justify-content-md-center my-3 ps-md-4 ps-lg-3">
                                                <a class="collapse_link h2 text-uppercase btn_bg_third btn_reverse w-auto" href="{$root}/landing-landlord/?lan={$lan}">Ce ne occupiamo noi!
                                                    <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                                </a>
                                            </div>
                                        </div>

                                        <div class="collapse_nav navbar-nav d-flex flex-wrap flex-row justify-content-sm-center justify-content-md-start pt-2">
                                            <a class="about_us collapse_link h2 text-uppercase btn_reset me-3 mb-3 w-auto" href="{$root}/institutional/41515/about/{$lanurl}">
                                                <xsl:if test="($current-page = 'index')">
                                                    <xsl:attribute name="class">collapse_link h2 text-uppercase btn_color_white border border-2 border_color_white me-3 mb-3 active_link</xsl:attribute>
                                                </xsl:if>

                                                About us
                                                <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                            </a>

                                            <a class="privacy_and_terms collapse_link h2 text-uppercase btn_reset me-3 mb-3 w-auto" href="{$root}/institutional/3606/terms-conditions/{$lanurl}">
                                                <xsl:if test="$current-page = 'events'">
                                                    <xsl:attribute name="class">collapse_link h2 text-uppercase btn_color_white border border-2 border_color_white me-3 mb-3 active_link</xsl:attribute>
                                                </xsl:if>

                                                Terms and Conditions
                                                <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                            </a>

                                            <a class="privacy_and_terms collapse_link h2 text-uppercase btn_reset mb-3 w-auto" href="{$root}/institutional/3607/privacy/{$lanurl}">
                                                <xsl:if test="$current-page = 'events'">
                                                    <xsl:attribute name="class">collapse_link h2 text-uppercase btn_color_white border border-2 border_color_white active_link</xsl:attribute>
                                                </xsl:if>

                                                Privacy Policy
                                                <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                            </a>
                                        </div>
                                    </div>

                                    <!-- Edit only from this point backwards. -->

                                    <!-- Footer -->
                                    <xsl:call-template name="footer_nav" />

                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- Collapse. <<OUT>> -->


                    <!-- Cart (ecommerce). <<IN>> -->

                    <!-- Cart navbar background. -->
                    <!-- Uncomment div if the cart toggle is being used (necessary for the JS animation). -->
                    <!-- <div class="cont_ghost_bg coll_ghost_bg position-fixed top-0 end-0" /> -->

                    <!-- Cart. -->
                    <!-- Delete block if element is not needed on current project for safety and performance reasons. -->
                    <div class="menu_options bg_color_second border border-end-md-0 border_color_third navbar-collapse collapse" id="menuOptions" dir="rtl">

                        <div class="options_wrapper scrollbar_spacing" dir="ltr">

                            <div class="option_items position-relative container_humanbit_1 py-5">
                                <h4 class="option_title h4 border-bottom border-2 border-color-white mb-5 pb-3">
                                    Rivedi e cambia le tue opzioni
                                    <xsl:value-of select="/data/translate/entry[code = 'change_your_opt']/*[local-name() = $lanextended]" />
                                </h4>

                                <!-- Close button. -->
                                <button class="btn_toggler navbar-toggler p bg-danger position-absolute top-0 end-0 border-0 me-4 px-2 pt-2 pb-1 collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#menuOptions" aria-controls="menuOptions" aria-expanded="false" aria-label="Close">
                                    <i class="icon_toggler color_white align-bottom fa-solid fa-xmark" />
                                </button>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/?step=1" id="labelCityName">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/?step=1" id="labelCityName"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    Milano
                                    <xsl:if test="/data/member-services/entry[town]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                        <xsl:value-of select="/data/member-services/entry/town" />
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/?step=3" id="labelApartmentType">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/?step=3" id="labelApartmentType"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    Bilocale
                                    <xsl:if test="/data/member-services/entry[apartment-type]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                        <xsl:value-of select="translate(/data/member-services/entry/apartment-type, '-', ' ')" />
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/?step=2" id="labelProfession">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/?step=2" id="labelProfession"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    Lavoratore
                                    <xsl:if test="/data/member-services/entry[profession]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                        <xsl:value-of select="/data/member-services/entry/profession" />
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/?step=2" id="labelFamily">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/?step=2" id="labelFamily"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    <xsl:text>Con la famiglia</xsl:text>
                                    <xsl:if test="/data/member-services/entry[family]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/?step=4" id="labelApartmentSpecifications">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/?step=4" id="labelApartmentSpecifications"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    Lavatrice
                                    <xsl:if test="/data/member-services/entry[room-specifications]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                        <xsl:variable name="first_pref" select="substring-before(/data/member-services/entry/room-specifications, ',')" />
                                        <xsl:variable name="other_pref" select="substring-after(/data/member-services/entry/room-specifications, ',')" />
                                        <xsl:variable name="count_other_pref" select="string-length(translate($other_pref, translate($other_pref, ',', ''), '')) + 1" />
                                        <xsl:value-of select="$first_pref" /><xsl:if test="$count_other_pref != 0"> + (<xsl:value-of select="$count_other_pref" />)</xsl:if>
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/?step=5" id="labelApartmentPriority">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/?step=5" id="labelApartmentPriority"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    Mezzi pubblici
                                    <xsl:if test="/data/member-services/entry[apartment-priority]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                        <xsl:value-of select="/data/member-services/entry/apartment-priority" />
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/?step=6" id="labelFlatmateSpecifications">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/?step=6" id="labelFlatmateSpecifications"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    Pet-friendly
                                    <xsl:if test="/data/member-services/entry[flatmate-specifications]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                        <xsl:variable name="first_pref" select="substring-before(/data/member-services/entry/flatmate-specifications, ',')" />
                                        <xsl:variable name="other_pref" select="substring-after(/data/member-services/entry/flatmate-specifications, ',')" />
                                        <xsl:variable name="count_other_pref" select="string-length(translate($other_pref, translate($other_pref, ',', ''), '')) + 1" />
                                        <xsl:text>Coinquilino - </xsl:text><span><xsl:value-of select="$first_pref" /><xsl:if test="$count_other_pref != 0"> + (<xsl:value-of select="$count_other_pref" />)</xsl:if></span>
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/angels/?city={/data/member-services/entry/town-id}" id="labelAngelName">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/angels/?city={/data/member-services/entry/town-id}" id="labelAngelName"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    Pinko Pallino
                                    <xsl:if test="/data/member-services/entry[angel]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                        <xsl:value-of select="/data/member-services/entry/angel" />
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/packages/?step=1" id="labelPackage">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/packages/?step=1" id="labelPackage"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    1 sett. (€300)
                                    <xsl:if test="/data/member-services/entry[package]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                        <xsl:value-of select="/data/member-services/entry/package" /><xsl:text> </xsl:text><xsl:value-of select="/data/translate/entry[code = 'days']/*[local-name() = $lanextended]" />
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-4" href="{$root}/packages/?step=2" id="labelFurtherServices">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-4 d-none" href="{$root}/packages/?step=2" id="labelFurtherServices"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    SIM Card
                                    <xsl:if test="/data/member-services/entry[futher-services]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-4 option_unsaved</xsl:attribute>
                                        <xsl:variable name="first_futher" select="substring-before(/data/member-services/entry/futher-services, ',')" />
                                        <xsl:variable name="other_futher" select="substring-after(/data/member-services/entry/futher-services, ',')" />
                                        <xsl:variable name="count_other_futher" select="string-length(translate($other_futher, translate($other_futher, ',', ''), '')) + 1" />
                                        <xsl:value-of select="$first_futher" /><xsl:if test="$count_other_futher != 0"> + (<xsl:value-of select="$count_other_futher" />)</xsl:if>
                                    </xsl:if>
                                </a>

                                <!-- Delete first <a> (placeholder) and uncomment the second one (which has `.d-none`) for dynamic values. -->
                                <a class="option_item small btn_bg_third d-inline-block me-2 mb-5" href="{$root}/?step=6" id="labelBudget">
                                <!-- <a class="option_item small btn_bg_third d-inline-block me-2 mb-5 d-none" href="{$root}/?step=6" id="labelBudget"> -->
                                    <!-- Comment out following hardcoded placeholder for dynamic values. -->
                                    €700
                                    <xsl:if test="/data/member-services/entry[budget]">
                                        <xsl:attribute name="class">option_item small btn_bg_first d-inline-block me-2 mb-5 option_unsaved</xsl:attribute>
                                        <span><xsl:text>Budget - €</xsl:text><xsl:value-of select="/data/member-services/entry/budget" /></span>
                                    </xsl:if>
                                </a>

                                <div class="container_choices row justify-content-between align-items-center">
                                    <form id="memberServicesForm" action="{$current-url}/" method="post">
                                        <input name="id" type="hidden" value="{/data/member-services/entry/@id}" />
                                        <input name="fields[member]" type="hidden" value="{$member-id}" />
                                        <input name="xsrf" type="hidden" value="{$cookie-xsrf-token}" />
                                        <input class="input_member_service" id="inputApartmentType" name="fields[apartment-type]" type="hidden" value="{/data/member-services/entry/apartment-type}" data-session-name="apartment_type" data-session-type="unique" required="required" />
                                        <input class="input_member_service" id="inputFamily" name="fields[family]" type="hidden" value="{/data/member-services/entry/family}" data-session-name="family" data-session-type="unique" required="required" />
                                        <input class="input_member_service" id="inputApartmentSpecifications" name="fields[room-specifications]" type="hidden" value="{/data/member-services/entry/room-specifications}" data-session-name="apartment_specifications" data-session-type="multiple" />
                                        <input class="input_member_service" id="inputApartmentPriority" name="fields[apartment-priority]" type="hidden" value="{/data/member-services/entry/apartment-priority}" data-session-name="apartment_priority" data-session-type="unique" />
                                        <input class="input_member_service" id="inputProfession" name="fields[profession]" type="hidden" value="{/data/member-services/entry/profession}" data-session-name="profession" data-session-type="unique" required="required" />
                                        <input class="input_member_service" id="inputFlatmateSpecifications" name="fields[flatmate-specifications]" type="hidden" value="{/data/member-services/entry/flatmate-specifications}" data-session-name="flatmate_specifications" data-session-type="multiple" />
                                        <input class="input_member_service" id="inputAngel" name="fields[my-angel]" type="hidden" value="{/data/member-services/entry/my-angel/item/@id}" data-session-name="angel" data-session-type="angel" required="required" />
                                        <input class="input_member_service" id="inputAngelName" name="fields[angel]" type="hidden" value="{/data/member-services/entry/angel}" data-session-name="angel_name" data-session-type="unique" required="required" />
                                        <input class="input_member_service" id="inputCityName" name="fields[town]" type="hidden" value="{/data/member-services/entry/town}" data-session-name="city_name" data-session-type="unique" required="required" />
                                        <input class="input_member_service" id="inputCity" name="fields[town-id]" type="hidden" value="{/data/member-services/entry/town-id}" data-session-name="city" data-session-type="unique" required="required" />
                                        <input class="input_member_service" id="inputBudget" name="fields[budget]" type="hidden" value="{/data/member-services/entry/budget}" data-session-name="budget" data-session-type="unique" required="required" />
                                        <input class="input_member_service" id="inputPackage" name="fields[package]" type="hidden" value="{/data/member-services/entry/package}" data-session-name="package" data-session-type="unique" required="required" />
                                        <input class="input_member_service" id="inputPackagePrice" name="fields[package-price]" type="hidden" value="{/data/member-services/entry/package-price}" data-session-name="package_price" data-session-type="unique" required="required" />
                                        <input class="input_member_service" id="inputFurtherServices" name="fields[futher-services]" type="hidden" value="{/data/member-services/entry/futher-services}" data-session-name="futher_services" data-session-type="multiple" />
                                        <input class="input_member_service" id="inputFurtherServicesPrice" name="fields[futher-services-price]" type="hidden" value="{/data/member-services/entry/futher-services-price}" data-session-name="futher_services_price" data-session-type="unique" />
                                        <xsl:choose>
                                            <xsl:when test="$member-id != ''">
                                                <input name="redirect" type="hidden" value="{$root}/book" />
                                                <button class="btn_book_option small btn_bg_third d-block col-12 col-md-9 mb-4 mx-auto px-2 px-md-4 option_unsaved" name="action[add-member-service]" type="submit">
                                                    Salva e vai alla book
                                                </button>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <button class="btn_book_option login_modal small btn_bg_third d-block col-12 col-md-9 mb-4 mx-auto px-2 px-md-4 option_unsaved" data-bs-toggle="modal" data-bs-target="#login" data-login-form="#formNew">
                                                    Salva e vai alla book
                                                </button>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </form>

                                    <a class="btn_book_option small btn_bg_third d-block col-12 col-md-9 mx-auto px-2 px-md-4" href="">
                                        Continua a scegliere senza salvare
                                    </a>
                                </div>
                            </div>

                        </div>

					</div>

                    <!-- Cart (ecommerce). <<OUT>> -->

                </div>

            </nav>

        </div>

    </xsl:template>

</xsl:stylesheet>
