<?php
function create_admin_smarty_obj()
{
    chdir(substr(str_replace("admin","",dirname(__FILE__)),0,-1));
	require_once("main/libs/SmartyBC.class.php");
    $sm_obj = new SmartyBC();
    $sm_obj->setTemplateDir('admin/templates/');
    $sm_obj->setCompileDir('admin/templates_c/');
    $sm_obj->setConfigDir('admin/configs/');
    $sm_obj->setCacheDir('admin/cache/');
    return $sm_obj;
}
?>