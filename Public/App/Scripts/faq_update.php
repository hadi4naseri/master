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
  
  
  $faq=select("faq","question,answer,images","id=".$_GET['fid']);
  
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("faq",$faq);
  $temp_faq_images="";
  if($faq[0][2]!="") 
  {  
    $temp_faq_images= explode(",",$faq[0][2]);
    if (count($temp_faq_images)>=0)
    for ($i=0;$i<count($temp_faq_images);$i++)
       {
       $temp_pinf=pathinfo($temp_faq_images[$i]);
       $temp_faq_images[$i]= array(str_replace("admin/","",$temp_faq_images[$i]),"Files/thumbs/".$temp_pinf['filename'].".".$temp_pinf['extension']);
       }   
  }
  $sm->assign("faq_images",$temp_faq_images);
  $sm->assign("image_files",$images);
  $sm->assign("adm_path",admin_path);
  $sm->assign("faq_id",$_GET['fid']);
  $sm->display("edit_faq.tpl");
  }
else
{
	access_denied();
}  
?>