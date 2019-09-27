<?php
$temp_path=getcwd();
chdir(substr(dirname(__FILE__),0,strpos(dirname(__FILE__),"modules")-1));
require_once("db/functions.php");
require_once("config.php");
if ($_GET['param']==100)
{
	if (array_key_exists("current_user",$_COOKIE)==TRUE)
	{
	$user_info=explode("/",translate_cookie($_COOKIE['current_user']));
	
	$history=select("contributions","time","user_id = ".$user_info[2]." && module like 'like' && module_ref=".$_GET['likeid']);
	$max_val=0;
	for ($i=0;$i<count($history);$i++)
	if ($history[$i][0]>$max_val)
		$max_val=$history[$i][0];
		if (count($history)==0 || $max_val+86400 < time())
		{
		$val=select("likes","good","id = ".$_GET['likeid']);
		insert("contributions",array("module"=>"like","module_ref"=>$_GET['likeid'],"ip"=>$_SERVER['REMOTE_ADDR'],"time"=>time(),"user_id"=>$user_info[2]));
		update("likes",array("good"=>++$val[0][0],"time"=>time()),"id = ".$_GET['likeid']);
		die("1");
		}
		else
		die("-2");
	}
	else
	die("-1");
}
else if ($_GET['param']==200)
{
	if (array_key_exists("current_user",$_COOKIE)==TRUE)
	{
	$user_info=explode("/",translate_cookie($_COOKIE['current_user']));
	
	$history=select("contributions","time","user_id = ".$user_info[2]." && module like 'like' && module_ref=".$_GET['likeid']);
	$max_val=0;
	for ($i=0;$i<count($history);$i++)
	if ($history[$i][0]>$max_val)
		$max_val=$history[$i][0];
		if (count($history)==0 || $max_val+86400 < time())
		{
		$val=select("likes","bad","id = ".$_GET['likeid']);
		insert("contributions",array("module"=>"like","module_ref"=>$_GET['likeid'],"ip"=>$_SERVER['REMOTE_ADDR'],"time"=>time(),"user_id"=>$user_info[2]));
		update("likes",array("bad"=>++$val[0][0],"time"=>time()),"id = ".$_GET['likeid']);
		die("1");
		}
		else
		die("-2");
	}
	else
	die("-1");
}
else if ($_GET['param']==300)
{
	if( !preg_match("/^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$/i", $_GET['email']) )
	die("-1");
	else
	{
		if (array_key_exists("current_user",$_COOKIE)==TRUE)
		{
		$user_info=explode("/",translate_cookie($_COOKIE['current_user']));
		insert("comments",array("user_id"=>$user_info[2],"user_name"=>$user_info[1],"mail"=>$_GET['email'],"category"=>$_GET['comm_id'],"message"=>$_GET['comm'],"reg_date"=>jdate('Y/n/j-H:i:s'),"status"=>"0"));
		insert("contributions",array("module"=>"comment","module_ref"=>$_GET['comm_id'],"ip"=>$_SERVER['REMOTE_ADDR'],"time"=>time(),"user_id"=>$user_info[2]));
		die("1");
		}
		else
		{
		$posts=select("contributions","time","module like 'comment' and ip like '".$_SERVER['REMOTE_ADDR']."' and module_ref=".$_GET['comm_id']);
		$cnt=0;
		for ($i=0;$i<count($posts);$i++)
		{
			if ($posts[$i][0]>time()-3600 && $posts[$i][0]<time())
			$cnt++;
		}
		if ($cnt<3)
		{		
			insert("comments",array("user_id"=>"0","user_name"=>$_GET['nme'],"mail"=>$_GET['email'],"category"=>$_GET['comm_id'],"message"=>$_GET['comm'],"reg_date"=>jdate('Y/n/j-H:i:s'),"status"=>"0"));
			insert("contributions",array("module"=>"comment","module_ref"=>$_GET['comm_id'],"ip"=>$_SERVER['REMOTE_ADDR'],"time"=>time(),"user_id"=>"0","email"=>$_GET['email']));
			die("1");
		}
		else
		{
			die("-2");
		}
		}
	}
}
else if ($_GET['param']==123)
{
	update("modules",array("language"=>$_GET['new_lang']),"name like '".$_GET['module_name']."'");
	die("1");
}
else
	die("Invalid use...");
chdir($temp_path);
?>