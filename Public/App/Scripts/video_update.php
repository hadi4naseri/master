<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $videos=array();
  $videos_name=array();
  $res=array();
  listFolderFiles("admin/Files/Videos/",$res);
  $thumbs=array();
  for($i=0;$i<count($res);$i++)
  if(substr(strtolower($res[$i]),-3)=="mp4" || substr(strtolower($res[$i]),-3)=="flv")
  {
		array_push($videos,$res[$i]);		
		$pth=pathinfo($res[$i]);
		array_push($videos_name,$pth['filename']);	
  }
  
  
  $video=select("video_briefcase","name,description,videos","id=".$_GET['vid']);
  
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $temp_videos="";
  $temp_videos_name=array();
  if($video[0][2]!="") 
  {  
    $temp_videos= explode(",",$video[0][2]);
	for($i=0;$i<count($temp_videos);$i++)
	{
		$pth=pathinfo($temp_videos[$i]);
		array_push($temp_videos_name,$pth['filename']);
	}
  }
  $sm->assign("curr_videos",$temp_videos);
  $sm->assign("curr_videos_name",$temp_videos_name);
  $sm->assign("video_info",$video);
  $sm->assign("videos",$videos);
  $sm->assign("videos_name",$videos_name);
  $sm->assign("adm_path",admin_path);
  $sm->assign("video_id",$_GET['vid']);
  $sm->assign("site_domain",siteDomain);
  $sm->display("edit_video.tpl");
  }
  else
{
	access_denied();
} 
?>