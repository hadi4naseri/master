<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $status=select("blocks","active","id=".$_GET['bid']);
  if($status[0][0]==0)
  {
     update("blocks",array("active"=>1),"id=".$_GET['bid']);
     die("1");
  }
  else
  {
     update("blocks",array("active"=>0),"id=".$_GET['bid']);
     die("0");
  }
  }
else
{
	die("خطای دسترسی");
}  
?>