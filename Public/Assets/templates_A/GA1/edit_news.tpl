<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<link rel="stylesheet" href="{$site_domain}/admin/templates/css/file_preview.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>



<script type="text/javascript">
      var abs_path="{$site_domain}/admin/";
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
        delete CKEDITOR.instances["editor12"];
     }
          
     //CKEDITOR.replaceAll();
     
	CKEDITOR.replace( 'editor11',
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
			
			CKEDITOR.replace( 'editor12',
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
			{/literal}
	  {if $news_images != ""}
	  {$img_cnt=$news_images|count}
	  {if $img_cnt>0}		
		  $(".dropdown2 dt a#sample span").html("<img src=' " +abs_path + "{$news_images[0][1]}' /><span class=\"value\" style=\"display:none;\">{$news_images[0][0]}</span>");
		  {$img_cnt=$img_cnt-1}
	  {/if}	  
	  {if $img_cnt>0}		
		  $(".dropdown2 dt a#sample2 span").html("<img src=\"{$news_images[1][1]}\" /><span class=\"value\" style=\"display:none;\">{$news_images[1][0]}</span>");
		  {$img_cnt=$img_cnt-1}
	  {/if}	  
	  {if $img_cnt>0}		
		  $(".dropdown2 dt a#sample3 span").html("<img src=\"{$news_images[2][1]}\" /><span class=\"value\" style=\"display:none;\">{$news_images[2][0]}</span>");
		  {$img_cnt=$img_cnt-1}
	  {/if}
	  {if $img_cnt>0}		
		  $(".dropdown2 dt a#sample4 span").html("<img src=\"{$news_images[3][1]}\" /><span class=\"value\" style=\"display:none;\">{$news_images[3][0]}</span>");
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
function do_news_update()
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
  xmlhttp.open("post","news_update_db.php",true);
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
  news_id="{$news_id}";
  {literal}
  xmlhttp.send("nid="+news_id+"&title="+document.getElementById("news_title").value+"&abst="+encodeURIComponent(CKEDITOR.instances.editor11.getData())+"&full="+encodeURIComponent(CKEDITOR.instances.editor12.getData())+"&image_pics="+pics );
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	    document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");     
	    setTimeout('$j.fancybox.close();', 4000);
	   }
    }
  }
{/literal}
</script>
</head>

<body>

<div id="error_reporting" style="position: fixed;">
</div>

<fieldset>
<legend>تصاویر خبر</legend>
برای انتخاب تصاویر خبر بر روی<span style="font-weight:bold" onmouseover="$('div.dropdown2 dt a').css('border','1px red solid');" onmouseout="$('div.dropdown2 dt a').css('border','1px solid #D4CA9A');"> یکی از 4 گزینه</span> زیر کلیک نمائید...
<br/>
<div id="sample" class="dropdown2">
	<dt><a id="sample"><span>انتخاب تصویر برای خبر</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample span').html('انتخاب تصویر برای خبر');">حذف تصویر</a>
</div>
<div id="sample2" class="dropdown2">
	<dt><a id="sample2"><span>انتخاب تصویر برای خبر</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample2 span').html('انتخاب تصویر برای خبر');">حذف تصویر</a>
	
</div>
<div id="sample3" class="dropdown2">
	<dt><a id="sample3"><span>انتخاب تصویر برای خبر</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample3 span').html('انتخاب تصویر برای خبر');">حذف تصویر</a>
	
</div>
<div id="sample4" class="dropdown2">
	<dt><a id="sample4"><span>انتخاب تصویر برای خبر</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample4 span').html('انتخاب تصویر برای خبر');">حذف تصویر</a>
	
</div>


<div id="list">
	<ul>
		{for $i=0 to $image_files|count-1}
		<li><a href="#"><img alt="" src="{$site_domain}/admin/{$image_files[$i][1]}" /><span class="value" style="display:none;">{$image_files[$i][0]}</span></a></li>
		{/for}
	</ul>
</div>

</fieldset>


<p>عنوان خبر : <input id="news_title" size="120" type="text" value="{$news[0][0]}" /> <br />
</p>
<div id="topSpace">
</div>
<div id="content2">
لطفاً از نوار ابزار قرار گرفته در بالا برای ویرایش <strong><u>خلاصه خبر</u></strong> 
و <strong><u>متن کامل خبر</u></strong> استفاده نمائید. <br />
خلاصه خبر :
<textarea id="editor11" class="ckeditor" cols="80" name="editor1" rows="10">{$news[0][1]}</textarea>
<br />
متن کامل خبر :
<textarea id="editor12" class="ckeditor" cols="80" name="editor2" rows="10">{$news[0][2]}</textarea>
</div>
<div id="bottomSpace">
</div>
<p><input onclick="do_news_update();" type="button" value="ویـــرایش خـــــبر" /> </p>

</body>
</html>
