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


function insert($tenant,$collectionName,$data)
{
  
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


function update($tenant,$collectionName,$data,$condition=array())
{
    
  $connection=connect($tenant);
  $collectionName=$connection['tenantCollectionPrefix'].$collectionName;
  try{    
  $newdata = array('$set' => $data);
  $result=$connection['connctionString']->$connection['tenantDbName']->$collectionName->update($condition,$newdata);
  }
  catch(MongoException $e)
  {
	echo "error message: ".$e->getMessage()."\n";
  }
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