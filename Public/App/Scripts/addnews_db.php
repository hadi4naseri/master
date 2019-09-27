<?php
session_start();
$temp_path=getcwd();
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
	if (isset($_SESSION['adm_cer']) && $_SESSION['adm_cer']==true)
		insert("news",array("title"=>$_POST['title'],"abstract"=>urldecode($_POST['abst']),"full_text"=>urldecode($_POST['full']),"date_registered"=>jdate('Y/n/j-H:i:s'),"images"=>$_POST['image_pics'],"author"=>$_POST['uname'],"author_id"=>$_POST['userid'],"acpd"=>"1"));
	else
		insert("news",array("title"=>$_POST['title'],"abstract"=>urldecode($_POST['abst']),"full_text"=>urldecode($_POST['full']),"date_registered"=>jdate('Y/n/j-H:i:s'),"images"=>$_POST['image_pics'],"author"=>$_POST['uname'],"author_id"=>$_POST['userid'],"acpd"=>"0"));
	die("خبر با موفقیت درج شد...تا چند لحظه دیگر اين صفحه بسته خواهد شد...");
	}
}
else
{
	die("خطای دسترسی");
}
?>