<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{  
  delete("blocks","id=".$_GET['bid']);
  die("بلاک مورد نظر با موفقیت حذف شد");
}
else
{
	die("خطای دسترسی");
}
  ?>