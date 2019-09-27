<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{  
  $books=array();
  $books_name=array();
  $res=array();
  listFolderFiles("admin/Files/Books/",$res);
  $thumbs=array();
  for($i=0;$i<count($res);$i++)
  if(substr(strtolower($res[$i]),-3)=="pdf" || substr(strtolower($res[$i]),-3)=="doc" || substr(strtolower($res[$i]),-4)=="docx")
  {
		array_push($books,$res[$i]);		
		$pth=pathinfo($res[$i]);
		array_push($books_name,$pth['filename']);	
  }
  
  
  $book=select("book_briefcase","name,description,books","id=".$_GET['bid']);
  
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("book",$book);
  $temp_books="";
  $temp_books_name=array();
  if($book[0][2]!="") 
  {  
    $temp_books= explode(",",$book[0][2]);
	for($i=0;$i<count($temp_books);$i++)
	{
		$pth=pathinfo($temp_books[$i]);
		array_push($temp_books_name,$pth['filename']);
	}
  }
  $sm->assign("curr_books",$temp_books);
  $sm->assign("curr_books_name",$temp_books_name);
  $sm->assign("book_info",$book);
  $sm->assign("books",$books);
  $sm->assign("books_name",$books_name);
  $sm->assign("adm_path",admin_path);
  $sm->assign("book_id",$_GET['bid']);
  $sm->assign("site_domain",siteDomain);
  $sm->display("edit_book.tpl");
}
else
{
	access_denied();
}
?>