<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $comments=select("comments","id,mail,message,reg_date,status,category","category<>'contact_admin'");
  
  for($i=0;$i<count($comments);$i++)
  {
	$x=select("modules_relation","module_name,mapped_table,row_index","module_name2 like 'comments' and reference = ".$comments[$i][5]);
	$mdl_info=select("modules","title,field2display","name like '".$x[0][0]."'");
	$comments[$i][5]=$mdl_info[0][0];
	$item=select($x[0][1],$mdl_info[0][1],"id=".$x[0][2]);
	array_push($comments[$i],$item[0][0]);
  }
  
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("comments",$comments);
  $sm->assign("adm_path",admin_path);
  $sm->display("mng_messages.tpl");
  }
else
{
	access_denied();
} 
?>