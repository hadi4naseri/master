<?php /* Smarty version 3.1.27, created on 2020-03-10 20:16:20
         compiled from "D:\wamp\www\Mobina_new\Tenants\main\Modules\news\templates\newsDetails.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:182575e67c45c248602_54425653%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2e3a4642cfd2a16f633b0efbfefb4a393695a314' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new\\Tenants\\main\\Modules\\news\\templates\\newsDetails.tpl',
      1 => 1583839032,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '182575e67c45c248602_54425653',
  'variables' => 
  array (
    'content' => 0,
    'k' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5e67c45c696005_21133187',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5e67c45c696005_21133187')) {
function content_5e67c45c696005_21133187 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '182575e67c45c248602_54425653';
?>
<div style="color:black;">





<h2><?php echo $_smarty_tpl->tpl_vars['content']->value["data"]["title"];?>
</h2>

<h3><?php echo $_smarty_tpl->tpl_vars['content']->value["data"]["shortDescription"];?>
</h3>

<h4><?php echo $_smarty_tpl->tpl_vars['content']->value["data"]["longDescription"];?>
</h4>

<br/>
<?php if ($_smarty_tpl->tpl_vars['content']->value["data"]["addons"]) {?>
<?php $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['k']->step = 1;$_smarty_tpl->tpl_vars['k']->total = (int) ceil(($_smarty_tpl->tpl_vars['k']->step > 0 ? count($_smarty_tpl->tpl_vars['content']->value["data"]["addons"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['content']->value["data"]["addons"])-1)+1)/abs($_smarty_tpl->tpl_vars['k']->step));
if ($_smarty_tpl->tpl_vars['k']->total > 0) {
for ($_smarty_tpl->tpl_vars['k']->value = 0, $_smarty_tpl->tpl_vars['k']->iteration = 1;$_smarty_tpl->tpl_vars['k']->iteration <= $_smarty_tpl->tpl_vars['k']->total;$_smarty_tpl->tpl_vars['k']->value += $_smarty_tpl->tpl_vars['k']->step, $_smarty_tpl->tpl_vars['k']->iteration++) {
$_smarty_tpl->tpl_vars['k']->first = $_smarty_tpl->tpl_vars['k']->iteration == 1;$_smarty_tpl->tpl_vars['k']->last = $_smarty_tpl->tpl_vars['k']->iteration == $_smarty_tpl->tpl_vars['k']->total;?>
	<?php echo $_smarty_tpl->getSubTemplate (loadTemplate($_smarty_tpl->tpl_vars['content']->value["data"]["addons"][$_smarty_tpl->tpl_vars['k']->value]["moduleName"],$_smarty_tpl->tpl_vars['content']->value["data"]["addons"][$_smarty_tpl->tpl_vars['k']->value]["handle"],$_smarty_tpl->tpl_vars['content']->value["addons"][$_smarty_tpl->tpl_vars['content']->value["data"]["addons"][$_smarty_tpl->tpl_vars['k']->value]["handle"]]["template"],NULL), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
?>

<?php }} ?>
<?php }?>

</div>
<?php }
}
?>