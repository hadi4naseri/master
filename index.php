<?php

include_once("Public/config.php");

if (stripos( $_SERVER['REQUEST_URI'] , '/Tenants/' )=== false){
header("Location:".tenantDomain."Tenants/main/index.php");
exit();
}
//Úãá äãÇíÔ ÕÝÍÇÊ íÏÇ äÔÏä ãÔ˜á ÏÇÑå
else
{
$tenant=findTenant($_SERVER['REQUEST_URI']);	
header("Location:".siteDomain."/".$tenant."/index.php");
exit();
}


/*
	
	$s_ini=select("config","site_title,visit_count,site_keywords,site_color,box_color,site_bg_pic,site_width,site_layout,columns_width,site_box,maintain_mode,maintain_msg,template_name","id=".$_SESSION['site_index']);

if (count($s_ini)==0)
{
	$_SESSION['site_index']=1;
	$sm=reinitial_modules("ÓÇíÊ íÏÇ äÔÏ!",$modules,"modules/sites/templates","site_not_found.tpl","","ÎØÇ ÏÑ æÑæÏ ÂÏÑÓ ÓÇíÊ...");
	//path manipulation
	$sm->assign("main_path",siteDomain."/".main_path);
	$sm->assign("modules_path",siteDomain."/".modules_path);
	$tpl=select("config","template_name","id=1");
	$sm->display($tpl[0][0]);
}
else
{
	if ($s_ini[0][10]==0)
	{
		$sm=create_smarty_obj($modules);
			
		//module initiatioin...
		for ($i=0;$i<count($modules);$i++)
		{
		if(file_exists(modules_path."/".$modules[$i]."/initial.php"))
		{
		  require(modules_path."/".$modules[$i]."/initial.php");
		  $func_name=$modules[$i]."_initial";
		  $ini_data=$func_name();
		  $sm->assign($modules[$i]."_ini_data",$ini_data[0]);
		}
		}

		
		$visit_cnt=$s_ini[0][1];
		if ($visit_cnt%500==0)
		{
			$files = glob('modules/captcha/pics/*'); 
			foreach($files as $file)
			{  
			  if(is_file($file))
				unlink($file); 
			}
		}	
		$col_width=explode(",",$s_ini[0][8]);
		update("config",array("visit_count" => ++$visit_cnt));
		$sm->assign("visit_counter",$visit_cnt);
		$sm->assign("site_domain",siteDomain);
		$sm->assign("main_path",main_path);
		$sm->assign("modules_path",modules_path);
		$sm->assign("modules",$modules);
		$sm->assign("css_array",css_register($modules,modules_path));
		$sm->assign("main_page_title",$s_ini[0][0]);
		$s_ini[0][2]=str_replace("-",",",$s_ini[0][2]);
		$sm->assign("keywords",$s_ini[0][2]);
		$sm->assign("site_color",$s_ini[0][3]);
		$sm->assign("box_color",$s_ini[0][4]);
		$sm->assign("bg_pic",$s_ini[0][5]);
		$sm->assign("site_width",$s_ini[0][6]);
		$sm->assign("box",$s_ini[0][9]);
		if (isset($_GET['stid']))
		$sm->assign("site_index",$_GET['stid']);
		else
		$sm->assign("site_index",1);
		$centered=select("modules","name,title","is_center=1");
		$sm->assign("centered_content",$centered[0][0].".tpl");
		$sm->assign("centered_content_caption",$centered[0][1]);

		/*
		if (strpos($_SERVER['HTTP_REFERER'],"uid=")===FALSE)
		$sm->assign("username","˜ÇÑÈÑ ãåãÇä");
		else
		{
		$pos=strpos($_SERVER['HTTP_REFERER'],"uid=");
		$uname=substr($_SERVER['HTTP_REFERER'],$pos+4);
		$dt=select("users","name","username like '%".$uname."%'");
		$sm->assign("username",$dt[0][0]);
		}
		
		
		for($k=0;$k<count($modules);$k++)
			{
			$cont=select("modules","content","name like '".$modules[$k]."'");
			$sm->assign(trim($modules[$k])."_tpl",htmlspecialchars_decode(stripslashes($cont[0][0])));
			}
			$cont=select("modules","content","name like 'template_functions'");
			$sm->assign("template_functions_tpl",htmlspecialchars_decode(stripslashes($cont[0][0])));
			
		$sm->display($s_ini[0][12]);
	}
	else
	{
		$sm=create_smarty_obj($modules);
		//module initiatioin...
		for ($i=0;$i<count($modules);$i++)
		{
		if(file_exists(modules_path."/".$modules[$i]."/initial.php"))
		{
		  require(modules_path."/".$modules[$i]."/initial.php");
		  $func_name=$modules[$i]."_initial";
		  $ini_data=$func_name();
		  $sm->assign($modules[$i]."_ini_data",$ini_data[0]);
		}
		}

		$visit_cnt=$s_ini[0][1];
		
		update("config",array("visit_count" => ++$visit_cnt));
		$sm->assign("site_domain",siteDomain);
		$sm->assign("main_path",main_path);
		$sm->assign("modules_path",modules_path);
		$sm->assign("modules",$modules);
		$sm->assign("css_array",css_register($modules,modules_path));
		$sm->assign("main_page_title",$s_ini[0][0]);
		$s_ini[0][2]=str_replace("-",",",$s_ini[0][2]);
		$sm->assign("keywords",$s_ini[0][2]);
		$sm->assign("site_color",$s_ini[0][3]);
		$sm->assign("box_color",$s_ini[0][4]);
		$sm->assign("bg_pic",$s_ini[0][5]);
		$sm->assign("box",$s_ini[0][9]);
		$sm->assign("maintain_message",$s_ini[0][11]);
		
		if (isset($_GET['stid']))
		$sm->assign("site_index",$_GET['stid']);
		else
		$sm->assign("site_index",1);
		
		$centered=select("modules","name,title","is_center=1");
		$sm->assign("centered_content","login.tpl");
		$sm->assign("centered_content_caption","æÑæÏ Èå ÈÎÔ ãÏíÑíÊ");

		$sm->display("maintain.tpl");
	}
}
*/
