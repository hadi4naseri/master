<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $res=array();
  $sounds=array();
  $user_info=explode("/",translate_cookie($_COOKIE['current_user']));
  
  if ($user_info[3]==1)
  listFolderFiles("admin/Files/",$res);
  else
  listFolderFiles("admin/Files/Users/".$user_info[0],$res);
  
  for($i=0;$i<count($res);$i++)
  if(substr(strtolower($res[$i]),-3)=="mp3" || substr(strtolower($res[$i]),-3)=="aac")
  {
		array_push($sounds,$res[$i]);		
		$pth=pathinfo($res[$i]);		
  }
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();

  $sm->assign("sounds",$sounds);
  $sm->assign("adm_path",admin_path);
  $sm->assign("site_domain",siteDomain);
  $sm->assign("script_name",$_SERVER['PHP_SELF']);
  $sm->assign("auth_name",$user_info[1]);
  $sm->assign("auth_id",$user_info[2]);
  
  $sm->display("new_sound.tpl");
  }
else
{
	access_denied();
} 
?>