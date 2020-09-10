<?php

trait addNewsT
{
	public static function addNews($tenant,$handle,$title,$shortDesc,$Description)

	{
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		require $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		chdir($tempPath);
		
		//$findHandle=select($tenant,"news",array(),array("handle"=>$handle));
		/*
		$ins=insert($tenant,"news",array("id"=>strrev($randomString),"registerDate"=>time(),"expireDate"=>time()+(60*$sessionTime),"username"=>$uname,"name"=>$name,"userId"=>$id));
		setcookie("userToken",$randomString.$tail,(time()+(60*$sessionTime)),'/');
		*/
		callEvent($tenant,"insertNews","",array($tenant,$uname));	
	}
}
?>