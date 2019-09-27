<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
update("faq",array("question"=>urldecode($_POST['question']),"answer"=>urldecode($_POST['answer']),"images"=>$_POST['image_pics']),"id=".$_POST['fid']);
die("سوال با موفقیت ويرایش شد...تا چند لحظه دیگر اين صفحه بسته خواهد شد...");
}
else
{
	die("خطای دسترسی");
} 
?>