<?php
  session_start();
  $temp_path=getcwd();
  chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
  require_once("config.php");
  if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
  { 
	  $table=select("modules","mapped_table","name like '".$_GET['module_name']."'");
	  $relation=select($table[0][0],"relation","id = ".$_GET['item']);
	  $find=false;
	  if ($relation[0][0]<>"")
	  {
		$rels=explode("/",$relation[0][0]);
		for ($i=0;$i<count($rels);$i++)
		{
			$detail=explode(":",$rels[$i]);
			if ($detail[0]==$_GET['mrg_module'])
			{
			$find=true;
			die("-1");
			}
		}
	  }
	  if ($relation[0][0]=="" || $find==false)
	  {
		if ($_GET['mrg_module']=="counter")
		{
		$counters=select("counter","id");
		$last_id=$counters[count($counters)-1][0];
		$last_id++;
		insert("counter",array("id"=>$last_id,"count"=>$_GET['seed']));
		$relation[0][0].="counter:".$last_id."/";
		update($table[0][0],array("relation" => $relation[0][0]),"id=".$_GET['item']);
		insert("modules_relation",array("module_name"=>$_GET['module_name'],"mapped_table"=>$table[0][0],"row_index"=>$_GET['item'],"module_name2"=>"comments","reference"=>$last_id,"time"=>time()));
		die("1");		
		}
		if ($_GET['mrg_module']=="comments")
		{
		$comments=select_distinct("comments","category");
		for($i=0;$i<count($comments);$i++)
		if ($comments[$i][0]=="contact_admin")
		unset($comments[$i]);

		$max_val=0;
		
		foreach ($comments as $com)
		if ($com[0]>$max_val)
			$max_val=$com[0];
		$max_val++;	
		$relation[0][0].="comments:".$max_val."/";
		update($table[0][0],array("relation" => $relation[0][0]),"id=".$_GET['item']);
		insert("modules_relation",array("module_name"=>$_GET['module_name'],"mapped_table"=>$table[0][0],"row_index"=>$_GET['item'],"module_name2"=>"comments","reference"=>$max_val,"time"=>time()));
		die("1");		
		}
		if ($_GET['mrg_module']=="like")
		{
		$likes=select("likes","id");
		$last_id=$likes[count($likes)-1][0];
		$last_id++;
		insert("likes",array("id"=>$last_id,"good"=>"0","bad"=>"0","time"=>time()));
		$relation[0][0].="like:".$last_id."/";
		update($table[0][0],array("relation" => $relation[0][0]),"id=".$_GET['item']);
		insert("modules_relation",array("module_name"=>$_GET['module_name'],"mapped_table"=>$table[0][0],"row_index"=>$_GET['item'],"module_name2"=>"like","reference"=>$last_id,"time"=>time()));
		die("1");		
		}
		if ($_GET['mrg_module']=="access")
		{
		$priv=select("content_access","id","1=1 order by id");
		
		if (count($priv)==0)
		$last_id=0;
		else
		$last_id=$priv[count($priv)-1][0];
		
		$last_id++;
		insert("content_access",array("id"=>$last_id,"groups_permission"=>$_GET['valid_grps']));
		$relation[0][0].="access:".$last_id."/";
		update($table[0][0],array("relation" => $relation[0][0]),"id=".$_GET['item']);
		insert("modules_relation",array("module_name"=>$_GET['module_name'],"mapped_table"=>$table[0][0],"row_index"=>$_GET['item'],"module_name2"=>"access","reference"=>$last_id,"time"=>time()));
		die("1");		
		}
	  }
  }
   else
	{
		access_denied();
	}
?>