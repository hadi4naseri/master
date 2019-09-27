<?php

if (isset($_GET['action']) && !empty($_GET['action'])) {
    makeCaptcha();
}
function makeCaptcha()
{
    $im = @imagecreatetruecolor(70, 20);
    $text_color = imagecolorallocate($im, 255, 255, 255);

    while (true) {
        $n1 = rand(1, 9);
        $n2 = rand(1, 9);
        $n3 = rand(1, 9);
        $val = 0;
        $val = $n1;
        $str = $n1;
        switch ($n1) {
            case 1:
            case 2:
            case 3:
            case 4:
                $val += $n2;
                $str .= '+' . $n2;
                break;
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
                $val -= $n2;
                $str .= '-' . $n2;
                break;

        }
        switch ($n2) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
                $val += $n3;
                $str .= '+' . $n3;
                break;
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
                $val -= $n3;
                $str .= '-' . $n3;
                break;
        }
        if ($val > 0)
            break;
    }
    /* imageline($im, 1, 1, 70, 20, imagecolorallocate($im, 255, 255, 91));
    imageline($im, 70, 1, 1, 20, imagecolorallocate($im, 255, 255, 110));
    imageline($im, 1, rand(1, 20), 70, rand(1, 20), imagecolorallocate($im, 255, 255, 91)); */
   
    //imagestring($im, 4, 14, 2, $str, $text_color);
    $temp_path=getcwd();
	chdir(substr(dirname(__FILE__),0,strpos(dirname(__FILE__),"modules")-1));
	imagettftext($im, 18, rand(-10,10), 10, 20, $text_color, "main/templates/styles/fonts/B NAZANIN.ttf", $str);
	
	chdir("modules/captcha/");
	$fname = "pics/tc" . rand(1, 99999) . ".png";

	imagepng($im, $fname);
    imagedestroy($im);
    chdir($temp_path);
	$rnd = rand(10, 99);
    if (isset($_GET['action']) && !empty($_GET['action'])) {
        header('Content-disposition: attachment; filename=file.json');
		header('Content-type: application/json', true);
        echo json_encode(array("fileName" => $fname, "r" => ($val * $rnd) . $rnd));
    } else
        return array($fname, ($val * $rnd) . $rnd);
}