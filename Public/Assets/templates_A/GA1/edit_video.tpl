<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<link rel="stylesheet" href="../{$adm_path}/templates/css/file_preview.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>

{literal}
<script type="text/javascript">
     
     $j(document).ready(function(){
	 
	 
	 flag=false;
     for (x in CKEDITOR.instances)
	 {
	 flag=true;
	 break;
	 }
     
     if(flag==true)
     {
        delete CKEDITOR.instances["editor1"];
     }
          
     //CKEDITOR.replaceAll();
     
	CKEDITOR.replace( 'editor1',
			{
				// Removes the maximize plugin as it's not usable
				// in a shared toolbar.
				// Removes the resizer as it's not usable in a
				// shared elements path.
				removePlugins : 'maximize,resize'
			} );
			
			{/literal}
	  {if $curr_videos != ""}
	  {$img_cnt=$curr_videos|count}
	  {if $img_cnt>0}		
		  {if $curr_videos[0]|substr:-3=='mp4'}
		  $(".dropdown2 dt a#sample span").html("<img src=\"{$site_domain}/admin/Files/Videos/mp4.png\" title=\"{$curr_videos_name[0]}\"/><span class=\"value\" style=\"display:none;\">{$curr_videos[0]}</span>");
		  {else}
		  $(".dropdown2 dt a#sample span").html("<img src=\"{$site_domain}/admin/Files/Videos/flv.png\" title=\"{$curr_videos_name[0]}\"/><span class=\"value\" style=\"display:none;\">{$curr_videos[0]}</span>");
		  {/if}
		  {$img_cnt=$img_cnt-1}
	  {/if}	  
	  {if $img_cnt>0}		
		  {if $curr_videos[1]|substr:-3=='mp4'}
		  $(".dropdown2 dt a#sample2 span").html("<img src=\"{$site_domain}/admin/Files/Videos/mp4.png\" title=\"{$curr_videos_name[1]}\"/><span class=\"value\" style=\"display:none;\">{$curr_videos[1]}</span>");
		  {else}
		  $(".dropdown2 dt a#sample2 span").html("<img src=\"{$site_domain}/admin/Files/Videos/flv.png\" title=\"{$curr_videos_name[1]}\"/><span class=\"value\" style=\"display:none;\">{$curr_videos[1]}</span>");
		  {/if}
		  {$img_cnt=$img_cnt-1}
	  {/if}	  
	  {if $img_cnt>0}		
		  {if $curr_videos[2]|substr:-3=='mp4'}
		  $(".dropdown2 dt a#sample3 span").html("<img src=\"{$site_domain}/admin/Files/Videos/mp4.png\" title=\"{$curr_videos_name[2]}\"/><span class=\"value\" style=\"display:none;\">{$curr_videos[2]}</span>");
		  {else}
		  $(".dropdown2 dt a#sample3 span").html("<img src=\"{$site_domain}/admin/Files/Videos/flv.png\" title=\"{$curr_videos_name[2]}\"/><span class=\"value\" style=\"display:none;\">{$curr_videos[2]}</span>");
		  {/if}
		  {$img_cnt=$img_cnt-1}
	  {/if}
	  {if $img_cnt>0}		
		  {if $curr_videos[3]|substr:-3=='mp4'}
		  $(".dropdown2 dt a#sample4 span").html("<img src=\"{$site_domain}/admin/Files/Videos/mp4.png\" title=\"{$curr_videos_name[3]}\"/><span class=\"value\" style=\"display:none;\">{$curr_videos[3]}</span>");
		  {else}
		  $(".dropdown2 dt a#sample4 span").html("<img src=\"{$site_domain}/admin/Files/Videos/flv.png\" title=\"{$curr_videos_name[3]}\"/><span class=\"value\" style=\"display:none;\">{$curr_videos[3]}</span>");
		  {/if}
		  {$img_cnt=$img_cnt-1}
	  {/if}	  	  
	  {/if}
	  {literal}	  
	   clicked="";
            $("div#list ul").hide();
//            $(".dropdown2 dt a").live('click',function() {
            $(".dropdown2 dt a").click(function() {
               
                if($('div#list ul').is(':visible')==false)
	                clicked=($(this).attr('id'));
                $("div#list ul").slideToggle();

            });
                        
            $("div#list ul li a").live('click',(function() {
                var text = $(this).html();
                $(".dropdown2 dt a#"+clicked+" span").html(text);
                $("div#list ul").hide();
                $("#result").html(getSelectedValue(clicked));
            }));
                        
            function getSelectedValue(id) {
                return $("div#" + id).find("dt a span.value").html();
            }
    
      });
    </script>
<script language="javascript" type="text/javascript">
function do_video_update()
{
	  videos="";
	  if($('div#sample').find('dt a span.value').text()!="")
	  {
	  if (videos=="")
		 videos=$('div#sample').find('dt a span.value').text();
	  else
		videos+="," + ($('div#sample').find('dt a span.value').text());       
	  }
	  if ($('div#sample2').find('dt a span.value').text()!="")
	  {
	  if (videos=="")
		 videos=$('div#sample2').find('dt a span.value').text();
	  else
		videos+="," + ($('div#sample2').find('dt a span.value').text());      
	  } 
	  if ($('div#sample3').find('dt a span.value').text()!="")
	  {
	  if (videos=="")
		 videos=$('div#sample3').find('dt a span.value').text();
	  else
		videos+="," + ($('div#sample3').find('dt a span.value').text());       
	  }
	  if ($('div#sample4').find('dt a span.value').text()!="")
	  {
	  if (videos=="")
		 videos=$('div#sample4').find('dt a span.value').text();
	  else
		videos+="," + ($('div#sample4').find('dt a span.value').text());       
	  }
	  
	  if (document.getElementById('video_title').value=="")
	  {
		document.getElementById("error_reporting").innerHTML="عنوان برای کلیپ تصویری وارد نشده است.";
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
	  }
	  else if(CKEDITOR.instances.editor1.getData()=="")
	  {
		document.getElementById("error_reporting").innerHTML="متن توصیفی برای کلیپ تصویری وارد نشده است.";
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
	  }
	  else if(videos=="")
	  {
		document.getElementById("error_reporting").innerHTML="هیچ کلیپ تصویری برای ثبت انتخاب نشده است.";
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
	  }
	  else
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
			  xmlhttp.open("post","video_update_db.php",true);
			  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			 
			  {/literal}
			  video_id="{$video_id}";
			  {literal}
			  xmlhttp.send("vid="+video_id+"&title="+document.getElementById("video_title").value+"&desc="+encodeURIComponent(CKEDITOR.instances.editor1.getData())+"&videos="+videos );
			  xmlhttp.onreadystatechange=function()
			  {
			  if (xmlhttp.readyState==4 && xmlhttp.status==200)
				{
					document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
					$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");     
					setTimeout('$j.fancybox.close();', 4000);
				   }
				}
		}
  }
{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="position: fixed;">
</div>

<p>تنها فایل های با پسوند flv و mp4 قابل درج در بخش کلیپ های صوتی هستند.</p>
<fieldset style="width=800px;">
<legend>کلیپ های تصویری سایت</legend>
برای انتخاب کلیپ های تصویری بر روی<span style="font-weight:bold" onmouseover="$('div.dropdown2 dt a').css('border','1px red solid');" onmouseout="$('div.dropdown2 dt a').css('border','1px solid #D4CA9A');"> یکی از 4 گزینه</span> زیر کلیک نمائید...
<br/>
<div id="sample" class="dropdown2">
	<dt><a id="sample"><span>انتخاب کلیپ تصویری</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample span').html('انتخاب کلیپ تصویری');">حذف کلیپ تصویری</a>
</div>
<div id="sample2" class="dropdown2">
	<dt><a id="sample2"><span>انتخاب کلیپ تصویری</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample2 span').html('انتخاب کلیپ تصویری');">حذف کلیپ تصویری</a>
	
</div>
<div id="sample3" class="dropdown2">
	<dt><a id="sample3"><span>انتخاب کلیپ تصویری</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample3 span').html('انتخاب کلیپ تصویری');">حذف کلیپ تصویری</a>
	
</div>
<div id="sample4" class="dropdown2">
	<dt><a id="sample4"><span>انتخاب کلیپ تصویری</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample4 span').html('انتخاب کلیپ تصویری');">حذف کلیپ تصویری</a>
	
</div>


<div id="list">
	<ul>
		{for $i=0 to $videos|count-1}
		{if {$videos[$i]|substr:-3}=='mp4'}
		<li><a href="#"><img alt="" src="{$site_domain}/admin/Files/Videos/mp4.png" title="{$videos_name[$i]}"/><span class="value" style="display:none;">{$videos[$i]}</span></a></li>
		{else}
		<li><a href="#"><img alt="" src="{$site_domain}/admin/Files/Videos/flv.png" title="{$videos_name[$i]}"/><span class="value" style="display:none;">{$videos[$i]}</span></a></li>
		{/if}
		{/for}
	</ul>
</div>

</fieldset>

<div id="content">
<br />
عنوان کلیپ تصویری : <input type="text" size="80" id="video_title" value="{$video_info[0][0]}"/><br/>
توضیحاتی در خصوص کلیپ تصویری :
<textarea id="editor1" class="ckeditor" cols="80" name="editor1" rows="10">{$video_info[0][1]}</textarea>
<br />
<p><input onclick="do_video_update();" type="button" value="ویـــرایش کلیپ تصویری" /> </p>

</body>
</html>
