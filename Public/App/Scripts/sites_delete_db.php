<?php
  session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
	$site_info=select("config","db_info","id=".$_GET['sid']);
	
	$temp_db=$_SESSION['db_name'];
	$temp_user=$_SESSION['db_username'];
	$temp_pass=$_SESSION['db_password'];
	
	
	$dbh = new PDO("mysql:host=".$_SESSION['db_host_name'], $_SESSION['db_main_user'], $_SESSION['db_main_password']);
	
	$extract=explode("/",$site_info[0][0]);
	
	$_SESSION['db_name']=$extract[0];
	$_SESSION['db_username']=$extract[1];
	$_SESSION['db_password']=strrev($extract[2]);
	
	$dbh->exec("DROP DATABASE ".$_SESSION['db_name'])  or die(print_r($dbh->errorInfo(), true));
	
	//$dbh->exec("DROP USER  '".$_SESSION['db_name'])."' @ '".$_SESSION['db_host_name']."'"  or die(print_r($dbh->errorInfo(), true));
	
	$prefix=substr(trim($_SESSION['db_name']),7,4);
	unlink("main/templates/index".$prefix.".tpl");
	
	$_SESSION['db_name']=$temp_db;
	$_SESSION['db_username']=$temp_user;
	$_SESSION['db_password']=$temp_pass;
	
	
	
	
  delete("config","id=".$_GET['sid']);
  die("زیر سایت مورد نظر با موفقیت حذف شد");
  }
  else
{
	die("خطای دسترسی");
} 
?>