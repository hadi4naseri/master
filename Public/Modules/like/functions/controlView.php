<?php

trait controlViewT
{
	public static function enableView($data)

	{
		
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		require $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		chdir($tempPath);
		
		update($tenant,$data["parentModule"],array("data.visible"=>true),array("handle"=>$data["parentHandle"]));
		
		callEvent($tenant,"likeEnabled","",array());	
		callEvent($tenant,"likeEnabled",$data["parentHandle"],array());	
	}
	
	public static function disableView($data)

	{
		
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		require $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		chdir($tempPath);
		
		update($tenant,$data["parentModule"],array("data.visible"=>false),array("handle"=>$data["parentHandle"]));
		
		callEvent($tenant,"likeDisabled","",array());	
		callEvent($tenant,"likeDisabled",$data["parentHandle"],array());	
	}
}
?>