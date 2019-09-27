<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />


<script language="javascript" type="text/javascript">
{literal}

function load_file()
{
if (document.getElementById('modules_list').selectedIndex!=0)
{
	$.ajax({
	  type: "GET",
	  url: "load_file.php",
	  data: {mname: $('#modules_list').val()},
	  success: function(data)
		{
		
		$j('#editor11').text(data);	
		$j('#editor11').css('direction','ltr');				
		}
	});
}
}

  
  function save()
  {
	if ($('#modules_list').val()==0)
	{
		document.getElementById("error_reporting").innerHTML="فایلی انتخاب نشده است";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
	else
	{			
		$.ajax({
		  type: "POST",
		  url: "update_file.php",
		  data: {mname: $('#modules_list').val(),cont:encodeURIComponent($j('#editor11').val())},
		  success: function(data)
			{
				
				if (data==1)				
				{
					document.getElementById("error_reporting").innerHTML="به روز رسانی فایل با موفقیت انجام شد";
					$j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
				}
			}
		});	
		
	}
  }
{/literal}
</script>
</head>

<body>

<p style="font-size:15px;color:red">تغییرات فایل ها ممکن است اثرات جدی بر نمایش غیر صحیح و عملکرد نامناسب سایت داشته باشد.برای اعمال تغییرات با برنامه نویسان سیستم مشورت نمائید</p>
<p style="padding-top:20px;">برای ویرایش فایل های قالب آن را از لیست انتخاب نموده و پس از ویرایش بر روی گزینه ذخیره کردن کلیک کنید.</p>
<br/>


نام ماژول : <select id ="modules_list" onchange="load_file();">
<option value="0">یکی از موارد را انتخاب نمائید</option>
<option value="index">قالب صفحه اصلی</option>
{for $i=0 to count($modules)-1}
<option value="{$modules[$i][0]}">{$modules[$i][1]}</option>
{/for}
</select>
<input type="button" value="پاک کردن کد" onclick="$j('#editor11').val('')"/>

<br/>
	<textarea id="editor11" name="content" cols="100" rows="5" style="direction:rtl;width:100%;font-family:inherit;">
برای ویرایش فایل ها، نام فایل را از لیست بالا انتخاب نمائید
</textarea>
<br/>
<input type="button" id="btn" onclick="save();" value="ذخیره کردن" /><div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:-25px;">
</div>

</body>
</html>
