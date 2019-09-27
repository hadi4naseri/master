<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $status=select("book_briefcase","acpd","id=".$_GET['bid']);
  if($status[0][0]==0)
  {   
     update("book_briefcase",array("acpd"=>1),"id=".$_GET['bid']);
     die("1");
  }
  else
  {
     update("book_briefcase",array("acpd"=>0),"id=".$_GET['bid']);
     die("0");
  }
}
else
{
	die("خطای دسترسی");
}   
?>