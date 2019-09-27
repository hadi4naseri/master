<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />


<script language="javascript" type="text/javascript">
var abs_path="{$site_domain}/admin/";
function do_delete(tbl,mdl_name,ref,iid)
{literal}
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

  xmlhttp.open("get",abs_path+"relation_delete.php?table="+tbl+"&module_name="+mdl_name+"&ref="+ref+"&item="+iid,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: abs_path + "edit_del_relation.php",

                async: false

            }).responseText;

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 1000);
    }
  }
}

function show_alert(tbl,mdl,val,iid)
{
  $j('html,body').animate({scrollTop: $j('#error_reporting').offset().top-10},'slow');
  $.ajax({
  type: "GET",
  url: abs_path + "delete_alert_relation.php",
  data:{table:tbl,mrg_module:mdl,value:val,item_id:iid},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
});
}

{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="display:table;"></div>

<p style="padding-top:20px;">در جدول زیر رابطه های ایجاد شده بین ماژولها آورده شده است</p>

<table border="1" class="grid">
<tr>
<td>ردیف</td>
<td>نام ماژول</td>
<td>آیتم</td>
<td>نام ماژول مرتبط</td>
<td>حذف</td>
</tr>

{for $i=0 to $relations|count-1}
<tr>
<td>{$i+1}</td>
<td>{$relations[$i]["module"]}</td>
<td style="font-family:inherit;">{$relations[$i]["item"]}</td>
<td>{$relations[$i]["title"]}</td>
<td><img src="{$site_domain}/admin/templates/images/delete.png" style="border:0px;" onclick="show_alert('{$relations[$i]['mapped_table']}','{$relations[$i]['name']}','{$relations[$i]['value']}','{$relations[$i]['iid']}');"/></td>
</tr>
{/for}

</table>

</body>
</html>
