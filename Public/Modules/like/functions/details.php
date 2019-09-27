<?php
$tempPath=getcwd();

chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

require_once("config.php");
include_once $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";


if ($_SERVER['QUERY_STRING']!="")
	{
		
		chdir($tempPath);
		$ini=json_decode($tenant_ini,true)[0];
		
		$tenant=findTenant($_SERVER['HTTP_REFERER']);
		
		$details=json_decode(select($tenant,"modules",array("data"=>1,"data.$"=>1),array("name"=>"news","data.id"=>$_GET['id'])),true)[0]["data"][0];
		
		
		//die(print_r($details));
		
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
		//die(print_r($details["templates"]));
		$sm=renderPage($tenant,$ini,"news_details.php",array("data"=>$details));
				
	}
	
	else
	//header();
	die("oooooo");
	
	chdir($tempPath);
?>