<?php
  session_start();
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  require_once("db/functions.php");
  require_once("config.php");
  if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
  {
	  if ($_GET['fname']=="" || $_GET['flink']=="")
		die("نام سایت و یا آدرس آن نمیتواند خالی باشد");
	  else
	  {
		if (strpos($_GET['flink'],"http://")===FALSE && strpos($_GET['flink'],"https://")===FALSE && strpos($_GET['flink'],"ftp://")===FALSE)
		   $path="http://".$_GET['flink'];
		else
		  $path=$_GET['flink'];   
		// check
		
		if (@fopen($path,"r")!==false) 
		{   
		   insert("friends",array("name"=>$_GET['fname'],"address"=>$path,"visited"=>0));
		   die("درج با موفقیت انجام شد");
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