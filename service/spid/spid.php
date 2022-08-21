<?php

function sshEncodePublicKey($privKey) {
    $keyInfo = openssl_pkey_get_details($privKey);
    $buffer  = pack("N", 7) . "ssh-rsa" .
    sshEncodeBuffer($keyInfo['rsa']['e']) . 
    sshEncodeBuffer($keyInfo['rsa']['n']);
    return "ssh-rsa " . base64_encode($buffer);
}

function sshEncodeBuffer($buffer) {
    $len = strlen($buffer);
    if (ord($buffer[0]) & 0x80) {
        $len++;
        $buffer = "\x00" . $buffer;
    }
    return pack("Na*", $len, $buffer);
}

$AuthnRequest_ID = vsprintf( '%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex(random_bytes(16)), 4) );
$AuthnRequest_ID_Ref = '#' . $AuthnRequest_ID;
$AuthnRequest_Version = "2.0";
$AuthnRequest_IssueInstant = gmdate("Y-m-d\TH:i:s\Z");
$AuthnRequest_Destination = "https://172.104.252.157:8443/samlsso";
$AuthnRequest_AssertionConsumerServiceURL = "https://172.104.252.157:8443/samlsso";
$AuthnRequest_ProtocolBinding = "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST";
$AttributeConsumingServiceIndex = "1";

$AuthnRequest_Issuer_NameQualifier = "https://ecom1.humanbit.com";
$AuthnRequest_Issuer_Format = "urn:oasis:names:tc:SAML:2.0:nameid-format:entity";
$AuthnRequest_Issuer = "https://ecom1.humanbit.com";

$rsaKey = openssl_pkey_new(array( 
    'private_key_bits' => 2048, 
    'private_key_type' => OPENSSL_KEYTYPE_RSA));

$privKey = openssl_pkey_get_private($rsaKey); 
openssl_pkey_export($privKey, $pem); //Private Key
$pubKey = sshEncodePublicKey($rsaKey); //Public Key

$umask = umask(0066); 
file_put_contents('/tmp/test.rsa', $pem); //save private key into file
file_put_contents('/tmp/test.rsa.pub', $pubKey); //save public key into file

$AuthnRequest_Signature = $pubKey;
$AuthnRequest_NameIDPolicy_Format = "urn:oasis:names:tc:SAML:2.0:nameid-format:transient";
$AuthnRequest_RequestedAuthnContext_Comparison = "exact";
$AuthnRequest_RequestedAuthnContext_AuthnContextClassRef = "https://www.spid.gov.it/SpidL1";

$xml = <<<XML
<samlp:AuthnRequest xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol"
    xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
    xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
    ID="$AuthnRequest_ID"
    Version="$AuthnRequest_Version"
    IssueInstant="$AuthnRequest_IssueInstant"
    Destination="$AuthnRequest_Destination"
    AssertionConsumerServiceURL="$AuthnRequest_AssertionConsumerServiceURL"
    ProtocolBinding="$AuthnRequest_ProtocolBinding"
    AttributeConsumingServiceIndex="$AttributeConsumingServiceIndex">
    <saml:Issuer NameQualifier="$AuthnRequest_Issuer_NameQualifier" Format="$AuthnRequest_Issuer_Format">$AuthnRequest_Issuer</saml:Issuer>
    <ds:Signature id="Signature1">
        <ds:SignedInfo>
            <ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
            <ds:SignatureMethod Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"/>
            <ds:Reference URI="$AuthnRequest_ID_Ref">
            <ds:Transforms>
                <ds:Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
                <ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
            </ds:Transforms>
            <ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256"/>
                <ds:DigestValue>sq9w49CyaVqtz7gyqh7M8uwVGq1og3czvxvHRCAyQaw=</ds:DigestValue>
            </ds:Reference>
        </ds:SignedInfo>
        <ds:SignatureValue>
            $AuthnRequest_Signature
        </ds:SignatureValue>
    </ds:Signature>
    <samlp:NameIDPolicy Format="$AuthnRequest_NameIDPolicy_Format" />
    <samlp:RequestedAuthnContext Comparison="$AuthnRequest_RequestedAuthnContext_Comparison">
        <saml:AuthnContextClassRef>$AuthnRequest_RequestedAuthnContext_AuthnContextClassRef</saml:AuthnContextClassRef>
    </samlp:RequestedAuthnContext>
</samlp:AuthnRequest>
XML;

$sxe = new SimpleXMLElement($xml);
print_r(base64_encode($sxe->asXML()));
