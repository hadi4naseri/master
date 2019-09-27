<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $res=array();
  $books=array();
  $books_name=array();
  
  $user_info=explode("/",translate_cookie($_COOKIE['current_user']));
  listFolderFiles("admin/Files/Users/".$user_info[0],$res);
  
  for($i=0;$i<count($res);$i++)
  if(substr(strtolower($res[$i]),-3)=="pdf" || substr(strtolower($res[$i]),-3)=="doc" || substr(strtolower($res[$i]),-4)=="docx")
  {
		array_push($books,$res[$i]);		
		$pth=pathinfo($res[$i]);
		array_push($books_name,$pth['filename']);		
  }
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();

  $sm->assign("books",$books);
  $sm->assign("books_name",$books_name);
  $sm->assign("adm_path",admin_path);
  $sm->assign("site_domain",siteDomain);
  $sm->assign("script_name",$_SERVER['PHP_SELF']);
   $sm->assign("auth_name",$user_info[1]);
  $sm->assign("auth_id",$user_info[2]);
  
  $sm->display("new_book.tpl");
  }
  else
{
	access_denied();
} 
?>