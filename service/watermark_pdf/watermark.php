<?php
use setasign\Fpdi\Fpdi; 
require_once('vendor/setasign/fpdf/fpdf.php');
require_once('vendor/autoload.php');

//parse dei parametri passati dalla url
parse_str($_SERVER['QUERY_STRING'], $payload);

$type = $payload['type'];
$source = '../../workspace/uploads/'.$payload['source'];

//inizializzazione del pdf
$pdf = new Fpdi();
if(file_exists("./".$source)){
    $pagecount = $pdf->setSourceFile($source);
    $image = null;
    if($type === 'text'){
        $date = $payload['date'];
        $membername = $payload['name'];
        $membersurname = $payload['surname'];

        //creazione dell'array
        $text = Array("Bussola 4.0", "Assolombarda", $date, $membername, $membersurname);

        //inizializzazione delle proprieta' dell'immagine: dimensione, trasparenza del background e del testo, colore del testo, font del testo
        $image = './watermark.png';
        $img = @imagecreatetruecolor(250, 250)
        or die('Cannot Initialize new GD image stream');
        imagesavealpha($img, true);
        $bgcolor = imagecolorallocatealpha($img,0x00,0x00,0x00,127);
        imagefill($img, 0, 0, $bgcolor);
        $text_color = imagecolorallocatealpha($img, 52, 58, 64, 40);

        //$text_color = imagecolorallocate($img, 2, 15, 79);
        $font = '../../workspace/static/css/font/Butler_Regular.ttf';
        $font_size = 12;

        //ciclo per posizionare ogni parola a capo
        for($i=0; $i < sizeof($text); $i++){
            $height = $font_size + ($i * ($font_size + 5));
            $value = $text[$i];
            imagettftext($img, $font_size, 0, 0, $height, $text_color, $font, $value);
        }

        //salvataggio dell'immagine in un file png e distruzione di quella generata
        imagepng($img, $image);
        imagedestroy($img);
    } else {
        $image = '../../workspace/uploads/'.$payload['image'];
    }

    //ciclo per posizionare ogni parola nel file pdf
    for($i=1; $i<=$pagecount; $i++){ 
        $tpl = $pdf->importPage($i); 
        $size = $pdf->getTemplateSize($tpl);
        $pdf->addPage(); 
        $pdf->useTemplate($tpl, 1, 1, $size['width'], $size['height'], TRUE); 
        
        //Put the watermark 
        $xxx_final = ($size['width']-50); 
        $yyy_final = ($size['height']-290); 
        $pdf->Image($image, $xxx_final, $yyy_final, 0, 0, 'png');
    } 

    //output
    $pdf->Output('I');
} else { 
    die('Source PDF not found!'); 
}
?>