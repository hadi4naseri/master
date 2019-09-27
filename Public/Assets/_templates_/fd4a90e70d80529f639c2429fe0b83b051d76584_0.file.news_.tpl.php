<?php /* Smarty version 3.1.27, created on 2017-06-27 21:47:37
         compiled from "D:\wamp\www\Mobina_new\Tenants\main\Modules\news\templates\news_.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:16903595293311fdea0_25083423%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fd4a90e70d80529f639c2429fe0b83b051d76584' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new\\Tenants\\main\\Modules\\news\\templates\\news_.tpl',
      1 => 1467963856,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16903595293311fdea0_25083423',
  'variables' => 
  array (
    'news_ini_data' => 0,
    'tenantDomain' => 0,
    'tenantName' => 0,
    'i' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_59529331570c73_84651227',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_59529331570c73_84651227')) {
function content_59529331570c73_84651227 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '16903595293311fdea0_25083423';
?>
<div style="width:100%;text-align:justify;">

<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['i']->step = 1;$_smarty_tpl->tpl_vars['i']->total = (int) ceil(($_smarty_tpl->tpl_vars['i']->step > 0 ? count($_smarty_tpl->tpl_vars['news_ini_data']->value["body"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['news_ini_data']->value["body"])-1)+1)/abs($_smarty_tpl->tpl_vars['i']->step));
if ($_smarty_tpl->tpl_vars['i']->total > 0) {
for ($_smarty_tpl->tpl_vars['i']->value = 0, $_smarty_tpl->tpl_vars['i']->iteration = 1;$_smarty_tpl->tpl_vars['i']->iteration <= $_smarty_tpl->tpl_vars['i']->total;$_smarty_tpl->tpl_vars['i']->value += $_smarty_tpl->tpl_vars['i']->step, $_smarty_tpl->tpl_vars['i']->iteration++) {
$_smarty_tpl->tpl_vars['i']->first = $_smarty_tpl->tpl_vars['i']->iteration == 1;$_smarty_tpl->tpl_vars['i']->last = $_smarty_tpl->tpl_vars['i']->iteration == $_smarty_tpl->tpl_vars['i']->total;?>
<p>
<span style="font-weight:bold"><a href='<?php echo $_smarty_tpl->tpl_vars['tenantDomain']->value;?>
Tenants/<?php echo $_smarty_tpl->tpl_vars['tenantName']->value;?>
/Modules/news/functions/details.php?id=<?php echo $_smarty_tpl->tpl_vars['news_ini_data']->value["body"][$_smarty_tpl->tpl_vars['i']->value]["id"];?>
'><?php echo $_smarty_tpl->tpl_vars['news_ini_data']->value["body"][$_smarty_tpl->tpl_vars['i']->value]["data"]["title"];?>
</a></span>
<br/>
<?php echo $_smarty_tpl->tpl_vars['news_ini_data']->value["body"][$_smarty_tpl->tpl_vars['i']->value]["data"]["shortDescription"];?>

</p>
<?php }} ?>
</div><?php }
}
?>