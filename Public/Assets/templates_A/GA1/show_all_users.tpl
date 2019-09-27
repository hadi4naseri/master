<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">
{literal}
function do_delete(usr_id)
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
  
  xmlhttp.open("get","user_delete_db.php?pid="+usr_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "show_all_users.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);
		
		setTimeout(function() {
		   $j.fancybox(contentText);		   
		   }, 2000);
    }
  }
}

function show_alert(usr_id)
{
  $.ajax({
  type: "GET",
  url: "delete_alert_user.php",
  data: {pid:usr_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	    //setTimeout('$j.fancybox.close();', 4000);
	}
});
}

  
function modify_activity(usr_id,usrname)
{
  {/literal}
  path="../{$adm_path}";
  {literal}
  $j("#activity_u"+usr_id).attr("src",path+"/templates/images/wait.gif");
  $.ajax({
  type: "GET",
  url: "modify_activity_user.php",
  data: {pid:usr_id,uname:usrname},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity_u"+usr_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity_u"+usr_id).attr("src",path+"/templates/images/active.png");

	}
});
}  

function change_role(person,role)
{
  $.ajax({
  type: "GET",
  url: "change_role.php",
  data: {pid:person,role:role.trim()}
});
} 
 
function send_message(id,nam)
{

var contentText = $j.ajax({

        url: "new_message.php",
		data:"uname="+nam+"&uid="+id,
        async: false

    }).responseText;
    $j.fancybox.close();
    $j.fancybox(contentText);

}

 
{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="position: fixed;">
</div>

<p style="padding-top:20px;">برای ویرایش و یا حذف و غیرفعال سازی لیست کاربران سایت از جدول زیر استفاده نمائید...</p>

<table border="1" class="grid">
<tr>
<td>ردیف</td>
<td>نام</td>
<td>نام کاربری</td>
<td>آدرس ایمیل</td>
<td>تلفن تماس</td>
<td>گروه کاربری</td>
<td>تعداد فایل</td>
<td>حجم پوشه(MB)</td>
<td>آخرین دسترسی</td>
<td>حذف</td>
<td>فعال / غیر فعال</td>
<td>ارسال پیام شخصی</td>
</tr>

{for $i=0 to $all_users|count -1}
<tr>
<td>{$i+1}</td>
<td>{$all_users[$i][2]}</td>
<td>{$all_users[$i][1]}</td>
<td>{$all_users[$i][3]}</td>
<td>{$all_users[$i][4]}</td>
<td>
<select onchange="change_role({$all_users[$i][0]},this.value);">
{for $j=0 to count($all_groups)-1}
{if $all_users[$i][6]=={$all_groups[$j][0]}}
<option selected>{$all_groups[$j][1]}</option>
{else}
<option>{$all_groups[$j][1]}</option>
{/if}
{/for}
</select>
</td>
<td>
{$files_info[$i]['cnt']}
</td>
<td>
{$files_info[$i]['size']}
</td>
<td>{$all_users[$i][7]}</td>
<td>
{if $user_info[2]<>$all_users[$i][0]}
<img src="{$site_domain}/admin/templates/images/delete.png" style="border:0px;cursor:pointer;" onclick="show_alert({$all_users[$i][0]});"/>
{/if}
</td>
<td>
{if $user_info[2]<>$all_users[$i][0]}
{if $all_users[$i][5]==1}
<img src="{$site_domain}/admin/templates/images/active.png" style="cursor:pointer;" onclick="modify_activity({$all_users[$i][0]},'{$all_users[$i][1]}');" id="activity_u{$all_users[$i][0]}"/>
{else}
<img src="{$site_domain}/admin/templates/images/deactive.png" style="cursor:pointer;" onclick="modify_activity({$all_users[$i][0]},'{$all_users[$i][1]}');" id="activity_u{$all_users[$i][0]}"/>
{/if}
{/if}
</td>
<td>
{if $user_info[2]<>$all_users[$i][0] && $all_users[$i][5]==1}
<img src="{$site_domain}/admin/templates/images/message.png"  onclick="send_message({$all_users[$i][0]},'{$all_users[$i][2]}')"  style="border:0px;cursor:pointer;"/></td>
{/if}
</tr>
{/for}

</table>

</body>
</html>
