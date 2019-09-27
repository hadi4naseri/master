<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
  {
	if($_POST['full_desc']=="")
	  die("شرح کامل فعالیت ها وارد نشده است.مجدداً تلاش نمائید");
	  else{

	update("config",array("short_desc"=>urldecode($_POST['short_desc']),"description"=>urldecode($_POST['full_desc']),"site_images"=>$_POST['image_pics']));
	die("متن درباره ی ما با موفقیت ويرایش شد...تا چند لحظه دیگر اين صفحه بسته خواهد شد...");
	}
  }
  else
  {
	die("خطای دسترسی");
  }

?>