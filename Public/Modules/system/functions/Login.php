<?php

trait simpleLoginT
{
	
	public static function simple_login($tenant,$uname,$password)
	{
			
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");
		require_once "config.php";
		include $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		callEvent($tenant,"beforeLogin","",array());
		
		
		$userInfo=json_decode(select($tenant,"users",array("hashedPass"=>1,"salt"=>1,"isActive"=>1,"algorithm"=>1,"name"=>1,"id"=>1),array("username"=>$uname)),true);		
				
		//login to system...
		
		if (count($userInfo)>0)
		{	
			$userInfo=$userInfo[0];
			if ($userInfo["isActive"]==false){
				echo "userNotActivated";
				exit;
			}
			else if (hash($userInfo["algorithm"],substr($userInfo["salt"],0,4).$password.substr($userInfo["salt"],4,4))==$userInfo["hashedPass"])
			{	
				//login was successful
				callEvent($tenant,"successfulLogin","",array($tenant,$uname,$userInfo["name"],$userInfo["id"]));
				echo "loginSuccessfull";
				exit;				
			}
			else
			{	
				//login was unsuccessful
				callEvent($tenant,"unsuccessfulLogin","",array());
				echo "loginUnSuccessfull";
				exit;	
			}
						
			//after login event
		}
		else
			print("userNotExist");

		chdir($tempPath);		
		
	}		
}
?>