<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />


<script language="javascript" type="text/javascript">
{literal}
function do_delete(com_id)
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

  xmlhttp.open("get","admin_comment_delete_db.php?cid="+com_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "mng_messages.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2000);
    }
  }
}


function show_alert(com_id)
{
  $j('html,body').animate({scrollTop: $j('#error_reporting').offset().top-10},'slow');
  $.ajax({
  type: "GET",
  url: "delete_alert_admin_comment.php",
  data: {cid:com_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	    //setTimeout('$j.fancybox.close();', 4000);
	}
});
}


function modify_activity(com_id)
{
  {/literal}
  path="../{$adm_path}";
  {literal}
  $j("#activity"+com_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: "modify_activity_message.php",
  data: {cid:com_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity"+com_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity"+com_id).attr("src",path+"/templates/images/active.png");

	}
});
}

{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="display:table;">
</div>

<p style="padding-top:20px;">برای تائید نظر رسیده برای نمایش در مطلب و یا حذف آن از جدول زیر استفاده نمائید</p>

<table border="1" class="grid">
<tr>
<td>ردیف</td>
<td>ارسال کننده</td>
<td>پیام</td>
<td>بخش</td>
<td>آیتم</td>
<td>تاریخ و زمان ارسال</td>
<td>فعال/غیرفعال</td>
<td>حذف</td>
</tr>

{for $i=0 to $comments|count -1}
<tr>
<td>{$i+1}</td>
<td>{$comments[$i][1]}</td>
<td>{$comments[$i][2]}</td>
<td>{$comments[$i][5]}</td>
<td>{$comments[$i][6]}</td>
<td>{$comments[$i][3]}</td>
{if $comments[$i][4]==0}
<td><img src="../{$adm_path}/templates/images/deactive.png" id="activity{$comments[$i][0]}" style="border:0px;" onclick="modify_activity({$comments[$i][0]});"/></td>
{else}
<td><img src="../{$adm_path}/templates/images/active.png" id="activity{$comments[$i][0]}" style="border:0px;" onclick="modify_activity({$comments[$i][0]});"/></td>
{/if}
<td><img src="../{$adm_path}/templates/images/delete.png" style="border:0px;" onclick="show_alert({$comments[$i][0]});"/></td>
</tr>
{/for}

</table>

</body>
</html>
