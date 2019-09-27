<?php
  session_start();
  $temp_path=getcwd();
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  require_once("config.php");
  if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
  { 
	  $perms=select("file_access","valid_groups","id=".$_GET['fid']);
	  $roles=explode(",",$perms[0][0]);
	  $new_role="";
	  
	  for ($i=0;$i<count($roles)-1;$i++)
		{
			if ($roles[$i]!=$_GET['gid'])
			$new_role.=$roles[$i].",";
			
		}

		update("file_access",array("valid_groups"=>$new_role),"id = ".$_GET['fid']);
			  
		die("1");
	  
	}
   else
	{
		access_denied();
	}
?>