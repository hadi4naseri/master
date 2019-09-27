<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
var abs_path="{$site_domain}/admin/";
{literal}

  function del_role(f_id,g_id)
  {
		
		$.ajax({
		  type: "GET",
		  url: "delete_role.php",
		  data: {fid:f_id,gid:g_id},
		  success: function(data)
			{
				if (data==1)				
				{
					document.getElementById("error_reporting").innerHTML="دسترسی برای فایل مورد نظر به روز شد";
					$j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
					var contentText = $.ajax({

					url: abs_path + "mng_roles.php",

					async: false

					}).responseText;
					//$j.fancybox(contentText);

					setTimeout(function() {
				   $j.fancybox(contentText);
				   }, 1000);
				}
			}
		});	
	}
	
function show_alert(fid,gid)
{
  $j('html,body').animate({scrollTop: $j('#error_reporting').offset().top-10},'slow');

  $.ajax({
  type: "GET",
  url: abs_path + "delete_alert_role.php",
  data:{fid:fid,grp_id:gid},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
});
}

{/literal}
</script>
</head>

<body>

<p style="padding-top:20px;width:700px;">لیست زیر حاوی نام فایل هایی است که دارای سطح دسترسی خاصی هستند. حذف دسترسی به صورت اشتباه ممکن است باعث عدم دستیابی کاربران به اطلاعات شود . همچنین دسترسی مدیر سیستم قابل حذف نمی باشد..</p>
<br/>

<br/>
<div id="error_reporting" style="display:table;">
</div>
<table class="grid">
<tr>
<td>ردیف</td>
<td>نام فایل</td>
<td>عنوان فایل</td>
<td>نام گروه</td>
<td>سطح دسترسی</td>
<td>حذف دسترسی</td>
</tr>
{assign cnt "1"}
{for $i=0 to count($files)-1}

{assign gr explode(",",$files[$i][7])}
{for $j=0 to count($gr)-2}
{if $files[$i][3]!=0 && $files[$i][3]!=40}
<tr>
<td>{$cnt}</td>
<td>{$files[$i][1]}</td>
<td>{$files[$i][2]}</td>
<td>{$files[$i][5]}&nbsp;&nbsp;<img src="{$site_domain}/admin/templates/images/{$files[$i][6]}" style="width:32px;height:32px;margin-bottom:-15px"/></td>

{for $k=0 to count($grps)-1}
{if $grps[$k][0]==$gr[$j]}
<td>{$grps[$k][1]}</td>
{/if}
{/for}

{if $gr[$j]!=1}
<td><img src="{$site_domain}/admin/templates/images/delete.png" style="border:0px;" onclick="show_alert('{$files[$i][0]}','{$gr[$j]}');"/></td>
{else}
<td>---</td>
{/if}
{$cnt=$cnt+1}
{/if}
{/for}
</tr>

{/for}

</table>

</body>
</html>
