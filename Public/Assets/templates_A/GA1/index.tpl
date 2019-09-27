<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>سیستم مدیریت مبینا ..::.. صفحه مدیریت</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<link rel="icon"
      type="image/ico"
      href="../{$adm_path}/templates/images/favicon.ico" />

<link rel="stylesheet" href="../{$adm_path}/templates/css/main.css"/>
<script type="text/javascript" src="../{$adm_path}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../admin/js/jscolor.js"></script>

<!-- Add jQuery library -->
<script type="text/javascript" src="../{$adm_path}/fancy/lib/jquery-1.7.2.min.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="../{$adm_path}/fancy/source/jquery.fancybox.js?v=2.0.6"></script>

<link rel="stylesheet" type="text/css" href="../{$adm_path}/fancy/source/jquery.fancybox.css?v=2.0.6" media="screen" />


<script type="text/javascript">


var path="{$site_domain}";
{literal}
var $j = jQuery.noConflict();
	$j(document).ready(function(){

	
	//--------General-------------------------------------
	$j('.fancybox.general').fancybox({
	afterClose : function()
	{
	if (document.cookie.indexOf("current_user") < 0)
	{
	alert("مدت زمان فعالیت شما در سیستم به پایان رسیده است!مجدداً وارد سیستم شوید");
	window.location.replace($j("#logout").attr("href"));
	}
	if ($j('#bck_nme').val()!="")
	{
		$j.ajax({
		url: "delete_backup.php",
		data:{nme:$('#bck_nme').val()},
		async: false,
		success:function(data)
		{
			if (data=="1")
			$j('#bck_nme').val("");
			alert("فایل پشتیبان پایگاه داده با موفقیت پاک شد");
		}
		});
	}
	},
	beforeClose: function() {	
	}
	});
	//----------------------------------------------------
	
	});
	
	function rotatePicture()
{
	if (document.cookie.indexOf("current_user") < 0)
	{
	window.location.replace($j("#logout").attr("href"));
	}
 var pics=new Array("login-whisp.png","background-timeline.jpg","qqq.jpg","2014-03-Green-Background-15.jpg","hiag-large-background1.jpg","watercolor-circles-2277.jpg");
 //document.getElementById("bg_pic").src= path + "/admin/templates/images/" + pics[Math.floor(Math.random() * pics.length)];
  $j("#bg_pic")
        .fadeOut(5000, function() {
            $("#bg_pic").attr('src',path + "/admin/templates/images/" + pics[Math.floor(Math.random() * pics.length)]);
        })
        .fadeIn(5000);
}

	</script>

{/literal}
<script type="text/javascript" src="../{$adm_path}/js/jquery.min.js"></script>

<script type="text/javascript">
jQuery(document).ready(function() {
  jQuery(".cnt").hide();
  //toggle the componenet with class msg_body
  jQuery(".header").click(function()
  {
    if(jQuery(this).css("color")!="black")
	{
   // jQuery(this).children().css("visibility","hidden");
    jQuery(this).children().slideToggle('fast');
    jQuery(this).css("color","black");
   // jQuery(this).children().css("visibility","visible");
    }
    else{
   // jQuery(this).children().css("visibility","hidden");
    jQuery(this).children().slideToggle('fast');
    jQuery(this).css("color","white");
    ///jQuery(this).children().css("visibility","visible");

    }
  });
});


</script>

</head>
<div><b>عنوان سایت : </b>{$title}</div>
  <body style="max-width: 1280px;" onload="window.setInterval('rotatePicture();', 60000);">
	<input type="hidden" id="bck_nme"/>
<img src="../{$adm_path}/templates/images/login-whisp.png" class="background-image" id="bg_pic"/>

<div>

	<table  id="main" align="center" cellpadding="1" cellspacing="0"  dir="rtl" height="1300px" border="1">
		<img src="../{$adm_path}/templates/images/banner.png" style="margin-top:-70px;margin-bottom:-50px;margin-right:-45px;"/>
		
		<tr style="border:1px dashed black;">
			<td width="20%">خوش آمدید {$username} !<br/>
			<a href="../index.php?stid={$smarty.session.site_index}" target="_blank">مشاهده صفحه اصلی سایت</a><br/>
			<a href="pdata.php?uid={$userID}" class="general fancybox fancybox.ajax" id="pdata">تکمیل اطلاعات شخصی</a><br/>
			<a href="logout.php?uid={$userID}&stid={$smarty.session.site_index}" id="logout">خروج از حساب کاربری</a></td>
			<td colspan="2"><b>تاریخ و زمان ورود قبلی :</b> {$last_login} ---- <b>تاریخ و زمان خروج قبلی :</b> {$last_logout} <br/>
			{if {$msgs} neq 0}
			<img class="menu_icon" src="../admin/templates/images/messaging.png" style="width:32px;height:32px;margin-bottom:-10px;margin-left:-15px;"/><a class="general fancybox fancybox.ajax" href="../{$adm_path}/inbox.php">{$msgs} پیام در صندوق ورودی</a>
			{/if}
			</td>

		</tr>
		<tr>

			<td colspan="3">
			<table align="center" cellpadding="0" cellspacing="0" id="imain" style="table-layout:fixed;">
				{assign cur_item 0}
				{assign counter 0}
				<tr>
				{for $cur_grp=0 to $groups|count-1}
				
					
					{assign rept 0}
					{for $k=0 to count($items)-1}
					{if $items[$k][5]==$groups[$cur_grp][0]}
					{$rept= $rept + 1}
					{/if}
					{/for}
					
					{if $rept>0}
					<td style="width:100px;text-align:center;">
					<div class="header">
					<img class="menu_icon" src="../admin/templates/images/{$items[$cur_item][3]}" style="width:64px;height:64px;"/>
					
					{for $p=0 to $rept-1}
					<a class="general cnt fancybox fancybox.ajax" href="../{$adm_path}/{$items[$cur_item][0]}">{$items[$cur_item][1]}</a>
					{$cur_item = $cur_item +1}
					{/for}
					
					<a class="cnt" href="javascript:;">انصراف</a>
					</div>
					<strong>{$items[$cur_item-1][2]}</strong>
					</td>
					{$counter=$counter +1}
					{/if}	
					
					{if ($counter) % 5 == 0 }
					</tr><tr>
					{/if}
				{/for}
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center" id="copyright"><a href="http://www.idehandish.com">شرکت مهندسی ایده اندیش <img src="../admin/templates/images/mobin_logo.png"/></a>سیستم مدیریت محتوای مبینا نسخه1.1</td>
		</tr>
	</table>
	<img src="../{$adm_path}/templates/images/banner2.png" style="margin-top:-68px;margin-bottom:-50px;margin-right:-13px;"/>
</div>


</body>

</html>
