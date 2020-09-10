<?php

if($_GET["tenant"]&&$_GET["Sid"])
	panelT::logout($_GET["tenant"],$_GET["Sid"]);

trait panelT
{
	public static function logout($tenant,$sessionId)

	{
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		require $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		chdir($tempPath);
		callEvent($tenant,"logout");	
		
		//$findHandle=select($tenant,"news",array(),array("handle"=>$handle));
		
		delete($tenant,"sessions",array("id"=>strrev(substr($sessionId,0,strlen($sessionId)-10))));
		unset($_COOKIE['userTocken']); 
		setcookie('userTocken', null, -1, '/'); 
		header('Location: '.tenantDomain."Tenants/".$tenant);
	}
}
?>