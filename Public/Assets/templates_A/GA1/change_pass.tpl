<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function change_password(uid,user_slt)
{
if (document.getElementById("new_pass").value == "")
{
    document.getElementById("error_reporting").innerHTML='لطفاً کلمه عبور جدید را مشخص نمائید...';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else if (document.getElementById("old_pass").value == "")
{
    document.getElementById("error_reporting").innerHTML='کلمه عبور فعلی وارد نشده است...';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else if(document.getElementById("new_pass").value != document.getElementById("re_new_pass").value)
    {
document.getElementById("error_reporting").innerHTML='کلمه عبور و تکرار آن صحیح نمی باشند.';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
    else if( document.getElementById("new_pass").value.length <6)
    {
document.getElementById("error_reporting").innerHTML='طول رمز عبور تعیین شده می بایست بیشتر از 6 کاراکتر باشد.';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{
  $.ajax({
  type: "POST",
  url: "change_password.php",
  data: {userid:uid,old_pass:document.getElementById("old_pass").value,new_pass:document.getElementById("new_pass").value,salt:user_slt},
  success: function(data)
	{
  	    if(data!="-1")
		{
		document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		window.location.href='logout.php?uid='+uid;
		}
		else
		{
		document.getElementById("error_reporting").innerHTML="رمز عبور فعلی نادرست وارد شده است!";
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		$j('#old_pass').val("");
		
		
			$j('#old_pass').css("border","solid 2px red");
		
		}
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

    <table style="padding-top: 25px">
    <tr>
        <td> نام کاربری :</td>
        <td><input type="text" value="{$username}" size="20" id="site_title" readonly="readonly"/></td>
    </tr>
    <tr>
        <td>نام کاربر :</td>
        <td><input type="text" size="20" readonly="readonly" value="{$uname}"/></td>
    </tr>
	<tr>
        <td>کلمه عبور قبلی</td>
        <td><input type="password" size="20" id="old_pass" onkeydown="$j(this).css(&quot;border&quot;,&quot;none&quot;);"/></td>
    </tr>
    <tr>
        <td>کلمه عبور جدید</td>
        <td><input type="password" size="20" id="new_pass"/></td>
    </tr>
    <tr>
        <td>تکرار کلمه عبور جدید</td>
        <td><input type="password" size="20" id="re_new_pass"/></td>
    </tr>
    
    </table>    

<input type="button" id="btn" onclick="change_password({$uid},{$salt});" value="تغییر کلمه عبور"/>

</body>
</html>
