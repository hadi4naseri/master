<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("adm_path",admin_path);
  $dt=select("users","username,name,email,phone","id=".$_GET['uid']);
  $sm->assign("info",$dt[0]);
  $sm->assign("uid",$_GET['uid']);
  $sm->display("pdata.tpl");
  }
else
{
	access_denied();
} 
?>