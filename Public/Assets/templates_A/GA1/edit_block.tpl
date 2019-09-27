<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<link rel="stylesheet" href="../{$adm_path}/templates/css/file_preview.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>

{literal}
<script type="text/javascript">
{/literal}
blkid="{$block_id}"
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
     }

     //CKEDITOR.replaceAll();

	CKEDITOR.replace( 'editor11',
			{
				removePlugins : 'maximize,resize'
			} );

      });

function update_block()
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
	  alert(col);
	  col++;
	  xmlhttp.open("post","block_update_db.php",true);
	  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	  xmlhttp.send("bid="+blkid+"&title="+document.getElementById('block_title').value+"&content="+encodeURIComponent(CKEDITOR.instances.editor11.getData())+"&col="+col+"&vpos="+document.getElementById('vpos').value);
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

<body style="width:800px;">

<div id="error_reporting" style="position: fixed;">
</div>

<div>
<br/>
برای درج اطلاعات بلاک جدید، عنوان نمایش بلاک و متن بلاک را وارد نمائید.برای درج کد HTML در بلاک با کلیک بر روی گزینه منبع در ویرایشگر کد مورد نظر رار درج نمائید. <br />
عنوان نمایشی بلاک :
<input type="text" width="80" id="block_title" value="{$block[0][0]}"/><br/><br/>
درج متن بلاک یا کد HTML :
<textarea id="editor11" class="ckeditor" cols="80" name="editor1" rows="10">{$block[0][1]}</textarea><br/>
ستون انتخاب شده برای نمایش : 
<select name="column" id="col_select">
{if $site_layout==1}
{if $block[0][2]==1}
<option value="1" selected>ستون اول</option>
{else}
<option value="1">ستون اول</option>
{/if}
{/if}

{if $site_layout==2}
{if $block[0][2]==1}
<option value="1" selected>ستون اول</option>
{else}
<option value="1">ستون اول</option>
{/if}
{if $block[0][2]==2}
<option value="2" selected>ستون دوم</option>
{else}
<option value="2">ستون دوم</option>
{/if}
{/if}


{if $site_layout==3}
{if $block[0][2]==1}
<option value="1" selected>ستون اول</option>
{else}
<option value="1">ستون اول</option>
{/if}
{if $block[0][2]==2}
<option value="2" selected>ستون دوم</option>
{else}
<option value="2">ستون دوم</option>
{/if}
{if $block[0][2]==3}
<option value="3" selected>ستون سوم</option>
{else}
<option value="3">ستون سوم</option>
{/if}
{/if}
</select>
<br/>
<p>موقعیت عمودی بلاک را در ستون مشخص نمائید.با نسبت دادن اعداد کوچکتر نسبت به موقعیت عمودی سایر بلاکهای قرار گرفته در این ستون،ستون فعلی پائین تر و با در نظر گرفتن اعداد مثبت و بزرگتر ستون بالاتر به نسبت دیگر بلاکهای ستون قرار خواهد گرفت</p>
عدد موقعیت عمودی بلاک : <input type="text" value="{$block[0][3]}" id="vpos" size="5" style="direction:ltr"/>
</div>

<p><input onclick="update_block();" type="button" value="ویرایش اطلاعات بلاک" /> </p>

</body>
</html>
