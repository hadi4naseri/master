<?php

trait details
{
	public static function show_details($id)

	{

		$tempPath=getcwd();

		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		include_once $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
				
		chdir($tempPath);
		$ini=json_decode($tenant_ini,true)[0];
		
		
		$details=json_decode(select($tenant,"news",array(),array("id"=>$id)),true)[0];
				
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