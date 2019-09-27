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
     }

     //CKEDITOR.replaceAll();

	CKEDITOR.replace( 'editor11',
			{
				removePlugins : 'maximize,resize'
			} );

      });
    </script>
<script language="javascript" type="text/javascript">
function page_update()
{
   {/literal}
   var paid="{$page_id}";
   {literal}
   if (document.getElementById('site_title').value=="" || CKEDITOR.instances.editor11.getData()=="")
	{
		document.getElementById("error_reporting").innerHTML="عنوان صفحه  و یا متن  صفحه برای درج می بایست وارد شوند...";
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
	  xmlhttp.open("post","page_update_db.php",true);
	  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	  xmlhttp.send("title="+document.getElementById('site_title').value+"&content="+encodeURIComponent(CKEDITOR.instances.editor11.getData())+"&pid="+paid);
	  xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
			$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
			//setTimeout('$j.fancybox.close();', 4000);
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

<div id="content">
<br/>
برای درج اطلاعات در صفحه، عنوان نمایشی صفحه  و متن صفحه را وارد نمائید.برای درج کد HTML در صفحه با کلیک بر روی گزینه منبع در ویرایشگر کد مورد نظر رار درج نمائید. <br />
عنوان نمایشی صفحه :
<input type="text" width="80" id="site_title" size="50" value="{$page[0][0]}"/><br/><br/>
درج متن صفحه و یا کد HTML :
<textarea id="editor11" class="ckeditor" cols="80" name="editor1" rows="10">{$page[0][1]}</textarea><br/>
</div>

<p><input onclick="page_update();" type="button" value="ویرایش اطلاعات صفحه" /> </p>

</body>
</html>
