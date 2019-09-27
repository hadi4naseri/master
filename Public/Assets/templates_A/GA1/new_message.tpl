<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<link rel="stylesheet" href="../{$adm_path}/templates/css/file_preview.css"/>

<script type="text/javascript">

var sender_name="{$sender_uname}";

{literal}
     $j(document).ready(function(){
     
	 flag=false;
     for (x in CKEDITOR.instances)
	 {
	 flag=true;
	 break;
	 }

     if(flag==true)
     {
        delete CKEDITOR.instances["editor11"];
        //delete CKEDITOR.instances["editor12"];
     }

     //CKEDITOR.replaceAll();

	CKEDITOR.replace( 'editor11',
			{
				// Removes the maximize plugin as it's not usable
				// in a shared toolbar.
				// Removes the resizer as it's not usable in a
				// shared elements path.
				removePlugins : 'maximize,resize'
			} );

            clicked="";
            $("div#list ul").hide();
//            $(".dropdown dt a").live('click',function() {
            $(".dropdown dt a").click(function() {
            if($('div#list ul').is(':visible')==false)
	                clicked=($(this).attr('id'));
                $("div#list ul").slideToggle(function(){
				if ($("#fname").is(':visible'))
					$("#fname").hide();
				
				});

            });

            $("div#list ul li a").live('click',(function() {
                var text = $(this).html();
                $(".dropdown dt a#"+clicked+" span").html(text);
                $("div#list ul").hide();
                $("#result").html(getSelectedValue(clicked));
            }));

            function getSelectedValue(id) {
                return $("div#" + id).find("dt a span.value").html();
            }
			

      });
    </script>
<script language="javascript" type="text/javascript">
function send_message()
{
var xmlhttp;
  files="";
  if($('div#sample').find('dt a span.value').text()!="")
  {
  if (files=="")
     files=$('div#sample').find('dt a span.value').text();
  else
    files+="," + ($('div#sample').find('dt a span.value').text());
  }
  if ($('div#sample2').find('dt a span.value').text()!="")
  {
  if (files=="")
     files=$('div#sample2').find('dt a span.value').text();
  else
    files+="," + ($('div#sample2').find('dt a span.value').text());
  }
  if ($('div#sample3').find('dt a span.value').text()!="")
  {
  if (files=="")
     files=$('div#sample3').find('dt a span.value').text();
  else
    files+="," + ($('div#sample3').find('dt a span.value').text());
  }
  if ($('div#sample4').find('dt a span.value').text()!="")
  {
  if (files=="")
     files=$('div#sample4').find('dt a span.value').text();
  else
    files+="," + ($('div#sample4').find('dt a span.value').text());
  }
  if (document.getElementById('subject').value=="")
  {
	document.getElementById("error_reporting").innerHTML="موضوع پیام وارد نشده است";
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
  }
  else if(CKEDITOR.instances.editor11.getData()=="")
  {
	document.getElementById("error_reporting").innerHTML="متن پیام وارد نشده است.";
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
  }
  else
  {
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  xmlhttp.open("post","new_message_db.php",true);
	  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");

	  xmlhttp.send("subject="+$('#subject').val()+"&msg="+encodeURIComponent(CKEDITOR.instances.editor11.getData())+"&files="+files+"&uname="+sender_name+"&contacts="+$('#contid').val());
	  xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
			$j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
		   }
		}
	  }
  }

      //----------------upload-------------------------
             
  {/literal}
  var uid="{$auth_id}";
  {literal}
  function upload(x)
  {
  var file = x.files[0];
    name = file.name;
    var result = [];
	var ext=name.split('.').pop();
	if (ext=="aac" || ext=="mp3" || ext=="pdf" || ext=="doc" || ext=="docx")
	{
		size = (file.size/1024)/1024;
		if (size<=5)
		{
			$('#progress').show();
			$('#upload').submit();
		}
		else
		{
			alert('آپلود فایل با حجم بیش از 5 مگا بایت امکان پذیر نمی باشد');
		}
	}
	else
	{
		alert(" فایل های با پسوند docx ، aac ، mp3 ، pdf ، doc پشتیبانی می شوند");
	}
  }
   
  function do_del(path)
  {
	path=path.replace('//','/','g');
	$.ajax({
	  type: "GET",
	  url: "delete_file.php",
	  data: { path:path},
	  success: function(data)
		{
			if (data =="1")
			{
			alert('فایل مورد نظر با موفقیت حذف شد');
			refresh();
			}
			else
			alert('متاسفانه فایل پاک نشده است...!');
		}
	});
  }
  function refresh()
  {
	var contentText = $.ajax({

                url: "new_message.php",
                async: false

            }).responseText;

			$j.fancybox.close();

			$j.fancybox(contentText);
  }
  
  function test_upload()
  {
  $j('#progress').hide();
  if($('#upload_target').contents().find('body').text()=="1")
  {
  alert('آپلود فایل با موفقیت انجام شد');
  refresh();
  }
  else if ($('#upload_target').contents().find('body').text()=="0")
  alert('متاسفانه فایل آپلود نشده است!');
  }
  
//--------------------------------------------------------------------- 
  
  
  function add_contact(id,contact)
  {
	if ($('#contacts').val()=="")
	{	
		$('#contacts').val(contact);
		$('#contid').val(id);
	}
	else
	{	
		$('#contacts').val($('#contacts').val()+","+contact);
		$('#contid').val($('#contid').val()+","+id);
	}	
  }

{/literal}

</script>
</head>

<body>

<p >جهت ارسال پیام جدید به دوستان خود اطلاعات مورد نیاز را وارد و از لیست کاربران مجاز، مخاطب خود را انتخاب نمائید.فایلهای ارسالی مجاز پسوندهای pdf,doc,docx,mp3,aac میباشد.</p>
<fieldset style="width=850px;">
<legend>فایل ضمیمه</legend>
برای انتخاب فایل ضمیمه پیام بر روی <span style="font-weight:bold" onmouseover="$('div.dropdown dt a').css('border','1px red solid');" onmouseout="$('div.dropdown dt a').css('border','1px solid #D4CA9A');"> یکی از 4 گزینه</span> زیر کلیک نمائید...
<br/>
<div id="sample" class="dropdown">
	<dt><a id="sample"><span>انتخاب فایل</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown dt a#sample span').html('انتخاب فایل');">حذف فایل</a>
</div>
<div id="sample2" class="dropdown">
	<dt><a id="sample2"><span>انتخاب فایل</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown dt a#sample2 span').html('انتخاب فایل');">حذف فایل</a>

</div>
<div id="sample3" class="dropdown">
	<dt><a id="sample3"><span>انتخاب فایل</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown dt a#sample3 span').html('انتخاب فایل');">حذف فایل</a>

</div>
<div id="sample4" class="dropdown">
	<dt><a id="sample4"><span>انتخاب فایل</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown dt a#sample4 span').html('انتخاب فایل');">حذف فایل</a>

</div>


<div id="list">
	<ul>
		{for $i=0 to $files|count-1}
		<li style="text-align:center;"><a href="javascript:;" style="text-align:center;color:black;"><img alt="" src="{$site_domain}/admin/Files/images/file.png" title="{$site_domain}/{$files[$i]}"  /><span class="value" style="display:none;">{$files[$i]}</span><br/><span style="text-align:center;font-size:9px;direction:ltr;">{assign f_info pathinfo($files[$i])}<b>{$f_info['filename']}.{$f_info['extension']}</b></span></a><span onclick="event.stopPropagation();do_del('{$files[$i]|replace:'//':'/'}');" style="color:red;font-weight:bold;cursor:pointer;">حذف</span>/<span onclick="event.stopPropagation();alert('{$site_domain}/{$files[$i]|replace:'//':'/'}');" style="color:red;font-weight:bold;cursor:pointer;">آدرس</span></li>
		{/for}
	
	</ul>
	
</div>
<span id="fname" style="color:black;display:none;"></span><br/>
<span id="fpath" style="color:black;display:none;"></span>
</fieldset style="width:800px">


<div id="content">

<!--Inline upload-->
<div id="inline_upload">
<form id="upload" method="POST" action="upload_files.php" enctype="multipart/form-data" target="upload_target" >
<input type="file" name="myfile" style="visibility:hidden;" onchange="upload(this);"/>
<input type="hidden" value="{$auth_id}" name="uid"/>
<input type="hidden" value="{$script_name}" name="decision" id="decision"/>
<iframe id="upload_target" name="upload_target" src="#" style="width:0px;height:0px;border:0px solid #fff;" onload="test_upload();"></iframe>
</form>
</div>

<br/>
<table style="table-layout:fixed;" >
<tr>
<td style="width:100px;">موضوع پیام : </td><td><input type="text" size="60" id="subject"/></td><td style="width:200px;">
<a href="javascript:;" onclick="$('input[type=file]').click();" style="color:blue;text-decoration:none;">آپلود سریع فایل<img src="{$site_domain}/admin/templates/images/upload.png" style="margin-bottom:-15px;"/></a>
</td>
<span id="progress" style="width:100%;text-align:center;position:absolute;display:none;" >در حال بارگذاری فایل...<img src="{$site_domain}/admin/templates/images/up_loading.gif"/></span>
</tr>
<tr>
<td>
گیرندگان پیام : </td><td>
{if isset($smarty.get.uname)}
<input type="text" size="60" id="contacts" value="{$smarty.get.uname}" readonly="readonly"     /><input type="hidden" id="contid" value="{$smarty.get.uid}"/>
{else}
<input type="text" size="60" id="contacts" readonly="readonly" /><input type="hidden" id="contid"/>
{/if}
</td>
<td>
<select id="contacts_list" onchange="add_contact(this.options[this.selectedIndex].value,this.options[this.selectedIndex].text);">
{for $j=0 to count($friends)-1}
<option value="{$friends[$j][0]}">{$friends[$j][2]}</option>
{/for}
</select>
<br/>
<a href="javascript:;" style="color:red;" onclick="$('#contacts').val('');$('#contid').val('');">پاک کردن لیست</a>

</td>
</tr>
</table>

<span id="progress" style="width:100%;text-align:center;position:absolute;display:none;" >در حال بارگذاری فایل...<img src="{$site_domain}/admin/templates/images/up_loading.gif"/></span>

<br/>
متن پیام :
<textarea id="editor11" class="ckeditor" cols="80" name="editor1" rows="10"></textarea>
</div>
<p><input onclick="send_message();" type="button" value="ارسال پیام" /> <div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:-35px;">
</div></p>

</body>
</html>
