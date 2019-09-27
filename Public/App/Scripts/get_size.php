<?php
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
$url=$_GET['url'];
$info=getimagesize($url);
chdir($temp_path);
die($info[0].','.$info[1]);
}
else
{
die("خطای دسترسی");
}
?>