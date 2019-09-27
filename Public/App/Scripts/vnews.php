<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
	$filename='admin/'.$_GET['url'];
	$filename = str_replace("//","/",$filename);
	$pinf=pathinfo($filename);
	// Resample
	$image_p = imagecreatetruecolor($_GET['width'],$_GET['height']);
	$image = imagecreatefromjpeg($filename);
	imagecopyresampled($image_p, $image, 0, 0, $_GET['x1_r'], $_GET['y1_r'], $_GET['width'],$_GET['height'],$_GET['width'],$_GET['height']);

	// Output
	$path_name="Files/vnews/".$pinf['filename'].rand(1,1000).'.jpg';
	imagejpeg($image_p,'admin/'.$path_name ,100);

	insert("vnews",array("path"=>$path_name,"active"=>"1"));
}
else
{
	access_denied();
}
?>