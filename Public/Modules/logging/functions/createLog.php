<?php

trait logmgmt{
	
 public static function createLog($tenant,$data)
	{
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");
		require_once "config.php";
		include_once $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		callEvent($tenant,"createLog");
		
		insert($tenant,"log",array("date"=>time(),"data"=>$data));
		return true;
		
	}
}
