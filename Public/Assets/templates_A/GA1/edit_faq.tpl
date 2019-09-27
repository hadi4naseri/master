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
	  {if $faq_images != ""}
	  {$img_cnt=$faq_images|count}
	  {if $img_cnt>0}		
		  $(".dropdown2 dt a#sample span").html("<img src=\"{$faq_images[0][1]}\" /><span class=\"value\" style=\"display:none;\">{$faq_images[0][0]}</span>");
		  {$img_cnt=$img_cnt-1}
	  {/if}	  
	  {if $img_cnt>0}		
		  $(".dropdown2 dt a#sample2 span").html("<img src=\"{$faq_images[1][1]}\" /><span class=\"value\" style=\"display:none;\">{$faq_images[1][0]}</span>");
		  {$img_cnt=$img_cnt-1}
	  {/if}	  
	  {if $img_cnt>0}		
		  $(".dropdown2 dt a#sample3 span").html("<img src=\"{$faq_images[2][1]}\" /><span class=\"value\" style=\"display:none;\">{$faq_images[2][0]}</span>");
		  {$img_cnt=$img_cnt-1}
	  {/if}
	  {if $img_cnt>0}		
		  $(".dropdown2 dt a#sample4 span").html("<img src=\"{$faq_images[3][1]}\" /><span class=\"value\" style=\"display:none;\">{$faq_images[3][0]}</span>");
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
function do_faq_update()
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
  xmlhttp.open("post","faq_update_db.php",true);
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
  faq_id="{$faq_id}";
  {literal}
  xmlhttp.send("fid="+faq_id+"&question="+encodeURIComponent(CKEDITOR.instances.editor11.getData())+"&answer="+encodeURIComponent(CKEDITOR.instances.editor12.getData())+"&image_pics="+pics );
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

<fieldset style="width:800px;">
<legend>تصاویر سوال پرتکرار</legend>
برای انتخاب تصاویر سوال بر روی<span style="font-weight:bold" onmouseover="$('div.dropdown2 dt a').css('border','1px red solid');" onmouseout="$('div.dropdown2 dt a').css('border','1px solid #D4CA9A');"> یکی از 4 گزینه</span> زیر کلیک نمائید...
<br/>
<div id="sample" class="dropdown2">
	<dt><a id="sample"><span>انتخاب تصویر برای سوال</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample span').html('انتخاب تصویر برای سوال');">حذف تصویر</a>
</div>
<div id="sample2" class="dropdown2">
	<dt><a id="sample2"><span>انتخاب تصویر برای سوال</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample2 span').html('انتخاب تصویر برای سوال');">حذف تصویر</a>
	
</div>
<div id="sample3" class="dropdown2">
	<dt><a id="sample3"><span>انتخاب تصویر برای سوال</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample3 span').html('انتخاب تصویر برای سوال');">حذف تصویر</a>
	
</div>
<div id="sample4" class="dropdown2">
	<dt><a id="sample4"><span>انتخاب تصویر برای سوال</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown2 dt a#sample4 span').html('انتخاب تصویر برای سوال');">حذف تصویر</a>
	
</div>


<div id="list">
	<ul>
		{for $i=0 to $image_files|count-1}
		<li><a href="#"><img alt="" src="{$image_files[$i][1]}" /><span class="value" style="display:none;">{$image_files[$i][0]}</span></a></li>
		{/for}
	</ul>
</div>

</fieldset>


<div id="topSpace">
</div>
<div id="content">
لطفاً از نوار ابزار قرار گرفته در بالا برای ویرایش <strong><u>سوال</u></strong> 
و <strong><u>پاسخ آن</u></strong> استفاده نمائید. <br />
سوال :
<textarea id="editor11" class="ckeditor" cols="80" name="editor1" rows="10">{$faq[0][0]}</textarea>
<br />
پاسخ :
<textarea id="editor12" class="ckeditor" cols="80" name="editor2" rows="10">{$faq[0][1]}</textarea>
</div>
<div id="bottomSpace">
</div>
<p><input onclick="do_faq_update();" type="button" value="ویـــرایش سوال پرتکرار" /> </p>

</body>
</html>
