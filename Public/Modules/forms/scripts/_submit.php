<?php
	if ($_POST['tnt']!="" && $_POST['frmHandle']!="")
	{	
		$tenant=$_POST['tnt'];
		$tempPath=getcwd();
		
		//var_dump($arr);die();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/Db/");
		require_once("functions.php");
		chdir($tempPath);
		
		$raw_data=json_decode(select($tenant,"modules",array(),array("name"=>"forms")),10)[0];
		//doing action before submit on form modules

		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="onSubmit")
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
		
		//Casting.....
		$raw_data2=json_decode(select($tenant,"forms",array(),array("handle"=>$_POST['frmHandle'])),10)[0];
		
		//doing action before submit on specific form

		if (count($raw_data2["actions"])>0)
		{
			for($i=0;$i<count($raw_data2["actions"]);$i++)
			{
				if ($raw_data2["actions"][$i]["type"].$raw_data2["actions"][$i]["action"]=="onSubmit")
				{
					
					chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new/Tenants/".$tenant."/");
					$conditions=$raw_data2["actions"][$i]["conditions"];
					$patterns=$raw_data2["actions"][$i]["patterns"];
					$actions_success=$raw_data2["actions"][$i]["actions_success"];
					$actions_failure=$raw_data2["actions"][$i]["actions_failure"];
					include "Actions/_".$raw_data2["actions"][$i]["fileName"]."_".$tenant.".php";
					//execute process...
				}
			}
		}
	}
	else
		return false;
	?>