<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $comments=select("comments","id,mail,message,reg_date","category='contact_admin'");

  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("comments",$comments);
  $sm->assign("adm_path",admin_path);
  $sm->display("mng_admin_msg.tpl");
  }
else
{
	access_denied();
} 
?>