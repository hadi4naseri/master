<?php
  session_start();
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  $_sesssion['site_index']=$_GET['stid'];
  require_once("config.php");
  require_once("modules/jdate/jdf.php");
  
  $uname=select("users","username","id=".$_GET['uid']);
  
  if (isset($_SESSION[$uname[0][0]]))
  {
  delete("sessions"," handle like '%".$_COOKIE['current_user']."%'");
  
  unset($_SESSION[$uname[0][0]]);
  setcookie("current_user","",time()-3600,'/');	
  }
  session_write_close();
  $res=update("users",array("last_logout" => jdate('Y/n/j-H:i:s')),"id=".$_GET['uid']);
  header('location:'.siteDomain."/index.php?stid=".$_GET['stid']);
  exit;
?>