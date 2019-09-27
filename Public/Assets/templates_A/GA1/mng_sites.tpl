<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />


<script language="javascript" type="text/javascript">
{literal}
function do_delete(site_id)
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

  xmlhttp.open("get","sites_delete_db.php?sid="+site_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "edit_del_sites.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2000);
    }
  }
}


function show_alert(site_id)
{
  $j('html,body').animate({scrollTop: $j('#error_reporting').offset().top-10},'slow');
  $.ajax({
  type: "GET",
  url: "delete_alert_sites.php",
  data: {sid:site_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	    //setTimeout('$j.fancybox.close();', 4000);
	}
});
}


function modify_activity(site_id)
{
  {/literal}
  path="../{$adm_path}";
  {literal}
  $j("#activity"+site_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: "modify_activity_site.php",
  data: {sid:site_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity"+site_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity"+site_id).attr("src",path+"/templates/images/active.png");

	}
});
}

{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="display:table;">
</div>

<p style="padding-top:20px;width:500px;">برای غیر فعال کردن زیر سایت و یا حذف آن از جدول زیر استفاده نمائید. در صورت حذف زیر سایت تمامی اطلاعات پایگاه داده و همچنین فایل قالب آن از بین خواهد رفت. توصیه می شود قبل از حذف به زیر سایت مراجعه کرده و از پایگاه داده آن پشتیبان تهیه شود</p>

<table border="1" class="grid">
<tr>
<td>ردیف</td>
<td>عنوان سایت</td>
<td>فعال/غیرفعال</td>
<td>حذف</td>
</tr>

{for $i=0 to $sites|count -1}
<tr>
<td>{$i+1}</td>
<td>{$sites[$i][1]}</td>
{if $sites[$i][0]!=1}
	{if $sites[$i][2]==0}
	<td><img src="../{$adm_path}/templates/images/deactive.png" id="activity{$sites[$i][0]}" style="border:0px;" onclick="modify_activity({$sites[$i][0]});"/></td>
	{else}
	<td><img src="../{$adm_path}/templates/images/active.png" id="activity{$sites[$i][0]}" style="border:0px;" onclick="modify_activity({$sites[$i][0]});"/></td>
	{/if}
{else}
<td>---</td>
{/if}	
<td>
{if $sites[$i][0]==1}
<span>---</span>
{else}
<img src="../{$adm_path}/templates/images/delete.png" style="border:0px;" onclick="show_alert({$sites[$i][0]});"/>
{/if}
</td>

</tr>
{/for}

</table>

</body>
</html>
