<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{

	if (preg_match('/[^A-Za-z]+/', $_GET['grp_name'])&& !ctype_alpha($_GET['grp_name'][0]))
	{
		die("-1");
	}

$grp_names=select("users_groups","group_name","group_name like '%".$_GET['grp_name']."%'");

if (count($grp_names)>0)
die("0");
else
{
insert("users_groups",array("group_name"=>$_GET['grp_name']));
die("1");
}
}
else
{
	die("خطای دسترسی");
} 
?>