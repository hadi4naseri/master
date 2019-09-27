<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $data=select("config","site_width,site_layout,columns_width");
  $blks=select("blocks","id,title,type,colmn,vposition,active");
  $pgs=select("pages","id,title,active");
  
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("adm_path",admin_path);
  $sm->assign("data",$data);
  $sm->assign("blocks",$blks);
  $sm->assign("pages",$pgs);
  $sm->assign("cols_width",explode(",",$data[0][2]));
  
  $sm->display("block_settings.tpl");
}
else
{
	access_denied();
}
?>