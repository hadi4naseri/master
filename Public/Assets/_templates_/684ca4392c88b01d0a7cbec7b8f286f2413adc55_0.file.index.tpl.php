<?php /* Smarty version 3.1.27, created on 2020-09-08 00:03:22
         compiled from "D:\wamp\www\Mobina_new\Tenants\MooniMsg\Assets\Templates\local_themes\theme1\index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:201845f568b024bc4f1_19741219%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '684ca4392c88b01d0a7cbec7b8f286f2413adc55' => 
    array (
      0 => 'D:\\wamp\\www\\Mobina_new\\Tenants\\MooniMsg\\Assets\\Templates\\local_themes\\theme1\\index.tpl',
      1 => 1599507035,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '201845f568b024bc4f1_19741219',
  'variables' => 
  array (
    'urlPatch' => 0,
    'tenantDomain' => 0,
    'content' => 0,
    'i' => 0,
    'j' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5f568b038622e5_69613607',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5f568b038622e5_69613607')) {
function content_5f568b038622e5_69613607 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '201845f568b024bc4f1_19741219';
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>PIK - پیام رسان کسب و کاری</title>
		<base href="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
"/>
		<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
				<link rel="stylesheet" href="theme1/styles/bootstrap.min.css">
					<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/styles/fonts.css">
						<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/styles/main.css">
							<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/styles/jquery.fancybox.min.css">

								<?php echo '<script'; ?>
 src="theme1/js/jquery.min.js"><?php echo '</script'; ?>
>
								<!--
							<?php echo '<script'; ?>
 src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"><?php echo '</script'; ?>
>
							-->
								<?php echo '<script'; ?>
 src="theme1/js/bootstrap.min.js"><?php echo '</script'; ?>
>
								<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/js/jquery.fancybox.min.js"><?php echo '</script'; ?>
>
								<?php echo '<script'; ?>
>var $j = jQuery.noConflict(true);<?php echo '</script'; ?>
>
								<!--for video and audio message -->
								<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/js/script.js"><?php echo '</script'; ?>
>
								<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/js/adapter.js"><?php echo '</script'; ?>
>
								<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/js/chatclient.js"><?php echo '</script'; ?>
>
								<?php echo '<script'; ?>
>  
									
									//global variables
									var adres="<?php echo $_smarty_tpl->tpl_vars['tenantDomain']->value;?>
";
									var uid="<?php echo $_smarty_tpl->tpl_vars['tenantDomain']->value;?>
";
									var activeTopic= new Object();
									var targetContact= "";
									var lastSeen=0;
									var editMode="";
									var shareScreen=false;
									
									
									/*function display(messageHTML) {
									$('#chat-box').append(messageHTML);
									}*/

									$j(document).ready(function(){
									
									
									webSocketInit();
									connect();
									
									});

								<?php echo '</script'; ?>
>
										
								

									</head>
									<body style="background-color:black;background-image:url(<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/pics/sky.jpg);font-family:BNazanin" onbeforeunload='' onmousemove="lastSeen=Date.now() /1000 |0;" >

										<div class="container " style="direction:rtl;">

											<div class="row rounded">
												<a href="javascript:;" data-fancybox data-src="#settings" style="text-decoration:none">
													<div class="col" style="direction:rtl;text-align:right">
														<img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/profile.svg"/>
														<?php if ($_smarty_tpl->tpl_vars['content']->value == '') {?>
														<span>خوش آمدی کاربر مهمان! در صورتیکه قبلا ثبت نام کرده اید <b><a href="javascript:;">وارد</a></b> شوید</span>
														<?php } else { ?>
														خوش آمدید <span id="userName"><?php echo $_smarty_tpl->tpl_vars['content']->value["uname"];?>
</span>
														<span id="userId" style="display:none"><?php echo $_smarty_tpl->tpl_vars['content']->value["uid"];?>
</span>
														<?php }?>
														
														<?php if ($_smarty_tpl->tpl_vars['content']->value != '') {?>
														<div style="display:none; direction:rtl;text-align:right" id="settings">

															<div style="text-align:center"><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/profile.svg"/></div>
															<div><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/account.svg"/><a href="javascript:;" style="text-decoration:none"><b>اطلاعات حساب کاربری</b></a></div>
															<div><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/chat.svg"/>گفتگوها</div>
															<div><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/notification.svg"/>اعلان ها</div>
															<div><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/cloud-storage.svg"/>اطلاعات و ذخیره سازی</div>
															<div><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/help.svg"/>راهنما</div>

															<div style="text-align:center"><span style="position:relative;top:30px;">محصولی از </span><br/><br/><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/pics/ITaaS.jpg" style="height:128px;width:180px"/></div>
														</div>
														<?php } else { ?>
														<div style="display:none; direction:rtl;text-align:right" id="settings">

															<div style="text-align:center"><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/profile.svg"/></div>
															<p>برای مشاهده تنظیمات حساب کاربری وارد سیستم شوید</p>
															<div><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/help.svg"/> راهنما </div>

															<div style="text-align:center"><span style="position:relative;top:30px;">محصولی از </span><br/><br/><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/pics/ITaaS.jpg" style="height:128px;width:180px"/></div>
														</div>
														<?php }?>

													</div>
													</a>
													
													<span style="font-weight:bold" class="invertable">حالت شب<input type="checkbox" onclick='if($j(this).is(":checked")==true){$j(body).css("background-image","none"),$j(".invertable").css("filter","invert(1)")} else{$j(body).css("background-image","url(\"<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/pics/sky.jpg\")"),$j(".invertable").css("filter","invert(0)")}'></span>

											</div>


											<div class="row">

												<div class="col border rounded" style="direction:rtl;text-align:right">




													<div class="col">
														<input type="text" class="form-control w-100" placeholder="جستجو..."/>
													</div>

												</div>

												<div class="col border rounded" style="direction:rtl;text-align:right" >


													<img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/lock.svg"/ title="قفل کردن صفحه" onclick='$j.fancybox.open("<span style=\"direction:rtl\">صفحه قفل شد</span>",{scrolling: "no",modal:true,padding: 0,     closeEffect: "elastic"});' class="invertable">
													<img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/people.svg" title="مشاهده کاربران " class="invertable"/>
													<img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/trash.svg" title="حذف کردن گفتگو" class="invertable"/>
													<img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/add-person.svg" title="افزودن نفر جدید" class="invertable"/>
													<a href="javascript:;"><img id="call" src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/voiceCall.svg" title="مکالمه صوتی" class="icons invertable" onclick="voiceCallInit();invite();"  /></a>
													<a id="vcall" href="javascript:;">
														<img src="theme1/icons/videoCall.svg" title="مکالمه تصویری" class="icons invertable" onclick="videoCallInit();invite();"/>
													</a>
													<a id="scsharing" href="javascript:;">
														<img src="theme1/icons/screenSharing.svg" title="اشتراک صفحه" class="icons invertable" onclick="shareScreen=true;videoCallInit();invite();"/>
													</a>
													<a id="webinar" href="javascript:;" style="display:none">
														<img src="theme1/icons/webinar.svg" title="وبینار" class="invertable" />
													</a>
													<a id="videoConference" href="javascript:;" style="display:none">
														<img src="theme1/icons/videoConference.svg" title="ویدئو کنفرانس" class="invertable" />
													</a>

													<div id="logout-content" style="display:none">
														<p>آیا قصد خارج شدن از حساب کاربری خود را دارید؟</p>
														<input type="button" value="خیر" class="btn btn-secondart" onclick="$j.fancybox.close();"/>
														<input type="button" value="بله" class="btn btn-primary"/>
													</div>

													<?php if ($_smarty_tpl->tpl_vars['content']->value != '') {?>
													<a data-fancybox data-src="#logout-content" href="javascript:;"><svg class="bi bi-power" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
															<path fill-rule="evenodd" d="M5.578 4.437a5 5 0 104.922.044l.5-.866a6 6 0 11-5.908-.053l.486.875z" clip-rule="evenodd"/>
															<path fill-rule="evenodd" d="M7.5 8V1h1v7h-1z" clip-rule="evenodd"/>
														</svg></a>
													<?php } else { ?>
													<a href="javascript:window.top.close();" ><svg class="bi bi-power" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
															<path fill-rule="evenodd" d="M5.578 4.437a5 5 0 104.922.044l.5-.866a6 6 0 11-5.908-.053l.486.875z" clip-rule="evenodd"/>
															<path fill-rule="evenodd" d="M7.5 8V1h1v7h-1z" clip-rule="evenodd"/>
														</svg></a>
													<?php }?>	
													<span class="invertable" id="connectionStatus">وضعیت اتصال به سرور : <b>قطع اتصال! اتصال مجدد...</b></span>
												</div>
											</div>
											
											<div id="newTopicBox" style="display:none;direction:rtl;text-align:right">
												<input id="newTopicName" type="text" class="form-control" />
												<div style="text-align:center">
												<br/>
												<?php if ($_smarty_tpl->tpl_vars['content']->value != '') {?>
												<input type="button" value="ایجاد" class="btn btn-primary" onclick='createNewTopic($j("#newTopicName").val(),<?php echo $_smarty_tpl->tpl_vars['content']->value["uid"];?>
,$j(".active").attr("data-type"));'/>
												<?php } else { ?>
												<?php }?>
												</div>
											</div>
											
											<div class="row">
												<div class="col border rounded  overflow-auto" style="height:80vh;" >

													
													
													<a  href="javascript:;" id="newTopic" style="text-decoration:none;color:black;"><div style="left: 5px;bottom: 0px;position: absolute;background-color: red;border-radius: 50%;width: 50px;height:50px; text-align: center;font-weight: bold;font-size: 30px;" onclick="$j.fancybox.open({src  : '#newTopicBox',	type : 'inline',opts : {		beforeShow : function( instance, current ) {$j('#newTopicName').val('');$j('#newTopicName').attr('placeholder',$j('.active').attr('data-msg'));}}});">+</div></a>
													
													<ul class="nav nav-pills nav-fill">
														
														<li class="nav-item">
															<a class="nav-link active" href="javascript:;" data-msg="عنوان گفتگوی جدید"  data-type="chat" onclick='$j("#newTopic").show();$j(".contentHolder").hide();$j("#chats").show();$j(".nav-link").removeClass("active");$j(this).addClass("active");$j("#videoConference,#webinar").hide();$j("#call,#vcall,#scsharing").show();'>گفتگو</a>
														</li>
														<li class="nav-item">
															<a class="nav-link" href="javascript:;" data-msg="عنوان گروه جدید" data-type="group"  onclick='$j("#newTopic,#videoConference").show();$j(".contentHolder").hide();$j("#groups").show();$j(".nav-link").removeClass("active");$j(this).addClass("active");$j("#call,#vcall,#scsharing,#webinar").hide();'>گروه</a>
														</li>
														<li class="nav-item">
															<a class="nav-link" href="javascript:;" data-msg="عنوان کانال جدید" data-type="channel" onclick='$j("#newTopic,#webinar").show();$j(".contentHolder").hide();$j("#channels").show();$j(".nav-link").removeClass("active");$j(this).addClass("active");$j("#call,#vcall,#scsharing,#videoConference").hide();'>کانال</a>
														</li>
														<li class="nav-item">
															<a class="nav-link" href="javascript:;" onclick='$j("#newTopic").hide();$j(".contentHolder").hide();$j("#services").show();$j(".nav-link").removeClass("active");$j(this).addClass("active");$j("#call,#vcall,#scsharing").hide();'>خدمات</a>
														</li>
													</ul>

													<div id="chats" class="contentHolder" style="direction:rtl;text-align:right">

													<?php if ($_smarty_tpl->tpl_vars['content']->value == '') {?>
													<br/>
													<span style="text-align:right">متاسفانه شما گفتگویی با دیگران ندارید</span>
													<?php } else { ?>
													<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['i']->step = 1;$_smarty_tpl->tpl_vars['i']->total = (int) ceil(($_smarty_tpl->tpl_vars['i']->step > 0 ? count($_smarty_tpl->tpl_vars['content']->value["ugroups"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['content']->value["ugroups"])-1)+1)/abs($_smarty_tpl->tpl_vars['i']->step));
if ($_smarty_tpl->tpl_vars['i']->total > 0) {
for ($_smarty_tpl->tpl_vars['i']->value = 0, $_smarty_tpl->tpl_vars['i']->iteration = 1;$_smarty_tpl->tpl_vars['i']->iteration <= $_smarty_tpl->tpl_vars['i']->total;$_smarty_tpl->tpl_vars['i']->value += $_smarty_tpl->tpl_vars['i']->step, $_smarty_tpl->tpl_vars['i']->iteration++) {
$_smarty_tpl->tpl_vars['i']->first = $_smarty_tpl->tpl_vars['i']->iteration == 1;$_smarty_tpl->tpl_vars['i']->last = $_smarty_tpl->tpl_vars['i']->iteration == $_smarty_tpl->tpl_vars['i']->total;?>
													<?php if ($_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["type"] == "chat") {?>
													<a href="javascript:;"   id ='<?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["topicId"];?>
' onclick='handleTopic(<?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["topicId"];?>
,"<?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["name"];?>
","<?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["type"];?>
")'><div class="chatTopic" style="direction:rtl;text-align:right;background-color:#ff0bd9;height:50px;margin-bottom:2px;">
																		<img src="theme1/icons/home.svg"/>		
																			<?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["name"];?>
<small>(<?php echo count($_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["members"]);?>
عضو)</small>
													
													<small class="counter">0</small>
													<?php $_smarty_tpl->tpl_vars['j'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['j']->step = 1;$_smarty_tpl->tpl_vars['j']->total = (int) ceil(($_smarty_tpl->tpl_vars['j']->step > 0 ? count($_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["members"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["members"])-1)+1)/abs($_smarty_tpl->tpl_vars['j']->step));
if ($_smarty_tpl->tpl_vars['j']->total > 0) {
for ($_smarty_tpl->tpl_vars['j']->value = 0, $_smarty_tpl->tpl_vars['j']->iteration = 1;$_smarty_tpl->tpl_vars['j']->iteration <= $_smarty_tpl->tpl_vars['j']->total;$_smarty_tpl->tpl_vars['j']->value += $_smarty_tpl->tpl_vars['j']->step, $_smarty_tpl->tpl_vars['j']->iteration++) {
$_smarty_tpl->tpl_vars['j']->first = $_smarty_tpl->tpl_vars['j']->iteration == 1;$_smarty_tpl->tpl_vars['j']->last = $_smarty_tpl->tpl_vars['j']->iteration == $_smarty_tpl->tpl_vars['j']->total;?>
													<?php ob_start();
echo $_smarty_tpl->tpl_vars['content']->value["uid"];
$_tmp1=ob_get_clean();
if ($_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["members"][$_smarty_tpl->tpl_vars['j']->value]["uid"] != $_tmp1) {?>
													<small style="display:none" class="targetContactId"><?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["members"][$_smarty_tpl->tpl_vars['j']->value]["uid"];?>
</small>
													<?php }?>
													<?php }} ?>
													</div></a>
													<?php }?>
													<?php }} ?>
													<?php }?>

													</div>

													<div id="groups" style="display:none;direction:rtl;text-align:right" class="contentHolder">
													
													<?php if ($_smarty_tpl->tpl_vars['content']->value == '') {?>
													<br/>
													<span style="text-align:right">در حال حاضر شما عضو هیچ گروهی نیستید!</span>
													<?php } else { ?>
													<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['i']->step = 1;$_smarty_tpl->tpl_vars['i']->total = (int) ceil(($_smarty_tpl->tpl_vars['i']->step > 0 ? count($_smarty_tpl->tpl_vars['content']->value["ugroups"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['content']->value["ugroups"])-1)+1)/abs($_smarty_tpl->tpl_vars['i']->step));
if ($_smarty_tpl->tpl_vars['i']->total > 0) {
for ($_smarty_tpl->tpl_vars['i']->value = 0, $_smarty_tpl->tpl_vars['i']->iteration = 1;$_smarty_tpl->tpl_vars['i']->iteration <= $_smarty_tpl->tpl_vars['i']->total;$_smarty_tpl->tpl_vars['i']->value += $_smarty_tpl->tpl_vars['i']->step, $_smarty_tpl->tpl_vars['i']->iteration++) {
$_smarty_tpl->tpl_vars['i']->first = $_smarty_tpl->tpl_vars['i']->iteration == 1;$_smarty_tpl->tpl_vars['i']->last = $_smarty_tpl->tpl_vars['i']->iteration == $_smarty_tpl->tpl_vars['i']->total;?>
													<?php if ($_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["type"] == "group") {?>
													<a href="javascript:;" ><div style="direction:rtl;text-align:right;background-color:#eaf54a;height:50px;margin-bottom:2px;">
																		<img src="theme1/icons/home.svg"/>		
																			<?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["name"];?>
<small>(<?php echo count($_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["members"]);?>
عضو)</small>
													
													<span class="topicId" style="display:none"><?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["topicId"];?>
</span>
													</div></a>
													<?php }?>
													<?php }} ?>
													<?php }?>

													</div>

													<div id="channels" style="display:none;direction:rtl;text-align:right" class="contentHolder">
													
													<?php if ($_smarty_tpl->tpl_vars['content']->value == '') {?>
													<br/>
													<span style="text-align:right">هیچ کانالی شما عضو نشده اید!</span>
													<?php } else { ?>
													<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['i']->step = 1;$_smarty_tpl->tpl_vars['i']->total = (int) ceil(($_smarty_tpl->tpl_vars['i']->step > 0 ? count($_smarty_tpl->tpl_vars['content']->value["ugroups"])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['content']->value["ugroups"])-1)+1)/abs($_smarty_tpl->tpl_vars['i']->step));
if ($_smarty_tpl->tpl_vars['i']->total > 0) {
for ($_smarty_tpl->tpl_vars['i']->value = 0, $_smarty_tpl->tpl_vars['i']->iteration = 1;$_smarty_tpl->tpl_vars['i']->iteration <= $_smarty_tpl->tpl_vars['i']->total;$_smarty_tpl->tpl_vars['i']->value += $_smarty_tpl->tpl_vars['i']->step, $_smarty_tpl->tpl_vars['i']->iteration++) {
$_smarty_tpl->tpl_vars['i']->first = $_smarty_tpl->tpl_vars['i']->iteration == 1;$_smarty_tpl->tpl_vars['i']->last = $_smarty_tpl->tpl_vars['i']->iteration == $_smarty_tpl->tpl_vars['i']->total;?>
													<?php if ($_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["type"] == "channel") {?>
													<a href="javascript:;"><div style="direction:rtl;text-align:right;background-color:#a8ff80;height:50px;margin-bottom:2px;">
																		<img src="theme1/icons/home.svg"/>		
																			<?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["name"];?>
<small>(<?php echo count($_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["members"]);?>
عضو)</small>
													
													<span class="topicId" style="display:none"><?php echo $_smarty_tpl->tpl_vars['content']->value["ugroups"][$_smarty_tpl->tpl_vars['i']->value]["topicId"];?>
</span>
													</div></a>
													<?php }?>
													<?php }} ?>
													<?php }?>

													</div>
													
													<div id="services" style="display:none;direction:rtl;text-align:right" class="contentHolder">
																										
													<div style="background-color:lime;width:160px;height:75px;float:right;text-align:center;vertical-align:middle;font-size:20px;padding-top:20px;">سلامت</div>
													<div style="background-color:red;width:160px;height:75px;float:right;text-align:center;vertical-align:middle;font-size:20px;padding-top:20px;">ورزش</div>
													<div style="background-color:yellow;width:160px;height:75px;float:right;text-align:center;vertical-align:middle;font-size:20px;padding-top:20px;">فیلم و موسیقی</div>
													<div style="background-color:brown;width:160px;height:75px;float:right;text-align:center;vertical-align:middle;font-size:20px;padding-top:20px;">امور بانکی</div>
													<div style="background-color:orange;width:160px;height:75px;float:right;text-align:center;vertical-align:middle;font-size:20px;padding-top:20px;">امور خیریه</div>
													<div style="background-color:cyan;width:160px;height:75px;float:right;text-align:center;vertical-align:middle;font-size:20px;padding-top:20px;">امور اداری</div>
													<div style="background-color:magenta;width:160px;height:75px;float:right;text-align:center;vertical-align:middle;font-size:20px;padding-top:20px;">خرید و فروش کالا</div>
													<div style="background-color:green;width:160px;height:75px;float:right;text-align:center;vertical-align:middle;font-size:20px;padding-top:20px;">بیمه</div>
													<div style="background-color:blue ;width:160px;height:75px;float:right;text-align:center;vertical-align:middle;font-size:20px;padding-top:20px;">آموزش</div>
													
													</div>

												</div>
												<div class="col border rounded overflow-auto"  style="height:80vh;">

													<div class="col" id="chat_list" style="height:65vh;overflow:auto">


														</div> <!--chat list-->

														<div class="row border rounded " style="position:absolute;bottom:40px;width:100%">

															<div class="col-sm-8">

																<textarea class="form-control" id="chat-message" rows="1" placeholder="پیام..."id="chat-message" ></textarea>
															</div>
															<div class="col-sm-4" style="padding-right:0px;margin-top:10px">

																<div style="display:none;text-align:right;direction:rtl" id="emojiBox">

																	<ul class="nav nav-pills nav-fill">

																		<li class="nav-item">
																			<a class="nav-link active" id="emojiItem1" href="javascript:;" onclick='$j(".Holder").hide();$j("#emoji").show();$j("#emojiItem2,#emojiItem3").removeClass("active");$j(this).addClass("active")'>شکلک</a>
																		</li>
																		<li class="nav-item">
																			<a id="emojiItem2" class="nav-link" href="javascript:;" onclick='$j(".Holder").hide();$j("#gifs").show();$j("#emojiItem1,#emojiItem3").removeClass("active");$j(this).addClass("active")'>تصویر متحرک</a>
																		</li>
																		<li class="nav-item">
																			<a id="emojiItem3" class="nav-link" href="javascript:;" onclick='$j(".Holder").hide();$j("#shortVideos").show();$j("#emojiItem1,#emojiItem2").removeClass("active");$j(this).addClass("active")'>ویدئو کوتاه</a>
																		</li>
																		

																	</ul>
																	<br/>
																	<div class="Holder" id="emoji" >
																		<?php echo $_smarty_tpl->getSubTemplate ("./smilies.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
?>

																	</div>
																	<div class="Holder" id="gifs" style="display:none">
																		<img src="theme1/gifs/2.gif"/>
																	</div>
																	<div class="Holder" id="shortVideos" style="display:none">
																		<video width="200" height="160" autoplay loop>
																		<source src="theme1/videos/4_5773654635420059321.mp4" type="video/mp4">
																		</video>
																		<video width="200" height="160" autoplay loop>
																		<source src="theme1/videos/4_5823226486525528093.mp4" type="video/mp4">
																		</video>
																	</div>



																</div>
																<a href="javascript:;" data-fancybox data-src="#emojiBox"><img class="invertable" src="theme1/icons/smiely.svg"/></a>
																<input id ="sendMessage" type="button" value="ارسال" class="btn btn-primary" onclick="sendMessage()"/>
																
																
																<a href="javascript:;" onclick="if( $j('#micRecorder').attr('src')=='theme1/icons/mic.svg') {initMic();} else if ($j('#micRecorder').attr('src')=='theme1/icons/_mic.svg') {$j('#micRecorder').attr('src','theme1/icons/record.svg');startMic();} else {stopRecording();$j('#micRecorder').attr('src','theme1/icons/mic.svg');}"><img class="invertable" id="micRecorder" src="theme1/icons/mic.svg" style="width:32px;height:32px"/></a>
																<a href="javascript:;" onclick="if( $j('#camRecorder').attr('src')=='theme1/icons/camera.svg') initCam(); else if ($j('#camRecorder').attr('src')=='theme1/icons/_camera.svg') {$j('#camRecorder').attr('src','theme1/icons/record.svg');startCam();} else {stopRecording();$j('#camRecorder').attr('src','theme1/icons/camera.svg');}"><img class="invertable" id="camRecorder" src="theme1/icons/camera.svg" style="width:32px;height:32px"/></a>
																	
															</div>


														</div>
														<div class="row" style="position:absolute;bottom:0px;width:100%">


															<div style="display:none;direction:rtl;text-align:right" id="moduleMarket">


																<p>هزینه ها بر اساس ریال می باشد</p>
															</div>


															<!--Plus-->
															<a href="javascript:;" data-fancybox data-src="#moduleMarket" data-toggle="tooltip" data-placement="auto" title="فروشگاه ماژول">
																<svg  class="bi bi-plus" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
																	<path fill-rule="evenodd" d="M8 3.5a.5.5 0 01.5.5v4a.5.5 0 01-.5.5H4a.5.5 0 010-1h3.5V4a.5.5 0 01.5-.5z" clip-rule="evenodd"/>
																	<path fill-rule="evenodd" d="M7.5 8a.5.5 0 01.5-.5h4a.5.5 0 010 1H8.5V12a.5.5 0 01-1 0V8z" clip-rule="evenodd"/>
																</svg>
															</a>
															
															<!---->
															<a href="javascript:;"><img src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/icons/process.svg" style="position:absolute;left:0px;"/></a>
															<!---->

														</div>

													</div>

												</div>
											</div>
											<div class="row">
												<div class="col text-center invertable">
													کلیه حقوق محفوظ است
												</div>
											</div>
											<!-- for video and voice call -->
											<video id="received_video" autoplay style="display:none"></video>
											<video id="local_video" autoplay muted style="display:none"></video>
											<button id="hangup-button" onclick="hangUpCall();" role="button" style="display:none">
												قطع تماس
											</button>
											<audio id="msgRecieved">
												<source src="<?php echo $_smarty_tpl->tpl_vars['urlPatch']->value;?>
/sounds/beep.mp3" type='audio/mp3; codecs="mp3"'>
											</audio>
										</body>
									</html><?php }
}
?>