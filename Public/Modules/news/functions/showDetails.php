<?php

trait showDetailsT
{
	public static function show_details($handle,$id)

	{

		$tempPath=getcwd();

		chdir($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/");

		require_once("config.php");
		include_once $_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/tenant_ini.php";
		
		$tenant=findTenant($_SERVER['REQUEST_URI']);
			
		chdir($tempPath);
		$ini=json_decode($tenant_ini,true)[0];
		
		
		callEvent($tenant,"newsShowDetails");
		//callEvent($tenant,"newsShowDetails",$handle);
		
		
		$newsItems=json_decode(select($tenant,"news",array("languages"=>1,"data"=>1,"schemas"=>1),array("handle"=>$handle)),true)[0];
		
		//load template
		$languages=$newsItems["languages"];

		//find default theme in dafault language
		for($i=0;$i<count($languages);$i++)
			if ($languages[$i]["isDefault"]==true)
				for($j=0;$j<count($languages[$i]["templates"]);$j++)
					if ($languages[$i]["templates"][$j]["name"]=="showDetails" &&  $languages[$i]["templates"][$j]["enabled"]==true)
						$template=$languages[$i]["templates"][$j];
		
		//load data
		for($ii=0;$ii<count($newsItems["data"]);$ii++)
		{
			if($newsItems["data"][$ii]["id"]==$_GET["id"])
				break;
		}
		$newsItem=$newsItems["data"][$ii];
		
		//load schema
		for($jj=0;$jj<count($newsItems["schemas"]);$jj++)
			if($newsItems["schemas"][$jj]["default"]==true && $newsItems["schemas"][$jj]["enabled"]==true)
				break;
		
		$addons=$newsItem["addons"];

		
		for($i=0;$i<count($addons);$i++)
		{
				if(file_exists(modulesPath.$addons[$i]["moduleName"]."/initial.php"))
				{	
				  $func_name=$addons[$i]["moduleName"]."_initial";
				  require_once(modulesPath.$addons[$i]["moduleName"]."/initial.php");
				  //because can not send NULL to refrenced parameter, define variable with NULL value and send it
				  $ref_null=NULL;
				  $ini_data=$func_name($ref_null,$addons[$i]["handle"]);
				  
				  $addonsData[$addons[$i]["handle"]]=$ini_data;
				  //$sm->assign($addons[$i]["moduleName"]."_".$addons[$i]["handle"]."_ini_data",$ini_data);
				}
		}
		
		
		//render page
		if($addons)
			$sm=renderPage($tenant,$ini,$newsItems["schemas"][$jj]["name"],array("data"=>$newsItem,"template"=>$template,"addons"=>$addonsData));
		else
			$sm=renderPage($tenant,$ini,$newsItems["schemas"][$jj]["name"],array("data"=>$newsItem,"template"=>$template,"addons"=>NULL));
		
		chdir($tempPath);
	
		}
}