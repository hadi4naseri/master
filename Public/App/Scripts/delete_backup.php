<?php
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
unlink("admin/".$_GET['nme']);
print("1");
chdir($temp_path);
}
else
die("خطای دسترسی");
?>