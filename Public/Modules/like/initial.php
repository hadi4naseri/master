<?php

function like_initial(&$smartyObj=null,$handle)
{

$tempPath=getcwd();

chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/Db/");
require_once("functions.php");
chdir($tempPath);

$tenant=findTenant($_SERVER['REQUEST_URI']);

callEvent($tenant,"likeLoad","");
callEvent($tenant,"likeLoad",$handle);

//loading schema ....
$itemSchema=select($tenant,"Schema",array(),array("name"=>$handle));
$itemSchema=json_decode($itemSchema,true);


//data loading....
$itemData=select($tenant,"likes",array("languages"=>1,"data"=>1,"addons"=>1),array("handle"=>$handle));
$itemData=json_decode($itemData,true)[0];

$languages=$itemData["languages"];

//find default theme in dafault language
for($i=0;$i<count($languages);$i++)
	if ($languages[$i]["isDefault"]==true)
		for($j=0;$j<count($languages[$i]["templates"]);$j++)
			if ($languages[$i]["templates"][$j]["isDefault"]==true)
				$template=$languages[$i]["templates"][$j];


//loading addons data
$addonsData=array();
for($w=0;$w<count($itemSchema);$w++)
{
	$addons=$itemSchema[$w]["modules"];
			
			for($i=0;$i<count($addons);$i++)
			{
					if(file_exists(modulesPath.$addons[$i]["name"]."/initial.php"))
					{	
					  $func_name=$addons[$i]["name"]."_initial";
					  require_once(modulesPath.$addons[$i]["name"]."/initial.php");
					  //because can not send NULL to refrenced parameter, define variable with NULL value and send it
					  $ref_null=NULL;
					  $ini_data=$func_name($ref_null,$addons[$i]["handle"]);
					  $addonsData[$addons[$i]["handle"]]=$ini_data;
					}
			}
}
		
return array("template"=>$template,"content"=>$itemData["data"],"handle"=>$handle,"moduleName"=>"like");	
//return json_decode($data,true)[0];
}
