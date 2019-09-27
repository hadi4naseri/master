<?php /* Smarty version 3.1.27, created on 2019-03-31 14:41:34
         compiled from "D:\wamp\www\Mobina_new\Tenants\Main\Modules\news\templates\news_.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:57915ca092565fc255_24755349%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c6fba666c9ff88a54c2f767db0caa6624573f72f' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new\\Tenants\\Main\\Modules\\news\\templates\\news_.tpl',
      1 => 1467963856,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '57915ca092565fc255_24755349',
  'variables' => 
  array (
    'news_ini_data' => 0,
    'tenantDomain' => 0,
    'tenantName' => 0,
    'i' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5ca0925684a066_63338136',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5ca0925684a066_63338136')) {
function content_5ca0925684a066_63338136 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '57915ca092565fc255_24755349';
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