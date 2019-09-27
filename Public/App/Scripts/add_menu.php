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
	  $grps=select("users_groups","id,group_name");
	  $mns=select("menu","id,content","parent=-1 or parent=0");
	  $mdls=select("modules","name,title","type=0");
	  $sm->assign("groups",$grps);
	  $sm->assign("menu",$mns);
	  $sm->assign("modules",$mdls);
	  $sm->display("add_menu.tpl");
  }
   else
	{
		access_denied();
	}
?>