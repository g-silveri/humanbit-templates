<?php
use setasign\Fpdi\Fpdi; 
use Mpdf\Mpdf; 
require_once('vendor/setasign/fpdf/fpdf.php');
require_once('vendor/autoload.php');

//parse dei parametri passati dalla url
parse_str($_SERVER['QUERY_STRING'], $payload);

$url = $payload['url'];
$bussola_logo = '../../workspace/images/loghi/logo-bussola-sito.png';
$assolombarda_logo = '../../workspace/images/loghi/logo-assolombarda-bussola.png';

$pdf = new Fpdi();
$pdf->AddPage();
$pdf->Image($bussola_logo, 15, 10, 35, 0, 'png');
$pdf->Image($assolombarda_logo , 160, 10, 35, 0, 'png');
$pdf->Output('F', 'pdf/prova.pdf');

if (!preg_match('@^https?://bussola40.assolombarda\.it/@', $url)) {
    die("Access denied");
}

if (count($_POST) > 0) {

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1 );
    
    $html = curl_exec($ch);
    curl_close($ch);

} elseif (ini_get('allow_url_fopen')) {
    $html = file_get_contents($url);

} else {
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt ( $ch , CURLOPT_RETURNTRANSFER , 1 );
    $html = curl_exec($ch);
    curl_close($ch);
}

$mpdf = new Mpdf();
$pagecount = $mpdf->SetSourceFile('pdf/prova.pdf');

// Import the last page of the source PDF file
$tplId = $mpdf->ImportPage($pagecount);
$mpdf->UseTemplate($tplId);
$mpdf->useSubstitutions = true;
$mpdf->setBasePath($url);
$mpdf->WriteHTML($html);
$mpdf->Output();

?>