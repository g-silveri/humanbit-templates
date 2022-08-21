<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="footer_nav">

        <div class="footer_partial">

            <footer class="footer_collapse row align-items-center">
                <!-- Who talks about us (TITLE) -->
				<p class="who_talks h5 color_white mt-3">
                    Who talks about us
                    <xsl:value-of select="/data/translate/entry[code='who_talks']/*[local-name() = $lanextended]"/>
                </p>

                <!-- Who talks about us (LOGOS) -->
                <div class="who_talks_logos row align-items-center col-12 mb-5 pe-lg-6">
					<!-- <xsl:for-each select="/data/press/entry"> -->
						<!-- <a class="who_talks_link col-6 col-sm-3 col-xl-2" href="{link}" target="_blank">
							<figure class="who_talks_wrapper figure col-12 my-3 pe-4">
								<img class="who_talks_logo img-fluid w-100" src="{$root}/image/1/140/0/uploads/{logo/filename}" alt="{titolo}" />
							</figure>
						</a> -->

                        <!-- Delete placeholders once they've been cycled <<IN>> -->
						<a class="who_talks_link col-6 col-sm-3 col-xl-2" href="{link}" target="_blank">
							<figure class="who_talks_wrapper figure col-12 my-3 pe-4">
								<img class="who_talks_logo img-fluid w-100" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="{titolo}" />
							</figure>
						</a>

						<a class="who_talks_link col-6 col-sm-3 col-xl-2" href="{link}" target="_blank">
							<figure class="who_talks_wrapper figure col-12 my-3 pe-4">
								<img class="who_talks_logo img-fluid w-100" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="{titolo}" />
							</figure>
						</a>

						<a class="who_talks_link col-6 col-sm-3 col-xl-2" href="{link}" target="_blank">
							<figure class="who_talks_wrapper figure col-12 my-3 pe-4">
								<img class="who_talks_logo img-fluid w-100" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="{titolo}" />
							</figure>
						</a>

						<a class="who_talks_link col-6 col-sm-3 col-xl-2" href="{link}" target="_blank">
							<figure class="who_talks_wrapper figure col-12 my-3 pe-4">
								<img class="who_talks_logo img-fluid w-100" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="{titolo}" />
							</figure>
						</a>

						<a class="who_talks_link col-6 col-sm-3 col-xl-2" href="{link}" target="_blank">
							<figure class="who_talks_wrapper figure col-12 my-3 pe-4">
								<img class="who_talks_logo img-fluid w-100" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="{titolo}" />
							</figure>
						</a>

						<a class="who_talks_link col-6 col-sm-3 col-xl-2" href="{link}" target="_blank">
							<figure class="who_talks_wrapper figure col-12 my-3 pe-4">
								<img class="who_talks_logo img-fluid w-100" src="{$workspace}/static/images/logos/logo-humanbit-white.svg" alt="{titolo}" />
							</figure>
						</a>
                        <!-- Delete placeholders once they've been cycled <<OUT>> -->
					<!-- </xsl:for-each> -->
                </div>

                <!-- Newsletter (TITLE) -->
                <p class="newsletter_text h5 mb-4">
                    Subscribe to our newsletter to keep up to date on our news
                    <xsl:value-of select="/data/translate/entry[code='up_to_date']/*[local-name() = $lanextended]"/>
                </p>

                <!-- Newsletter (FORM) -->
                <form class="nav_form row mb-5" action="">
                    <div class="nav_input form-floating mb-4 mb-md-0 pe-md-5 w-100 w-md-75 w-xl-50">
                        <input type="email" class="form-control border-top-0 border-end-0 border-start-0" id="floatingEmail" placeholder="Your email:" />

                        <label class="border-top-0 border-end-0 border-start-0" for="floatingEmail">
                            Your email
                            <xsl:value-of select="/data/translate/entry[code='your_email']/*[local-name() = $lanextended]"/>
                        </label>
                    </div>

                    <button class="btn_bg_third btn_reverse px-5 py-3 w-100 w-md-auto" type="submit" value="Send">
                        <!-- Send -->
                        <xsl:value-of select="/data/translate/entry[code='send']/*[local-name() = $lanextended]"/>
                    </button>
                </form>

                <!-- Social icons -->
                <div class="container_social h1 d-flex flex-wrap mb-4">
                    <a class="link_social h2 lh-1" href="https://www.facebook.com/dotstay.it/">
                        <i class="icon_social social_facebook color_white fa-brands fa-facebook me-4" />
                    </a>

                    <a class="link_social h2 lh-1" href="https://www.instagram.com/_dotstay_/">
                        <i class="icon_social social_instagram color_white fa-brands fa-instagram me-4" />
                    </a>

                    <a class="link_social h2 lh-1" href="https://www.linkedin.com/company/5383094/">
                        <i class="icon_social social_linkedin color_white fa-brands fa-linkedin" />
                    </a>
                </div>

                <!-- Copyright -->
                <div class="copyright_wrapper h1 mb-5">
                    <p class="copyright_text">
                        <bold>©</bold> 2022 Humanbit
                    </p>
                </div>
            </footer>

        </div>

    </xsl:template>

</xsl:stylesheet>
