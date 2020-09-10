<?php
	require_once("../App/Db/functions.php");
	$schema=select($_POST['tnt'],"Schema",array("modules"=>1,"name"=>1,"grabFunction"=>1),array("name"=>$_POST['moduleHandle']));
	echo(json_encode($schema));