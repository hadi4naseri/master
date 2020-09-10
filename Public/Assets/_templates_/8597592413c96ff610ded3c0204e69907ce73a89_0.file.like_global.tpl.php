<?php /* Smarty version 3.1.27, created on 2020-03-18 23:54:59
         compiled from "D:\wamp\www\Mobina_new_master\Public\Modules\like\templates\like_global.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:211545e72839b83c464_42826301%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8597592413c96ff610ded3c0204e69907ce73a89' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new_master\\Public\\Modules\\like\\templates\\like_global.tpl',
      1 => 1584563083,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '211545e72839b83c464_42826301',
  'variables' => 
  array (
    'news_mainNews_ini_data' => 0,
    'siteDomain' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5e72839ba6ae61_92208954',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5e72839ba6ae61_92208954')) {
function content_5e72839ba6ae61_92208954 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '211545e72839b83c464_42826301';
?>
<div style="width:100%;text-align:justify;">

<?php if ($_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["addons"]["like_news_main"]["content"]["visible"] == true) {?>
<a href="#"><?php echo $_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["addons"]["like_news_main"]["content"]["like"];?>
<img src="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/Modules/like/templates/pics/like.png" style=width:32px;height:32px;/></a>
&nbsp;&nbsp;&nbsp;
<a href="#"><?php echo $_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["addons"]["like_news_main"]["content"]["dislike"];?>
<img src="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/Modules/like/templates/pics/dislike.png" style=width:32px;height:32px;/></a>
<?php }?>

</div><?php }
}
?>