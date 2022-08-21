<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../utilities/navbar_modules.xsl" />
	<xsl:import href="../utilities/footer_modules.xsl" />
	<xsl:import href="../utilities/modules.xsl" />
	<xsl:import href="../utilities/calendar.xsl" />
	<xsl:import href="../utilities/registration.xsl" />
	<xsl:decimal-format name="euro" decimal-separator="," grouping-separator="." NaN=" " />
	<xsl:output method="html" doctype-system="about:legacy-compat" />
	<xsl:param name="url-email" />
	<xsl:param name="member-id" />
	<xsl:param name="url-lan" />
	<xsl:param name="url-category" />
	<xsl:param name="member-role" />
	<xsl:param name="url-test" />
	<xsl:param name="cookie-xsrf-token" />
	<xsl:param name="timestamp" />
	<xsl:param name="url-activation" />
	<xsl:param name="url-code" />
	<xsl:param name="url-reg" />
	<xsl:param name="url-emailchange" />
	<xsl:param name="url-recovery" />
	<xsl:param name="title" />
	<xsl:param name="id" />
	<xsl:variable name="lan">
		<xsl:choose>
			<xsl:when test="$url-lan = 'en'">en</xsl:when>
			<xsl:otherwise>it</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lanurl">
		<xsl:choose>
			<xsl:when test="$url-lan = 'en'">?lan=en</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lanexp">
		<xsl:choose>
			<xsl:when test="$url-lan = 'en'">english</xsl:when>
			<xsl:otherwise>italian</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lanextended">
		<xsl:choose>
			<xsl:when test="$url-lan != ''">
				<xsl:value-of select="$url-lan" />
			</xsl:when>
			<xsl:otherwise>it</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="titlelan">title-<xsl:value-of select="$lanexp" /></xsl:variable>
	<xsl:variable name="metatitlelan">meta-title-<xsl:value-of select="$lanexp" /></xsl:variable>
	<xsl:variable name="metadesclan">meta-description-<xsl:value-of select="$lanexp" /></xsl:variable>
	<xsl:variable name="namelan">name-<xsl:value-of select="$lanexp" /></xsl:variable>
	<xsl:variable name="subtitlelan">subtitle-<xsl:value-of select="$lanexp" /></xsl:variable>
	<xsl:variable name="bodylan">body-<xsl:value-of select="$lanexp" /></xsl:variable>
	<xsl:variable name="desclan">description-<xsl:value-of select="$lanexp" /></xsl:variable>
	<xsl:variable name="abslan">abstract-<xsl:value-of select="$lanexp" /></xsl:variable>
	<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in" />
	<xsl:template match="/">

	<xsl:comment><![CDATA[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[if IE 8]>         <html class="no-js lt-ie9"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[if gt IE 8]><html class="no-js"> <![endif]]]></xsl:comment>
	<html lang="{$lanextended}">
		<head>
			<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" /> -->
			<meta name="viewport" content="height=device-height, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi, shrink-to-fit=no" />
			<xsl:choose>
				<xsl:when test="$current-page = 'index'">
					<title>
						<xsl:choose>
							<xsl:when test="/data/home">
								<xsl:value-of select="/data/home/entry/*[local-name() = $metatitlelan]" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>Humanbit Template v2</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</title>
					<meta name="description" content="{/data/home/entry/*[local-name() = $metadesclan]}" />
					<meta property="og:url" content="{$current-url}/" />
					<meta property="og:type" content="article" />
					<meta property="og:title" content="{/data/home/entry/*[local-name() = $metatitlelan]}" />
					<meta property="og:description" content="{/data/home/entry/*[local-name() = $metadesclan]}" />
					<meta property="og:image" content="{$root}/image/1/1200/0{/data/*/entry/image/@path}/{/data/*/entry/image/filename}" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
					<xsl:when test="$title != ''">
						<title>Humanbit Template v2 -  <xsl:value-of select="/data/*/entry/*[local-name()=$titlelan]" /></title>
						<meta name="description" content="{/data/*/entry/*[local-name()=$abslan]}" />
						<meta property="og:url" content="{$current-url}/" />
						<meta property="og:type" content="article" />
						<meta property="og:title" content="{/data/*/entry/*[local-name()=$titlelan]}" />
						<meta property="og:description" content="{/data/*/entry/*[local-name()=$abslan]}" />
						<meta property="og:image" content="{$root}/image/1/1200/0{/data/*/entry/image/@path}/{/data/*/entry/image/filename}" />
					</xsl:when>
					<xsl:otherwise>
							<title>Humanbit Template v2 </title>
							<meta name="description" content="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." />
					</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			<!-- favicon -->
			<link rel="apple-touch-icon" sizes="57x57" href="{$root}/favicon/apple-icon-57x57.png" />
			<link rel="apple-touch-icon" sizes="60x60" href="{$root}/favicon/apple-icon-60x60.png" />
			<link rel="apple-touch-icon" sizes="72x72" href="{$root}/favicon/apple-icon-72x72.png" />
			<link rel="apple-touch-icon" sizes="76x76" href="{$root}/favicon/apple-icon-76x76.png" />
			<link rel="apple-touch-icon" sizes="114x114" href="{$root}/favicon/apple-icon-114x114.png" />
			<link rel="apple-touch-icon" sizes="120x120" href="{$root}/favicon/apple-icon-120x120.png" />
			<link rel="apple-touch-icon" sizes="144x144" href="{$root}/favicon/apple-icon-144x144.png" />
			<link rel="apple-touch-icon" sizes="152x152" href="{$root}/favicon/apple-icon-152x152.png" />
			<link rel="apple-touch-icon" sizes="180x180" href="{$root}/favicon/apple-icon-180x180.png" />
			<link rel="icon" type="image/png" sizes="144x144" href="{$root}/favicon/android-icon-144x144.png" />
			<link rel="icon" type="image/png" sizes="192x192" href="{$root}/favicon/android-icon-192x192.png" />
			<link rel="icon" type="image/png" sizes="32x32" href="{$root}/favicon/favicon-32x32.png" />
			<link rel="icon" type="image/png" sizes="96x96" href="{$root}/favicon/favicon-96x96.png" />
			<link rel="icon" type="image/png" sizes="16x16" href="{$root}/favicon/favicon-16x16.png" />
			<link rel="manifest" href="{$root}/favicon/manifest.json" />
			<meta name="msapplication-TileColor" content="#ffffff" />
			<meta name="theme-color" content="#6a3075" />
			<!-- fine favicon -->

			<!-- BOOTSTRAP CDN -->
			<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" /> -->

			<!-- <link href="{$workspace}/static/css/bootstrap.min.css" rel="stylesheet" /> -->
			<!--link href="{$workspace}/static/css/style_default.css" rel="stylesheet"/-->
			<!--link href="{$workspace}/static/css/mdb.min.css" rel="stylesheet"/-->
			<!-- <link href="{$workspace}/static/css/slick.css" rel="stylesheet" /> -->

			<link href="{$workspace}/static/bessex/css/bessex_humanbit.css" rel="stylesheet" />
			<link href="{$workspace}/static/css/plugin.min.css" rel="stylesheet" />



			<!-- <link href="{$workspace}/static/css/style_gabriel.css" rel="stylesheet" /> -->
			<!-- <link href="{$workspace}/static/css/style.css" rel="stylesheet" /> -->
			<!-- <link href="{$workspace}/static/css/style_gabriel_all.css" rel="stylesheet" /> -->
			<link href="{$workspace}/static/css/style.css" rel="stylesheet" />

			<!-- google fonts (download and put them in utilities) -->
			<link rel="preconnect" href="https://fonts.googleapis.com" />
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin" />
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Display:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&amp;family=Roboto+Mono:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />


			<!-- <link href="{$workspace}/static/css/style.min.css" rel="stylesheet" /> -->


			<!--link href="{$workspace}/static/css/bootstrap-boost_humanbit-ponzano.css" rel="stylesheet"/-->

			<link href="{$workspace}/static/fonts/fontawesome-pro-6.0.0-beta2-web/css/all.min.css" rel="stylesheet" />

			<!-- Custom styles for this template -->

			<xsl:call-template name="head" />
		</head>

		<body class="bg_color_white">

			<!-- <div class="preloader" id="preloader">
				<div class="loader">
					<hr class="hr_preloader" />
				</div>
			</div> -->

			<div class="container_humanbit_overflow scrollbar_spacing" id="page">

				<!-- <button id="add-webapp" class="btnBgP text-center font-weight-bold mb-4 py-1 px-3 d-lg-none" style="top: 15%; position: fixed;">Scarica l'App!</button> -->

				<!-- Navbar slide left -->
				<xsl:call-template name="navbar_slide_right" />

				<div class="container_humanbit_structure container-fluid">
					<xsl:call-template name="page_structure" />
					<xsl:call-template name="login" />
					<xsl:call-template name="forgot_pw" />
					<xsl:call-template name="register_modal" />
					<xsl:call-template name="change_pw_modal" />
					<xsl:call-template name="service_messages" />
					<xsl:call-template name="newsletter_b2c_modal" />
					<!-- Credits -->
					<xsl:call-template name="modal_credits_module" />
				</div>

				<!-- Footer -->
				<xsl:call-template name="footer_left_right" />




			</div>

			<!-- <script src="{$workspace}/static/bootstrap/dist/js/jquery-3.5.1.js"></script> -->
			<!-- <script src="{$workspace}/static/bootstrap/dist/js/bootstrap.min.js"></script> -->
			<!-- <script src="{$workspace}/static/bootstrap/dist/js/popper.min.js"></script> -->
			<!-- <script src="{$workspace}/static/bootstrap/dist/js/mdb.min.js"></script> -->
			<!-- <script src="{$workspace}/static/fonts/fontawesome-pro-6.0.0-beta2-web/js/all.min.js"></script> -->
			<script src="{$workspace}/static/js/plugin.min.js"></script>
			<script src="{$workspace}/static/js/main.js?v1.06"></script>
			<script src="{$workspace}/static/js/main_humanbit.js?v1.06"></script>
			<script type="text/javascript" src="https://nibirumail.com/docs/scripts/nibirumail.cookie.min.js"></script>
			<script src="{$workspace}/static/js/slick_script.js" />
			<!-- <script src="{$workspace}/static/js/preloader.js" /> -->
			<!-- linetobe -->
			<xsl:if test="($current-page = 'linetobe-test')">
				<script defer="defer" crossorigin="anonymous" src="https://www.linetobe.com/workspace/static/bootstrap/js/linetobe.js?idm=idm46723354096336"></script>
			</xsl:if>
			<xsl:if test="($current-page = 'spid-test')">
				<script src="{$root}/service/spid/spid.min.js"></script>
				<script src="{$root}/service/spid/spid-request.js"></script>
				<link rel="stylesheet" href="{$root}/service/spid/spid.min.css" type="text/css" />
			</xsl:if>
			<xsl:if test="($current-page = 'humanbit-doc')">
				<script src="{$workspace}/static/js/echarts.min.js" />
				<script src="{$root}/documentation/js/echarts.js" />
				<script src="{$root}/documentation/js/codeStyler.js" />
				<script src="{$workspace}/static/js/push_notifications.js" />
			</xsl:if>
			<!-- medium editor -->
			<xsl:if test="($current-page = 'post-editing')">
				<script src="{$workspace}/static/js/medium-editor.min.js"></script>
				<link rel="stylesheet" href="{$workspace}/static/css/medium-editor.min.css" type="text/css" media="screen" charset="utf-8" />
				<script>
					$(document).ready(function () {
						var editor = new MediumEditor('.editable', {
							toolbar: {
								/* These are the default options for the toolbar,
								if nothing is passed this is what is used */
								allowMultiParagraphSelection: true,
								buttons: ['bold', 'italic', 'underline'],
								diffLeft: 0,
								diffTop: -10,
								firstButtonClass: 'medium-editor-button-first',
								lastButtonClass: 'medium-editor-button-last',
								relativeContainer: null,
								standardizeSelectionStart: false,
								static: false,
								/* options which only apply when static is true */
								align: 'left',
								sticky: false,
								updateOnEmptySelection: false
							}
						});
					});
				</script>
			</xsl:if>
			<xsl:if test="($current-page = 'humanbit-doc') or ($current-page = 'index')">
				<link href="{$root}/service/leaflet/leaflet.css" rel="stylesheet"/>
				<script src="{$root}/service/leaflet/leaflet.js"/>
				<script src='//api.tiles.mapbox.com/mapbox.js/plugins/leaflet-image/v0.0.4/leaflet-image.js'></script>
				<script src="{$root}/service/leaflet/map.js"/>
				<script>
					sliderForHome();
					sliderForLarge();
					sliderForDimo();
					sliderFor();
				</script>
			</xsl:if>
			<script src="{$workspace}/static/js/web-app.js"></script>
			<!-- slick slider -->
			<!-- <xsl:if test="$current-page = 'index'">
				<script>
					sliderForHome();
				</script>
			</xsl:if> -->
			<!-- mail forgot -->
			<xsl:choose>
				<xsl:when test="/data/events/members-generate-recovery-code/@result = 'success'">
					<script>
						$('#forgot_modal_2_success').modal('show');
					</script>
				</xsl:when>
				<xsl:when test="/data/events/members-generate-recovery-code/@result = 'error'">
					<script>
						$('#forgot_modal_2_error').modal('show');
					</script>
				</xsl:when>
				<xsl:when test="$url-emailchange != ''">
					<script>
						$('#changepswdmodal').modal('show');
					</script>
				</xsl:when>
			</xsl:choose>
			<!-- event message -->
			<xsl:if test="((/data/events/*/@result = 'error') or (/data/events/@result = 'error')) and (not(/data/events/members-generate-recovery-code))">
				<script>
					$('#alertMessage').modal('show');
				</script>
			</xsl:if>
			<xsl:if test="((/data/events/*[local-name() != 'member-login-info']/@result = 'success') or (/data/events/@result = 'success'))and (not(/data/events/members-generate-recovery-code))">
				<script>
					$('#positiveMessage').modal('show');
				</script>
			</xsl:if>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>
