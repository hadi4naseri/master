<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />

<script language="javascript" type="text/javascript">
userid={$uid};
{literal}

function update_pdata()
{

if (document.getElementById("name").value == ""||
document.getElementById("email").value == ""||
document.getElementById("phone").value == "")
{
    document.getElementById("error_reporting").innerHTML='لطفا تمامی اطلاعات خواسته شده را تکمیل نمائید';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{
  $.ajax({
  type: "GET",
  url: "update_pdata.php",
  data: {uid:userid,name: document.getElementById("name").value,email:document.getElementById("email").value,phone:document.getElementById("phone").value},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
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
لطفاً اطلاعات خواسته شده را برای تکمیل اطلاعات شخصی در سایت وارد نمائید...
<p style="padding-top:20px;">نام کاربری :  <input type="text" value="{$info[0]}" size="30" id="uname" readonly/></p>
<p style="padding-top:20px;"> نام و نام خانوادگی:  <input type="text" value="{$info[1]}" size="30" id="name"/></p>
<p style="padding-top:20px;">پست الکترونیک :  <input type="text" value="{$info[2]}" size="50" id="email"/></p>
<p style="padding-top:20px;">شماره تماس :  <input type="text" value="{$info[3]}" size="30" id="phone"/></p>

<input type="button" id="btn" onclick="update_pdata();" value="ثبت اطلاعات"/>

</body>
</html>
