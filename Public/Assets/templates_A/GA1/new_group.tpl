<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
var abs_path="{$site_domain}/admin/";
{literal}

function do_delete(grp_id)
{
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.open("get","group_delete_db.php?gid="+grp_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    if (xmlhttp.responseText==1)
		{
		document.getElementById("error_reporting").innerHTML="گروه مورد نظر با موفقیت حذف شد";
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "new_group.php",

                async: false

            }).responseText;
	
		   setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2500);
		 }
		 else if (xmlhttp.responseText==-2)
		 {
			document.getElementById("error_reporting").innerHTML="این گروه قابل حذف نمی باشد!!!";
			$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		 }
    }
  }
}

function show_alert(grp_id)
{
  $.ajax({
  type: "GET",
  url: abs_path + "delete_alert_groups.php",
  data: {gid:grp_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(3500).fadeOut("slow");
	}
});
}

function register_group()
{

  if ($j('#group_name').val().trim()=="") return;
  
  $.ajax({
  type: "GET",
  url: "new_group_db.php",
  data: {grp_name:$('#group_name').val()},
  success: function(data)
	{
		if (data==1)
		{
		document.getElementById("error_reporting").innerHTML='گروه مورد نظر با موفقیت ثبت شد';
		$('#group_name').val="";
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

			url: "new_group.php",

			async: false

		}).responseText;
		
		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2500);
		
		}
		
		else if (data==0)
		{
		document.getElementById("error_reporting").innerHTML='نام گروه وارد شده تکراری است';
		$j('#group_name').val("");
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		}
		else if (data==-1)
		{
		document.getElementById("error_reporting").innerHTML='نام گروه میبایست از حروف انگلیسی تشکیل شده باشد';
		$j('#group_name').val("");
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		}
	}
});
}


{/literal}
</script>
</head>

<body dir="rtl">

<p style="padding-top:20px;">برای تعریف گروه کاربری جدید نام مورد نظر گروه را وارد نمائید .نام گروه باید با حروف انگلیسی نوشته شود و تکراری نباشد<br/><div><b>گروه های کاربری ثبت شده :</b> {for $i=0 to count($all_groups)-1}<span style="background-color:#518495;color:white;margin-right:5px;font-weight:bold;font-size:12px;border-radius:4px;height:25px;display:inline-block;padding-top:4px;padding-left:4px;padding-right:4px;" onmouseover="$(this).css('color','black');" onmouseout="$(this).css('color','white');">{$all_groups[$i][0]}</span>{/for}</div><br/>نام گروه : <input type="text" size="40" id="group_name" /></p>
<input type="button" id="btn" onclick="register_group();" value="ایجاد گروه جدید"/>
<div id="error_reporting" style="position: absolute;height:20px;right:120px;margin-top:-30px;"></div>
<br/>
<div>
<p>برای حذف گروه های کاربری سایت از جدول زیر استفاده نمائید.<span style="color:red;font-weight:bold;">لازم به ذکر است که کاربران در گروه حذف شده به گروه User منتقل می شوند</span></p>
<table class="grid">
<tr>
<td>ردیف
</td>
<td>نام گروه
</td>
<td>حذف گروه</td>
</tr>
{for $i=0 to $all_groups|count -1}
<tr>
<td>{$i+1}</td>
<td>{$all_groups[$i][0]}</td>
<td><img src="../{$adm_path}/templates/images/delete.png" style="border:0px;" onclick="show_alert({$all_groups[$i][1]});"/></td>
</tr>
{/for}
</table>
</div>
</body>
</html>
