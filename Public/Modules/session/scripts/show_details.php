<?php
@session_start();
chdir(substr(dirname(__FILE__),0,strpos(dirname(__FILE__),"modules")-1));
$_SESSION['site_index']=$_GET['stid'];
require_once("config.php");


if (get_maintain_mode()==0)
{			
		//get data to display
		$data=select("news","title,full_text,images,relation","id=".$_GET['id']);
		if (count($data)!=0)
		{

		$sm=reinitial_modules("صفحه اخبار",$modules,"modules/news/templates","show_full_news.tpl","",$data[0][0]);

		$temp_news_images="";
		if($data[0][2]!="")
		{
		  $data[0][2].=",";
		  $temp_news_images= explode(",",$data[0][2]);

		  if (count($temp_news_images)>=1)
		  for ($i=0;$i<count($temp_news_images)-1;$i++)
			 {
			 $temp_pinf=pathinfo($temp_news_images[$i]);
			 $temp_news_images[$i]= array(siteDomain."/admin/".$temp_news_images[$i],siteDomain."/admin/Files/thumbs/".$temp_pinf['filename'].".".$temp_pinf['extension']);
			 }
		}

		if ($data[0][3]!= "")
		{
			array_push($data[0],find_related_modules($data[0][3]));
		}
		$sm->assign("news_full",$data);
		$sm->assign("news_images",$temp_news_images);

		}
		else
		{
			
			$sm=reinitial_modules("صفحه اخبار",$modules,"modules/news/templates","show_full_news.tpl","","خطای دسترسی");
			$sm->assign("news_full",null);
		}


		//path manipulation
		$sm->assign("main_path",siteDomain."/".main_path);

		$sm->assign("modules_path",siteDomain."/".modules_path);

		$tpl=select("config","template_name","id=".$_SESSION['site_index']);
		
		
		
		$sm->display($tpl[0][0]);
}
else
{
	header("Location: ".siteDomain."/index.php");
	exit();
}
?>