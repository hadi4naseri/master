
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
	  $mdls=select("modules","name,title","type=0 || type=2");
	  $sm->assign("modules",$mdls);
	  $sm->assign("site_domain",siteDomain);
	  $sm->display("edit_templates.tpl");
  }
   else
	{
		access_denied();
	}
?>