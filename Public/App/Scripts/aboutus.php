<?php
  session_start();
  $temp_path=getcwd();
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  require_once("db/functions.php");
  require_once("config.php");
  if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
  {
	  $images=array();
	  $res=array();
	  
	  $user_info=explode("/",translate_cookie($_COOKIE['current_user']));
		if ($user_info[3]==1)
		listFolderFiles("admin/Files/",$res);
		else
		listFolderFiles("admin/Files/Users/".$user_info[0],$res);
	  
	  $thumbs=array();
	  for($i=0;$i<count($res);$i++)
	  if(substr(strtolower($res[$i]),-3)=="jpg" || substr(strtolower($res[$i]),-3)=="png" || substr(strtolower($res[$i]),-3)=="gif" ||substr(strtolower($res[$i]),-4)=="jpeg")
	  {
	  
	  $pinf=pathinfo($res[$i]);
		
		if(!file_exists(trim("admin/Files/thumbs/".trim($pinf['filename']).".".trim($pinf['extension']))))
		thumbnail($res[$i],100);
	  if(strpos($pinf['dirname'],"thumbs")===false)
		array_push($images,array($res[$i],"Files/thumbs/".$pinf['filename'].".".$pinf['extension']));
		}
	  
	  
	  $about=select("config","short_desc,description,site_images");
	  
	  chdir($temp_path);
	  require_once("functions.php");
	  $sm=create_admin_smarty_obj();
	  $sm->assign("about",$about);
	  $temp_about_images="";
	  if($about[0][2]!="") 
	  {  
		$temp_about_images= explode(",",$about[0][2]);
		if (count($temp_about_images)>=0)
		for ($i=0;$i<count($temp_about_images);$i++)
		   {
		   $temp_pinf=pathinfo($temp_about_images[$i]);
		   $temp_about_images[$i]= array($temp_about_images[$i],"Files/thumbs/".$temp_pinf['filename'].".".$temp_pinf['extension']);
		   }   
	  }
	  $sm->assign("about_images",$temp_about_images);
	  $sm->assign("image_files",$images);
	  $sm->assign("adm_path",admin_path);
	  $sm->assign("site_domain",siteDomain);
	  $sm->assign("auth_name",$user_info[1]);
      $sm->assign("auth_id",$user_info[2]);
	  $sm->assign("script_name",$_SERVER['PHP_SELF']);
	  $sm->display("aboutus.tpl");
	}
	else
	{
		access_denied();
	}