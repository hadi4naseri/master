<?php
  session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  delete("users","id=".$_GET['pid']);
  die("کاربر مورد نظر با موفقیت حذف شد");
  }
else
{
	access_denied();
} 
?>