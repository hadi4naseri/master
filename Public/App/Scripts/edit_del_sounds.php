<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $all_sounds=select("sound_briefcase","id,name,description,visit,sounds,active,acpd,author");

  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("all_sounds",$all_sounds);
  $sm->assign("adm_path",admin_path);
  $sm->assign("site_domain",siteDomain);
  $sm->display("edit_del_sounds.tpl");
  }
else
{
	access_denied();
} 
?>