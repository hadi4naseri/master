<?php /* Smarty version 3.1.27, created on 2020-03-12 23:25:57
         compiled from "D:\wamp\www\Mobina_new_master\Public\Modules\news\templates\news.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:71775e6a93cd4a4723_31841548%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ea50069991b2ae456d4c2f0adaa34dd89832e365' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new_master\\Public\\Modules\\news\\templates\\news.tpl',
      1 => 1584042955,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '71775e6a93cd4a4723_31841548',
  'variables' => 
  array (
    'news_mainNews_ini_data' => 0,
    'tenantDomain' => 0,
    'tenantName' => 0,
    'i' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5e6a93cd82ebf2_32346248',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5e6a93cd82ebf2_32346248')) {
function content_5e6a93cd82ebf2_32346248 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '71775e6a93cd4a4723_31841548';
?>
<div style="width:100%;text-align:justify;">


<?php echo $_smarty_tpl->getSubTemplate (loadTemplate($_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["addons"]["like_news_main"]["moduleName"],$_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["addons"]["like_news_main"]["handle"],$_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["addons"]["like_news_main"]["template"],NULL), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
?>



<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['i']->step = 1;$_smarty_tpl->tpl_vars['i']->total = (int) ceil(($_smarty_tpl->tpl_vars['i']->step > 0 ? count($_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["content"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["content"])-1)+1)/abs($_smarty_tpl->tpl_vars['i']->step));
if ($_smarty_tpl->tpl_vars['i']->total > 0) {
for ($_smarty_tpl->tpl_vars['i']->value = 0, $_smarty_tpl->tpl_vars['i']->iteration = 1;$_smarty_tpl->tpl_vars['i']->iteration <= $_smarty_tpl->tpl_vars['i']->total;$_smarty_tpl->tpl_vars['i']->value += $_smarty_tpl->tpl_vars['i']->step, $_smarty_tpl->tpl_vars['i']->iteration++) {
$_smarty_tpl->tpl_vars['i']->first = $_smarty_tpl->tpl_vars['i']->iteration == 1;$_smarty_tpl->tpl_vars['i']->last = $_smarty_tpl->tpl_vars['i']->iteration == $_smarty_tpl->tpl_vars['i']->total;?>


<p onmouseover='color=$(this).css("background-color");$(this).css("background-color","darkgreen")' onmouseout='$(this).css("background-color",color)'>
<span style="font-weight:bold"><a href='<?php echo $_smarty_tpl->tpl_vars['tenantDomain']->value;?>
Tenants/<?php echo $_smarty_tpl->tpl_vars['tenantName']->value;?>
/Modules/news/functions/details.php?handle=<?php echo $_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["handle"];?>
&id=<?php echo $_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["content"][$_smarty_tpl->tpl_vars['i']->value]["id"];?>
'><?php echo $_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["content"][$_smarty_tpl->tpl_vars['i']->value]["title"];?>
</a></span>
<br/>
<?php echo $_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["content"][$_smarty_tpl->tpl_vars['i']->value]["shortDescription"];?>

</p>
<?php }} ?>


<small>template from global tenant</small>
</div><?php }
}
?>