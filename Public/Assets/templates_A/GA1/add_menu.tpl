<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />

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

{literal}
function load_items()
{
if (document.getElementById('modules_list').selectedIndex!=0)
{
	$.ajax({
	  type: "GET",
	  url: "load_items.php",
	  data: {module_name: $('#modules_list').val()},
	  success: function(data)
		{
			
			var dt = data.split("-/-");
			$('#sub_module').empty();
			var option = document.createElement('option');
			option.text = "یکی از موارد را انتخاب نمائید";
			option.value = 0;
			document.getElementById('sub_module').add(option,0);
			for (i=0;i<dt.length-1;i++)
			{
			spl_dt=dt[i].split("**");
			var option = document.createElement('option');
			option.text = spl_dt[1];
			option.value = spl_dt[0];
			document.getElementById('sub_module').add(option,0);
			}
			
			
		}
	});
}
}

function add_group()
  {
	id=$('#groups').val();
	if(id!=0)
	{
		group=$('#groups option:selected').text();
		if ($('#groups_list').val()=="")
		{	
			$('#groups_list').val(group);
			$('#grpsid').val(id);
		}
		else
		{	
			$('#groups_list').val($('#groups_list').val()+","+group);
			$('#grpsid').val($('#grpsid').val()+","+id);
		}
	}	
  }
  
  
  function add_menu()
  {
	if (CKEDITOR.instances.editor11.getData()=="")
	{
		document.getElementById("error_reporting").innerHTML="عنوانی برای منو انتخاب نشده است!";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
	else if ($('#hpos').val()=="")
	{
		document.getElementById("error_reporting").innerHTML="موقعیت افقی برای منو تعیین نشده است";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}	
	else if ($('#vpos').val()=="")
	{
		document.getElementById("error_reporting").innerHTML="موقعیت عمودی برای منو تعیین نشده است";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
	else if ($('#http_div').is(':visible') && $('#url_txt').val()=="")
	{
		document.getElementById("error_reporting").innerHTML="آدرس منبعی برای کلیک کاربر بر روی منو انتخاب نشده است";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
	else if ($('#site_div').is(':visible') && $('#sub_module').val()==0)
	{
		document.getElementById("error_reporting").innerHTML="محتوایی از سایت برای اتصال به منو انتخاب نشده است";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
	else
	{
		if ($('#http_div').is(':visible') && $('#url_txt').val()!="")
		{
			$.ajax({
			  type: "POST",
			  url: "creat_menu.php",			  
			  data: {content: CKEDITOR.instances.editor11.getData(),hpos:$('#hpos').val(),vpos:$('#vpos').val(),parent:$('#menu_list').val(),target:$('#url_txt').val(),groups:$('#grpsid').val(),param:1},
			  success: function(data)
				{
					
					if (data==-1)
					{
						document.getElementById("error_reporting").innerHTML="آدرس وارد شده را با پروتکل http:// و یا https:// وارد نمائید!";
						$j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
					}
					else if (data==1)				
					{
						document.getElementById("error_reporting").innerHTML="منو مورد نظر ایجاد گردید";
						$j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
					}
				}
			});
		}
		else if ($('#site_div').is(':visible') && $('#sub_module').val()!=0)
		{
			$.ajax({
			  type: "POST",
			  url: "creat_menu.php",			  
			  data: {content: CKEDITOR.instances.editor11.getData(),hpos:$('#hpos').val(),vpos:$('#vpos').val(),parent:$('#menu_list').val(),module:$('#modules_list').val(),item:$('#sub_module').val(),groups:$('#grpsid').val(),param:2},
			  success: function(data)
				{
					
					if (data==1)				
					{
						document.getElementById("error_reporting").innerHTML="منو مورد نظر ایجاد گردید";
						$j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
					}
				}
			});
		}
	}
  }
  function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
{/literal}
</script>
</head>

<body>


<fieldset>
<legend>اطلاعات منو</legend>
<span style="font-weight:bold">عنوان منو : </span>
<textarea id="editor11" class="ckeditor" cols="80" name="editor1" rows="10"></textarea>
<br/>
<span style="font-weight:bold">این منو مرتبط است با :</span>
<select id ="menu_list" >
<option value="0">یکی از موارد را انتخاب نمائید</option>
{for $i=0 to count($menu)-1}
<option value="{$menu[$i][0]}">{$menu[$i][1]}</option>
{/for}
</select>
<br/>
<span style="font-weight:bold">موقعیت افقی منو : </span>
<input type="text"  size="5" id="hpos" onkeypress="return isNumberKey(event)"/><small>این خصوصیت مشخص میکند که منو در کدام ستون در نوار منو نشان داده شود.اعداد بزرگتر بیان کننده اولیت بیشتر در نمایش در سمت راست را خواهند داشت</small>
<br/>
<span style="font-weight:bold">موقعیت عمودی منو : </span>
<input type="text"  size="5" id="vpos" onkeypress="return isNumberKey(event)"/><small>این خصوصیت مشخص میکند که منو در کدام سطر در ستون منو نشان داده شود.اعداد بزرگتر بین کننده اولویت بیشتر در نمایش بالا را خواهند داشت</small>
</fieldset>

<fieldset>
<legend>تعیین مقصد منو</legend>
<span>برای انتخاب نوع مقصد منو بر روی یکی از دو مورد زیر کلیک و اطلاعات خواسته شده را وارد نمائید  : </span><br/>
<a href="javascript:;" style="background-color:yellow;color:red;"  onclick="$('#site_div').slideUp();$('#http_div').slideDown();">آدرس منبع:</a>
<div id ="http_div">
<span>آدرس:</span><input type="text" id="url_txt" style="width:500px;"/>
</div>
<br/>
<a href="javascript:;" style="background-color:yellow;color:red;" onclick="$('#http_div').slideUp();$('#site_div').slideDown();">انتخاب از سایت :</a>
<div style="display:none" id ="site_div">
نام ماژول : <select id ="modules_list" onchange="load_items();">
<option value="0">یکی از موارد را انتخاب نمائید</option>
{for $i=0 to count($modules)-1}
<option value="{$modules[$i][0]}">{$modules[$i][1]}</option>
{/for}
</select>
<br/>
انتخاب آیتم : <select id="sub_module" ><option value="0">یکی از موارد را انتخاب نمائید</option></select>
</div>
</fieldset>
<br/>

<fieldset>
<legend>دسترسی به منو</legend>
<div id="access_settings">
<span style="color:red;font-weight:bold;">در صورتیکه میخواهید دسترسی این مطلب برای تمام کاربران عضو سایت باشد هیچ گروهی را انتخاب ننمائید و در صورتیکه اجازه دسترسی به این مطلب برای تمام کاربران عضو سایت و بازدید کنندگان که عضو سایت نشده اند میخواهید وجود داشته باشد، رابطه دسترسی برای آیتم مورد نظر ایجاد نفرمائید!</span><br/>همچنین این دسترسی برای نمایش منو میباشد و دسترسی به مطلب مورد نظر از سایت اعطا نخواهد شد.<br/><br/>
<b>گروه های کاربری مجاز :</b><select id ="groups" onchange="add_group();">
{for $i=0 to count($groups)-1}
<option value="{$groups[$i][0]}">{$groups[$i][1]}</option>
{/for}
</select>/دسترسی مجاز است برای : <input type="text" readonly="readonly" id="groups_list" size="50"/><input type="hidden" id="grpsid"/><br/>
<a href="javascript:;" onclick="$('#groups_list').val('');$('#grpsid').val('');">  پاک کردن لیست دسترسی</a>
</div>

</fieldset>

<input type="button" id="btn" onclick="add_menu();" value="ایجاد منو" /><div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:-25px;">
</div>

</body>
</html>
