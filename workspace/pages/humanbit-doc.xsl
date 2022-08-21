<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

	<xsl:include href="../utilities/default_template.xsl" />

	<xsl:template name="head">
		<link href="{$root}/documentation/css/humanbit-doc.css" rel="stylesheet"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.5.0/themes/prism.min.css"/>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.5.0/prism.min.js"></script>
	</xsl:template>

	<xsl:template name="page_structure">
		<div class="humanbit-doc mt-7">
			<div class="row">
				<aside class="docMenu col-3">
					<ul id="categoryNav" class="nav flex-column nav-pills" role="tablist">
						<xsl:for-each select="/data/humanbit-doc-category/entry[not(father)]">
							<xsl:variable name="idCat" select="@id"/>
							<a class="title_cat w-100 m-3 border-bottom" data-bs-toggle="collapse" href="#collapse{$idCat}" role="button" aria-expanded="false" aria-controls="collapse{$idCat}"><xsl:value-of select="title"/></a>
							<div id="collapse{$idCat}" class="collapse">
								<xsl:if test="position() = 1">
									<xsl:attribute name="class">collapse show</xsl:attribute>
								</xsl:if>
								<xsl:for-each select="/data/humanbit-doc-category/entry[father/item/@id = $idCat]">
									<xsl:variable name="handleCat" select="title/@handle"/>
									<li class="nav-item">
										<a id="{$handleCat}-tab" class="nav-link" data-bs-toggle="tab" type="button" data-bs-target="#{$handleCat}" role="tab" aria-controls="{$handleCat}">
											<xsl:if test="$handleCat = 'generale'">
												<xsl:attribute name="class">nav-link active</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="title"/>
										</a>
									</li>
								</xsl:for-each>
							</div>
						</xsl:for-each>
						<xsl:for-each select="/data/humanbit-doc-modules-category/entry">
							<xsl:variable name="idCat" select="@id"/>
							<a class="title_cat w-100 m-3 border-bottom" data-bs-toggle="collapse" href="#collapse{$idCat}" role="button" aria-expanded="true" aria-controls="collapse{$idCat}"><xsl:value-of select="title"/></a>
							<div id="collapse{$idCat}" class="collapse">
								<xsl:for-each select="/data/humanbit-doc-modules/entry[category/item/@id = $idCat]">
									<xsl:variable name="handleCat" select="name"/>
									<li class="nav-item">
										<a id="{$handleCat}-tab" class="nav-link" data-bs-toggle="tab" type="button" data-bs-target="#{$handleCat}" role="tab" aria-controls="{$handleCat}">
											<xsl:value-of select="title"/>
										</a>
									</li>
								</xsl:for-each>
							</div>
						</xsl:for-each>
					</ul>
				</aside>
				<main class="docContent col-9 linetobe">
					<div class="tab-content" id="content">
						<xsl:for-each select="/data/humanbit-doc-category/entry[father/item]">
							<xsl:variable name="idCat" select="@id"/>
							<xsl:variable name="handleCat" select="title/@handle"/>
							<xsl:variable name="father" select="father/item/@handle"/>
							<div id="{$handleCat}" class="tab-pane fade" role="tabpanel" aria-labelledby="{$handleCat}-tab">
								<xsl:if test="$handleCat = 'generale'">
									<xsl:attribute name="class">tab-pane fade active show</xsl:attribute>
								</xsl:if>
								<h1 class="m-4"><xsl:value-of select="title"/></h1>
								<xsl:choose>
									<xsl:when test="count(/data/humanbit-doc/entry[category/item/@id = $idCat]) &gt; 0">
										<div id="accordionDoc" class="m-4">
											<xsl:for-each select="/data/humanbit-doc/entry[category/item/@id = $idCat]">
												<xsl:variable name="idDoc" select="@id"/>
												<xsl:variable name="handleDoc" select="title/@handle"/>
												<div class="accordionDocItem">
													<div id="heading-doc_{$handleDoc}">
														<h2 class="accordionDocTitle">
															<a class="btn btn-link bodyDocCollapse collapsed" data-bs-target="#doc_{$handleDoc}" data-bs-toggle="collapse" type="button" aria-controls="doc_{$handleDoc}">
																<xsl:value-of select="title"/><i class="ms-2 fa-solid fa-chevron-down"></i>
															</a>
														</h2>
													</div>
													<div id="doc_{$handleDoc}" class="collapse" aria-labelledby="heading-doc_{$handleDoc}" data-bs-parent="#accordionDoc">
														<div class="bodyDoc mb-4">
															<div class="card-body">
																<h4 class="subtitleDoc mb-4"><xsl:value-of select="subtitle"/></h4>
																<xsl:choose>
																	<xsl:when test="$father = 'programmazione'">
																		<xsl:call-template name="codeDocumentation">
																			<xsl:with-param name="body" select="body"/>
																			<xsl:with-param name="code-node-cat" select="'documentazione'"/>
																			<xsl:with-param name="code-node" select="'humanbit-doc-code'"/>
																			<xsl:with-param name="handle" select="$handleDoc"/>
																		</xsl:call-template>
																		<xsl:choose>
																			<xsl:when test="title/@handle = 'mappa-dinamica'">
																				<div id="map" class="w-100" style="height:500px"></div>
																			</xsl:when>
																		</xsl:choose>
																		<xsl:if test="trigger">
																			<button id="{trigger}" class="buttonPreview" data-elem="previewDoc_{$handleDoc}">Preview</button>
																			<div id="previewDoc_{$handleDoc}" style="display:none;width: 600px; height:400px;"></div>
																		</xsl:if>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:copy-of select="body"/>
																	</xsl:otherwise>
																</xsl:choose>
																<xsl:if test="fonte">
																	<a class="fonteDoc mt-3" href="{fonte}" target="_blank">Fonte <i class="fas fa-external-link-alt"></i></a>
																</xsl:if>
															</div>
														</div>
													</div>
												</div>
											</xsl:for-each>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<p class="m-4">Ancora niente qui!</p>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</xsl:for-each>
						<xsl:for-each select="/data/humanbit-doc-modules/entry">
							<xsl:variable name="handleCat" select="name"/>
							<xsl:variable name="handleModule" select="title/@handle"/>
							<div id="{$handleCat}" class="tab-pane fade" role="tabpanel" aria-labelledby="{$handleCat}-tab">
								<h1 class="m-4"><xsl:value-of select="title"/></h1>
								<div class="m-4">
									<div class="bodyDoc">
										<h4 class="subtitleDoc mb-4"><xsl:value-of select="description"/></h4>
										<xsl:choose>
											<xsl:when test="$handleCat = 'calendar_module'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule"><xsl:call-template name="calendar_module"/></span>
											</xsl:when>
											<xsl:when test="$handleCat = 'timestamp'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">Data corrente: <xsl:value-of select="$today"/></span>
												<span class="infoModule">
													Timestamp:
													<xsl:call-template name="timestamp">
														<xsl:with-param name="date" select="$today"/>
													</xsl:call-template>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'day'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">Data corrente: <xsl:value-of select="$today"/></span>
												<span class="infoModule">
													Day:
													<xsl:call-template name="day">
														<xsl:with-param name="date" select="$today"/>
													</xsl:call-template>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'month'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">Data corrente: <xsl:value-of select="$today"/></span>
												<span class="infoModule">
													Month:
													<xsl:call-template name="month">
														<xsl:with-param name="date" select="$today"/>
													</xsl:call-template>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'month_label'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">Data corrente: <xsl:value-of select="$today"/></span>
												<span class="infoModule">
													Month label:
													<xsl:call-template name="month_label">
														<xsl:with-param name="date" select="$today"/>
													</xsl:call-template>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'year'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">Data corrente: <xsl:value-of select="$today"/></span>
												<span class="infoModule">
													Year:
													<xsl:call-template name="year">
														<xsl:with-param name="date" select="$today"/>
													</xsl:call-template>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'format-date'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">Data corrente: <xsl:value-of select="$today"/></span>
												<span class="infoModule">
													Data formattata:
													<xsl:call-template name="format-date">
														<xsl:with-param name="date" select="$today"/>
													</xsl:call-template>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'card_horiz_module'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">
													<xsl:for-each select="/data/article/entry">
														<xsl:variable name="idArticle" select="@id"/>
														<xsl:call-template name="card_horiz_module">
															<xsl:with-param name="img" select="/data/article-media/entry[article/item/@id = $idArticle]/image/filename"/>
														</xsl:call-template>
													</xsl:for-each>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'card_vert_module'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">
													<div class="card_vert_module_container col-12 row">
														<xsl:for-each select="/data/article/entry">
															<xsl:variable name="idArticle" select="@id"/>
															<xsl:call-template name="card_vert_module">
																<xsl:with-param name="img" select="/data/article-media/entry[article/item/@id = $idArticle]/image/filename"/>
															</xsl:call-template>
														</xsl:for-each>
													</div>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'push_notifications'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<i id="btn_notification" role="button" class="fal fa-bell my-4"></i>
												<span class="infoModule">
													<xsl:for-each select="/data/push-notifications/entry[position() = 1]">
														<xsl:call-template name="push_notifications"/>
													</xsl:for-each>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'slide_selection_module_image_1'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">
													<xsl:call-template name="slide_selection_module_image_1">
														<xsl:with-param name="nodecont" select="'article'"/>
														<xsl:with-param name="nodemedia" select="'article-media'"/>
													</xsl:call-template>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'slide_selection_module_noimage'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">
													<xsl:call-template name="slide_selection_module_noimage">
														<xsl:with-param name="nodecont" select="'article'"/>
													</xsl:call-template>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'navbar_slide_top'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<div class="infoModule">
													<iframe id="navbar_slide_top" width="100%" height="600px" src="{$root}/navbar-doc/?module=navbar_slide_top"></iframe>
												</div>
											</xsl:when>
											<xsl:when test="$handleCat = 'navbar_slide_right'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<div class="infoModule">
													<iframe id="navbar_slide_right" width="100%" height="600px" src="{$root}/navbar-doc/?module=navbar_slide_right"></iframe>
												</div>
											</xsl:when>
											<xsl:when test="$handleCat = 'navbar_slide_bottom'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<div class="infoModule">
													<iframe id="navbar_slide_bottom" width="100%" height="600px" src="{$root}/navbar-doc/?module=navbar_slide_bottom"></iframe>
												</div>
											</xsl:when>
											<xsl:when test="$handleCat = 'navbar_slide_left'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<div class="infoModule">
													<iframe id="navbar_slide_left" width="100%" height="600px" src="{$root}/navbar-doc/?module=navbar_slide_left"></iframe>
												</div>
											</xsl:when>
											<xsl:when test="$handleCat = 'navbar_grow_top'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<div class="infoModule">
													<iframe id="navbar_grow_top" width="100%" height="600px" src="{$root}/navbar-doc/?module=navbar_grow_top"></iframe>
												</div>
											</xsl:when>
											<xsl:when test="$handleCat = 'navbar_grow_right'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<div class="infoModule">
													<iframe id="navbar_grow_right" width="100%" height="600px" src="{$root}/navbar-doc/?module=navbar_grow_right"></iframe>
												</div>
											</xsl:when>
											<xsl:when test="$handleCat = 'navbar_grow_bottom'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<div class="infoModule">
													<iframe id="navbar_grow_bottom" width="100%" height="600px" src="{$root}/navbar-doc/?module=navbar_grow_bottom"></iframe>
												</div>
											</xsl:when>
											<xsl:when test="$handleCat = 'navbar_grow_left'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<div class="infoModule">
													<iframe id="navbar_grow_left" width="100%" height="600px" src="{$root}/navbar-doc/?module=navbar_grow_left"></iframe>
												</div>
											</xsl:when>
											<xsl:when test="$handleCat = 'footer_left_right'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">
													<xsl:call-template name="footer_simple"/>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'slide_hero_home_module'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">
													<xsl:for-each select="/data/article/entry">
														<xsl:call-template name="slide_hero_home_module">
															<xsl:with-param name="title" select="*[local-name() = $titlelan]"/>
															<xsl:with-param name="color" select="color"/>
															<xsl:with-param name="abstract" select="*[local-name() = $abslan]"/>
														</xsl:call-template>
													</xsl:for-each>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'text_img_row_module'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">
													<xsl:for-each select="/data/article/entry">
														<xsl:variable name="idArticle" select="@id"/>
														<xsl:call-template name="text_img_row_module">
															<xsl:with-param name="title" select="*[local-name() = $titlelan]"/>
															<xsl:with-param name="subtitle" select="*[local-name() = $subtitlelan]"/>
															<xsl:with-param name="abstract" select="*[local-name() = $abslan]"/>
															<xsl:with-param name="imgname" select="/data/article-media/entry[article/item/@id = $idArticle]/image/filename"/>
														</xsl:call-template>
													</xsl:for-each>
												</span>
											</xsl:when>
											<xsl:when test="$handleCat = 'horiz_calendar_module'">
												<xsl:call-template name="codeDocumentation">
													<xsl:with-param name="body" select="body"/>
													<xsl:with-param name="code-node-cat" select="'modulo'"/>
													<xsl:with-param name="code-node" select="'humanbit-doc-modules-code'"/>
													<xsl:with-param name="handle" select="$handleModule"/>
												</xsl:call-template>
												<span class="infoModule">
													<xsl:call-template name="horiz_calendar_module"/>
												</span>
											</xsl:when>
										</xsl:choose>
									</div>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</main>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="codeDocumentation">
		<xsl:param name="body"/>
		<xsl:param name="handle"/>
		<xsl:param name="code-node-cat"/>
		<xsl:param name="code-node"/>
		<div class="bodyDocHeader mb-4 px-2"><span class="bodyDocHeaderTitle">Parametri - Requisiti</span><xsl:copy-of select="$body"/></div>
		<div class="px-2"><span class="bodyDocHeaderTitle">Codice</span></div>
		<ul class="codeList">
			<xsl:for-each select="/data/*[local-name() = $code-node]/*[local-name() = $code-node-cat][@link-handle = $handle]/entry">
				<li>
					<xsl:variable name="id" select="@id"/>
					<xsl:variable name="language" select="language/item"/>
					<div class="bodyDocCode mt-2 mb-4 px-2">
						<a class="btn btn-link bodyDocCollapse collapsed" data-bs-target="#docCode{$id}" data-bs-toggle="collapse" type="button" aria-controls="docCod{$id}"><xsl:value-of select="name"/> <i class="ms-2 fa-solid fa-chevron-down"></i></a>
						<div id="docCode{$id}" class="collapse mt-3" aria-labelledby="heading-docCode{$id}">
							<div class="code">
								<pre>
									<code id="code{$id}" class="language-{$language}">
										<xsl:value-of select="code"/>
									</code>
								</pre>
								<button class="mt-2 me-2 codeButton" data-ref="#code{$id}"><i class="fa-solid fa-copy"></i></button>
							</div>
						</div>
					</div>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

</xsl:stylesheet>
