<?php /* Smarty version 3.1.27, created on 2020-03-10 19:02:57
         compiled from "D:\wamp\www\Mobina_new_master\Public\Modules\news\templates\news-login.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:36785e67b3290ec498_27521136%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5a942342774cbd1ce7793c48680bc17ef07c359f' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new_master\\Public\\Modules\\news\\templates\\news-login.tpl',
      1 => 1583615786,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '36785e67b3290ec498_27521136',
  'variables' => 
  array (
    'news_loginNews_ini_data' => 0,
    'tenantDomain' => 0,
    'tenantName' => 0,
    'i' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5e67b329355825_72182144',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5e67b329355825_72182144')) {
function content_5e67b329355825_72182144 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '36785e67b3290ec498_27521136';
?>
<div style="width:100%;text-align:justify;">
<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['i']->step = 1;$_smarty_tpl->tpl_vars['i']->total = (int) ceil(($_smarty_tpl->tpl_vars['i']->step > 0 ? count($_smarty_tpl->tpl_vars['news_loginNews_ini_data']->value["content"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['news_loginNews_ini_data']->value["content"])-1)+1)/abs($_smarty_tpl->tpl_vars['i']->step));
if ($_smarty_tpl->tpl_vars['i']->total > 0) {
for ($_smarty_tpl->tpl_vars['i']->value = 0, $_smarty_tpl->tpl_vars['i']->iteration = 1;$_smarty_tpl->tpl_vars['i']->iteration <= $_smarty_tpl->tpl_vars['i']->total;$_smarty_tpl->tpl_vars['i']->value += $_smarty_tpl->tpl_vars['i']->step, $_smarty_tpl->tpl_vars['i']->iteration++) {
$_smarty_tpl->tpl_vars['i']->first = $_smarty_tpl->tpl_vars['i']->iteration == 1;$_smarty_tpl->tpl_vars['i']->last = $_smarty_tpl->tpl_vars['i']->iteration == $_smarty_tpl->tpl_vars['i']->total;?>
<p onmouseover='$(this).css("border","2px solid red")' onmouseout='$(this).css("border","0px")'>
<div style="font-weight:bold">*<a href='<?php echo $_smarty_tpl->tpl_vars['tenantDomain']->value;?>
Tenants/<?php echo $_smarty_tpl->tpl_vars['tenantName']->value;?>
/Modules/news/functions/details.php?handle=<?php echo $_smarty_tpl->tpl_vars['news_loginNews_ini_data']->value["handle"];?>
&id=<?php echo $_smarty_tpl->tpl_vars['news_loginNews_ini_data']->value["content"][$_smarty_tpl->tpl_vars['i']->value]["id"];?>
'><?php echo $_smarty_tpl->tpl_vars['news_loginNews_ini_data']->value["content"][$_smarty_tpl->tpl_vars['i']->value]["title"];?>
</a>*</div>
<br/>
<?php echo $_smarty_tpl->tpl_vars['news_loginNews_ini_data']->value["content"][$_smarty_tpl->tpl_vars['i']->value]["shortDescription"];?>

</p>
<?php }} ?>
</div><?php }
}
?>