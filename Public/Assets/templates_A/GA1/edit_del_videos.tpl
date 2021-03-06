<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function do_delete(video_id)
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

  xmlhttp.open("get","video_delete_db.php?vid="+video_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "edit_del_videos.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2000);
    }
  }
}

function do_update(video_id)
{
var contentText = $j.ajax({

        url: "video_update.php",
		data:"vid="+video_id,
        async: false

    }).responseText;
    $j.fancybox.close();
    $j.fancybox(contentText);
}


function show_alert(video_id)
{
  $j('html,body').animate({scrollTop: $j('#error_reporting').offset().top-10},'slow');
  $.ajax({
  type: "GET",
  url: "delete_alert_video.php",
  data: {vid:video_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	    //setTimeout('$j.fancybox.close();', 4000);
	}
});
}

function modify_activity_video(video_id)
{

  {/literal}
  path="../{$adm_path}";
  {literal}
  $j("#activity"+video_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: "modify_activity_video.php",
  data: {vid:video_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity"+video_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity"+video_id).attr("src",path+"/templates/images/active.png");

	}
});
}

function modify_accept_video(video_id)
{

  {/literal}
  path="../{$adm_path}";
  {literal}
  $j("#accept"+video_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: "modify_accept_video.php",
  data: {vid:video_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#accept"+video_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#accept"+video_id).attr("src",path+"/templates/images/active.png");

	}
});
}

{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="display:table;">
</div>

<p style="padding-top:20px;">برای ویرایش و یا حذف و غیرفعال سازی کلیپ های تصویری درج شده در سایت از جدول زیر استفاده نمائید...</p>

<table border="1" class="grid">
<tr>
<td>ردیف</td>
<td>عنوان کلیپ تصویری</td>
<td>تعداد بازدید</td>
<td>ارسال کننده کلیپ</td>
<td>ویرایش</td>
<td>حذف</td>
<td>فعال / غیر فعال</td>
<td>وضعیت پذیرش مدیر</td>
</tr>

{for $i=0 to $all_videos|count -1}
<tr>
<td>{$i+1}</td>
<td>{$all_videos[$i][1]}</td>
<td>{$all_videos[$i][3]}</td>
<td>{$all_videos[$i][7]}</td>
<td><img src="../{$adm_path}/templates/images/edit.png"  style="border:0px;" onclick="do_update({$all_videos[$i][0]});"/></td>
<td><img src="../{$adm_path}/templates/images/delete.png" style="border:0px;" onclick="show_alert({$all_videos[$i][0]});"/></td>
<td>
{if $all_videos[$i][5] eq 1}
<img src="../{$adm_path}/templates/images/active.png" onclick="modify_activity_video({$all_videos[$i][0]});" id="activity{$all_videos[$i][0]}"/>
{else}
<img src="../{$adm_path}/templates/images/deactive.png" onclick="modify_activity_video({$all_videos[$i][0]});" id="activity{$all_videos[$i][0]}"/>
{/if}
</td>
<td>
{if $all_videos[$i][6] eq 1}
<img src="../{$adm_path}/templates/images/active.png" onclick="modify_accept_video({$all_videos[$i][0]});" id="accept{$all_videos[$i][0]}"/>
{else}
<img src="../{$adm_path}/templates/images/deactive.png" onclick="modify_accept_video({$all_videos[$i][0]});" id="accept{$all_videos[$i][0]}"/>
{/if}
</td>
</tr>
{/for}

</table>

</body>
</html>
