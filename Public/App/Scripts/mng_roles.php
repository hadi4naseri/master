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
	  $access=select("file_access","id,filename,file_title,group_id,group_offset,group_title,group_logo,valid_groups","1=1 order by group_id");
	  $sm->assign("grps",$grps);
	  $sm->assign("files",$access);
	  $sm->assign("site_domain",siteDomain);
	  $sm->display("mng_roles.tpl");
  }
   else
	{
		access_denied();
	}
?>