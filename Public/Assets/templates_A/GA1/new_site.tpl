<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function new_site()
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
  url: "new_site_db.php",
  data: { site_title: document.getElementById("site_title").value},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		//setTimeout('$j.fancybox.close();', 3500);
	}
});
}
}
{/literal}
</script>
</head>

<body dir="rtl">


<p>عناوین سایت های ثبت شده تا کنون : </p>
{for $i=0 to count($all_sites)-1}<span style="background-color:#518495;color:white;margin-right:5px;font-weight:bold;font-size:12px;border-radius:4px;height:25px;display:inline-block;padding-top:4px;padding-left:4px;padding-right:4px;" onmouseover="$(this).css('color','black');" onmouseout="$(this).css('color','white');">{$all_sites[$i][0]}</span>{/for}


<p style="padding-top:20px;">عنوان سایت :  <input type="text"  size="50" id="site_title"/></p>

<span style="color:red;"><small>پس از ثبت سایت جدید به منظور انجام تنظیمات اولیه وارد سایت ایجاد شده شووید و تنظیمات خود را انجام دهید.</small></span><br/>
<input type="button" id="btn" onclick="new_site();" value="ثبت سایت جدید"/>
<div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:-28px;margin-right:20px;"> </div>
</body>
</html>
