<?php
	require_once("../App/Db/functions.php");
	$msg=select($_POST['tenant'],"messages",array("translation"=>1,"callback"=>1),array("Message"=>$_POST['msgHandle']));
	echo(json_encode($msg));