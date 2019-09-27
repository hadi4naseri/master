<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
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
function select_action()
{
	$('#access_settings').slideUp();
	$('#counter_settings').slideUp();
	if ($('#mergable_modules').val()!=0)
	{
		if ($('#mergable_modules').val()=="access")
		{
			$('#access_settings').slideDown();
			$j.fancybox.update();
		}
		else if ($('#mergable_modules').val()=="counter")
		{
			$('#counter_settings').slideDown();
			$j.fancybox.update();
		}
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
  
  
  function add_relation()
  {
	if ($('#modules_list').val()==0)
	{
		document.getElementById("error_reporting").innerHTML="ماژولی برای ایجاد رابطه انتخاب نشده است!";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
	else if ($('#sub_module').val()==0)
	{
		document.getElementById("error_reporting").innerHTML="آیتمی از ماژول انتخابی برای برقراری رابطه انتخاب نشده است!";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}	
	else if ($('#mergable_modules').val()==0)
	{
		document.getElementById("error_reporting").innerHTML="ماژول ادغام پذیری از لیست انخاب نشده است!";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
	else
	{
		if ($('#mergable_modules').val()=="access")
		{
			if ($('#grpsid').val()=="")
			{
				document.getElementById("error_reporting").innerHTML="گروه های مجاز انتخاب نشده است و تمام گروه ها مجاز خواهند بود!";
				$j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
			}
			$.ajax({
			  type: "GET",
			  url: "creat_relation.php",
			  data: {module_name: $('#modules_list').val(),item:$('#sub_module').val(),mrg_module:$('#mergable_modules').val(),valid_grps:$('#grpsid').val()},
			  success: function(data)
				{
					
					if (data==-1)
					{
						document.getElementById("error_reporting").innerHTML="این رابطه برای ماژول انتخابی قبلا برقرار شده است!";
						$j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
					}
					else if (data==1)				
					{
						document.getElementById("error_reporting").innerHTML="رابطه مورد نظر ایجاد گردید.";
						$j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
					}
				}
			});	
		}
		else if ($('#mergable_modules').val()=="counter")
		{
			if ($('#counter_seed').val()=="")
				$('#counter_seed').val('0');
			$.ajax({
			  type: "GET",
			  url: "creat_relation.php",			  
			  data: {module_name: $('#modules_list').val(),item:$('#sub_module').val(),mrg_module:$('#mergable_modules').val(),seed:$('#counter_seed').val()},
			  success: function(data)
				{
					
					if (data==-1)
					{
						document.getElementById("error_reporting").innerHTML="این رابطه برای ماژول انتخابی قبلا برقرار شده است!";
						$j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
					}
					else if (data==1)				
					{
						document.getElementById("error_reporting").innerHTML="رابطه مورد نظر ایجاد گردید.";
						$j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
					}
				}
			});
		}
		else if ($('#mergable_modules').val()=="comments" || $('#mergable_modules').val()=="like")
		{
			$.ajax({
			  type: "GET",
			  url: "creat_relation.php",			  
			  data: {module_name: $('#modules_list').val(),item:$('#sub_module').val(),mrg_module:$('#mergable_modules').val()},
			  success: function(data)
				{
					
					if (data==-1)
					{
						document.getElementById("error_reporting").innerHTML="این رابطه برای ماژول انتخابی قبلا برقرار شده است!";
						$j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
					}
					else if (data==1)				
					{
						document.getElementById("error_reporting").innerHTML="رابطه مورد نظر ایجاد گردید.";
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

<p style="padding-top:20px;">برای برقراری ارتباط میان ماژولهای سایت، ابتدا نام ماژول مورد نظر را انتخاب نموده و پس از انتخاب آیتم مربوطه از ماژول، آن را با ماژول دلخواه در لیست ترکیب نمائید.</p>
<br/>


نام ماژول : <select id ="modules_list" onchange="load_items();">
<option value="0">یکی از موارد را انتخاب نمائید</option>
{for $i=0 to count($modules)-1}
<option value="{$modules[$i][0]}">{$modules[$i][1]}</option>
{/for}
</select>
<br/>
انتخاب آیتم : <select id="sub_module" ><option value="0">یکی از موارد را انتخاب نمائید</option></select>
<br/>
انتخاب ماژول ادغام پذیر : <select onchange="$j.fancybox.toggle();$j.fancybox.center;select_action();" id="mergable_modules">
<option value="0">یکی از موارد را انتخاب نمائید</option>
{for $i=0 to count($modules2)-1}
{if {$modules2[$i][1]} neq "توابع قالب"}
<option value="{$modules2[$i][0]}">{$modules2[$i][1]}({$modules2[$i][0]})</option>
{/if}
{/for}
</select>
<br/>

<input type="button" id="btn" onclick="add_relation();" value="ایجاد رابطه" /><div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:-25px;">
</div>
<br/>
<br/>
<div id="access_settings" style="display:none;">
<span style="color:red;font-weight:bold;">در صورتیکه میخواهید دسترسی این مطلب برای تمام کاربران عضو سایت باشد هیچ گروهی را انتخاب ننمائید و در صورتیکه اجازه دسترسی به این مطلب برای تمام کاربران عضو سایت و بازدید کنندگان که عضو سایت نشده اند میخواهید وجود داشته باشد، رابطه دسترسی برای آیتم مورد نظر ایجاد نفرمائید!</span><br/><br/><br/>
<b>گروه های کاربری مجاز :</b><select id ="groups" onchange="add_group();">
{for $i=0 to count($groups)-1}
<option value="{$groups[$i][0]}">{$groups[$i][1]}</option>
{/for}
</select>/دسترسی مجاز است برای : <input type="text" readonly="readonly" id="groups_list" size="50"/><input type="hidden" id="grpsid"/><br/>
<a href="javascript:;" onclick="$('#groups_list').val('');$('#grpsid').val('');">  پاک کردن لیست دسترسی</a>
</div>
<div id="counter_settings" style="display:none;">
شروع شمارنده از  : <input type="text" id="counter_seed"  value="0" onkeypress="return isNumberKey(event)" size="5"/>
</div>
</body>
</html>
