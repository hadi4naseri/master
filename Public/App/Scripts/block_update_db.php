<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{ 
update("blocks",array("title"=>$_POST['title'],"content"=>urldecode($_POST['content']),"colmn"=>$_POST['col'],"vposition"=>$_POST['vpos']),"id=".$_POST['bid']);
die("اطلاعات بلاک مورد نظر با موفقیت ويرایش شد...تا چند لحظه دیگر اين صفحه بسته خواهد شد...");
}
else
{
	die("خطای دسترسی");
}
?>