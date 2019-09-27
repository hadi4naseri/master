<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
$dt=jdate('Y/n/j-H:i:s');
$pics=explode(",",$_GET['pics']);
for($i=0;$i<count($pics);$i++)
{
$pinf=pathinfo($pics[$i]);
insert("img_gallery",array("picture"=>$pinf['filename'].".".$pinf['extension'],"path"=>$pics[$i],"date"=>$dt));
}
die("درج تصویر در گالری به درستی انجام شد.");
}
else
{
	die("خطای دسترسی");
} 
?>