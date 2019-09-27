<?php /* Smarty version 3.1.27, created on 2017-06-27 21:47:35
         compiled from "D:\wamp\www\Mobina_new\Tenants\main\Assets\Templates\local_themes\G1\index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:82625952932fcc7581_08668757%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '07fe2caccfdd01678c2c8ec1898d7e8ed3e6d8b9' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new\\Tenants\\main\\Assets\\Templates\\local_themes\\G1\\index.tpl',
      1 => 1490984000,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '82625952932fcc7581_08668757',
  'variables' => 
  array (
    'pageSchema' => 0,
    'urlPatch' => 0,
    'siteDomain' => 0,
    'siteLang' => 0,
    'content' => 0,
    'news_ini_data' => 0,
    'login_ini_data' => 0,
    'i' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_59529331002133_33790506',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_59529331002133_33790506')) {
function content_59529331002133_33790506 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '82625952932fcc7581_08668757';
?>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $_smarty_tpl->tpl_vars['pageSchema']->value["pageProperties"]["title"];?>
</title>
<meta name="keywords" content="<?php echo $_smarty_tpl->tpl_vars['pageSchema']->value['pageProperties']['keywords'];?>
" />
<meta name="description" content="" />
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
			<h1><a href="#">قالب اولیه</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li class="active"><a href="#" accesskey="1" title="">Homepage</a></li>
				<li><a href="#" accesskey="2" title="">Our Clients</a></li>
				<li><a href="#" accesskey="3" title="">About Us</a></li>
				<li><a href="#" accesskey="4" title="">Careers</a></li>
				<li><a href="#" accesskey="5" title="">Contact Us</a></li>
			</ul>
		</div>
	</div>

<div id="banner-wrapper">
	<div id="banner" class="container">
		<div class="title">
			<h2> با تولید سادگی نامفهوم </h2>
			<span class="byline">Donec pulvinar ullamcorper metus</span>
		</div>
		<ul class="actions">
			<li><a href="#" class="button">Pulvinar mollis</a></li>
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
			<p>Phasellus pellentesque, ante nec iaculis dapibus, eros justo auctor lectus, a lobortis lorem mauris quis nunc. Praesent pellentesque facilisis elit. Class aptent taciti sociosqu ad  torquent per conubia nostra.</p>
			<a href="#" class="button button-alt">More Info</a>
		</div>
		<div class="boxB">
			<p><?php if (findTemplate("news",array(),$_smarty_tpl->tpl_vars['pageSchema']->value) != false) {
echo $_smarty_tpl->getSubTemplate (findTemplate("news",$_smarty_tpl->tpl_vars['news_ini_data']->value["header"]["templates"],$_smarty_tpl->tpl_vars['pageSchema']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
}?></p>
			<a href="#" class="button button-alt">More Info</a>
		</div>
		<div class="boxC">
			<p> <?php if (findTemplate("login",array(),$_smarty_tpl->tpl_vars['pageSchema']->value) != false) {
echo $_smarty_tpl->getSubTemplate (findTemplate("login",$_smarty_tpl->tpl_vars['login_ini_data']->value["templates"],$_smarty_tpl->tpl_vars['pageSchema']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
}?></p>
		</div>
	</div>
	<?php } else { ?>
		<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['i']->step = 1;$_smarty_tpl->tpl_vars['i']->total = (int) ceil(($_smarty_tpl->tpl_vars['i']->step > 0 ? count($_smarty_tpl->tpl_vars['content']->value["data"]["templates"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['content']->value["data"]["templates"])-1)+1)/abs($_smarty_tpl->tpl_vars['i']->step));
if ($_smarty_tpl->tpl_vars['i']->total > 0) {
for ($_smarty_tpl->tpl_vars['i']->value = 0, $_smarty_tpl->tpl_vars['i']->iteration = 1;$_smarty_tpl->tpl_vars['i']->iteration <= $_smarty_tpl->tpl_vars['i']->total;$_smarty_tpl->tpl_vars['i']->value += $_smarty_tpl->tpl_vars['i']->step, $_smarty_tpl->tpl_vars['i']->iteration++) {
$_smarty_tpl->tpl_vars['i']->first = $_smarty_tpl->tpl_vars['i']->iteration == 1;$_smarty_tpl->tpl_vars['i']->last = $_smarty_tpl->tpl_vars['i']->iteration == $_smarty_tpl->tpl_vars['i']->total;?>
			<?php if ($_smarty_tpl->tpl_vars['content']->value["data"]["templates"][$_smarty_tpl->tpl_vars['i']->value]["isDefault"] == 1) {?>
				<?php echo $_smarty_tpl->getSubTemplate ($_smarty_tpl->tpl_vars['content']->value["data"]["templates"][$_smarty_tpl->tpl_vars['i']->value]["fileName"], $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
?>

			<?php }?>
		<?php }} ?>	
	<?php }?>
</div>

<div id="copyright" class="container">
	<p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['siteDomain']->value;?>
Public/Assets/js/jquery-3.1.1.min.js"><?php echo '</script'; ?>
>
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