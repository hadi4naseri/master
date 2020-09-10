<?php
chdir(substr(dirname(__FILE__),0,strpos(dirname(__FILE__),"modules")-1));
require_once("config.php");
require_once("db/functions.php");

if(strlen($_GET['uname'])<4)
die("2");
else if (preg_match('/[^A-Za-z]+/', $_GET['uname'])&& !ctype_alpha($_GET['uname'][0]))
die("3");
else
{
$dt=select("users","username","username='".$_GET['uname']."'");
if(count($dt)==0)	
	die("1");
else
	die("0");
	}
?>