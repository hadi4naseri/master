<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (isset($_SESSION['adm_cer']) && $_SESSION['adm_cer']==true || isset($_SESSION['sec_cer']) && $_SESSION['sec_cer']==true || isset($_SESSION['usr_cer']) && $_SESSION['usr_cer']==true )
{
if (isset($_SESSION['adm_cer']) && $_SESSION['adm_cer']==true)
insert("sound_briefcase",array("name"=>($_POST['title']),"description"=>urldecode($_POST['desc']),"sounds"=>$_POST['sounds'],"author"=>$_POST['uname'],"author_id"=>$_POST['userid'],"acpd"=>"1"));
else
insert("sound_briefcase",array("name"=>($_POST['title']),"description"=>urldecode($_POST['desc']),"sounds"=>$_POST['sounds'],"author"=>$_POST['uname'],"author_id"=>$_POST['userid'],"acpd"=>"0"));
die("درج کلیپ صوتی با موفقیت انجام شد.");
}
else
{
	die("خطای دسترسی");
} 
?>