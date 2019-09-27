<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  copy('main/templates/index.tpl', 'main/templates/index_copy.tpl');
  
  for(;;)
  {
	  $nme=rand(1000,9999);
	  if (file_exists(siteDomain."/main/templates/index".$nme.".tpl")==FALSE)
	  {
	  rename('main/templates/index_copy.tpl','main/templates/index'.$nme.'.tpl');
	  break;
	  }
  }
  
  //--------------------------import new instance to DB-----------------
  
	$dbh = new PDO("mysql:host=".$_SESSION['db_host_name'], $_SESSION['db_main_user'], $_SESSION['db_main_password']);
	
	$db_user="mobina_".$nme;
	$db_pass="mob@".$nme;
	
	
	$dbh->exec("CREATE DATABASE `mobina_".$nme."`;
			CREATE USER ".$db_user."@'".$_SESSION['db_host_name']."' IDENTIFIED BY '".$db_pass."';
			GRANT ALL  PRIVILEGES ON ".$db_user .".* TO ".$db_user."@'".$_SESSION['db_host_name']."' WITH GRANT OPTION;
			FLUSH PRIVILEGES;")  or die(print_r($dbh->errorInfo(), true));

	$dbh->query("ALTER DATABASE  `mobina_".$nme."` DEFAULT CHARACTER SET utf8 COLLATE utf8_persian");
	$dbh=null;
	
	$temp_db=$_SESSION['db_name'];
	$temp_user=$_SESSION['db_username'];
	$temp_pass=$_SESSION['db_password'];
	
	
	insert("config",array("site_title"=>$_GET['site_title'],"db_info"=>"mobina_".$nme."/".$db_user."/".strrev($db_pass)."/","template_name"=>"index".$nme.".tpl","visit_count"=>"0"));
	
	$ini_config=select("config","id","template_name like 'index".$nme.".tpl'");
	$parent_info=select("config","site_title,db_info,template_name","id=1");
	$admin=select("users","id,grp,username,password,slt,name,email,phone,isActive","id=1");
	$_SESSION['db_name']="mobina_".$nme;
	$_SESSION['db_username']=$db_user;
	$_SESSION['db_password']=$db_pass;
	$con=connect();
	
	// Name of the file
	$filename = 'admin/new_instance.sql';
	
	// Temporary variable, used to store current query
	$templine = '';
	// Read in entire file
	$lines = file($filename);
	// Loop through each line
	foreach ($lines as $line)
	{
		// Skip it if it's a comment
		if (substr($line, 0, 2) == '--' || $line == '')
			continue;

		// Add this line to the current segment
		$templine .= $line;
		// If it has a semicolon at the end, it's the end of the query
		if (substr(trim($line), -1, 1) == ';')
		{
			// Perform the query
			$con->query($templine);
			// Reset temp variable to empty
			$templine = '';
		}
	}
	
	insert("config",array("id"=>$ini_config[0][0],"site_title"=>$_GET['site_title'],"db_info"=>"mobina_".$nme."/".$db_user."/".strrev($db_pass)."/","template_name"=>"index".$nme.".tpl","visit_count"=>"0"));
	insert("users",array("id"=>$admin[0][0],"grp"=>$admin[0][1],"username"=>$admin[0][2],"password"=>$admin[0][3],"slt"=>$admin[0][4],"name"=>$admin[0][5],"email"=>$admin[0][6],"phone"=>$admin[0][7],"isActive"=>$admin[0][8]));
	
	$_SESSION['db_name']=$temp_db;
	$_SESSION['db_username']=$temp_user;
	$_SESSION['db_password']=$temp_pass;
	
	
  die(print($nme)); 
}
else
{
	die("خطای دسترسی");
}   
?>