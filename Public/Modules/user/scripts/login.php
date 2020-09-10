<?php
  session_start();  
  chdir(substr(dirname(__FILE__),0,strpos(dirname(__FILE__),"modules")-1));
  $_SESSION['site_index']=$_POST['stid'];
  include_once "db/functions.php";
  include_once "modules/jdate/jdf.php";
  
  $cap=substr($_POST['val'],0,strlen($_POST['val'])-2);
  $slt=substr($_POST['val'],strlen($_POST['val'])-2);

  if ($_POST['user_val']*$slt==$cap)
  {
	/*
	//------------------------LDAP----------------------------------------
	
		// LDAP variables
	$ldaphost = "192.168.92.137";  // your ldap servers
	$ldapport = 389;                 // your ldap server's port number

	// Connecting to LDAP
	$ldap_connection = ldap_connect($ldaphost, $ldapport)
			  or die("Could not connect to $ldaphost");
	
	$ldap_password = 'AAAaaa!@#';
	$ldap_username = 'ali@mobina';
	
	  // We have to set this option for the version of Active Directory we are using.
	ldap_set_option($ldap_connection, LDAP_OPT_PROTOCOL_VERSION, 3) or die('Unable to set LDAP protocol version');
	ldap_set_option($ldap_connection, LDAP_OPT_REFERRALS, 0); // We need this for doing an LDAP search.

	 $m=ldap_bind($ldap_connection, $ldap_username, $ldap_password);
    $ldaprecord['displayName'] = "مهدیه";
    $ldaprecord['name'] = "mahdiyeh";
    $ldaprecord['sn'] = "jshdjhjshdjshdjhsjd";
    $ldaprecord['mail'] = "kdksdjhj@dhksjd.com";
    $ldaprecord['objectclass'] = array("top","person","organizationalPerson","user");
    $ldaprecord["sAMAccountName"] = "mahdiyeh";
    $ldaprecord['testField'] = "ghghghggghgh"; 
	
		
	 //$ldaprecord["unicodepwd"] = "123";
    $ldaprecord["UserAccountControl"] = "544"; 
	 $dn = 'CN=mahdiyeh,OU=test,DC=mobina,DC=co';
    $r = ldap_add($ldap_connection, $dn, $ldaprecord); 

	
	if (TRUE === ldap_bind($ldap_connection, $ldap_username, $ldap_password)){
		$ldap_base_dn = 'DC=mobina,DC=co';
		$search_filter = '(&(objectCategory=person)(samaccountname=*))';
		$attributes = array();
		$attributes[] = 'givenname';
		$attributes[] = 'mail';
		$attributes[] = 'samaccountname';
		$attributes[] = 'sn';
		$attributes[] = 'userPassword';
		$result = ldap_search($ldap_connection, $ldap_base_dn, $search_filter, $attributes);
		 
		
		if (FALSE !== $result){
			$entries = ldap_get_entries($ldap_connection, $result);
			die(print_r($entries));
			
			 // prepare data
			$x=ldap_bind($ldap_connection, "sadegh@mobina", "SSSsss1239");
			
			die(print_r($x));
			
			
			
			
			
			for ($x=0; $x<$entries['count']; $x++){
				if (!empty($entries[$x]['givenname'][0]) &&
					 !empty($entries[$x]['mail'][0]) &&
					 !empty($entries[$x]['samaccountname'][0]) &&
					 !empty($entries[$x]['sn'][0]) &&
					 'Shop' !== $entries[$x]['sn'][0] &&
					 'Account' !== $entries[$x]['sn'][0]){
					$ad_users[strtoupper(trim($entries[$x]['samaccountname'][0]))] = array('email' => strtolower(trim($entries[$x]['mail'][0])),'first_name' => trim($entries[$x]['givenname'][0]),'last_name' => trim($entries[$x]['sn'][0]));
	  
	  }
	  }
	  }
	  }
	 
	  die("test ok");
	//---------------------------------------------------------------  
	 */  
	  
	  if(isset($_COOKIE['current_user']))
	  {
		print(-3);
	  }
	  else
	  {
		  $res=array();
		  $res=select("users","username,password,slt,id,name,last_login,last_logout,grp,isActive","username='".$_POST['uname']."'");
		  $flag=-1;
		  for($i=0;$i<count($res);$i++)
		  {
			  if ($res[$i][0]==$_POST['uname']  &&  md5(substr($res[$i][2],0,4).$_POST['pass'].substr($res[$i][2],4,4))==$res[$i][1] && $res[$i][8])
			  {
				$flag=$i;
				break;
			  }
			  else if ($res[$i][0]==$_POST['uname']  &&  md5(substr($res[$i][2],0,4).$_POST['pass'].substr($res[$i][2],4,4))==$res[$i][1] && $res[$i][8]==0)
			  {
				$flag=-100;
				break;
			  }
		  }
		  if ($flag==-1)
			print("-1");
		  else if($flag==-100)
			print("-100");
		  else
		  {
			if (isset($_SESSION[$res[$flag][0]]) and $res[$flag][0]==true)
			print("-99");
			else
			{
				$s_ini=select("config","maintain_mode","id=".$_POST['stid']);
				if ($s_ini[0][0]==2 && $res[$flag][7]!=1)
				print ("-88");
				else
				{
					ob_start();
					$uid=$res[$flag][0];
					
					$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
					$randomString = '';
					for ($i = 0; $i < 25; $i++) {
						$randomString .= $characters[rand(0, strlen($characters) - 1)];
					}
					
					$randomString=$randomString.",".$_POST['stid'];
					
					insert("sessions",array("handle"=>$randomString,"username"=>$res[$flag][0],"name"=>$res[$flag][4],"userid"=>$res[$flag][3],"groupid"=>$res[$flag][7]));
					
					setcookie("current_user",$randomString,time()+3600,'/');
					$msg_cnt=select("messages","id","to_user=".$res[$flag][3]);			
					/*$res=insert("users",array("last_login" => jdate('Y/n/j-H:i:s'),"another_parameter" => "parameter_value",.......));*/
					$_SESSION[$uid]=array($res[$flag][3],$res[$flag][5],$res[$flag][6],$res[$flag][4],$res[$flag][0],$res[$flag][7],count($msg_cnt));
					$res=update("users",array("last_login" => jdate('Y/n/j-H:i:s')),"id=".$res[$flag][3]);
					ob_end_flush();
					print($uid);
				}
			}	
		  }
		}
  }
  else
  {
	print(-2);
  }
  