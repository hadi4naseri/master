<?php

//configuration for generic settings - generic functions

require_once("App/Db/functions.php");
$app_protocol="https";
$app_host="localhost";
$db_host="localhost";
$db_auth="admin";
$db_main="Mobina";
$db_main_user="mobina_admin";
$db_main_pass="MB1N@186";
//define("defaultTenant","Main");

if (!function_exists('dbg')) {

	
	//Declarations
	define("masterDomain",$app_protocol."://".$app_host."/Mobina_new_master/");
	define("tenantDomain",$app_protocol."://".$app_host."/Mobina_new/");
	define("modulesPath",$_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/Modules/");
	define("tenantPath",$_SERVER["DOCUMENT_ROOT"]."Mobina_new/Tenants/");
	define("defaultTenant","main");
	
	
	function validateTocken($tenant,$tocken) //check Tocken for authenticate user by session
	{
		$tockenInfo=select($tenant,"sessions",array("id"=>1,"expireDate"=>1),array("id"=>strrev(substr($tocken,0,strlen($tocken)-10))));
		$tockenInfo=json_decode($tockenInfo,true);
		if (count($tockenInfo)>0)
			if ($tockenInfo[0]["expireDate"]>time())
				return true;
			else
				Session::delete_session($tocken);
		else
			return false;
	}
	
	//call every Tenant events from Event collection on adhoc usage
	function callEvent($tenant,$eventName) 
	{
		
		//execute master events
		//...
		
		//execute Tenant events
		$eventInfo=select($tenant,"events",array("BROrder"=>1,"hit"=>1,"name"=>1,"enabled"=>1),array("name"=>$eventName));
		//dbg($eventName);
		
		$eventInfo=json_decode($eventInfo,true);
	
		if ($eventInfo[0]["enabled"]==true)
		{
			include_once(tenantPath.$tenant."/Actions/".$eventInfo[0]["BROrder"]);
			$eventName();
			update($tenant,"events",array("hit"=>++$eventInfo[0]["hit"]),array("name"=>$eventName));
		}
		
		
	}
	
	//ToDo : eval security risk
	function check_condition($operand1,$operator,$operand2)
	{
		$res=json_decode($operand1,true);
		$result=true;			
		
		for($h=0;$h<count($res);$h++)
		{
			if (eval("return ".$res[$h]["value"].$operator.$operand2.";"))
			{
				continue;					
			}	
			else
				$result=false;
		}
		return $result;	
	}
	
	function dbg() {
		$param=func_get_args();
		 echo htmlspecialchars(var_dump($param),ENT_QUOTES);
		 die();
	}

	function findTenant($url)
	{
		$splt_url=explode("/",$url);
		$found=false;
		for($i=0;$i<count($splt_url);$i++)
			if ($splt_url[$i]=="Tenants"){$found=true;break;}
			if ($found==true)
				return $splt_url[++$i];
				else
					return "Mobina";
	}

	function findTemplate($moduleName,$templateArray=array(),$pgschema)
	{
		
		for ($k=0;$k<count($pgschema["modules"]);$k++)
			if (array_search($moduleName,$pgschema["modules"][$k]))
			{
				if (count($templateArray)>0)
				{	
					for($i=0;$i<count($templateArray);$i++)
						if($templateArray[$i]["isDefault"]==1)
							break;
					//die(print_r($templateArray[$i]));
					
					if ($templateArray[$i]["isLocal"]==false)
						return $templateArray[$i]["name"]."/".$templateArray[$i]["fileName"];
					else
						return $moduleName."/templates/".$templateArray[$i]["fileName"];
				}
				else
					return $moduleName."/templates/".$moduleName.".tpl";
			}
		return false;
	}

	function findSchema($tnt,$name)
	{
		$schema=select($tnt,"Schema",array("modules"=>1,"name"=>1,"Properties"=>1),array("name"=>$name));
		return json_decode($schema,true)[0];
	}

	//--------------SMARTY----------------------------------------

	function create_smarty_object($tnt)
	{
	  $tenant=$tnt;
	  include_once($_SERVER["DOCUMENT_ROOT"].'Mobina_new_master/Public/App/Libs/Smarty/Smarty.class.php');
	  $sm_obj= new Smarty();
		
	  $sm_obj->setTemplateDir(array("First" => $_SERVER["DOCUMENT_ROOT"].'Mobina_new_master/Public/Assets/templates/',"Second" => $_SERVER["DOCUMENT_ROOT"]."Mobina_new/Tenants/".$tenant."/Assets/Templates/","Third"=>$_SERVER["DOCUMENT_ROOT"].'Mobina_new_master/Public/Modules/',"Forth"=> $_SERVER["DOCUMENT_ROOT"]."Mobina_new/Tenants/".$tenant."/Modules/"));
	  
	  $sm_obj->setCompileDir($_SERVER["DOCUMENT_ROOT"].'/Mobina_new_master/Public/Assets/_templates_/');
	  $sm_obj->setConfigDir($_SERVER["DOCUMENT_ROOT"].'/Mobina_new_master/Public/Assets/configs/');
	  $sm_obj->setCacheDir($_SERVER["DOCUMENT_ROOT"].'/Mobina_new_master/Public/main/cache/');
	  return $sm_obj;
	}

	function renderPage($tenant,$ini,$page,$content="")
	{
		$sm=create_smarty_object($tenant);
			
		//find default language	
		for($i=0;$i<count($ini["siteConfig"]["langs"]);$i++)
			if ($ini["siteConfig"]["langs"][$i]["isDefault"]==1)
			{
				$langIndex=$i;
				$sm->assign("siteLang",$ini["siteConfig"]["langs"][$i]["name"]);
				break;
			}
		
		//find default theme for default language 
		for($j=0;$j<count($ini["siteConfig"]["langs"][$i]["theme"]);$j++)
			if ($ini["siteConfig"]["langs"][$langIndex]["theme"][$j]["isDefault"]==1)
			{
				$themeIndex=$j;
				$sm->assign("siteTheme",$ini["siteConfig"]["langs"][$langIndex]["theme"][$themeIndex]["name"]);
				break;
			}	
			
			

	if($ini["siteConfig"]["visibility"]==1)
		{
			if ($ini["siteConfig"]["langs"][$langIndex]["theme"][$themeIndex]["isLocal"]==0)
				$sm->assign("urlPatch",masterDomain."Public/Assets/templates/themes/".$ini["siteConfig"]["langs"][$langIndex]["theme"][$themeIndex]["name"]);
			else
				$sm->assign("urlPatch",tenantDomain."Tenants/".$tenant."/Assets/templates/local_themes/".$ini["siteConfig"]["langs"][$langIndex]["theme"][$themeIndex]["name"]);
				
			$sm->assign("siteDomain",masterDomain);
			$sm->assign("tenantDomain",tenantDomain);
			
			//Page initiatioin...
					
			$schema=findSchema($tenant,$page);

			$modules=$schema["modules"];
			
			for ($j=0;$j<count($modules);$j++)
			{
				if(file_exists(modulesPath.$modules[$j]["name"]."/initial.php"))
				{
				  $func_name=$modules[$j]["name"]."_initial";
				  require_once(modulesPath.$modules[$j]["name"]."/initial.php");
				  $ini_data=$func_name($sm);
				  $sm->assign($modules[$j]["name"]."_ini_data",$ini_data);
				}
			}
			if ($content)
			{		
				$addons=$content["data"]["addons"];
				
				for ($j=0;$j<count($addons);$j++)
				{
					if(file_exists(modulesPath.$addons[$j]["name"]."/initial.php"))
					{	
					  $func_name="_".$addons[$j]["name"]."_initial";
					  require_once(modulesPath.$addons[$j]["name"]."/initial.php");
					  $ini_data=$func_name($addons[$j]["name"],$addons[$j]["id"]);
					  
					  $sm->assign($addons[$j]["name"]."_".$addons[$j]["handle"]."_ini_data",$ini_data);
					}
				}
			}
			
			if (isset($_COOKIE['userTocken']) && validateTocken($tenant,$_COOKIE['userTocken']))
			{
				$cookieInfo=select($tenant,"sessions",array(),array("id"=>strrev(substr($_COOKIE['userTocken'],0,strlen($_COOKIE['userTocken'])-10))));
				$cookieInfo=json_decode($cookieInfo,true)[0];
				
				if ($cookieInfo['expireDate']>time())
					$sm->assign("userName",$cookieInfo['name']);
				else
					Session::delete_session(strrev(substr($_COOKIE['userTocken'],0,strlen($_COOKIE['userTocken'])-10)));

			}	
			
			$sm->assign("Schema",$schema);
			$sm->assign("tenantName",$tenant);
			if ($content)
				$sm->assign("content",$content);
			else	
				$sm->assign("content","");
			
			if ($ini["siteConfig"]["langs"][$langIndex]["theme"][$themeIndex]["isLocal"]==1)
				$sm->display("local_themes/".$ini["siteConfig"]["langs"][$langIndex]["theme"][$themeIndex]["name"]."/".$ini["siteConfig"]["langs"][$langIndex]["theme"][$themeIndex]["fileName"]);
			else
				$sm->display("themes/".$ini["siteConfig"]["langs"][$langIndex]["theme"][$themeIndex]["name"]."/".$ini["siteConfig"]["langs"][$langIndex]["theme"][$themeIndex]["fileName"]);
		}
		//if visibility for specific language is set to 0
		//ToDo : theme for error pages
		else
		{
			die("site for this language is not visible");
		}
	}
}	