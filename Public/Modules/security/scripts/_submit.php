<?php
	$tempPath=getcwd();
	chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");
	include_once("config.php");
	
	if ($_POST['tnt']!="" && $_POST['frmHandle']!="")
	{	
		$tenant=$_POST['tnt'];
		$tempPath=getcwd();
		
		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/Db/");
		require_once("functions.php");
		chdir($tempPath);
			
		//callEvent($tenant,"formSubmit");
		callEvent($tenant,"",$_POST['frmHandle'],array($_POST['frmData']));
	}
	else
		return false;
	