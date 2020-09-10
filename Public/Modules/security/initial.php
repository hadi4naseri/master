<?php

function security_initial(&$smartyObj,$handle)
{


$tempPath=getcwd();

chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/Db/");
require_once("functions.php");
chdir($tempPath);

$tenant=findTenant($_SERVER['REQUEST_URI']);

//loading schema ....
$itemSchema=select($tenant,"Schema",array(),array("name"=>$handle));
$itemSchema=json_decode($itemSchema,true);


//data loading....
$itemData=select($tenant,"security",array("parentModule"=>1,"parentHandle"=>1,"data"=>1,"addons"=>1),array("handle"=>$handle));
$itemData=json_decode($itemData,true)[0];


callEvent($tenant,"securityExecute","",array("tenant"=>$tenant,"itemHandle"=>$handle,"parentModule"=>$itemData["parentModule"],"parentHandle"=>$itemData["parentHandle"]));
callEvent($tenant,"securityExecute",$handle,array("tenant"=>$tenant,"itemHandle"=>$handle,"parentModule"=>$itemData["parentModule"],"parentHandle"=>$itemData["parentHandle"]));

chdir($tempPath);

}
