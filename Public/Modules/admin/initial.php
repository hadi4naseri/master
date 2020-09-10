<?php

function admin_initial($tenant)
{

$tempPath=getcwd();

chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");
require_once("config.php");
chdir($tempPath);

callEvent($tenant,"adminPanelInitiation");


//loading schema ....
$itemSchema=select($tenant,"Schema",array(),array("name"=>"adminPanel"));
$itemSchema=json_decode($itemSchema,true);


//loading data....
$itemData=select($tenant,"modules",array("languages"=>1),array("name"=>"admin"));
$itemData=json_decode($itemData,true)[0];

$languages=$itemData["languages"];
//find default theme in dafault language
for($i=0;$i<count($languages);$i++)
	if ($languages[$i]["isDefault"]==true)
		for($j=0;$j<count($languages[$i]["templates"]);$j++)
			if ($languages[$i]["templates"][$j]["isDefault"]==true)
				$template=$languages[$i]["templates"][$j];
/*

//update addons for admin module
$modules=select($tenant,"modules","name"=>1,"functions"=>1,"isLocal"=>1,"events"=>1,"billingPlans"=>1);

			
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
	*/	
//return array("schema"=>$itemSchema,"template"=>$template,"content"=>$itemData["data"],"addons"=>$addonsData,"handle"=>$handle,"moduleName"=>"admin");	
return array("schema"=>$itemSchema,"template"=>$template,"moduleName"=>"admin");	

}
