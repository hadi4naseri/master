<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $res=array();
  $files=array();

  $files_name=array();
  $user_info=explode("/",translate_cookie($_COOKIE['current_user']));
  listFolderFiles("admin/Files/Users/".$user_info[0],$res);
  
  for($i=0;$i<count($res);$i++)
  {	
	array_push($files,$res[$i]);		
	$pth=pathinfo($res[$i]);
	array_push($files_name,$pth['filename']);	
	
  }
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();

  $sm->assign("files",$files);
  $sm->assign("files_name",$files_name);
  $sm->assign("adm_path",admin_path);
  $sm->assign("site_domain",siteDomain);

  $sm->assign("sender_uname",$user_info[1]);
  $sm->assign("auth_id",$user_info[2]);
  
  //$sm->assign("auth_name",$user_info[1]);
  $sm->assign("script_name",$_SERVER['PHP_SELF']);
  
  if($user_info[3]==1)
  $friends=select("users","id,username,name","id <> ".$user_info[2]);
  else
  $friends=select("users","id,username,name","grp=".$user_info[3]." and id <> ".$user_info[2]);
  
  $sm->assign("friends",$friends);
  $sm->display("new_message.tpl");
  }
else
{
	access_denied();
} 
?>