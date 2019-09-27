<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $data=select("config","image_width,image_height");
  $images=array();
  $res=array();
  $img_size=array();
  $user_info=explode("/",translate_cookie($_COOKIE['current_user']));
		if ($user_info[3]==1)
		listFolderFiles("admin/Files/",$res);
		else
		listFolderFiles("admin/Files/Users/".$user_info[0],$res);

  for($i=0;$i<count($res);$i++)
  if(substr(strtolower($res[$i]),-3)=="jpg" ||substr(strtolower($res[$i]),-4)=="jpeg")
  {

  $pinf=pathinfo($res[$i]);

  if(!file_exists(trim("admin/Files/thumbs/".trim($pinf['filename']).".".trim($pinf['extension']))))
    thumbnail($res[$i],100);
  if(strpos($pinf['dirname'],"thumbs")===false){
          $img_size[$i] = getimagesize($res[$i]);
          array_push($images,array($res[$i],"Files/thumbs/".$pinf['filename'].".".$pinf['extension']));
  }

  }
  
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("adm_path",admin_path);
  $sm->assign("image_files",$images);
  $sm->assign("image_size",$img_size);
  $sm->assign("def_height",$data[0][1]);
  $sm->assign("def_width",$data[0][0]);
  $sm->assign("site_domain",siteDomain);
  $sm->assign("auth_name",$user_info[1]);
  $sm->assign("auth_id",$user_info[2]);
  $sm->assign("script_name",$_SERVER['PHP_SELF']);
  $sm->display("pics_crop.tpl");
  }
  else
{
	access_denied();
} 
?>