<?php

trait form_operations
{
	public static function getFields($frm_handle)
	{
		$tempPath=getcwd();

		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		include_once $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
				
		chdir($tempPath);
		$ini=json_decode($tenant_ini,true)[0];
		
		
		$raw_data=json_decode(select($tenant,"forms",array(),array("handle"=>$frm_handle)),true)[0];
		
		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="onGetFields")
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
		
		return $raw_data["data"]["fields"];
	
	}
	public static function validate_form($frm_fields)
	{
		$tempPath=getcwd();

		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		include_once $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
				
		chdir($tempPath);
		$ini=json_decode($tenant_ini,true)[0];
		
		
		$raw_data=json_decode(select($tenant,"forms",array(),array("handle"=>$frm_handle)),true)[0];
		
		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="onGetFields")
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
		
		die(print_r($raw_data["data"]["fields"]));
				
		//Do actions in show details event....
		for($j=0;$j<count($details["actions"]);$j++)
		{
			if ($details["actions"][$j]["type"].$details["actions"][$j]["action"]=="onDetails")
			{
				//print("on_details");
				//require_once();
				//execute
			}	
		}
		for($i=0;$i<count($details["schema"]);$i++)
			if($details["schema"][$i]["default"]==1) break;
		$sm=renderPage($tenant,$ini,$details["schema"][$i]["name"],array("data"=>$details));
						
			
			chdir($tempPath);
	
	}
}
?>