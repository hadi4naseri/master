<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $sounds=array();
  $sounds_name=array();
  $res=array();
  listFolderFiles("admin/Files/Sounds/",$res);
  $thumbs=array();
  for($i=0;$i<count($res);$i++)
  if(substr(strtolower($res[$i]),-3)=="mp3" || substr(strtolower($res[$i]),-3)=="aac")
  {
		array_push($sounds,$res[$i]);		
		$pth=pathinfo($res[$i]);
		array_push($sounds_name,$pth['filename']);	
  }
  
  
  $sound=select("sound_briefcase","name,description,sounds","id=".$_GET['sid']);
  
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $temp_sounds="";
  $temp_sounds_name=array();
  if($sound[0][2]!="") 
  {  
    $temp_sounds= explode(",",$sound[0][2]);
	for($i=0;$i<count($temp_sounds);$i++)
	{
		$pth=pathinfo($temp_sounds[$i]);
		array_push($temp_sounds_name,$pth['filename']);
	}
  }
  $sm->assign("curr_sounds",$temp_sounds);
  $sm->assign("curr_sounds_name",$temp_sounds_name);
  $sm->assign("sound_info",$sound);
  $sm->assign("sounds",$sounds);
  $sm->assign("sounds_name",$sounds_name);
  $sm->assign("adm_path",admin_path);
  $sm->assign("sound_id",$_GET['sid']);
  $sm->assign("site_domain",siteDomain);
  $sm->display("edit_sound.tpl");
  }
else
{
	access_denied();
} 
?>