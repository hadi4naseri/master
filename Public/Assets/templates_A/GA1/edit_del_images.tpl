<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function do_delete(img_id)
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

  xmlhttp.open("get","image_delete_db.php?iid="+img_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "edit_del_images.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2000);
    }
  }
}

function show_alert(img_id)
{
  $j('html,body').animate({scrollTop: $j('#error_reporting').offset().top-10},'slow');
  $.ajax({
  type: "GET",
  url: "delete_alert_image.php",
  data: {iid:img_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	    //setTimeout('$j.fancybox.close();', 4000);
	}
});
}

function modify_activity_image(img_id)
{

  {/literal}
  path="../{$adm_path}";
  {literal}
  $j("#activity"+img_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: "modify_activity_image.php",
  data: {iid:img_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity"+img_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity"+img_id).attr("src",path+"/templates/images/active.png");

	}
});
}

{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="display:table;">
</div>

<p style="padding-top:20px;">برای حذف و غیرفعال سازی تصاویر درج شده در گالری سایت از جدول زیر استفاده نمائید...</p>

<table border="1" class="grid">
<tr>
<td>ردیف</td>
<td>تصویر</td>
<td>تاریخ درج</td>
<td>حذف</td>
<td>فعال / غیر فعال</td>
</tr>

{for $i=0 to $all_images|count -1}
<tr>
<td>{$i+1}</td>
<td><img src="{$site_domain}/admin/Files/thumbs/{$all_images[$i][1]}"/></td>
<td>{$all_images[$i][2]}</td>

<td><img src="../{$adm_path}/templates/images/delete.png" style="border:0px;" onclick="show_alert({$all_images[$i][0]});"/></td>
<td>
{if $all_images[$i][3] eq 1}
<img src="../{$adm_path}/templates/images/active.png" onclick="modify_activity_image({$all_images[$i][0]});" id="activity{$all_images[$i][0]}"/>
{else}
<img src="../{$adm_path}/templates/images/deactive.png" onclick="modify_activity_image({$all_images[$i][0]});" id="activity{$all_images[$i][0]}"/>
{/if}
</td>
</tr>
{/for}

</table>

</body>
</html>
