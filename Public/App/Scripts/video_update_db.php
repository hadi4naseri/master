<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
update("video_briefcase",array("name"=>$_POST['title'],"description"=>urldecode($_POST['desc']),"videos"=>$_POST['videos']),"id=".$_POST['vid']);
die("کلیپ تصویری مورد نظر  با موفقیت ويرایش شد...تا چند لحظه دیگر اين صفحه بسته خواهد شد...");
}
else
{
	die("خطای دسترسی");
}
?>