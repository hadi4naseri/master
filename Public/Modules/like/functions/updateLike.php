<?php

trait updateLikeT
{
	public static function updateLike($tenant,$handle,$lk,$dlk)

	{
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		require $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		chdir($tempPath);
		
		update($tenant,"like",array("id"=>strrev($randomString),"registerDate"=>time(),"expireDate"=>time()+(60*$sessionTime),"username"=>$uname,"name"=>$name,"userId"=>$id));
		//setcookie("userTocken",$randomString.$tail,(time()+(60*$sessionTime)),'/');
		
		callEvent($tenant,"likeUpdate","",array());	
		callEvent($tenant,"likeUpdate",$handle,array());	
	}
}
?>