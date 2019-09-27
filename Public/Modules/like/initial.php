<?php

//die(select($tenant,"modules",array("data"=>1,"data.$"=>1),array("name"=>"news","data.id"=>7)));
//db.getCollection('MN_modules').find({"name":"news"},{"data":{$elemMatch:{"id":2}}})

function like_initial(&$smartyObj)
{

return "hi_like";
/*
$tempPath=getcwd();

chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/Db/");
require_once("functions.php");

$tenant=findTenant($_SERVER['REQUEST_URI']);

$raw_data=json_decode(select($tenant,"modules",array(),array("name"=>"news")),true)[0];

//doing action on initialize

if (count($raw_data["actions"])>0)
{
	for($i=0;$i<count($raw_data["actions"]);$i++)
	{
		
			//print("before_load");
			//require_once();
			//execute
		
	}
}

//doing action before load
for($i=0;$i<count($raw_data["data"]);$i++)
	for($j=0;$j<count($raw_data["data"][$i]["actions"]);$j++)
	{
		if ($raw_data["data"][$i]["actions"][$j]["type"].$raw_data["data"][$i]["actions"][$j]["action"]=="beforeLoad")
		{
			//print("before_load");
			//require_once();
			//execute
		}	
	}
//data loading....
$data=select($tenant,"modules",array("data"=>1,"templates"=>1),array("name"=>"news"));


//doing action after load
for($i=0;$i<count($raw_data["data"]);$i++)
	for($j;$j<count($raw_data["data"][$i]["actions"]);$j++)
	{
		if ($raw_data["data"][$i]["actions"][$j]["type"].$raw_data["data"][$i]["actions"][$j]["action"]=="afterLoad")
		{
			//print("before_load");
			//require_once();
			//execute
		}	
	}

	$addons=$raw_data["addons"];
	for ($j=0;$j<count($addons);$j++)
	{
		if(file_exists(modulesPath.$addons[$j]["name"]."/initial.php"))
		{	
		  $func_name="_".$addons[$j]["name"]."_initial";
		  require_once(modulesPath.$addons[$j]["name"]."/initial.php");
		  $ini_data=$func_name($addons[$j]["id"]);
		  
		  $smartyObj->assign("news_".$addons[$j]["name"]."_".$addons[$j]["handle"]."_ini_data",$ini_data);
		}
	}
		
chdir($tempPath);

//$tpl=select($tenant,"modules",array("templates"=>1),array("name"=>"news"));
//print("<pre>");
//die(print_r(json_decode($data,true)[0]));

return json_decode($data,true)[0];*/
}

function _like_initial($id)
{
/*
$tempPath=getcwd();

$tenant=findTenant($_SERVER['REQUEST_URI']);

$raw_data=json_decode(select($tenant,"modules",array("data"=>1,"data.$"=>1),array("name"=>"news","data"=>array('$elemMatch'=>array("id"=>$id)))),true);

//doing action on initialize

$raw_data=$raw_data[0]["data"][0];

if ( is_array($raw_data["actions"]) && count($raw_data["actions"])>0)
{
	for($i=0;$i<count($raw_data["actions"]);$i++)
	{
		
			//print("before_load");
			//require_once();
			//execute
		
	}
}

//doing action before load
for($j=0;$j<count($raw_data["actions"]);$j++)
{
	if ($raw_data["actions"][$j]["type"].$raw_data["actions"][$j]["action"]=="beforeLoad")
	{
		//print("before_load");
		//require_once();
		//execute
	}	
}
//data loading....
$data=$raw_data["data"];


//doing action after load
for($j;$j<count($raw_data["actions"]);$j++)
{
	if ($raw_data["actions"][$j]["type"].$raw_data["actions"][$j]["action"]=="afterLoad")
	{
		//print("before_load");
		//require_once();
		//execute
	}	
}

$addons=$raw_data["addons"];
for ($j=0;$j<count($addons);$j++)
{
	if(file_exists(modulesPath.$addons[$j]["name"]."/initial.php"))
	{	
	  $func_name=$addons[$j]["name"]."_initial";
	  require_once(modulesPath.$addons[$j]["name"]."/initial.php");
	  $ini_data=$func_name($addons[$j]["id"]);
	}
}
		
chdir($tempPath);
return $data;
*/
//return $_SERVER['HTTP_REFERER'];
}
?>