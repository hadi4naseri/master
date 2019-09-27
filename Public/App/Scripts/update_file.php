<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  if ($_POST['mname']!="index")
  {
  update("modules",array("content"=>htmlspecialchars(addslashes(urldecode($_POST['cont']))))," name like '".trim($_POST['mname'])."'");
  die("1");
  }
  else
  {
  $tpl=select("config","template_name","id=".$_SESSION['site_index']);
  file_put_contents("main/templates/".$tpl[0][0],urldecode($_POST['cont']));
  die("1");
  }
  
}  
else
{
	access_denied();
}
?>