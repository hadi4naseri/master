<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $status=select("feeds","status","id=".$_GET['fid']);
  if($status[0][0]==0)
  {
     update("feeds",array("status"=>1),"id=".$_GET['fid']);
     die("1");
  }
  else
  {
     update("feeds",array("status"=>0),"id=".$_GET['fid']);
     die("0");
  }
}
else
{
	die("خطای دسترسی");
} 
?>