<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />


<script language="javascript" type="text/javascript">
var abs_path="{$site_domain}/admin/";

{literal}
function do_delete(news_id)
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

  xmlhttp.open("get",abs_path+"news_delete_db.php?nid="+news_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: abs_path + "edit_del_news.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2500);
    }
  }
}

function do_update(news_id)
{
var contentText = $j.ajax({

        url: abs_path + "news_update.php",
		data:"nid="+news_id,
        async: false

    }).responseText;
    $j.fancybox.close();
    $j.fancybox(contentText);
}


function show_alert(news_id)
{
  $j('html,body').animate({scrollTop: $j('#error_reporting').offset().top-10},'slow');
  $.ajax({
  type: "GET",
  url: abs_path + "delete_alert_news.php",
  data: {nid:news_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	    //setTimeout('$j.fancybox.close();', 4000);
	}
});
}

function modify_activity_news(news_id)
{


  {/literal}
  path="{$site_domain}/admin";
  {literal}
  $j("#activity"+news_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: abs_path + "modify_activity.php",
  data: {nid:news_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity"+news_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity"+news_id).attr("src",path+"/templates/images/active.png");

	}
});
}

function modify_accept_news(news_id)
{

  {/literal}
  path="{$site_domain}/admin";
  {literal}
  $j("#accept"+news_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: abs_path + "modify_accept.php",
  data: {nid:news_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#accept"+news_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#accept"+news_id).attr("src",path+"/templates/images/active.png");

	}
});
}

{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="display:table;">
</div>

<p style="padding-top:20px;">برای ویرایش و یا حذف و غیرفعال سازی اخبار درج شده در سایت از جدول زیر استفاده نمائید...</p>

<table border="1" class="grid">
<tr>
<td>ردیف</td>
<td>عنوان خبر</td>
<td>تاریخ درج</td>
<td>ارسال کننده خبر</td>
<td>ویرایش</td>
<td>حذف</td>
<td>فعال / غیر فعال</td>
<td>وضعیت پذیرش مدیر</td>
</tr>

{for $i=0 to $all_news|count -1}
<tr>
<td>{$i+1}</td>
<td>{$all_news[$i][1]}</td>
<td>{$all_news[$i][2]}</td>
<td>{$all_news[$i][5]}</td>
<td><img src="{$site_domain}/admin/templates/images/edit.png"  style="border:0px;" onclick="do_update({$all_news[$i][0]});"/></td>
<td><img src="{$site_domain}/admin/templates/images/delete.png" style="border:0px;" onclick="show_alert({$all_news[$i][0]});"/></td>
<td>
{if $all_news[$i][3] eq 1}
<img src="{$site_domain}/admin/templates/images/active.png" onclick="modify_activity_news({$all_news[$i][0]});" id="activity{$all_news[$i][0]}"/>
{else}
<img src="{$site_domain}/admin/templates/images/deactive.png" onclick="modify_activity_news({$all_news[$i][0]});" id="activity{$all_news[$i][0]}"/>
{/if}
</td>
<td>
{if $all_news[$i][4] eq 1}
<img src="{$site_domain}/admin/templates/images/active.png" onclick="modify_accept_news({$all_news[$i][0]});" id="accept{$all_news[$i][0]}"/>
{else}
<img src="{$site_domain}/admin/templates/images/deactive.png" onclick="modify_accept_news({$all_news[$i][0]});" id="accept{$all_news[$i][0]}"/>
{/if}
</td>
</tr>
{/for}

</table>

</body>
</html>
