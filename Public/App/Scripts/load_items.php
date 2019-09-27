<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $data=select("modules","mapped_table,field2display","name like '".$_GET['module_name']."'");
  $dt=select($data[0][0],"id,".$data[0][1]);
  $result="";
  for($i=0;$i<count($dt);$i++)
  $result.=$dt[$i][0]."**".strip_tags($dt[$i][1])."-/-";
  die($result);
}
else
{
	access_denied();
}
?>