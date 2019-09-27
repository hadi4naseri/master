<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script type="text/javascript" src="../admin/js/jquery.idTabs.min.js"></script>
<link rel="stylesheet" href="../{$adm_path}/templates/css/file_preview.css"/>
{literal}
<script language="javascript">

function isNumberKey(evt)
{
 var charCode = (evt.which) ? evt.which : event.keyCode
 if (charCode > 31 && (charCode < 48 || charCode > 57))
	return false;

 return true;
}

function update_cols_width(t)
{
   if(t==0)
   {
   $('#r1').css('visibility','visible');
   $('#r2').css('visibility','hidden');
   $('#r3').css('visibility','hidden');
   document.getElementById('box1').value=document.getElementById('site_width').value;
   document.getElementById('box2').value=0;
   document.getElementById('box3').value=0;
   }
   else if(t==1)
   {
   $('#r1').css('visibility','visible');
   $('#r2').css('visibility','visible');
   $('#r3').css('visibility','hidden');
   document.getElementById('box1').value=parseInt(document.getElementById('site_width').value)/2;
   document.getElementById('box2').value=parseInt(document.getElementById('site_width').value)/2;
   document.getElementById('box3').value=0;
   }
   else
   {
   $('#r1').css('visibility','visible');
   $('#r2').css('visibility','visible');
   $('#r3').css('visibility','visible');
   document.getElementById('box1').value=parseInt(document.getElementById('site_width').value)/3;
   document.getElementById('box2').value=parseInt(document.getElementById('site_width').value)/3;
   document.getElementById('box3').value=parseInt(document.getElementById('site_width').value)/3;
   }
}

function update_size()
{

if (document.getElementById("site_width").value == "")
{
    document.getElementById("error_reporting").innerHTML='اندازه پهنای سایت وارد نشده است.';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else if (parseInt(document.getElementById("box1").value)+parseInt(document.getElementById("box2").value)+parseInt(document.getElementById("box3").value) < parseInt(document.getElementById("site_width").value)-2 )
{
    document.getElementById("error_reporting").innerHTML='اندازه های وارد شده برای پهنای ستونهای سایت کمتر از ابعاد مشخص شده است.';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else if (parseInt(document.getElementById("box1").value)+parseInt(document.getElementById("box2").value)+parseInt(document.getElementById("box3").value) > parseInt(document.getElementById("site_width").value)+2 )
{
    document.getElementById("error_reporting").innerHTML='اندازه های وارد شده برای پهنای ستونهای سایت بیشتر از ابعاد مشخص شده است.';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{
  $.ajax({
  type: "GET",
  url: "update_size.php",
  data: { site_width: document.getElementById("site_width").value,layout: document.getElementById("col_count").selectedIndex+1,cols_width:document.getElementById("box1").value+","+document.getElementById("box2").value+","+document.getElementById("box3").value},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		setTimeout('$j.fancybox.close();', 3500);
	}
});
}
}

function show_alert(block_id)
{
  $.ajax({
  type: "GET",
  url: "delete_alert_block.php",
  data: {bid:block_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
});
}


function show_alert_p(page_id)
{
  $.ajax({
  type: "GET",
  url: "delete_alert_page.php",
  data: {pid:page_id},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
});
}

function modify_activity_block(block_id)
{

  {/literal}
  path="../{$adm_path}";
  {literal}
  $.ajax({
  type: "GET",
  url: "modify_activity_block.php",
  data: {bid:block_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity"+block_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity"+block_id).attr("src",path+"/templates/images/active.png");

	}
});
}


function modify_activity_page(page_id)
{

  {/literal}
  path="../{$adm_path}";
  {literal}
  $.ajax({
  type: "GET",
  url: "modify_activity_page.php",
  data: {pid:page_id},
  success: function(data)
	{
  	    if(data==0)
  	    $j("#activity_p"+page_id).attr("src",path+"/templates/images/deactive.png");
  	    else
  	    $j("#activity_p"+page_id).attr("src",path+"/templates/images/active.png");

	}
});
}


function do_delete(block_id)
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

  xmlhttp.open("get","block_delete_db.php?bid="+block_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "block_settings.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2000);
		   setTimeout(function() {
		   document.getElementById('blks_mngt').click();
		   }, 2010);
    }
  }
}


function do_delete_p(page_id)
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

  xmlhttp.open("get","page_delete_db.php?pid="+page_id,true);
  xmlhttp.send();
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		var contentText = $.ajax({

                url: "block_settings.php",

                async: false

            }).responseText;
            //$j.fancybox(contentText);

		setTimeout(function() {
		   $j.fancybox(contentText);
		   }, 2000);
		   setTimeout(function() {
		   document.getElementById('page_mngt').click();
		   }, 2010);
    }
  }
}
{/literal}
layout="{$data[0][1]}";
{literal}

function do_update(block_id)
{
var contentText = $j.ajax({

        url: "block_update.php",
		data:{bid:block_id,lyt:layout},
        async: false

    }).responseText;
    $j.fancybox.close();
    $j.fancybox(contentText);
}


function do_update_p(page_id)
{
var contentText = $j.ajax({

        url: "page_update.php",
		data:{pid:page_id},
        async: false

    }).responseText;
    $j.fancybox.close();
    $j.fancybox(contentText);
}
</script>

<style>
.usual .tab {

background:orange;
  color:#111;
  width:850px;
}
.usual li { list-style:none; float:right;padding-top:5px; }
.usual ul { list-style:none; float:right;margin-top:-20px;padding-right:0; }
.usual ul a {
  display:block;
  padding:6px 10px;
  text-decoration:none!important;
  margin:1px;
  margin-right:0;

}
.usual ul a:hover {
  color:#FFF;
  background:#111;
  }
.usual ul a.selected {
  margin-bottom:0;
  color:#000;
  background:snow;
  border-bottom:1px solid snow;
  cursor:default;
  }
.usual,.tab {
  padding:20px 10px 8px 10px;
  margin-top:20px;
  clear:left;
  background:snow;
}

</style>
{/literal}
</head>

<body dir="rtl">

<div id="error_reporting" style="position: fixed;">
</div>

<p style="padding-top: 20px;font-weight: bold;">تنظیمات بلاکها :</p>
<div id="usual1" class="usual">
  <ul>
      <li><a class="selected" href="#tab1" style="background-color: red;" onclick="$j.fancybox.toggle();">تنظیمات ستون های سایت</a></li>
    <li><a href="#tab2" style="background-color: red;" onclick="$j.fancybox.toggle();" id="blks_mngt">مدیریت بلاک ها</a></li>
    <li><a href="#tab3" style="background-color: red;" onclick="$j.fancybox.toggle();" id="page_mngt">مدیریت صفحات</a></li>
  </ul>
    <div id="tab1" class="tab">
غیر فعال در سیستم جاری
    </div>
  <div id="tab2" class="tab">
غیر فعال در سیستم جاری
 </div>
 
   <div id="tab3" class="tab">

	<p >برای مدیریت صفحات سایت از جدول زیر استفاده نمائید:</p>

	<table border="1" class="grid">
	<tr>
	<td>ردیف</td>
	<td>عنوان صفحه</td>
	<td>ویرایش</td>
	<td>حذف</td>
	<td>فعال / غیر فعال</td>
	</tr>
	{for $i=0 to $pages|count -1}
	<tr>
	<td>{$i+1}</td>
	<td>{$pages[$i][1]}</td>
	<td><img src="../{$adm_path}/templates/images/edit.png"  style="border:0px;" onclick="do_update_p({$pages[$i][0]});"/></td>
	<td><img src="../{$adm_path}/templates/images/delete.png" style="border:0px;" onclick="show_alert_p({$pages[$i][0]});"/></td>
	<td>
	{if $pages[$i][2] eq 1}
	<img src="../{$adm_path}/templates/images/active.png" onclick="modify_activity_page({$pages[$i][0]});" id="activity_p{$pages[$i][0]}"/>
	{else}
	<img src="../{$adm_path}/templates/images/deactive.png" onclick="modify_activity_page({$pages[$i][0]});" id="activity_p{$pages[$i][0]}"/>
	{/if}
	</td>
	</tr>
	{/for}
	</table>

 </div>
 
</div>

<script type="text/javascript">
  $("#usual1 ul").idTabs();
</script>

</body>
</html>
