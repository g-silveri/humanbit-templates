<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

	<xsl:include href="../utilities/default_template.xsl" />

	<xsl:template name="head">
	</xsl:template>

	<xsl:template name="page_structure">

		<div class="mt-12">
			<p>Link documentazione: <a href="https://developers.italia.it/it/spid/" target="_blank" style="text-decoration: underline">Developers Italia</a></p>
			<p>Link demo: <a href="https://172.104.252.157:8443/demo" target="_blank" style="text-decoration: underline">Demo</a></p>
			<p>Metadata link: <a href="https://172.104.252.157:8443/metadata.xml" target="_blank" style="text-decoration: underline">Metadata</a></p>
			<p>SPID Validator link: <a href="https://172.104.252.157:8443/" target="_blank" style="text-decoration: underline">SPID Validator (validator / validator)</a></p>
			<p>Attivare docker per demo: sudo docker run -t -i -p 8443:8443 spid-saml-check</p>
		</div>

		<div class="text-center mt-12">
			<a href="#" class="italia-it-button italia-it-button-size-xl button-spid" spid-idp-button="#spid-idp-button-xlarge-get" aria-haspopup="true" aria-expanded="false">
				<span class="italia-it-button-icon"><img src="{$root}/service/spid/img/spid-ico-circle-bb.svg" onerror="this.src='img/spid-ico-circle-bb.png'; this.onerror=null;" alt="" /></span>
				<span class="italia-it-button-text">Entra con SPID</span>
			</a>
			<div id="spid-idp-button-xlarge-get" class="spid-idp-button spid-idp-button-tip spid-idp-button-relative">
				<ul id="spid-idp-list-xlarge-root-get" class="spid-idp-button-menu" aria-labelledby="spid-idp">
					<li class="spid-idp-button-link" data-idp="test">
						<a class="btnLogin" href="#" id="loginTest" data-ref="#spidForm" data-action="https://172.104.252.157:8443/samlsso"><span class="spid-sr-only">Test</span><img src="{$workspace}/static/images/logos/logo-humanbit-blue.svg" onerror="this.src='img/spid-idp-timid.png'; this.onerror=null;" alt="Test" style="height:55px;"/></a>
					</li>
					<!-- <li class="spid-idp-button-link" data-idp="test">
						<a href="#" id="spidValidatorTest" data-ref="#spidValidatorForm" data-action="https://172.104.252.157:8443"><span class="spid-sr-only">Test</span><img src="{$workspace}/static/images/logos/logo-humanbit-black.svg" onerror="this.src='img/spid-idp-timid.png'; this.onerror=null;" alt="Test" style="height:55px;"/></a>
					</li> -->
					<li class="spid-idp-button-link" data-idp="arubaid">
						<a href="#"><span class="spid-sr-only">Aruba ID</span><img src="{$root}/service/spid/img/spid-idp-arubaid.svg" onerror="this.src='img/spid-idp-arubaid.png'; this.onerror=null;" alt="Aruba ID" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-button-link" data-idp="infocertid">
						<a href="#"><span class="spid-sr-only">Infocert ID</span><img src="{$root}/service/spid/img/spid-idp-infocertid.svg" onerror="this.src='img/spid-idp-infocertid.png'; this.onerror=null;" alt="Infocert ID" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-button-link" data-idp="intesaid">
						<a href="#"><span class="spid-sr-only">Intesa ID</span><img src="{$root}/service/spid/img/spid-idp-intesaid.svg" onerror="this.src='img/spid-idp-intesaid.png'; this.onerror=null;" alt="Intesa ID" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-button-link" data-idp="lepidaid">
						<a href="#"><span class="spid-sr-only">Lepida ID</span><img src="{$root}/service/spid/img/spid-idp-lepidaid.svg" onerror="this.src='img/spid-idp-lepidaid.png'; this.onerror=null;" alt="Lepida ID" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-button-link" data-idp="namirialid">
						<a href="#"><span class="spid-sr-only">Namirial ID</span><img src="{$root}/service/spid/img/spid-idp-namirialid.svg" onerror="this.src='img/spid-idp-namirialid.png'; this.onerror=null;" alt="Namirial ID" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-button-link" data-idp="posteid">
						<a href="#"><span class="spid-sr-only">Poste ID</span><img src="{$root}/service/spid/img/spid-idp-posteid.svg" onerror="this.src='img/spid-idp-posteid.png'; this.onerror=null;" alt="Poste ID" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-button-link" data-idp="sielteid">
						<a href="#"><span class="spid-sr-only">Sielte ID</span><img src="{$root}/service/spid/img/spid-idp-sielteid.svg" onerror="this.src='img/spid-idp-sielteid.png'; this.onerror=null;" alt="Sielte ID" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-button-link" data-idp="spiditalia">
						<a href="#"><span class="spid-sr-only">SPIDItalia Register.it</span><img src="{$root}/service/spid/img/spid-idp-spiditalia.svg" onerror="this.src='img/spid-idp-spiditalia.png'; this.onerror=null;" alt="SpidItalia" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-button-link" data-idp="teamsystemid">
						<a href="#"><span class="spid-sr-only">TeamSystem ID</span><img src="{$root}/service/spid/img/spid-idp-teamsystemid.svg" onerror="this.src='img/spid-idp-teamsystemid.png'; this.onerror=null;" alt="TeamSystem ID" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-button-link" data-idp="timid">
						<a href="#"><span class="spid-sr-only">Tim ID</span><img src="{$root}/service/spid/img/spid-idp-timid.svg" onerror="this.src='img/spid-idp-timid.png'; this.onerror=null;" alt="Tim ID" style="height:55px;"/></a>
					</li>
					<li class="spid-idp-support-link" data-spidlink="info">
						<a href="https://www.spid.gov.it">Maggiori informazioni</a>
					</li>
					<li class="spid-idp-support-link" data-spidlink="rich">
						<a href="https://www.spid.gov.it/richiedi-spid">Non hai SPID?</a>
					</li>
					<li class="spid-idp-support-link" data-spidlink="help">
						<a href="https://www.spid.gov.it/serve-aiuto">Serve aiuto?</a>
					</li>
					<form id="spidForm" method="post" action="" style="display:none;">
						<input id="SAMLRequest" type="hidden" name="SAMLRequest"/>
						<input id="RelayState" type="hidden" name="RelayState"/>
						<input type="submit" value="Invia"/>
					</form>
				</ul>
			</div>
		</div>

	</xsl:template>

</xsl:stylesheet>
