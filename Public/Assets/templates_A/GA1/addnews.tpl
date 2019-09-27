<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<link rel="stylesheet" href="../{$adm_path}/templates/css/file_preview.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
{literal}
<script type="text/javascript">
        $j(document).ready(function() {
					
		 flag=false;
		 for (x in CKEDITOR.instances)
		 {
		 flag=true;
		 break;
		 }

		 if(flag==true)
		 {
			delete CKEDITOR.instances["editor1"];
			delete CKEDITOR.instances["editor2"];
		 }

		 //CKEDITOR.replaceAll();

		CKEDITOR.replace( 'editor1',
				{
					sharedSpaces :
					{
						top : 'topSpace',
						bottom : 'bottomSpace'
					},

					// Removes the maximize plugin as it's not usable
					// in a shared toolbar.
					// Removes the resizer as it's not usable in a
					// shared elements path.
					removePlugins : 'maximize,resize'
				} );

				CKEDITOR.replace( 'editor2',
				{
					sharedSpaces :
					{
						top : 'topSpace',
						bottom : 'bottomSpace'
					},

					// Removes the maximize plugin as it's not usable
					// in a shared toolbar.
					// Removes the resizer as it's not usable in a
					// shared elements path.
					removePlugins : 'maximize,resize'
				} );
			
			clicked="";
            //$(".dropdown dt a").live('click',function() {
            $(".dropdown dt a").click(function() {
                if($('div#list ul').is(':visible')==false)
	        clicked=($(this).attr('id'));
                $("div#list ul").slideToggle();

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
function do_ajax()
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
  xmlhttp.open("post","addnews_db.php",true);
  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  pics="";
  if($('div#sample').find('dt a span.value').text()!="")
  {
  if (pics=="")
     pics=$('div#sample').find('dt a span.value').text();
  else
    pics+="," + ($('div#sample').find('dt a span.value').text());
  }
  if ($('div#sample2').find('dt a span.value').text()!="")
  {
  if (pics=="")
     pics=$('div#sample2').find('dt a span.value').text();
  else
    pics+="," + ($('div#sample2').find('dt a span.value').text());
  }
  if ($('div#sample3').find('dt a span.value').text()!="")
  {
  if (pics=="")
     pics=$('div#sample3').find('dt a span.value').text();
  else
    pics+="," + ($('div#sample3').find('dt a span.value').text());
  }
  if ($('div#sample4').find('dt a span.value').text()!="")
  {
  if (pics=="")
     pics=$('div#sample4').find('dt a span.value').text();
  else
    pics+="," + ($('div#sample4').find('dt a span.value').text());
  }

  {/literal}
  var uname="{$auth_name}";
  var uid="{$auth_id}";
  {literal}
  xmlhttp.send("title="+document.getElementById("news_title").value+"&abst="+encodeURIComponent(CKEDITOR.instances.editor1.getData())+"&full="+encodeURIComponent(CKEDITOR.instances.editor2.getData())+"&image_pics="+pics+"&uname="+uname+"&userid="+uid);
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
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
	if (ext=="jpg" || ext=="png" || ext=="jpeg" || ext=="gif")
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
		alert("فایل های با پسوند jpg ، png ، gif و jpeg تنها پشتیبانی می شوند");
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

                url: "addnews.php",
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
  
{/literal}
</script>
</head>

<body >

<fieldset>
<legend>تصاویر خبر</legend>
برای انتخاب تصاویر خبر بر روی<span style="font-weight:bold" onmouseover="$('div.dropdown dt a').css('border','1px red solid');" onmouseout="$('div.dropdown dt a').css('border','1px solid #D4CA9A');"> یکی از 4 گزینه</span> زیر کلیک نمائید...
<br/>
<div id="sample" class="dropdown">
	<dt><a id="sample"><span>انتخاب تصویر برای خبر</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown dt a#sample span').html('انتخاب تصویر برای خبر');">حذف تصویر</a>

</div>
<div id="sample2" class="dropdown">
	<dt><a id="sample2"><span>انتخاب تصویر برای خبر</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown dt a#sample2 span').html('انتخاب تصویر برای خبر');">حذف تصویر</a>

</div>
<div id="sample3" class="dropdown">
	<dt><a id="sample3"><span>انتخاب تصویر برای خبر</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown dt a#sample3 span').html('انتخاب تصویر برای خبر');">حذف تصویر</a>

</div>
<div id="sample4" class="dropdown">
	<dt><a id="sample4"><span>انتخاب تصویر برای خبر</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown dt a#sample4 span').html('انتخاب تصویر برای خبر');">حذف تصویر</a>

</div>


<div id="list">
	<ul>
		
		{for $i=0 to $image_files|count-1}
		<li style="text-align:center;"><a href="javascript:;" style="text-align:center;color:black;"><img alt="" src="{$site_domain}/admin/{$image_files[$i][1]|replace:'//':'/'}" title="{$site_domain}/{$image_files[$i][0]}"  /><span class="value" style="display:none;">{$image_files[$i][0]}</span><br/><span style="text-align:center;font-size:9px;direction:ltr;">{assign f_info pathinfo($image_files[$i][0])}<b>{$f_info['filename']}.{$f_info['extension']}</b></span></a><span onclick="event.stopPropagation();do_del('{$image_files[$i][0]|replace:'//':'/'}');" style="color:red;font-weight:bold;cursor:pointer;">حذف</span>/<span onclick="event.stopPropagation();alert('{$site_domain}/{$image_files[$i][0]|replace:'//':'/'}');" style="color:red;font-weight:bold;cursor:pointer;">آدرس</span></li>
		{/for}
	</ul>	
	
	</div>
	
	
</fieldset>

<!--Inline upload-->
<div id="inline_upload">
<form id="upload" method="POST" action="upload_files.php" enctype="multipart/form-data" target="upload_target" >
<input type="file" name="myfile" style="visibility:hidden;" onchange="upload(this);"/>
<input type="hidden" value="{$auth_id}" name="uid"/>
<input type="hidden" value="{$script_name}" name="decision" id="decision"/>
<iframe id="upload_target" name="upload_target" src="#" style="width:0px;height:0px;border:0px solid #fff;" onload="test_upload();"></iframe>
</form>
</div>

<p>عنوان خبر : <input id="news_title" type="text" style="width:520px;" />&nbsp;
<a href="javascript:;" onclick="$('input[type=file]').click();" style="color:blue;text-decoration:none;">آپلود سریع فایل<img src="{$site_domain}/admin/templates/images/upload.png" style="margin-bottom:-15px;"/></a>
<br/>
<span id="progress" style="width:100%;text-align:center;position:absolute;display:none;" >در حال بارگذاری فایل...<img src="{$site_domain}/admin/templates/images/up_loading.gif"/></span> <br />
</p>
<div id="topSpace">
</div>
لطفاً از نوار ابزار قرار گرفته در بالا برای ویرایش <strong><u>خلاصه خبر</u></strong>
و <strong><u>متن کامل خبر</u></strong> استفاده نمائید. <br />

خلاصه خبر :
<textarea id="editor1" class="ckeditor" cols="80" name="editor1" rows="10"></textarea>
<br />
متن کامل خبر :
<textarea id="editor2" class="ckeditor" cols="60" name="editor2" rows="10"></textarea>
<p></p>
<div id="bottomSpace">
</div>
<p><input onclick="do_ajax();" type="button" value="ثبت خبر" /><div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:-40px;"> </div></p>

</body>
</html>
