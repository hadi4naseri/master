<?php

trait panel_functions
{
	public static function prepare()

	{
		$tempPath=getcwd();

		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		require $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		$ini=json_decode($tenant_ini,true)[0];
		
		$raw_data=json_decode(select($tenant,"modules",array(),array("name"=>"admin")),true)[0];
				
		
		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="onAdministration")
				{
					
					chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new/Tenants/".$tenant."/");
					$conditions=$raw_data["actions"][$i]["conditions"];
					$patterns=$raw_data["actions"][$i]["patterns"];
					$actions_success=$raw_data["actions"][$i]["actions_success"];
					$actions_failure=$raw_data["actions"][$i]["actions_failure"];
					include "Actions/_".$raw_data["actions"][$i]["fileName"]."_".$tenant.".php";
					//execute process...
				}
			}
		}
		
		exit();			
	}
}
?>