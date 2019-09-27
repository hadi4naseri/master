<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $grp_id=select("users_groups","id","group_name like '%".$_GET['role']."%'");
  update("users",array("grp"=>$grp_id[0][0]),"id=".$_GET['pid']);
  die("1");
  }
else
{
	die("خطای دسترسی");
}
?>