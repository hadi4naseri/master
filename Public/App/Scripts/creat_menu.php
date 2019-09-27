<?php
  session_start();
  $temp_path=getcwd();
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  require_once("config.php");
  if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
  { 
	  
	  if ($_POST['param']==1) //for url entered...
		{
		  if (strpos($_POST['target'],"http://")===FALSE && strpos($_POST['target'],"https://")===FALSE )
		  die("-1");
		  else
		  {
			if ($_POST['parent']==0)
			{
				insert("menu",array("vpos"=>$_POST['vpos'],"hpos"=>$_POST['hpos'],"vpos"=>$_POST['vpos'],"parent"=>-1,"child"=>-1,"content"=>urldecode($_POST['content']),"target"=>$_POST['target'],"status"=>1,"valid_groups"=>$_POST['groups']));
			}
			else
			{
				$prnt_vpos=select("menu","vpos","id=".$_POST['parent']);
				
				insert("menu",array("vpos"=>$prnt_vpos[0][0],"hpos"=>$_POST['hpos'],"child"=>$_POST['parent'],"parent"=>"-1","content"=>urldecode($_POST['content']),"target"=>$_POST['target'],"status"=>1,"valid_groups"=>$_POST['groups']));
				update("menu",array("parent"=>0),"id=".$_POST['parent']);
				
			}
		  }
		  die("1");
	  }
	  else //for pages from site...
	  {
		  
		  $trg=siteDomain."/modules/".$_POST['module']."/show_details.php?id=".$_POST['item']."#content";
		  if ($_POST['parent']==0)
			{
				insert("menu",array("vpos"=>$_POST['vpos'],"hpos"=>$_POST['hpos'],"vpos"=>$_POST['vpos'],"parent"=>-1,"child"=>"-1","content"=>urldecode($_POST['content']),"target"=>$trg,"status"=>1,"valid_groups"=>$_POST['groups']));
			}
			else
			{
				$prnt_vpos=select("menu","vpos","id=".$_POST['parent']);
				insert("menu",array("vpos"=>$prnt_vpos[0][0],"hpos"=>$_POST['hpos'],"child"=>$_POST['parent'],"parent"=>"-1","content"=>urldecode($_POST['content']),"target"=>$trg,"status"=>1,"valid_groups"=>$_POST['groups']));
				update("menu",array("parent"=>0),"id=".$_POST['parent']);
			}
		  
		  die("1");
	  }
	}
	
   else
	{
		access_denied();
	}
?>