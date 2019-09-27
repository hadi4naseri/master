<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $all_videos=select("video_briefcase","id,name,description,visit,videos,active,acpd,author");

  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("all_videos",$all_videos);
  $sm->assign("adm_path",admin_path);
  $sm->display("edit_del_videos.tpl");
  }
else
{
	access_denied();
} 
?>