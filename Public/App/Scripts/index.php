<?php
  session_start();
  $temp_path=getcwd();
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  $cal_stid=explode(',',$_COOKIE['current_user']);
  $_SESSION['site_index']=$cal_stid[1];
  require("config.php");

  if ($_GET['uid'] && $_SESSION[$_GET['uid']]!= "" )
  {  
		@$uid=$_GET['uid'];
		if (@$_SESSION[$uid])
		{
			chdir($temp_path);
			$user_info=explode("/",translate_cookie($_COOKIE['current_user']));
			require_once("functions.php");
			$sm=create_admin_smarty_obj();
			$sm->assign("username",$_SESSION[$uid][3]);
			$sm->assign("last_login",$_SESSION[$uid][1]);
			$sm->assign("last_logout",$_SESSION[$uid][2]);
			$sm->assign("userID",$_SESSION[$uid][0]);
			$sm->assign("msgs",$_SESSION[$uid][6]);
			$sm->assign("user_grp",$user_info[3]);
			array_push($_POST,$_SESSION[$uid][0]);
			$sm->assign("adm_path",admin_path);
			$sm->assign("site_domain",siteDomain);
			$grps=select_distinct("file_access","group_id","group_id <>0 and group_id<>40 order by group_id");
			$indx_data=select("file_access","filename,file_title,group_title,group_logo,valid_groups,group_id","file_title<>'' order by group_id");
			$show_items=array();
			for ($i=0;$i<count($indx_data);$i++)
			{
				$check=explode(",",$indx_data[$i][4]);
				array_splice($check,count($check)-1);
				for($j=0;$j<count($check);$j++)
				{
					if (in_array($user_info[3],$check))
					{
					array_push($show_items,$indx_data[$i]);
					break;
					}
				}
			}
			$title=select("config","site_title","id=".$_SESSION['site_index']);
			$sm->assign("title",$title[0][0]);
			$sm->assign("groups",$grps);
			$sm->assign("items",$show_items);
			$sm->display("index.tpl");		
		}		
  }
  else
	  {
		header('location:'.siteDomain);
		exit;
	  }
?>