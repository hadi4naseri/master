<?php
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  require_once("config.php");
  require_once("db/functions.php");
  if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
  {
	  update("config",array('maintain_mode'=>$_GET['mode'],'maintain_msg'=>$_GET['txt']));
	  die("اطلاعات به درستی به روز شد");  
	  }
    else
{
	die("خطای دسترسی");
}
?>