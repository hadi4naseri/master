<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function update()
{

if ($j('#maintain_msg').val() == "")
{
	document.getElementById("error_reporting").innerHTML='متنی جهت نمایش در صفحه اول سایت در حالت نگهداری وجود ندارد!';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{
  if ($j("#ordinal").is(':checked'))
  md=0;
  else if ($j("#exc").is(':checked'))
  md=1;
  else
  md=2;
  
  $j.ajax({
  type: "get",
  url: "change_maintain_mode_db.php",
  data: {mode:md,txt:document.getElementById("maintain_msg").value},
  success: function(data)
	{
		document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
	}
});
}
}
{/literal}
</script>
</head>

<body dir="rtl">


    <p style="font-weight:bold;margin-bottom:-20px;margin-top:20px;">به منظور انتخاب حالت نگهداری سایت یکی از موارد زیر را انتخاب نمائبد :</p>
	<table style="padding-top: 25px" style="text-align:justify;">
    <tr>
        <td style="text-align:justify;">
		{if $mode==0}
		<input type="radio" name="maintain" id="ordinal" checked onchange="$j('#msgtxt').slideUp();"/>
		{else}
		<input type="radio" name="maintain" id="ordinal" onchange="$j('#msgtxt').slideUp();" />
		{/if}
		<span>در این حالت سایت به صورت عادی بوده و مطالب نمایش داده شده و کاربران میتوانند به حسابهای کاربری خود وارد شوند</span>
		</td>
    </tr>
    <tr>
        <td style="text-align:justify;">
		{if $mode==1}
		<input type="radio" name="maintain" id="exc" checked onchange="$j('#msgtxt').slideDown();"/>
		{else}
		<input type="radio" name="maintain" id="exc" onchange="$j('#msgtxt').slideDown();" />
		{/if}
		<span>در این حالت سایت فاقد نمایش محتویات میباشد و تنها کاربران میتوانند از طریق پنل کاربری خود با هم در ارتباط بوده و امور مربوط به خود را انجام دهند.معمولا برای تغییر قالب سایت از این حالت استفاده میشود.</span>
		</td>
    </tr>
	<tr>
        <td style="text-align:justify;">
		{if $mode==2}
		<input type="radio" name="maintain" id="cri" checked onchange="$j('#msgtxt').slideDown();"/>
		{else}
		<input type="radio" name="maintain" id="cri" onchange="$j('#msgtxt').slideDown();" />
		{/if}
		<span>در این حالت تنها مدیران سایت میتوانند به سیستم وارد شده و سایت مورد دسترس همگان نخواهد بود. کاربران <u>نمیتوانند</u> وارد پنل خود شوند و برای اعمال تغییرات کلی از این حالت استفاده شود</span>
		</td>
    </tr>
	</table> 
    <div id="msgtxt" style="border:solid 1px black;">متن برای نمایش در صفحه نگهداری سایت :<input type="text" id="maintain_msg" value="{$message}" size="100" style="font-size:12px;"/></div>
	<br/>
	<input type="button"  onclick="update();" value="تغییر حالت نگهداری" />
    <div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:-25px;margin-right:50px;">
</div>       

</body>
</html>
