<?php /* Smarty version 3.1.27, created on 2020-03-10 20:16:20
         compiled from "D:\wamp\www\Mobina_new_master\Public\Modules\news\templates\news_news.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:152865e67c45c6e0396_87562796%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6204e6ab9417f98633b2c3c330ae799229a80326' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new_master\\Public\\Modules\\news\\templates\\news_news.tpl',
      1 => 1583839773,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '152865e67c45c6e0396_87562796',
  'variables' => 
  array (
    'content' => 0,
    'i' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5e67c45c92a322_83225876',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5e67c45c92a322_83225876')) {
function content_5e67c45c92a322_83225876 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '152865e67c45c6e0396_87562796';
?>
<div style="width:100%;text-align:justify;">
------------------------------------------------------------------
<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['i']->step = 1;$_smarty_tpl->tpl_vars['i']->total = (int) ceil(($_smarty_tpl->tpl_vars['i']->step > 0 ? count($_smarty_tpl->tpl_vars['content']->value["addons"]["news1Addon1"]["content"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['content']->value["addons"]["news1Addon1"]["content"])-1)+1)/abs($_smarty_tpl->tpl_vars['i']->step));
if ($_smarty_tpl->tpl_vars['i']->total > 0) {
for ($_smarty_tpl->tpl_vars['i']->value = 0, $_smarty_tpl->tpl_vars['i']->iteration = 1;$_smarty_tpl->tpl_vars['i']->iteration <= $_smarty_tpl->tpl_vars['i']->total;$_smarty_tpl->tpl_vars['i']->value += $_smarty_tpl->tpl_vars['i']->step, $_smarty_tpl->tpl_vars['i']->iteration++) {
$_smarty_tpl->tpl_vars['i']->first = $_smarty_tpl->tpl_vars['i']->iteration == 1;$_smarty_tpl->tpl_vars['i']->last = $_smarty_tpl->tpl_vars['i']->iteration == $_smarty_tpl->tpl_vars['i']->total;?>

<h2 style="color:green"><?php echo $_smarty_tpl->tpl_vars['content']->value["addons"]["news1Addon1"]["content"][$_smarty_tpl->tpl_vars['i']->value]["title"];?>
</h2>

<h3><?php echo $_smarty_tpl->tpl_vars['content']->value["addons"]["news1Addon1"]["content"][$_smarty_tpl->tpl_vars['i']->value]["shortDescription"];?>
</h3>

<h4><?php echo $_smarty_tpl->tpl_vars['content']->value["addons"]["news1Addon1"]["content"][$_smarty_tpl->tpl_vars['i']->value]["longDescription"];?>
</h4>

<?php }} ?>
------------------------------------------------------------------
</div><?php }
}
?>