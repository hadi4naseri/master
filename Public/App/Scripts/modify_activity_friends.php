<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $status=select("friends","status","id=".$_GET['nid']);
  if($status[0][0]==0)
  {
     update("friends",array("status"=>1),"id=".$_GET['nid']);
     die("1");
  }
  else
  {
     update("friends",array("status"=>0),"id=".$_GET['nid']);
     die("0");
  }
}
else
{
	die("خطای دسترسی");
}  
?>