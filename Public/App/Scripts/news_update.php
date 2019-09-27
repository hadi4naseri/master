<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $images=array();
  $res=array();
  listFolderFiles("admin/Files/",$res);
  $thumbs=array();
  for($i=0;$i<count($res);$i++)
  if(substr(strtolower($res[$i]),-3)=="jpg" || substr(strtolower($res[$i]),-3)=="png" || substr(strtolower($res[$i]),-3)=="gif" ||substr(strtolower($res[$i]),-4)=="jpeg")
  {
  
  $pinf=pathinfo($res[$i]);
    
    if(!file_exists(trim("admin/Files/thumbs/".trim($pinf['filename']).".".trim($pinf['extension']))))
    thumbnail($res[$i],100);
  if(strpos($pinf['dirname'],"thumbs")===false)
    array_push($images,array(str_replace("admin/","",$res[$i]),"Files/thumbs/".$pinf['filename'].".".$pinf['extension']));
    }
  
  
  $news=select("news","title,abstract,full_text,images","id=".$_GET['nid']);
  
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("news",$news);
  $temp_news_images="";
  if($news[0][3]!="") 
  {  
    $temp_news_images= explode(",",$news[0][3]);
    if (count($temp_news_images)>=0)
    for ($i=0;$i<count($temp_news_images);$i++)
       {
       $temp_pinf=pathinfo($temp_news_images[$i]);
       $temp_news_images[$i]= array(str_replace("admin/","",$temp_news_images[$i]),"Files/thumbs/".$temp_pinf['filename'].".".$temp_pinf['extension']);
       }   
  }
  $sm->assign("news_images",$temp_news_images);
  $sm->assign("image_files",$images);
  $sm->assign("adm_path",admin_path);
  $sm->assign("site_domain",siteDomain);
  $sm->assign("news_id",$_GET['nid']);
  $sm->display("edit_news.tpl");
  }
else
{
	access_denied();
} 
?>