<?php
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
if($_POST['question']=="" || $_POST['answer']=="")
  die("متن سوال و  یا پاسخ وارد نشده است...مجدداً تلاش نمائید.");
  else{

insert("faq",array("question"=>urldecode($_POST['question']),"answer"=>urldecode($_POST['answer']),"images"=>$_POST['image_pics']));
die("درج سوال و پاسخ به درستی انجام شد.");
}
}
else
die("خطای دسترسی");
?>