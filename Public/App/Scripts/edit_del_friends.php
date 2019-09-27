<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $all_news=select("friends","id,name,address,visited,status");

  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("all_friends",$all_news);
  $sm->assign("adm_path",admin_path);
  $sm->display("edit_del_friends.tpl");
  }
else
{
	access_denied();
} 
?>