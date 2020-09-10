<?php

$tempPath=getcwd();
chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

require_once("config.php");
require $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";


if(validateToken($_GET["tenant"],$_GET["Sid"]))
{
	$ini=json_decode($tenant_ini,true)[0];
	
	require_once("Modules/admin/initial.php");
	$admin_ini_data = admin_initial($_GET["tenant"]);
	callEvent($tenant,"adminPanelLoad");	
	
	$sm=create_smarty_object($_GET["tenant"]);
	
	
	if ($admin_ini_data["template"]["isLocal"])
		$sm->display($admin_ini_data["moduleName"]."/templates/".$admin_ini_data["template"]["fileName"]);
	else
		$sm->display ($admin_ini_data["moduleName"]."/templates/".$admin_ini_data["template"]["fileName"]);	
}
