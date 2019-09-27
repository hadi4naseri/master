<?php

include_once($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/App/Libs/jdate/jdf.php");

function connect($tenant)
{
   include($_SERVER["DOCUMENT_ROOT"]."Mobina_new_master/Public/config.php");
   
   try{
	   
   $connection = new MongoClient("mongodb://".$db_host,array('username'=>$db_main_user,"password"=>$db_main_pass,"db"=>$db_main));
   /*$connection = new MongoClient('mongodb://127.0.0.1:27017',[
    'username' => 'mobina_admin',
    'password' => 'MB1N@186',
    'db'       => 'Mobina'
]);*/
	}
	catch (MongoConnectionException $e)
	{
		die("Error in connecting to DataBase...");
	}
   if ($tenant=="Mobina")
      return $connection;
   $db=$connection->$db_main;
   $col_name="Tenants";
   $col=$db->$col_name;
   $tenant_info=$col->findOne(array("name"=>$tenant));
   $tenant_db=$tenant_info["dbName"];
   $tenant_db_user=$tenant_info["dbUser"];
   $tenant_db_pass=$tenant_info["dbPass"];
   try
   {
   $connection_tenant = new MongoClient("mongodb://".$db_host,array('username'=>$tenant_db_user,"password"=>$tenant_db_pass,"db"=>$tenant_db));
   $ret_data=array("connctionString"=>$connection_tenant,"tenantCollectionPrefix"=>$tenant_info["collectionPrefix"],"tenantDbName"=>$tenant_info["dbName"]);
   return $ret_data;
   }
   catch (MongoConnectionException $e)
   {
		echo "error message: ".$e->getMessage()."\n";
   }
   
}


function select($tenant,$collectionName,$project=array(),$condition=array(),$limit=0)
{
 
  //Search for _id
  $kys=array_keys($project);
  $found=false;
  for($i=0;$i<count($kys);$i++)
	if (ltrim("_id")==ltrim($kys[$i]))
		{$found=true;break;}
  if(!$found) $project["_id"]=0;
  
  $connection=connect($tenant);
  $collectionName=$connection['tenantCollectionPrefix'].$collectionName;
  try{    
  $result=$connection['connctionString']->$connection['tenantDbName']->$collectionName->find($condition,$project)->limit($limit);
  return json_encode(iterator_to_array($result));
  }
  catch(MongoException $e)
  {
	echo "error message: ".$e->getMessage()."\n";
  }
  
}


function select_distinct($tablename,$criteria,$condition="")
{
  $tablename=$_SESSION['db_prefix'].$tablename;
  $connection=connect();
  if ($condition!="")
     $result=$connection->query("select distinct ".$criteria." from ".$tablename." where ".$condition);
  else
     $result=$connection->query("select distinct ".$criteria." from ".$tablename);
  //return data...
  $ret = array(); 
  while($row = $result->fetch(PDO::FETCH_NUM)) {
    array_push($ret,$row);
	}
	$result->closeCursor();
	$connection = null;	
  return $ret;
}

function insert($tenant,$collectionName,$data)
{
/*
  //make field list
  $arr_keys=array();
  $arr_keys=array_keys($data);
  $names="";
  
  $names.=$arr_keys[0];
  for($i=1;$i<count($arr_keys);$i++)
     $names.=",".$arr_keys[$i];
  
  //make value list
  $arr_vals=array();
  $arr_vals=array_values($data);
  $values="";
  
  $values.="'".$arr_vals[0]."'";
  for($i=1;$i<count($arr_vals);$i++)
     $values.=",'".$arr_vals[$i]."'";
    
  */
  
  $connection=connect($tenant);
  $collectionName=$connection['tenantCollectionPrefix'].$collectionName;
  try{    
  $result=$connection['connctionString']->$connection['tenantDbName']->$collectionName->insert($data);
  return $result['ok'];
  }
  catch(MongoException $e)
  {
	echo "error message: ".$e->getMessage()."\n";
  }
  
}

//data must be in array form
function update($tablename,$data,$condition="")
{
  //make field list
  $arr_keys=array();
  $arr_keys=array_keys($data);
  $names="";
  
  $names.=$arr_keys[0];
  for($i=1;$i<count($arr_keys);$i++)
     $names.=",".$arr_keys[$i];
  
  //make value list
  $arr_vals=array();
  $arr_vals=array_values($data);
  $values="";
  
  $values.="'".$arr_vals[0]."'";
  for($i=1;$i<count($arr_vals);$i++)
     $values.=",'".$arr_vals[$i]."'";
    
  $query="";
  $query.=$arr_keys[0]."='".$arr_vals[0]."'";
  for($i=1;$i<count($arr_keys);$i++)
     $query.=",".$arr_keys[$i]."='".$arr_vals[$i]."'";
     
  $tablename=$_SESSION['db_prefix'].$tablename;
  $connection=connect();
  if ($condition!="")
  {
	 $result=$connection->query("update ".$tablename." set ".$query." where ".$condition);
    if ($result===FALSE)
       return "false";
    }
    else
     {
	 
     $result=$connection->query("update ".$tablename." set ".$query);      
     if ($result===FALSE)
       return "false";
     }

    //register log.....
    if (count($arr_keys)>1)
      log_register("Update",$tablename,implode(",",$arr_keys),implode(",",$arr_vals));
      else
        log_register("Update",$tablename,$arr_keys[0],$arr_vals[0]);  
    $result->closeCursor();
	$connection = null;	
	return $result;
}


function delete($tenant,$collectionName,$criteria="")
{
  $connection=connect($tenant);
  $collectionName=$connection['tenantCollectionPrefix'].$collectionName;
  try{    
  $result=$connection['connctionString']->$connection['tenantDbName']->$collectionName->remove($criteria);
  return $result;
  }
  catch(MongoException $e)
  {
	echo "error message: ".$e->getMessage()."\n";
  }

}

?>