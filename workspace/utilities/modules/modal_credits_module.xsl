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

	<!-- When you call the template watch which parameter expects (xsl:param subito sotto i template) and pass them on call template

		Ex:
			template:
			<xsl:template name="credits_module">
				<xsl:param name="nodecont"/>
				<xsl:param name="nodemedia"/>
			</xsl:template>

			call template:
			<xsl:call-template name="credits_module">
				<xsl:with-param name="nodecont" select="'(nme_data_source)'"/>
				<xsl:with-param name="nodemedia" select="'(nme_data_source)'" />
			</xsl:for-each> -->
	<!-- module 1 -->

	<xsl:template name="modal_credits_module">

		<div class="modal_credits_module">

			<div class="modal_credits modal_newsletter modal fade color_first" id="modal_credits" tabindex="-1" aria-labelledby="modal_creditsLabel" aria-hidden="true">

				<div class="modal-dialog modal-dialog-centered">

					<div class="modal-content">
						<div class="modal-header mb-4">
							<h5 class="modal-title color_white">Credits</h5>

							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
								<i class="fa-light fa-xmark" />
							</button>
						</div>

						<div class="modal-body">
							<h6 class="mb-4">Creativity, Experience and Technology</h6>

							<a href="https://humanbit.com/" class="link_humanbit link_humanbit_logo small color_first d-block mb-4">
								<svg class="logo_secondary img-fluid" id="livello2" data-name="Livello 2" viewBox="0 0 309.26 52.63" xmlns="http://www.w3.org/2000/svg">
									<defs></defs>

									<title>Humanbit</title>

									<path class="cls-2" d="M66.87,37.11c-5,4.76-11.41,9.69-14.7,9.92-3.64.25-4.33-1.94-4.46-2.89,0-.3-.12-1.67-.13-3.27,0-3.91,0-27.94,0-28.18H42c0,.24,0,24.29,0,28.22,0,1.76.11,3.33.18,3.88a9,9,0,0,0,9.39,7.81l.95,0c4.42-.3,10.07-4.32,14.33-8v8h5.55V12.75H66.87Z" transform="translate(-0.14 -0.12)"></path>

									<path class="cls-2" d="M30.54,20.42c-.34-2.91-2.95-8.29-10.34-7.78C15.71,13,10,17.08,5.7,20.75V.12H.14V52.66H5.7V28.28c5-4.81,11.53-9.87,14.87-10.1,3.66-.24,4.33,1.95,4.46,2.89,0,.3.12,1.67.14,3.27,0,4,0,9.75,0,9.75V52.63h5.55V34.08s0-5.8,0-9.78C30.71,22.54,30.61,21,30.54,20.42Z" transform="translate(-0.14 -0.12)"></path>

									<polygon class="cls-2" points="271.21 52.48 276.77 52.48 276.77 12.22 271.21 16.43 271.21 52.48"></polygon>

									<path class="cls-2" d="M306,43c-3.17,2.43-6.53,4.57-9.7,3.78-.22-.1-.49-.22-.81-.34A3.52,3.52,0,0,1,294,44.34c-.17-1.38,0-12.14.09-22h9.87V16.76h-9.8c.05-4,.09-7.86.12-11.33l-5.56,0c0,4.76-.1,10.33-.17,15.76-.21,16-.27,22.67,0,24.06a8.94,8.94,0,0,0,4.93,6.35l.22.08a3.79,3.79,0,0,1,.48.21l.47.19a11.1,11.1,0,0,0,3.13.44c5.08,0,9.43-3.34,11.72-5.1Z" transform="translate(-0.14 -0.12)"></path>

									<path class="cls-2" d="M135.14,20.61c-.34-2.91-2.94-8.27-10.34-7.77-4,.27-9.26,3.69-12.88,6.4-1-2.91-3.82-6.58-10-6.16-3.36.23-8.4,3.51-13,7.08V12.63H83.45V52.7H89V27.35c6.86-5.87,11.63-8.62,13.32-8.73,3.64-.25,4.33,1.94,4.45,2.89,0,.28.13,1.59.14,3.13l.06,6.11,0,0V52.66h5.55V25.81c4.26-3.59,10-7.25,12.62-7.43,3.64-.25,4.33,1.94,4.46,2.89,0,.3.12,1.67.13,3.27,0,3.91.05,27.89.05,28.13h5.55c0-.24,0-24.24,0-28.17C135.31,22.74,135.21,21.17,135.14,20.61Z" transform="translate(-0.14 -0.12)"></path>

									<path class="cls-2" d="M249.68,12.48c-4.68.14-10.93,3.49-15.34,6.27V.33h-5.56v52.3h5.56V48.71a27.94,27.94,0,0,0,3,1.8,20.68,20.68,0,0,0,9,2.24,13.84,13.84,0,0,0,8.23-2.59c6.46-4.64,6.66-9.4,6.87-14.44l0-.42c.22-5.27.3-11.79-1.13-15.61C258,13.53,253.24,12.35,249.68,12.48Zm6.18,22.58,0,.43c-.19,4.58-.29,7.09-4.56,10.16s-9.85.71-11.44-.09a26,26,0,0,1-5.44-3.89l-.06.06V25.41c4.94-3.43,11.73-7.26,15.51-7.38a4.82,4.82,0,0,1,5.22,3.6l0,.1C255.9,23.82,256.15,28.31,255.86,35.06Z" transform="translate(-0.14 -0.12)"></path>

									<path class="cls-2" d="M217.18,20.33c-.35-2.91-3-8.27-10.35-7.77-4.39.29-10,4.27-14.24,7.89V12.69H187V52.57h5.55V27.94c4.93-4.73,11.35-9.62,14.62-9.84,3.65-.25,4.33,1.94,4.45,2.89,0,.3.13,1.66.14,3.27,0,3.91,0,28.17,0,28.42h5.56c0-.24,0-24.52-.05-28.45C217.34,22.45,217.25,20.88,217.18,20.33Z" transform="translate(-0.14 -0.12)"></path>

									<path class="cls-2" d="M170.47,12.55l-2.8,0a31,31,0,0,0-3.58.36c-11.09,2.09-18.54,9.79-19,19.61-.14,1.66-.69,9.4.63,13.06,2.15,6,6.79,7,9.61,7h.38c4.58-.14,10.7-3.67,14.74-6.36v6.34H176V12.56h-5.54ZM155.53,47.1c-3,.06-3.94-1.55-4.61-3.44s-.57-7.36-.29-10.69v-.11c.39-8.72,8.05-13.24,14.49-14.45a26.82,26.82,0,0,1,2.69-.27l2.64,0V39.5C165.63,43.1,159,47,155.53,47.1Z" transform="translate(-0.14 -0.12)"></path>
								</svg>
							</a>

							<a href="https://humanbit.com/" class="link_humanbit small d-block mb-0">Humanbit S.r.l</a>

							<p class="small mb-0">Via della moscova 40</p>

							<p class="small mb-0">20121 - Milano</p>

							<a href="mailto:info@humanbit.com" class="small link_humanbit d-block mb-4">info@humanbit.com</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</xsl:template>

</xsl:stylesheet>
