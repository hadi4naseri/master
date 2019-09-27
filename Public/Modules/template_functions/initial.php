<?php
chdir(substr(dirname(__FILE__),0,strpos(dirname(__FILE__),"modules")-1));
require_once("db/functions.php");
function comments_initial($cid)
{
$data=select("comments","user_id,message,reg_date,user_name","category=".$cid." and status=1");
for($i=0;$i<count($data);$i++)
{
	if ($data[$i][0]!=0)
	{
	$uname=select("users","name","id=".$data[$i][0]);
	$data[$i][0]=$uname[0][0];
	}
	else
	$data[$i][0]=$data[$i][3] . "(میهمان)";
}
array_push($data,$cid);
//die(print_r($data));
return array($data);

}

function access_initial($aid)
{
$data=select("content_access","groups_permission","id=".$aid);
return array($data[0][0]);
}

function like_initial($lid)
{
$data=select("likes","good,bad","id=".$lid);
array_push($data[0],$lid);
return array($data[0]);
}
?>