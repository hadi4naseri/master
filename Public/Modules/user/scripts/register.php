<?php
chdir(substr(dirname(__FILE__),0,strpos(dirname(__FILE__),"modules")-1));
require_once("config.php");
require_once("db/functions.php");

$cap=substr($_POST['val'],0,strlen($_POST['val'])-2);
$slt=substr($_POST['val'],strlen($_POST['val'])-2);

if ($_POST['user_val']*$slt==$cap)
{

	$salt="";
	for($i=1;$i<=8;$i++)
	  $salt.=rand(0,9);
	$pass=md5(substr($salt,0,4).$_POST['pass'].substr($salt,4,4));
	insert("users",array("username"=>$_POST['uname'],"password"=>$pass,"slt"=>$salt,"name"=>$_POST['name'],"email"=>$_POST['email'],"phone"=>$_POST['tel'],"isActive"=>"0"));
	die('اطلاعات شما با موفقیت در سیستم درج شد و پس از تائید مدیر میتوانید وارد سیستم شوید.');
	}
	else
	{
		print(-2);
	}
?>