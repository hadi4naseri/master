<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $friend=select("friends","name,address","id=".$_GET['nid']);

  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("friend",$friend);

  $sm->assign("adm_path",admin_path);
  $sm->assign("friend_id",$_GET['nid']);
  $sm->display("edit_friend.tpl");
  }
else
{
	access_denied();
} 
?>