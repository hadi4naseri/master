<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function do_delete(sound_id)
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

  xmlhttp.open("get","sound_delete_db.php?sid="+sound_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "edit_del_sounds.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2000);
    }
  }
}

function do_update(sound_id)
{
var contentText = $j.ajax({

        url: "sound_update.php",
		data:"sid="+sound_id,
        async: false

    }).responseText;
    $j.fancybox.close();
    $j.fancybox(contentText);
}


function show_alert(sound_id)
{
  $j('html,body').animate({scrollTop: $j('#error_reporting').offset().top-10},'slow');
  $.ajax({
  type: "GET",
  url: "delete_alert_sound.php",
  data: {sid:sound_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	    //setTimeout('$j.fancybox.close();', 4000);
	}
});
}

function modify_activity_sound(sound_id)
{

  {/literal}
  path="../{$adm_path}";
  {literal}
  $j("#activity"+sound_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: "modify_activity_sound.php",
  data: {sid:sound_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity"+sound_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity"+sound_id).attr("src",path+"/templates/images/active.png");

	}
});
}


function modify_accept_sound(sound_id)
{

  {/literal}
  path="../{$adm_path}";
  {literal}
  $j("#accept"+sound_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: "modify_accept_sound.php",
  data: {sid:sound_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#accept"+sound_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#accept"+sound_id).attr("src",path+"/templates/images/active.png");

	}
});
}

{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="display:table;">
</div>

<p style="padding-top:20px;">برای ویرایش و یا حذف و غیرفعال سازی کلیپ های صوتی درج شده در سایت از جدول زیر استفاده نمائید...</p>

<table border="1" class="grid">
<tr>
<td>ردیف</td>
<td>عنوان کلیپ صوتی</td>
<td>تعداد بازدید</td>
<td>ارسال کننده کلیپ</td>
<td>مشاهده/دریافت</td>
<td>ویرایش</td>
<td>حذف</td>
<td>فعال / غیر فعال</td>
<td>وضعیت پذیرش مدیر</td>
</tr>

{for $i=0 to $all_sounds|count -1}
<tr>
<td>{$i+1}</td>
<td>{$all_sounds[$i][1]}</td>
<td>{$all_sounds[$i][3]}</td>
<td>{$all_sounds[$i][7]}</td>
<td>
{assign var=sounds value=","|explode:$all_sounds[$i][4] }

{for $f=0 to $sounds|count -1}
<a href="{$site_domain}/{$sounds[$f]|replace:'//':'/'}"><img src="../{$adm_path}/templates/images/view.png"/></a>
{/for}
</td>
<td><img src="../{$adm_path}/templates/images/edit.png"  style="border:0px;" onclick="do_update({$all_sounds[$i][0]});"/></td>
<td><img src="../{$adm_path}/templates/images/delete.png" style="border:0px;" onclick="show_alert({$all_sounds[$i][0]});"/></td>
<td>
{if $all_sounds[$i][5] eq 1}
<img src="../{$adm_path}/templates/images/active.png" onclick="modify_activity_sound({$all_sounds[$i][0]});" id="activity{$all_sounds[$i][0]}"/>
{else}
<img src="../{$adm_path}/templates/images/deactive.png" onclick="modify_activity_sound({$all_sounds[$i][0]});" id="activity{$all_sounds[$i][0]}"/>
{/if}
</td>
<td>
{if $all_sounds[$i][6] eq 1}
<img src="../{$adm_path}/templates/images/active.png" onclick="modify_accept_sound({$all_sounds[$i][0]});" id="accept{$all_sounds[$i][0]}"/>
{else}
<img src="../{$adm_path}/templates/images/deactive.png" onclick="modify_accept_sound({$all_sounds[$i][0]});" id="accept{$all_sounds[$i][0]}"/>
{/if}
</td>
</tr>
{/for}

</table>

</body>
</html>
