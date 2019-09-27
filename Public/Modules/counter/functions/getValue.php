<?php

trait getValue
{
	
	//process on addons that attached to node...
	public static function count_s($items)
	{
		$tempPath=getcwd();
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");
		require_once "config.php";
		include $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		$result=array();
		
		for($k=0;$k<count($items);$k++)
			for($kk=0;$kk<count($items[$k]["addons"]);$kk++)
				if ($items[$k]["addons"][$kk]["name"]=="counter")
				{
					$cnt_val=json_decode(select($tenant,"counter",array(),array("id"=>$items[$k]["addons"][$kk]["id"])),true);
					//die(print_r($cnt_val));
					//array_push($result,array("id"=>$items[$k]["id"],"value"=>10));
					array_push($result,array("id"=>$items[$k]["id"],"value"=>$cnt_val[0]["data"]["value"]));
				}

		chdir($tempPath);
		return (json_encode($result));
		
	}
		
	//process on node...
	public static function count_($item)
	{
	
	}		
}
?>