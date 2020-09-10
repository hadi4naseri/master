<?php /* Smarty version 3.1.27, created on 2020-03-12 13:32:43
         compiled from "D:\wamp\www\Mobina_new\Tenants\main\Assets\Templates\local_themes\G1\index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:256655e6a08c3c17617_91188019%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '07fe2caccfdd01678c2c8ec1898d7e8ed3e6d8b9' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new\\Tenants\\main\\Assets\\Templates\\local_themes\\G1\\index.tpl',
      1 => 1584007359,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '256655e6a08c3c17617_91188019',
  'variables' => 
  array (
    'siteDomain' => 0,
    'Schema' => 0,
    'urlPatch' => 0,
    'siteLang' => 0,
    'content' => 0,
    'news_mainNews_ini_data' => 0,
    'forms_loginForm_ini_data' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5e6a08c431e993_01733989',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5e6a08c431e993_01733989')) {
function content_5e6a08c431e993_01733989 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '256655e6a08c3c17617_91188019';
?>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/Assets/js/jquery-3.1.1.min.js"><?php echo '</script'; ?>
>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $_smarty_tpl->tpl_vars['Schema']->value["Properties"]["title"];?>
</title>
<meta name="keywords" content="<?php echo $_smarty_tpl->tpl_vars['Schema']->value['Properties']['keywords'];?>
" />
<meta name="description" content="<?php echo $_smarty_tpl->tpl_vars['Schema']->value['Properties']['description'];?>
" />
<link href="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

<!-- Add fancyBox main CSS files -->
<link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/Assets/js/fancy/source/jquery.fancybox.css?v=2.1.5" media="screen" />

<?php echo '<script'; ?>
 type="text/javascript">
var siteDomain="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
";
var siteLang="<?php echo $_smarty_tpl->tpl_vars['siteLang']->value;?>
";
<?php echo '</script'; ?>
>

</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="#">IT as a Service</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="#" accesskey="2" title="">ITaaS چیست؟</a></li>
				<li><a href="#" accesskey="3" title="" >درباره ما</a></li>
				<li><a href="#" accesskey="5" title="">ارتباط با ما</a></li>
				<li class="active"><a href="#" accesskey="1" title="">خانه</a></li>
			</ul>
		</div>
	</div>

<div id="banner-wrapper">
	<div id="banner" class="container">
		<div class="title">
			<h2> خدمات متمایز فناوری اطلاعات</h2>
		</div>
		<ul class="actions">
			<li><a href="#" class="button">بیشتر بدانید</a></li>
		</ul>
	</div>
</div>
</div>
<div id="wrapper">
	<?php if ($_smarty_tpl->tpl_vars['content']->value == '') {?>
	<div id="three-column" class="container">
	
		<div class="title">
			<h2>Feugiat lorem ipsum dolor sed veroeros</h2>
			<span class="byline">Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue</span>
		</div>
		<div class="boxA">
			<p>...</p>
			<a href="#" class="button button-alt">More Info</a>
		</div>
		<div class="boxB">
			
			<p><?php if (findModuleInSchema("news","mainNews",$_smarty_tpl->tpl_vars['Schema']->value) != false) {
echo $_smarty_tpl->getSubTemplate (loadTemplate("news","mainNews",$_smarty_tpl->tpl_vars['news_mainNews_ini_data']->value["template"],$_smarty_tpl->tpl_vars['Schema']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
}?></p>
			
			
			<a href="#" class="button button-alt">More Info</a>
		</div>
		<div class="boxC">
			
			<p> <?php if (findModuleInSchema("forms","loginForm",$_smarty_tpl->tpl_vars['Schema']->value) == true) {?>
			<?php echo $_smarty_tpl->getSubTemplate (loadTemplate("forms","loginForm",$_smarty_tpl->tpl_vars['forms_loginForm_ini_data']->value["template"],$_smarty_tpl->tpl_vars['Schema']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
?>

			<br/>
			
			
			<?php }?></p>
		</div>
	</div>
	<?php } else { ?>
		
		<?php echo $_smarty_tpl->getSubTemplate (loadTemplate("news","mainNews",$_smarty_tpl->tpl_vars['content']->value["template"],NULL), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
?>

		
	<?php }?>
</div>

<div id="copyright" class="container">
	<p>کلیه حقوق معنوی این سایت متعلق به ITaaS.ir می باشد</p>
</div>

<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/Assets/js/jquery-ui.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/Assets/js/Common.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/Assets/js/fancy/source/jquery.fancybox.js?v=2.1.5"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript">
$(document).ready(function() {
		$('.fancybox').fancybox();});
		<?php echo '</script'; ?>
>
</body>
</html>
<?php }
}
?>