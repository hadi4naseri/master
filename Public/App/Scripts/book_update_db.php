<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
update("book_briefcase",array("name"=>$_POST['title'],"description"=>urldecode($_POST['desc']),"books"=>$_POST['books']),"id=".$_POST['bid']);
die("کتاب / مقاله با موفقیت ويرایش شد...تا چند لحظه دیگر اين صفحه بسته خواهد شد...");
}
  else
{
	die("خطای دسترسی");
}
?>