<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function do_delete(id)
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

  xmlhttp.open("get","vnews_delete_db.php?nid="+id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "edit_vnews.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2000);
    }
  }
}

function show_alert(vpic_id)
{
  $j('html,body').animate({scrollTop: $j('#error_reporting').offset().top-10},'slow');
  $.ajax({
  type: "GET",
  url: "delete_alert_vnews.php",
  data: {nid:vpic_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
});
}

function modify_activity(vpic_id)
{
  {/literal}
  path="../{$adm_path}";
  {literal}
  $j("#activity"+vpic_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: "modify_activity_vnews.php",
  data: {nid:vpic_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity"+vpic_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity"+vpic_id).attr("src",path+"/templates/images/active.png");

	}
});
}

{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="display:table;">
</div>

<p style="padding-top:20px;">برای  حذف و یا غیرفعال سازی تصاویر خبر تصویری در سایت از جدول زیر استفاده نمائید...</p>

<table border="1" class="grid">
<tr>
<td>ردیف</td>
<td>تصویر</td>
<td>حذف</td>
<td>فعال / غیر فعال</td>
</tr>

{for $i=0 to $all_pics|count -1}
<tr>
<td>{$i+1}</td>
<td><img src="{$all_pics[$i][1]}" width="200" height="100"/></td>
<td><img src="../{$adm_path}/templates/images/delete.png" style="border:0px;" onclick="show_alert({$all_pics[$i][0]});"/></td>
<td>
{if $all_pics[$i][2] eq 1}
<img src="../{$adm_path}/templates/images/active.png" onclick="modify_activity({$all_pics[$i][0]});" id="activity{$all_pics[$i][0]}"/>
{else}
<img src="../{$adm_path}/templates/images/deactive.png" onclick="modify_activity({$all_pics[$i][0]});" id="activity{$all_pics[$i][0]}"/>
{/if}
</td>
</tr>
{/for}

</table>

</body>
</html>
