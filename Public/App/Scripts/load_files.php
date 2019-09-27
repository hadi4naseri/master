<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $dt=select("file_access","group_id,group_offset","id=".$_GET['file_id']);
  $data=select("file_access","id,filename","group_offset = ".$dt[0][1]." and group_id = ".$dt[0][0]);
  $result="";
  for($i=0;$i<count($data);$i++)
  $result.=$data[$i][0]."**".$data[$i][1]."-/-";
  die($result);
}
else
{
	die("خطای دسترسی");
}
?>