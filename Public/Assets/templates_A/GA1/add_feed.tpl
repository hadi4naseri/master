<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function reg_feed()
{
$j("#btn").attr("value", "در حال بررسی ...");
$j("#btn").attr("disabled", "disabled");
$.ajax({
  type: "GET",
  url: "add_feed_db.php",
  data: { fname: document.getElementById("feed_name").value , flink : document.getElementById("feed_addrs").value },
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
	  $j("#btn").removeAttr("disabled");
	  $j("#btn").attr("value", "ثبت اطلاعات منبع خبری");
	}
});
}
{/literal}
</script>
</head>

<body>

<p style="padding-top:20px;">برای تعریف منبع خبری در جدید سایت اطلاعات فرم زیر را کامل نمائید........</p>
<br/>

نام منبع خبری : <input type="text" size="50" id="feed_name"/>
<br/>
لینک آدرس : <input type="text" size="80" id="feed_addrs" dir="ltr" value="http://"/>
<br/>

<ul>
<li style="color:red"> ترجیحاً بهتر است آدرس سایت برای درج شدن با <span lang="en" dir="ltr">  http://  </span>   شروع شود.مثلاً <span dir="ltr">http://www.idehandish.com</span>  </li>
<li>پروتکل پیش فرض http در نظر گرفته خواهد شد.</li>
</ul>
<input type="button" id="btn" onclick="reg_feed();" value="ثبت اطلاعات منبع خبری" onkeypress="return isNumberKey(event)"/><div id="error_reporting" style="position: absolute;height:20px;right:180px;margin-top:-28px;">
</div>
</body>
</html>
