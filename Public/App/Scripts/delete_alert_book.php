<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("book_id",$_GET['bid']);
  $sm->assign("adm_path",admin_path);
  $sm->assign("func_name","book_alert");
  $sm->display("delete_alert.tpl");
  }
else
{
	die("خطای دسترسی");
}
?>