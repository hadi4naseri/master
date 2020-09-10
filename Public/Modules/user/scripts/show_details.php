<?php
chdir(substr(dirname(__FILE__),0,strpos(dirname(__FILE__),"modules")-1));
require_once("config.php");
require_once("db/functions.php");

$sm=reinitial_modules("عضویت در سایت",$modules,"modules/login/templates","show_reg_form.tpl","","عضویت در سایت");

//path manipulation
$sm->assign("main_path",siteDomain."/".main_path);
$sm->assign("modules_path",siteDomain."/".modules_path);
$sm->assign("site_domain",siteDomain);

if (get_maintain_mode()==0)
$sm->display("index.tpl");
else
{
	$msg=select("config","maintain_msg","id=".$_SESSION['site_index']);
	$sm->assign("maintain_message",$msg[0][0]);
	$sm->display("maintain.tpl");
}
?>