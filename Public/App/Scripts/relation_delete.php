<?php
session_start();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{
  //die($_GET['table']."-".$_GET['item']."-".$_GET['module_name']."-".$_GET['ref']);
  $rel=select($_GET['table'],"relation","id =".$_GET['item']);
  $detail=explode("/",$rel[0][0]);
  unset($detail[count($detail)-1]);
  for($i=0;$i<count($detail);$i++)
  if (substr(trim($detail[$i]),0,strlen($_GET['module_name']))==$_GET['module_name'])
  {
  unset($detail[$i]);
  break;
  }
  
  foreach ($detail as $index)
  $new_rel=$index."/";
  $trg_table=select("modules","mapped_table","name like '".$_GET['module_name']."'");
  delete($trg_table[0][0],"id=".$_GET['ref']);
  delete("modules_relation","module_name2 like '".$_GET['module_name']."' and reference=".$_GET['ref']);
  @update($_GET['table'],array("relation"=>$new_rel),"id=".$_GET['item']);
  die("رابطه با موفقیت از ماژول انتخابی حذف شد");
  }
else
{
	die("خطای دسترسی");
} 
?>