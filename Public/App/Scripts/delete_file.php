<?php
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{

$res=unlink($_GET['path']);

$pinf=pathinfo($_GET['path']);

if (file_exists("admin/Files/thumbs/".$pinf['filename'].".".$pinf['extension'])==true)
unlink("admin/Files/thumbs/".$pinf['filename'].".".$pinf['extension']);

chdir($temp_path);
if($res==TRUE)
die("1");
else
die("0");
}
else
die("خطای دسترسی");
?>