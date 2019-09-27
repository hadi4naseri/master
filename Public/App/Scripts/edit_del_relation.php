<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  $mdls=select("modules","name,title,mapped_table,field2display");
  $mdls2=select("modules","name,title","type=1");
  $mdls_r=select("modules_relation","id,module_name,mapped_table,row_index,module_name2,reference");
  chdir($temp_path);
  
  //--------------------------------------
  //sync intersect table with modules tables...

  for ($i=0;$i<count($mdls);$i++)
	{
			update($mdls[$i][2],array("relation"=>""));
	}  
  
  for ($i=0;$i<count($mdls_r);$i++)
	{
			$temp_val=select($mdls_r[$i][2],"relation","id=".$mdls_r[$i][3]);
			$temp_val[0][0].=$mdls_r[$i][4].":".$mdls_r[$i][5]."/";
			update($mdls_r[$i][2],array("relation"=>$temp_val[0][0]),"id=".$mdls_r[$i][3]);
	}
    
  $has_rel=array();
  for($i=0;$i<count($mdls_r);$i++)
  {
	
	for($j=0;$j<count($mdls);$j++)
		if ($mdls[$j][0]==$mdls_r[$i][1])
			break;
	for($k=0;$k<count($mdls2);$k++)
		if ($mdls2[$k][0]==$mdls_r[$i][4])
			break;
	
	$item_name=select($mdls_r[$i][2],$mdls[$j][3],"id=".$mdls_r[$i][3]);
	
	
	array_push($has_rel,array("module"=>$mdls_r[$i][1],"item"=>strip_tags($item_name[0][0]),"name"=>$mdls2[$k][0],"title"=>$mdls2[$k][1],"value"=>$mdls_r[$i][5],"mapped_table"=>$mdls_r[$i][2],"iid"=>$mdls_r[$i][3]));
		
  }	
  
  
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("site_domain",siteDomain);
  $sm->assign("relations",$has_rel);
  $sm->display("edit_del_relation.tpl");
  }
else
{
	access_denied();
}
?>