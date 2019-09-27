<?php

trait notifications
{
	//return error object and stop after show error
	public static function error($msg)
	{
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");
		require_once "config.php";
		include $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		$raw_data=json_decode(select($tenant,"modules",array(),array("name"=>"message")),10)[0];
		//doing action before submit on form modules

		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="beforeFetchError")
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
		
		$raw_data2=json_decode(select($tenant,"messages",array(),array('Message'=>$msg),0),true);
		
		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="afterFetchError")
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
		//اگر دستور آخر برداشته شود نتیجه جالبی رخ میدهد
		chdir($tempPath);
		header('Content-Type:application/json');
		echo(json_encode($raw_data2));
		die();

	}
	
	//show error and continue to execution
	public static function notify($msg)
	{
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");
		require_once "config.php";
		include $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		$raw_data=json_decode(select($tenant,"modules",array(),array("name"=>"message")),10)[0];
		//doing action before submit on form modules

		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="beforeFetchError")
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
		
		$raw_data2=json_decode(select($tenant,"messages",array(),array('Message'=>$msg),0),true);
		
		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="afterFetchError")
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

		chdir($tempPath);
		header('Content-Type:application/json');
		echo(json_encode($raw_data2));
		return false;
	}
	
}
?>