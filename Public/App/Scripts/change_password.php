<?php
  session_start();
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  require_once("config.php");
  require_once("db/functions.php");
  if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
  {
	  $pwd=select("users","password","id=".$_POST['userid']);
	  if (md5(substr($_POST['salt'],0,4).$_POST['old_pass'].substr($_POST['salt'],4,4))==$pwd[0][0])
	  {
	  $new_pass=md5(substr($_POST['salt'],0,4).$_POST['new_pass'].substr($_POST['salt'],4,4));
	  update("users",array('password'=>$new_pass),"id=".$_POST['userid']);
	  die("اطلاعات به درستی به روز شد");  
	  }
	  else
	  {
	  die("-1"); 
	  }
  }
    else
{
	die("خطای دسترسی");
}
?>