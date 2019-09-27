<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
var path="{$site_domain}/admin/";
{literal}
function update_news_cnt()
{
nws_cnt=parseInt(document.getElementById('news_cnt').value);
if (nws_cnt>10 || nws_cnt<2)
{
    document.getElementById("error_reporting").innerHTML='تعداد خبر وارد شده معتبر نمی باشد...';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{
  $.ajax({
  type: "GET",
  url: path + "/update_news_count.php",
  data: { nws_cnt: nws_cnt},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
	}
});
}
}
function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
{/literal}
</script>
</head>

<body dir="rtl">

<div id="error_reporting" style="position: fixed;">
</div>

<p style="padding-top:20px;">تعداد اخبار برای نمایش در صفحه اول :  <input type="text" value="{$news_count}" size="5" id="news_cnt" onkeypress="return isNumberKey(event)"/></p>
<input type="button" id="btn" onclick="update_news_cnt();" value="ثبت تنظیمات"/>

</body>
</html>
