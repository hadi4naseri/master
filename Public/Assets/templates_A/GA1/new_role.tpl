<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script language="javascript" type="text/javascript">

{literal}
function load_files()
{
if (document.getElementById('files_list').selectedIndex!=0)
{
	$.ajax({
	  type: "GET",
	  url: "load_files.php",
	  data: {file_id: $('#files_list').val()},
	  success: function(data)
		{
			
			var dt = data.split("-/-");
			$('#adv_files').empty();
			var option = document.createElement('option');
			option.text = "یکی از موارد را انتخاب نمائید";
			option.value = 0;
			document.getElementById('adv_files').add(option,0);
			for (i=0;i<dt.length-1;i++)
			{
			spl_dt=dt[i].split("**");
			var option = document.createElement('option');
			option.text = spl_dt[1];
			option.value = spl_dt[0];
			document.getElementById('adv_files').add(option,0);
			}
		}
	});
}
}

function add_group()
  {
	id=$('#groups').val();
	if (id!=0)
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
  
  
  function add_role()
  {
	if ($('#files_list').val()==0)
	{
		document.getElementById("error_reporting").innerHTML="آیتم مدیریتی انتخاب نشده است!";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
	else if ($('#groups').val()==0)
	{
		document.getElementById("error_reporting").innerHTML="گروه کاربری از لیست انخاب نشده است!";
	    $j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
	}
	else
	{
			if ($('#adv_files').val()==0)
			{
				vals="";
				$("#adv_files option").each(function()
{
					if ($(this).val()!=0)
					vals+=$(this).val() + "/";
				});
				$.ajax({
				  type: "GET",
				  url: "creat_role.php",
				  data: {item:vals,valid_grps:$('#grpsid').val(),param:"1"},
				  success: function(data)
					{
						
						if (data==-1)
						{
							document.getElementById("error_reporting").innerHTML="این رابطه برای ماژول انتخابی قبلا برقرار شده است!";
							$j("#error_reporting").css("background-color","red").fadeIn("slow").delay(2500).fadeOut("slow");
						}
						else if (data==1)				
						{
							document.getElementById("error_reporting").innerHTML="دسترسی برای فايلهاي مورد نظر ايجاد گرديد ";
							$j("#error_reporting").css("background-color","green").fadeIn("slow").delay(2500).fadeOut("slow");
							$('select>option:eq(3)').attr('selected', true);
						}
					}
				});	
			}
			else
			{
				$.ajax({
				  type: "GET",
				  url: "creat_role.php",
				  data: {item: $('#adv_files').val(),valid_grps:$('#grpsid').val(),param:"2"},
				  success: function(data)
					{
						
						if (data==1)				
						{
							document.getElementById("error_reporting").innerHTML="دسترسی برای فایل مورد نظر به روز شد";
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

<p style="padding-top:20px;">برای اعطای سطح دسترسی گروه مورد نظر ابتدا آیتم مدیریتی مورد نظر را انتخاب و سپس گروه مورد نظر را برای دسترسی انتخاب نمائید.</p>
<br/>


نام آیتم مدیریتی : <select id ="files_list" onchange="load_files();">
<option value="0">یکی از موارد را انتخاب نمائید</option>
{for $i=0 to count($files)-1}
<option value="{$files[$i][0]}">{$files[$i][1]}</option>
{/for}
</select>
<br/>
<br/>
<span>در صورت عدم انتخاب دسترسی پیشرفته دسترسی برای تمام فایل های مرتبط با آیتم انتخابی ایجاد خواهد گردید.</span>
<br/>
دسترسی پیشرفته(هماهنگی با برنامه نویس سیستم) : <select id="adv_files" ><option value="0">یکی از موارد را انتخاب نمائید</option></select>
<br/>
<br/>
انتخاب گروه : <select onchange="add_group();" id="groups">
<option value="0">یکی از موارد را انتخاب نمائید</option>
{for $i=0 to count($grps)-1}
<option value="{$grps[$i][0]}">{$grps[$i][1]}</option>
{/for}
</select>

<input type="text" readonly="readonly" id="groups_list" size="50"/>
<input type="hidden" id="grpsid"/><br/>
<a href="javascript:;" onclick="$('#groups_list').val('');$('#grpsid').val('');" style="color:red;">  پاک کردن لیست دسترسی</a>

<br/>

<input type="button" id="btn" onclick="add_role();" value="ایجاد دسترسی" /><div id="error_reporting" style="position: absolute;height:20px;right:120px;margin-top:-25px;">
</div>
<br/>
<br/>


</body>
</html>
