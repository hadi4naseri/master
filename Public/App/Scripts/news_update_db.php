<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
	if($_POST['title']=="")
	  die("عنوان خبر وارد نشده است.مجدداً تلاش نمائید");
	else if ($_POST['full']=="")
	die("متن کامل خبر وارد نشده است.مجدداً تلاش نمائید");
	else  
	{

	update("news",array("title"=>$_POST['title'],"abstract"=>urldecode($_POST['abst']),"full_text"=>urldecode($_POST['full']),"images"=>$_POST['image_pics']),"id=".$_POST['nid']);
	die("خبر با موفقیت ويرایش شد...تا چند لحظه دیگر اين صفحه بسته خواهد شد...");
	}
}
else
{
	die("خطای دسترسی");
} 
?>