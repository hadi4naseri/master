<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
require_once("modules/jdate/jdf.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
$user=explode(",",$_POST['contacts']);
for($i=0;$i<count($user);$i++)
{
insert("messages",array("from_name"=>$_POST['uname'],"to_user"=>$user[$i],"subject"=>$_POST['subject'],"message"=>urldecode($_POST['msg']),"attachment"=>$_POST['files'],"read_status"=>"0","sent_date"=>jdate('Y/n/j-H:i:s')));
}
die("پیام با موفقیت ارسال شد");

}
else
{
	die("خطای دسترسی");
} 
?>