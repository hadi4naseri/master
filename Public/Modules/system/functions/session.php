<?php

trait sessionT
{
	public static function registerSession($tenant,$uname,$name,$id)

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
		$_SESSION["userToken"]=strrev($randomString);
		$ins=insert($tenant,"sessions",array("id"=>strrev($randomString),"registerDate"=>time(),"expireDate"=>time()+(60*$sessionTime),"username"=>$uname,"name"=>$name,"userId"=>$id));
		setcookie("userToken",$randomString.$tail,(time()+(60*$sessionTime)),'/');
		
		callEvent($tenant,"registerSession","",array($tenant,$uname));	
	}
	
	
	public static function userLoggedIn($tenant)
	{
		if (isset($_COOKIE["userToken"]))
			if (validateToken($tenant,$_COOKIE["userToken"]))
				return true;
		else 
			return false;
	}
	
}
?>