<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
if (isset($_SESSION['adm_cer']) && $_SESSION['adm_cer']==true)
insert("video_briefcase",array("name"=>($_POST['title']),"description"=>urldecode($_POST['desc']),"videos"=>$_POST['videos'],"author"=>$_POST['uname'],"author_id"=>$_POST['userid'],"acpd"=>"1"));
else
insert("video_briefcase",array("name"=>($_POST['title']),"description"=>urldecode($_POST['desc']),"videos"=>$_POST['videos'],"author"=>$_POST['uname'],"author_id"=>$_POST['userid'],"acpd"=>"0"));
die("درج کلیپ تصویری با موفقیت انجام شد.");
}
else
{
	die("خطای دسترسی");
} 
?>