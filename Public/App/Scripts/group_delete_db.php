<?php
  session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  if($_GET['gid']==1 || $_GET['gid']==2)
  {
	die("-2");
  }
  else
  {
  $users=select("users","id,grp");
  for ($i=0;$i<count($users);$i++)
  if ($users[$i][1]==$_GET['gid'])
	update("users",array("grp"=>"2"),"id=".$users[$i][0]);
  delete("users_groups","id=".$_GET['gid']);
  die("1");
  }
  }
  else
{
	die("خطای دسترسی");
} 
?>