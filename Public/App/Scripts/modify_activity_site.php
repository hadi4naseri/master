<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $status=select("config","active","id=".$_GET['sid']);
  if($status[0][0]==0 )
  {
     update("config",array("active"=>1),"id=".$_GET['sid']);
     die("1");
  }
  else
  {
     update("config",array("active"=>0),"id=".$_GET['sid']);
     die("0");
  }
}
else
{
	die("خطای دسترسی");
} 
?>