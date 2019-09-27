<head>
{literal}
<script type="text/javascript">

function register()
{
if (document.getElementById('family').value=="" ||document.getElementById('email').value=="" ||document.getElementById('uname').value=="" ||document.getElementById('pass').value=="" ||document.getElementById('repass').value=="")
   return false;
if (document.getElementById('pass').value.length<6 )
{
	document.getElementById('error_reporting').innerHTML='<span style="color:white;background-color:red;text-align:center;">طول کلمه عبور می بایست بیشتر از 6 کاراکتر باشد.</span>';       
		$j("#error_reporting").fadeIn("slow").delay(2500).fadeOut("slow");
}
else if (document.getElementById('pass').value!= document.getElementById('repass').value)
{
	document.getElementById('error_reporting').innerHTML='<span style="color:white;background-color:red;text-align:center;">کلمه عبور و تکرار آن با هم یکسان نیستند.</span>';     $j("#error_reporting").fadeIn("slow").delay(2500).fadeOut("slow");
}
else if (document.getElementById('pass').value!= document.getElementById('repass').value)
{
	document.getElementById('error_reporting').innerHTML='<span style="color:white;background-color:red;text-align:center;">کلمه عبور و تکرار آن با هم یکسان نیستند.</span>';     $j("#error_reporting").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{

	if (document.getElementById('captcha_r').value=="")
		{
			document.getElementById('error_reporting').innerHTML='<span style="color:white;background-color:red;text-align:center;">کد امنیتی وارد نشده است.</span>';       
			$j("#error_reporting").fadeIn("slow").delay(2500).fadeOut("slow");
		}
		else
		{
			$ret=$j.ajax({
			url: adres+"/modules/login/register.php",
			type:'POST',
			data:{user_val:document.getElementById('captcha_r').value,val:document.getElementById('cap_val2').value,name:document.getElementById('family').value,email:document.getElementById('email').value,tel:document.getElementById('tel').value,uname:document.getElementById('uname').value,pass:document.getElementById('pass').value},
			success:function(data)
			{
				
				if (data==-2)
				{
					document.getElementById('error_reporting').innerHTML='<span style="color:white;background-color:red;text-align:center;">عبارت امنیتی اشتباه وارد شده است.</span>';       
					$j("#error_reporting").fadeIn("slow").delay(2500).fadeOut("slow");
					renew_login_captcha();
				}
				else
				{
					document.getElementById('error_reporting').innerHTML='<span style="color:white;background-color:green;text-align:right;">'+data+'</span>';
					$j("#error_reporting").fadeIn("slow").delay(4500).fadeOut("slow");
					window.location.href = {/literal}"{$site_domain}"{literal};
				}			
			}
			});
		}
}
}

{/literal}
adres="{$site_domain}";
{literal}
function renew_login_captcha()
{
	document.getElementById('captcha_r').value="";
	$j.ajax({
	url: adres+"/modules/captcha/captcha.php",
	data:{action:1},
	datatype:"json",
	success:function(data)
	{
		$j('#cap_img2').attr('src',adres+'/modules/captcha/'+data.f);
		document.getElementById('cap_val2').value=data.r;
	}

	});
			
}

function check_mail()
{
	if ($j('#email').val() == '')
	return false;
	$j.ajax({
	url: adres+"/modules/login/check_mail.php",
	data:{mail:document.getElementById('email').value},
	success:function(data)
	{
		if(data==0)
		{
			$j('#res').css('background-color','red');
			$j('#res').css('display','inline');
			document.getElementById('res').innerHTML="آدرس وارد شده معتبر نمی باشد.";
		}
		else
		{
			$j('#res').css('background-color','green');
			$j('#res').css('display','inline');
			document.getElementById('res').innerHTML="آدرس وارد شده صحیح می باشد.";
		}
	}
	});
			
}

function check_uname()
{
	if ($j('#uname').val() == '')
	return false;
	$j.ajax({
	url: adres+"/modules/login/check_uname.php",
	data:{uname:document.getElementById('uname').value},
	success:function(data)
	{
		if(data==0)
		{
			$j('#res_u').css('background-color','red');
			$j('#res_u').css('display','inline');
			document.getElementById('res_u').innerHTML="نام کاربری وارد شده قبلا استفاده شده است .";
		}
		else if (data==2)
		{
			$j('#res_u').css('background-color','red');
			$j('#res_u').css('display','inline');
			document.getElementById('res_u').innerHTML="طول نام کاربری می بایست بیشتر از 4 کاراکتر باشد.";
		}
		else if (data==3)
		{
			$j('#res_u').css('background-color','red');
			$j('#res_u').css('display','inline');
			document.getElementById('res_u').innerHTML="نام کاربری وارد شده شامل کاراکترهای غیر مجاز است.تنها از کاراکترهای انگلیسی و اعداد استفاده نمائید.";
		}
		else if (data==1)
		{
			$j('#res_u').css('background-color','green');
			$j('#res_u').css('display','inline');
			document.getElementById('res_u').innerHTML="نام کاربری وارد شده صحیح می باشد.";
		}
	}
	});
			
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
<div>
<p>برای عضویت در سایت تمامی موارد ستاره دار و الزامی را تکمیل نمائید : </p>
<div>
<div id="error_reporting" style="text-align:right;"></div>
</div>
<form>
<table border="0" style="width:256px;table-layout:fixed;">
<tr>
<td style="width:50%;">نام و نام خانوادگی : </td><td><input type="text" id="family" size="30" required aria-required="true"/><span style="position:absolute;color:red;font-size:20px;"> * </span></td>
</tr>

<tr>
<td>آدرس ایمیل : </td><td><input type="text" id="email" size="30" onblur="check_mail();" onkeydown="$('#res').css('display','none');" required aria-required="true"/><span style="color:red;font-size:20px;position:absolute;"> * </span><span id="res" style="position:absolute;"></span></td>
</tr>

<tr>
<td>تلفن همراه</td><td><input type="text" id="tel" size="15" onkeypress="return isNumberKey(event)"/></td>
</tr>

<tr>
<td>نام کاربردی - Username</td><td><input type="text" id="uname" size="15" onblur="check_uname();" onkeydown="$('#res_u').css('display','none');" required aria-required="true"/><span style="color:red;font-size:20px;position:absolute;"> * </span><span id="res_u" style="position:absolute;"></span></td>
</tr>

<tr>
<td>رمز عبور - Password</td><td><input type="password" id="pass" size="15" required aria-required="true"/><span style="color:red;font-size:20px;position:absolute;"> * </span></td>
</tr>

<tr>
<td>تکرار رمز عبور</td><td><input type="password" id="repass" size="15" required aria-required="true"/><span style="color:red;font-size:20px;position:absolute;"> * </span></td>
</tr>

<tr>
<td>
<table width="285px">
	<tr><td colspan="2">کد امنیتی : </td></tr>
	<tr><td><img src="{$site_domain}/modules/captcha/{$login_ini_data[0]}" id="cap_img2" style="vertical-align:middle;"/></td>
	<td><input type="text" size="5" id="captcha_r" dir="ltr" required aria-required="true" onkeypress="return isNumberKey(event)"/><img src="{$site_domain}/modules/captcha/retry.ico" onclick="renew_login_captcha();" style="width:20px;height:20px;vertical-align:middle;"/><span style="font-size:10px;">ارزیابی از چپ به راست</span></td>
	</tr>
	</table>
</td>
</tr>

</table>

<br/>
<input type="button" class="btn" onclick="register();" value="ثبت نام در سایت" />
<input type="reset" class="btn" value="پاک کردن فرم" onclick="$j('#res').css('display','none');$j('#res_u').css('display','none');renew_login_captcha();"/>
<input type="hidden" value="{$login_ini_data[1]}" id="cap_val2"/>
</form>
</div>