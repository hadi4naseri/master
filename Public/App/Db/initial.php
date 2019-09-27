<?php

$connection = new MongoClient();

//---for first use of connect--------
//---db name ansd user and pass of main database...
if ((!isset($_SESSION['db_name']) && !isset($_SESSION['db_username']) && !isset($_SESSION['db_password'])) || (trim($_SESSION['db_name'])=="" && trim($_SESSION['db_username'])=="" && trim($_SESSION['db_password'])==""))
{
$_SESSION['db_name']=$_SESSION['db_main_db'];
$_SESSION['db_username']=$_SESSION['db_main_user'];
$_SESSION['db_password']=$_SESSION['db_main_password'];
}
//-----------------------------------

	$site_ini=select("config","db_info","id=".$_SESSION['site_index']);
	if (count($site_ini)==0)
	{
		$_SESSION['db_name']=$_SESSION['db_main_db'];
		$_SESSION['db_username']=$_SESSION['db_main_user'];
		$_SESSION['db_password']=$_SESSION['db_main_password'];
		$site_ini=select("config","db_info","id=".$_SESSION['site_index']);
		if (count($site_ini)==0)
		{
			$site_ini=select("config","db_info","id=1");
			$_SESSION['site_index']=-1;
		}
	}
	$extract=explode("/",$site_ini[0][0]);
	
	$_SESSION['db_name']=$extract[0];
	$_SESSION['db_username']=$extract[1];
	$_SESSION['db_password']=strrev($extract[2]);
?>