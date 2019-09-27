<?php

trait register
{
	public static function register_session($uname,$name,$id)

	{
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		require $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
				
		chdir($tempPath);
		
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$tail='';
		$randomString = '';
		for ($i = 0; $i < 59; $i++) {
			if($i%6==0)
				$tail.=$characters[rand(0, strlen($characters) - 1)];
			$randomString .= $characters[rand(0, strlen($characters) - 1)];
		}
		
		
		
		$ini=json_decode($tenant_ini,true)[0];
		
		$sessionTime=$ini['siteConfig']['sessionTime'];
		
		$ins=insert($tenant,"sessions",array("id"=>strrev($randomString),"registerDate"=>time(),"expireDate"=>time()+(60*$sessionTime),"username"=>$uname,"name"=>$name,"userId"=>$id));
		setcookie("userTocken",$randomString.$tail,(time()+(60*$sessionTime)),'/');
		
		$raw_data=json_decode(select($tenant,"modules",array(),array("name"=>"session")),10)[0];
		//doing action after register session on Database

		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="afterRegister")
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
		return $ins;
	}
	
	public static function delete_session($id)

	{
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		require $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
				
		chdir($tempPath);
		
		$del=delete($tenant,"sessions",array("id"=>$id));
		
		setcookie("userTocken","nothing",1);
		
		$raw_data=json_decode(select($tenant,"modules",array(),array("name"=>"session")),10)[0];
		//doing action after session removed....

		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="afterDelete")
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
	}
}
?>