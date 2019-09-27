<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />


<script language="javascript" type="text/javascript">
var abs_path="{$site_domain}/admin/";

{literal}
function do_delete(msg_id)
{
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.open("get",abs_path+"message_delete_db.php?mid="+msg_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: abs_path + "inbox.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2000);
    }
  }
}


function show_alert(msg_id)
{
  $j.ajax({
  type: "GET",
  url: abs_path + "delete_alert_message.php",
  data: {mid:msg_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	    //setTimeout('$j.fancybox.close();', 4000);
	}
});
}

{/literal}
</script>
</head>

<body style="width:600px;">

<div id="error_reporting" style="position: fixed;">
</div>

<p style="padding-top:20px;width:98%;">برای مدیریت پیام های خوداز فرم زیر استفاده نمائید. همچنین برای مشاهده جزئیات پیام و یا استفاده از فایل های ضمیمه بر روی سطر هر پیام کلیک نمائید.</p>

<table width="700px">
<tr>
<td>
{for $i=0 to $all_msgs|count -1}
<div style="width:98%;background-color:#8787FF;border:solid 2px black;margin-top:2px;" onclick="$j(this).next().toggle();$j.fancybox.update();"><b>عنوان پیام :</b> {$all_msgs[$i][2]} <br/> <b>فرستنده : </b><div onclick="event.stopPropagation();">{$all_msgs[$i][1]} | {if $all_msgs[$i][3] neq ""} <img src="{$site_domain}/admin/templates/images/attachment.png" style="width:32px;height:32px;margin-bottom:-9px;" /> {else} --- {/if} | <img src="{$site_domain}/admin/templates/images/delete.png" style="border:0px;width:20px;height:20px;margin-bottom:-5px;" onclick="show_alert({$all_msgs[$i][0]});"/></div></div>
<div style="width:98%;display:none;border:solid 1px black;text-align:justify;float:right;background-color:white;"><b>متن پیام : </b><br/>{$all_msgs[$i][6]}<br/>
<b>ارسال شده در : </b>{$all_msgs[$i][5]}<br/>
{if $all_msgs[$i][3] neq ""}
<span style="float:right;"><b>فایل های ضمیمه : </b></span>
{assign files explode(",",$all_msgs[$i][3])}
{for $j=0 to count($files)-1}
<div style="display:block;float:right;"><a href="{$site_domain}/{$files[$j]}"><img src="{$site_domain}/admin/templates/images/file.png" style="width:32px;height:32px;"/></a></div>
{/for}
{/if}
</div>
{/for}
</td>
</tr>
</table>
</body>
</html>
