<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");

if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $all_users=select("users","id,username,name,email,phone,isActive,grp,last_login");
  $all_grps=select("users_groups","id,group_name");
  $fsize=array();
  for($i=0;$i<count($all_users);$i++)
  {
	if($all_users[$i][6]==1)
	{
		$x=0;
		$res=array();
		listFolderFiles('admin/Files/',$res);	

		for ($z=0;$z<count($res);$z++)
		   $x+=@filesize($res[$z]);
		array_push($fsize,array("cnt"=>count($res),"size"=>round($x/1024/1024,2)));
	}
	else if($all_users[$i][6]!=1 && $all_users[$i][5]==1)
	{
		$x=0;
		$res=array();
		listFolderFiles('admin/Files/Users/'.$all_users[$i][1]."/",$res);	

		for ($z=0;$z<count($res);$z++)
		   $x+=filesize($res[$z]);
		array_push($fsize,array("cnt"=>count($res),"size"=>round($x/1024/1024,2)));
	}
	else if($all_users[$i][6]!=1 && $all_users[$i][5]==0)
		array_push($fsize,array("cnt"=>"پوشه ایجاد نشده","size"=>"پوشه ایجاد نشده"));
}
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("user_info",explode("/",translate_cookie($_COOKIE['current_user'])));
  $sm->assign("all_users",$all_users);
  $sm->assign("all_groups",$all_grps);
  $sm->assign("adm_path",admin_path);
  $sm->assign("files_info",$fsize);
  $sm->assign("site_domain",siteDomain);
  $sm->display("show_all_users.tpl");
  }
else
{
	access_denied();
}
?>