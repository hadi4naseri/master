<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $feed=select("feeds","name,address","id=".$_GET['fid']);

  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("feed",$feed);

  $sm->assign("adm_path",admin_path);
  $sm->assign("feed_id",$_GET['fid']);
  $sm->display("edit_feed.tpl");
  }
else
{
	access_denied();
} 
?>