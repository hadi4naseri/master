<?php /* Smarty version 3.1.27, created on 2020-03-25 02:46:25
         compiled from "D:\wamp\www\Mobina_new_master\Public\Modules\forms\templates\loginForm.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:123465e7a86b9954718_95356202%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '96d2e85eb334ad1f7e2c6f6f60196c285a15db4e' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new_master\\Public\\Modules\\forms\\templates\\loginForm.tpl',
      1 => 1585088183,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '123465e7a86b9954718_95356202',
  'variables' => 
  array (
    'tenantName' => 0,
    'forms_loginForm_ini_data' => 0,
    'ii' => 0,
    'moduleName' => 0,
    'handle' => 0,
    'addon_ini' => 0,
    'userName' => 0,
    'siteDomain' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5e7a86ba13e3c4_39973047',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5e7a86ba13e3c4_39973047')) {
function content_5e7a86ba13e3c4_39973047 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '123465e7a86b9954718_95356202';
?>
<div style="text-align:center">
<?php if (!isset($_COOKIE['userToken']) || validatetoken($_smarty_tpl->tpl_vars['tenantName']->value,$_COOKIE['userToken']) == false) {?>
<span>برای ورود به سیستم اطلاعات زیر را تکمیل نمائید :</span><br/><br/>
<?php echo $_smarty_tpl->tpl_vars['forms_loginForm_ini_data']->value["content"]["form"];?>


<br/>
<?php $_smarty_tpl->tpl_vars['ii'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['ii']->step = 1;$_smarty_tpl->tpl_vars['ii']->total = (int) ceil(($_smarty_tpl->tpl_vars['ii']->step > 0 ? count($_smarty_tpl->tpl_vars['forms_loginForm_ini_data']->value["addons"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['forms_loginForm_ini_data']->value["addons"])-1)+1)/abs($_smarty_tpl->tpl_vars['ii']->step));
if ($_smarty_tpl->tpl_vars['ii']->total > 0) {
for ($_smarty_tpl->tpl_vars['ii']->value = 0, $_smarty_tpl->tpl_vars['ii']->iteration = 1;$_smarty_tpl->tpl_vars['ii']->iteration <= $_smarty_tpl->tpl_vars['ii']->total;$_smarty_tpl->tpl_vars['ii']->value += $_smarty_tpl->tpl_vars['ii']->step, $_smarty_tpl->tpl_vars['ii']->iteration++) {
$_smarty_tpl->tpl_vars['ii']->first = $_smarty_tpl->tpl_vars['ii']->iteration == 1;$_smarty_tpl->tpl_vars['ii']->last = $_smarty_tpl->tpl_vars['ii']->iteration == $_smarty_tpl->tpl_vars['ii']->total;?>


<?php $_smarty_tpl->tpl_vars['addon_ini'] = new Smarty_Variable('', null, 0);?>
<?php $_smarty_tpl->tpl_vars['moduleName'] = new Smarty_Variable($_smarty_tpl->tpl_vars['forms_loginForm_ini_data']->value["addons"][$_smarty_tpl->tpl_vars['ii']->value]["moduleName"], null, 0);?>
<?php $_smarty_tpl->tpl_vars['handle'] = new Smarty_Variable($_smarty_tpl->tpl_vars['forms_loginForm_ini_data']->value["addons"][$_smarty_tpl->tpl_vars['ii']->value]["handle"], null, 0);?>

<?php $_smarty_tpl->tpl_vars['addon_ini'] = new Smarty_Variable(((((('{$').($_smarty_tpl->tpl_vars['moduleName']->value)).("_")).($_smarty_tpl->tpl_vars['handle']->value)).("_ini_data")).('}'), null, 0);?>

<?php ob_start();
$_template = new Smarty_Internal_Template('eval:'.$_smarty_tpl->tpl_vars['addon_ini']->value, $_smarty_tpl->smarty, $_smarty_tpl);echo $_template->fetch();
$_tmp1=ob_get_clean();
$_smarty_tpl->tpl_vars['ab'] = new Smarty_Variable($_tmp1, null, 0);?>


<?php echo $_smarty_tpl->getSubTemplate (loadTemplate($_smarty_tpl->tpl_vars['forms_loginForm_ini_data']->value["addons"][$_smarty_tpl->tpl_vars['ii']->value]["moduleName"],$_smarty_tpl->tpl_vars['forms_loginForm_ini_data']->value["addons"][$_smarty_tpl->tpl_vars['ii']->value]["handle"],$_smarty_tpl->tpl_vars['forms_loginForm_ini_data']->value["addons"][$_smarty_tpl->tpl_vars['ii']->value]["addonData"]["template"]), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
?>

<?php }} ?>

<?php } else { ?>
<?php if (validateToken($_smarty_tpl->tpl_vars['tenantName']->value,$_COOKIE['userToken'])) {?>
<span><b><?php echo $_smarty_tpl->tpl_vars['userName']->value;?>
</b>، شما به سیستم وارد شده اید...</span><br/><br/>

<span><a onmouseover='$(this).css("font-weight","bold");' onmouseout='$(this).css("font-weight","normal");' class="general fancybox fancybox.ajax" style="color:black;text-decoration:black" href="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/modules/admin/functions/systemCenter.php?tenant=<?php echo $_smarty_tpl->tpl_vars['tenantName']->value;?>
&Sid=<?php echo $_COOKIE['userToken'];?>
">مرکز کنترل سیستم</a></span><br/>

<span><a onmouseover='$(this).css("font-weight","bold");' onmouseout='$(this).css("font-weight","normal");' class="general fancybox fancybox.ajax" style="color:black;text-decoration:black" href="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/modules/admin/functions/moduleStore.php?tenant=<?php echo $_smarty_tpl->tpl_vars['tenantName']->value;?>
&Sid=<?php echo $_COOKIE['userToken'];?>
">فروشگاه ماژول</a></span><br/>

<span><a onmouseover='$(this).css("font-weight","bold");' onmouseout='$(this).css("font-weight","normal");' href="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/modules/admin/functions/logout.php?tenant=<?php echo $_smarty_tpl->tpl_vars['tenantName']->value;?>
&Sid=<?php echo $_COOKIE['userToken'];?>
" style="color:red;text-decoration:red">خروج از سیستم</a></span>
<?php }?>
<?php }?>

</div><?php }
}
?>