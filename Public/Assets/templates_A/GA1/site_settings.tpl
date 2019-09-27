<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function update_site_sett()
{

if (document.getElementById("site_title").value == "")
{
    document.getElementById("error_reporting").innerHTML='لطفا نام صفحه آغازین سایت را مشخص نمائید';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{
  $.ajax({
  type: "GET",
  url: "update_site_settings.php",
  data: { site_title: document.getElementById("site_title").value,site_keywords:document.getElementById("keywords").value},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		setTimeout('$j.fancybox.close();', 3500);
	}
});
}
}
{/literal}
</script>
</head>

<body dir="rtl">

<div id="error_reporting" style="position: fixed;">
</div>

<p style="padding-top:20px;">عنوان سایت در صفحه اوّل&nbsp; :  <input type="text" value="{$site_title}" size="50" id="site_title"/></p>
<p style="padding-top:20px;">کلمات کلیدی سایت&nbsp; :  <input type="text" value="{$keywords}" size="50" id="keywords"/></p>
<span style="color:red;text-decoration:blink;"><small>لطفاً کلمات کلیدی را با کاراکتر - (dash و یا hyphen) از هم جدا نمائید.</small></span><br/>
<input type="button" id="btn" onclick="update_site_sett();" value="ثبت تنظیمات"/>

</body>
</html>
