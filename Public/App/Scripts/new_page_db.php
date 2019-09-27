<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
insert("pages",array("title"=>$_POST['title'],"content"=>urldecode($_POST['content'])));
die("درج صفحه با موفقیت انجام شد.");
}
else
{
	die("خطای دسترسی");
}
?>