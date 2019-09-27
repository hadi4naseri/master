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
function insert_block()
{
   if (document.getElementById('block_title').value=="" || CKEDITOR.instances.editor11.getData()=="")
	{
		document.getElementById("error_reporting").innerHTML="عنوان بلاک ومتن بلاک برای درج می بایست وارد شوند...";
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
	  col=document.getElementById('col_select').selectedIndex;
	  col++;
	  xmlhttp.open("post","new_block_db.php",true);
	  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	  xmlhttp.send("title="+document.getElementById('block_title').value+"&content="+encodeURIComponent(CKEDITOR.instances.editor11.getData())+"&col="+col);
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


<div id="content">
<br/>
برای درج اطلاعات بلاک جدید، عنوان نمایش بلاک و متن بلاک را وارد نمائید.برای درج کد HTML در بلاک با کلیک بر روی گزینه منبع در ویرایشگر کد مورد نظر رار درج نمائید. <br />
عنوان نمایشی بلاک :
<input type="text" width="80" id="block_title" size="50"/><br/><br/>
درج متن بلاک یا کد HTML :
<textarea id="editor11" class="ckeditor" cols="80" name="editor1" rows="10"></textarea><br/>
نمایش در ستون : 
<select name="column" id="col_select">
<option value="1">ستون اول</option>
{if $layout==2}
<option value="2">ستون دوم</option>
{/if}
{if $layout==3}
<option value="2">ستون دوم</option>
<option value="3">ستون سوم</option>
{/if}
</select>
</div>

<p><input onclick="insert_block();" type="button" value="درج بلاک جدید" /> </p>
<div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:-40px;margin-right:40px;"

</body>
</html>
