<?php /* Smarty version 3.1.27, created on 2017-06-27 21:47:37
         compiled from "D:\wamp\www\Mobina_new\Tenants\main\Modules\login\templates\lgn.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:28468595293315af484_76538518%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f1505dcf1d65284896915838e2e91694815b5ac9' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new\\Tenants\\main\\Modules\\login\\templates\\lgn.tpl',
      1 => 1480619939,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '28468595293315af484_76538518',
  'variables' => 
  array (
    'login_forms_f1_ini_data' => 0,
    'tenantName' => 0,
    'userName' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5952933184b4a0_65571595',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5952933184b4a0_65571595')) {
function content_5952933184b4a0_65571595 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '28468595293315af484_76538518';
?>
<div style="text-align:center">
<?php if (!isset($_COOKIE['userTocken'])) {?>
<span>برای ورود به سیستم اطلاعات زیر را تکمیل نمائید :</span><br/><br/>
<?php echo $_smarty_tpl->tpl_vars['login_forms_f1_ini_data']->value["form"];?>

<?php } else { ?>
<?php if (validateTocken($_smarty_tpl->tpl_vars['tenantName']->value,$_COOKIE['userTocken'])) {?>
<span><b><?php echo $_smarty_tpl->tpl_vars['userName']->value;?>
</b>، شما به سیستم وارد شده اید...</span><br/><br/>
<span><a style="color:black;text-decoration:black" href="javascript:;">مرکز کنترل سیستم</a></span><br/><br/>
<span><a href="javascript:;" style="color:red;text-decoration:red">خروج از سیستم</a></span>
<?php } else { ?>
<span style="color:red;font-size:12px;">متاسفانه cookie ایجاد شده بر روی سیستم شما نامعتبر است.برای ادامه آن را پاک کرده و صفحه را مجددا بارگزاری نمائید</span>
<?php }?>
<?php }?>
</div><?php }
}
?>