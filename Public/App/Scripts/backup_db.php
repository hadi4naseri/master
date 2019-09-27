<?php
session_start();
$temp_path=getcwd();
chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
require_once("config.php");
require_once("db/functions.php");
if (has_access($_SERVER['PHP_SELF'],@$_COOKIE['current_user']))
{

  //create backup....
	$c=connect();
	$tables = array();
	$result = $c->query('SHOW TABLES');

	while($row = $result->fetch(PDO::FETCH_NUM))
	{
		$tables[] = $row[0];
	}

	$tc=count($tables);
	//cycle through
	$ret_val='';
	for($k=0;$k<$tc;$k++)
	{

		$result = $c->query('SELECT * FROM '.$tables[$k]);
		$num_field = $result->columnCount();
		$row_t = $c->query('SHOW CREATE TABLE '.$tables[$k]);
		$row2=$row_t->fetch(PDO::FETCH_NUM);
		$ret_val.= "\n\n".$row2[1].";\n\n";
		
		for ($i = 0; $i < $num_field; $i++) 
		{
			while($row = $result->fetch(PDO::FETCH_NUM))
			{
				$ret_val.= 'INSERT INTO '.$tables[$k].' VALUES(';
				for($j=0; $j<$num_field; $j++) 
				{
					$row[$j] = addslashes($row[$j]);
					$row[$j] = preg_replace("/\n/","\\n",$row[$j]);
					if (isset($row[$j])) { $ret_val.= '"'.$row[$j].'"' ; } else { $ret_val.= '""'; }
					if ($j<($num_field-1)) { $ret_val.= ','; }
				}
				$ret_val.= ");\n";
			}
		}
		$ret_val.="\n\n\n";
		
	}

	//save file
	$nme='db-backup-'.date('d.m.y').'.sql';
	$handle = fopen('admin/Files/'.$nme,'w+');
	fwrite($handle,$ret_val);
	fclose($handle);

  //------
  chdir($temp_path);
  require_once("functions.php");
  $sm=create_admin_smarty_obj();
  $sm->assign("backup_name",$nme);
  $sm->assign("site_domain",siteDomain);
  $sm->display("backup.tpl");
  }
else
{
	access_denied();
}
?>