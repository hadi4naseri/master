<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  if ($_GET['mname']!="index")
  {
  $cont=select("modules","content","name like '".$_GET['mname']."'");
  die(htmlspecialchars_decode(stripslashes($cont[0][0])));
  }
  else
  {
	$cont=select("config","template_name","id=".$_SESSION['site_index']);
	die(file_get_contents(siteDomain."/main/templates/".$cont[0][0]));
  }
}
else
{
	access_denied();
}
?>