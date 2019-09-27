<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $data=select("config","site_color,box_color,site_bg_pic");

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


  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("adm_path",admin_path);
  $sm->assign("data",$data);
  $sm->assign("image_files",$images);
  
  $pinf=pathinfo($data[0][2]);
  $sm->assign("image_thumb","Files/thumbs/".$pinf['filename'].".".$pinf['extension']);
  $sm->display("visual_settings.tpl");
  }
  else
{
	access_denied();
}
?>