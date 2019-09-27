<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function update_image_dim()
{

if (document.getElementById("image_width").value == "" || document.getElementById("image_height").value == "")
{
    document.getElementById("error_reporting").innerHTML='اطلاعات مربوط به ابعاد تصویر وارد نشده است';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{
  $.ajax({
  type: "GET",
  url: "update_image_dimentions.php",
  data: { width: document.getElementById("image_width").value,height:document.getElementById("image_height").value},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		setTimeout('$j.fancybox.close();', 3500);
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

<p style="padding-top:20px;">پهنای تصویر &nbsp; :  <input type="text" value="{$width}" size="5" id="image_width" onkeypress="return isNumberKey(event)"/> پیکسل</p>
<p style="padding-top:20px;">ارتفاع تصویر&nbsp; :  <input type="text" value="{$height}" size="5" id="image_height" onkeypress="return isNumberKey(event)"/> پیکسل</p>

<input type="button" id="btn" onclick="update_image_dim();" value="ثبت تنظیمات"/>

</body>
</html>
