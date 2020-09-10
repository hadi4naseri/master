<?php

$tempPath=getcwd();

chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

require_once("config.php");
		
chdir($tempPath);

$form_fields=select($_POST["tenant"],"forms",array("data"=>1),array("handle"=>$_POST["moduleHandle"]));

echo(json_encode($form_fields));
