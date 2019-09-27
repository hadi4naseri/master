<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $status=select("video_briefcase","active","id=".$_GET['vid']);
  if($status[0][0]==0)
  {
     update("video_briefcase",array("active"=>1),"id=".$_GET['vid']);
     die("1");
  }
  else
  {
     update("video_briefcase",array("active"=>0),"id=".$_GET['vid']);
     die("0");
  }
}
else
{
	die("خطای دسترسی");
}  
?>