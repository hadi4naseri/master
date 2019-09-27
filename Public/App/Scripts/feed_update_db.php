<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
	if ($_GET['name']=="" || $_GET['link']=="")
		die("نام سایت و یا آدرس آن نمیتواند خالی باشد");
	  else
	  {
		if (strpos($_GET['link'],"http://")===FALSE && strpos($_GET['link'],"https://")===FALSE && strpos($_GET['link'],"ftp://")===FALSE)
		   $path="http://".$_GET['link'];
		else
		  $path=$_GET['link'];


		if (@fopen($path,"r")!==false)
		{
		   update("feeds",array("name"=>$_GET['name'],"address"=>$path),"id=".$_GET['fid']);
		   die("به روز رسانی اطلاعات  منبع خبری سایت با موفقیت انجام شد.");
		}
		else
		   die("دسترسی به آدرس داده شده امکان پذیر نمي باشد");
	  }
  }
else
{
	die("خطای دسترسی");
} 
?>