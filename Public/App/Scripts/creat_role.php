<?php
  session_start();
  $temp_path=getcwd();
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  require_once("config.php");
  if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
  { 
	  
	  if ($_GET['param']==1)
	  {

	  $rels=explode("/",$_GET['item']);
	  
	  for ($i=0;$i<count($rels)-1;$i++)
		{
			$access=select("file_access","valid_groups","id = ".$rels[$i]);
			$perms=explode(",",$access[0][0]);
			array_splice($perms,count($perms)-1);
			$grps=explode(",",$_GET['valid_grps']);
			for($j=0;$j<count($grps);$j++)
			if (!in_array($grps[$j],$perms))
			array_push($perms,$grps[$j]);
			
			$new_val="";
			for($j=0;$j<count($perms);$j++)
			$new_val.=$perms[$j].",";

			update("file_access",array("valid_groups"=>$new_val),"id = ".$rels[$i]);
			
		}
	  
	  die("1");
	  
	}
	else if ($_GET['param']=="2")
	{
	 
		$access=select("file_access","valid_groups","id = ".$_GET['item']);
		$perms=explode(",",$access[0][0]);
		array_splice($perms,count($perms)-1);
		$grps=explode(",",$_GET['valid_grps']);
		for($i=0;$i<count($grps);$i++)
		if (!in_array($grps[$i],$perms))
		array_push($perms,$grps[$i]);
		
		$new_val="";
		for($j=0;$j<count($perms);$j++)
		$new_val.=$perms[$j].",";
		update("file_access",array("valid_groups"=>$new_val),"id = ".$_GET['item']);
		
		die("1");
	}
	else
	die("-1");	
	}
	
   else
	{
		access_denied();
	}
?>