<?php

trait simpleLogin
{
	
	//process on addons that attached to node...
	public static function simple_login($fields)
	{
				
		$formData=$_POST['frmData'];
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");
		require_once "config.php";
		//require_once "Modules/session/sessionClass.php";
		include $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		$result=-1;
		
		$raw_data=json_decode(select($tenant,"modules",array(),array("name"=>"login")),10)[0];
		//doing action before submit on form modules

		if (count($raw_data["actions"])>0)
		{
			
			for($i=0;$i<count($raw_data["actions"]);$i++)
			{
				if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="beforeLogin")
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
		//login to system...
		
		parse_str($formData,$inputvals);
		
		if(count($fields)!= count($inputvals))
		{	Message::error('formFieldsNotSameSize');
			die();
		}
		
		foreach ($fields as $fld)
		{
			if (empty($inputvals[$fld['id']] && $fld['mandatory']))
				Message::error($fld['messageOnError']);
		}
		$frmflds = array();
		parse_str($formData, $frmflds);		
		
		$userInfo=json_decode(select($tenant,"users",array(),array("username"=>$frmflds['uname'])),true);
		
		if (count($userInfo)>0)
		{	
			$userInfo=$userInfo[0];
			if ($userInfo["isActive"]==0)
				$result=0; //user is inactive
			else if (hash($userInfo["algorithm"],substr($userInfo["salt"],0,4).$frmflds['pass'].substr($userInfo["salt"],4,4))==$userInfo["hashedPass"])
			{	
				Session::register_session($userInfo["username"],$userInfo["name"],$userInfo["id"]);
				$result=1; //login successful	
			}
			else
			{	
				Message::error('loginFailed');
				$result=-1; //login failed	
			}
						
			//------------------
			if (count($raw_data["actions"])>0)
			{
				
				for($i=0;$i<count($raw_data["actions"]);$i++)
				{
					if ($raw_data["actions"][$i]["type"].$raw_data["actions"][$i]["action"]=="afterLogin")
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
		}
		else
		{	
			Message::error('loginFailed');
			$result=-2;
		}	
		
		
		$result2=array();
		
		chdir($tempPath);
		array_push($result2,array("value"=>$result));
		return json_encode($result2);
		
	}		
}
