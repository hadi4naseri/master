<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function reg_friend()
{
$j("#btn").attr("value", "در حال بررسی ...");
$j("#btn").attr("disabled", "disabled");
$.ajax({
  type: "GET",
  url: "add_friend_db.php",
  data: { fname: document.getElementById("friend_name").value , flink : document.getElementById("friend_addrs").value },
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
                setTimeout('$j.fancybox.close();', 4000);
	  $j("#btn").removeAttr("disabled");
	  $j("#btn").attr("value", "ثبت اطلاعات دوست جدید");
	}
});
}
{/literal}
</script>
</head>

<body>

<p style="padding-top:20px;">برای تعریف دوست جدید سایت اطلاعات فرم زیر را کامل نمائید........</p>
<br/>

نام سایت جهت نمایش در صفحه سایت : <input type="text" size="50" id="friend_name"/>
<br/>
لینک آدر س سایت : <input type="text" size="80" id="friend_addrs" dir="ltr" value="http://"/>
<br/>
<ul>
<li style="color:red"> ترجیحاً بهتر است آدرس سایت برای درج شدن با <span lang="en" dir="ltr">  http://  </span>   شروع شود.مثلاً <span dir="ltr">http://www.idehandish.com</span>  </li>
<li>پروتکل پیش فرض http در نظر گرفته خواهد شد.</li>
</ul>
<input type="button" id="btn" onclick="reg_friend();" value="ثبت اطلاعات دوست جدید"/>
<div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:-25px;margin-right:80px;">
</div>

</body>
</html>
