<?php
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");

if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
	$fold_name=select("users","username","id=".$_POST['uid']);
	$file_inf=pathinfo($_FILES['myfile']['name']);
	$script_inf=pathinfo($_POST['decision']);
	
	chdir($temp_path);
	if ($script_inf['filename']=="new_sound"  && ($file_inf['extension']=="aac" || $file_inf['extension']=="mp3") && filesize($_FILES['myfile']['tmp_name'])<5*1024*1024)
	{
	  if(move_uploaded_file($_FILES['myfile']['tmp_name'],"Files/Users/".$fold_name[0][0]."/".$_FILES['myfile']['name']))
	  die("1");
	  else
	  die("0");
	}
	else if ($script_inf['filename']=="addnews"  && ($file_inf['extension']=="mp3" || $file_inf['extension']=="jpg" || $file_inf['extension']=="gif" || $file_inf['extension']=="jpeg") && filesize($_FILES['myfile']['tmp_name'])<5*1024*1024)
	{
	  if(move_uploaded_file($_FILES['myfile']['tmp_name'],"Files/Users/".$fold_name[0][0]."/".$_FILES['myfile']['name']))
	  die("1");
	  else
	  die("0");
	}
	else if ($script_inf['filename']=="new_video"  && ($file_inf['extension']=="mp4" || $file_inf['extension']=="flv" ) && filesize($_FILES['myfile']['tmp_name'])<5*1024*1024)
	{
	  if(move_uploaded_file($_FILES['myfile']['tmp_name'],"Files/Users/".$fold_name[0][0]."/".$_FILES['myfile']['name']))
	  die("1");
	  else
	  die("0");
	}
	else if ($script_inf['filename']=="new_message"  && ($file_inf['extension']=="mp3" || $file_inf['extension']=="doc" || $file_inf['extension']=="docx" || $file_inf['extension']=="aac" || $file_inf['extension']=="pdf") && filesize($_FILES['myfile']['tmp_name'])<5*1024*1024)
	{
	  if(move_uploaded_file($_FILES['myfile']['tmp_name'],"Files/Users/".$fold_name[0][0]."/".$_FILES['myfile']['name']))
	  die("1");
	  else
	  die("0");
	}
	else if ($script_inf['filename']=="new_book"  && ($file_inf['extension']=="pdf" || $file_inf['extension']=="doc" || $file_inf['extension']=="docx" ) && filesize($_FILES['myfile']['tmp_name'])<5*1024*1024)
	{
	  if(move_uploaded_file($_FILES['myfile']['tmp_name'],"Files/Users/".$fold_name[0][0]."/".$_FILES['myfile']['name']))
	  die("1");
	  else
	  die("0");
	}
	else if ($script_inf['filename']=="addimg"  && ($file_inf['extension']=="jpg" || $file_inf['extension']=="jpeg" || $file_inf['extension']=="gif" ) && filesize($_FILES['myfile']['tmp_name'])<5*1024*1024)
	{
	  if(move_uploaded_file($_FILES['myfile']['tmp_name'],"Files/Users/".$fold_name[0][0]."/".$_FILES['myfile']['name']))
	  die("1");
	  else
	  die("0");
	}
	else if ($script_inf['filename']=="pics_crop"  && ($file_inf['extension']=="jpg" || $file_inf['extension']=="jpeg" ) && filesize($_FILES['myfile']['tmp_name'])<5*1024*1024)
	{
	  if(move_uploaded_file($_FILES['myfile']['tmp_name'],"Files/Users/".$fold_name[0][0]."/".$_FILES['myfile']['name']))
	  die("1");
	  else
	  die("0");
	}
	else if ($script_inf['filename']=="new_faq"  && ($file_inf['extension']=="jpg" || $file_inf['extension']=="jpeg" || $file_inf['extension']=="png" || $file_inf['extension']=="gif" ) && filesize($_FILES['myfile']['tmp_name'])<5*1024*1024)
	{
	  if(move_uploaded_file($_FILES['myfile']['tmp_name'],"Files/Users/".$fold_name[0][0]."/".$_FILES['myfile']['name']))
	  die("1");
	  else
	  die("0");
	}
	else if ($script_inf['filename']=="aboutus"  && ($file_inf['extension']=="jpg" || $file_inf['extension']=="jpeg" || $file_inf['extension']=="png" || $file_inf['extension']=="gif" ) && filesize($_FILES['myfile']['tmp_name'])<5*1024*1024)
	{
	  if(move_uploaded_file($_FILES['myfile']['tmp_name'],"Files/Users/".$fold_name[0][0]."/".$_FILES['myfile']['name']))
	  die("1");
	  else
	  die("0");
	}
	chdir($temp_path);
}
else
{
	die("خطای دسترسی");
}
?> 