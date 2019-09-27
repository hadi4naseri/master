<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta content="text/html; charset=utf-8" http-equiv="content-type" />
        <link rel="stylesheet" href="../{$adm_path}/templates/css/file_preview.css"/>
        
        <script src="../{$adm_path}/js/jquery.Jcrop.js" type="text/javascript"></script>
        <link rel="stylesheet" href="../{$adm_path}/templates/css/jquery.Jcrop.css" type="text/css" />
			
            <script type="text/javascript">
			var domain="{$site_domain}";
			var img_width,img_height;
			def_height={$def_height};
			def_width={$def_width};
			{literal}
                 //var $x = jQuery.noConflict();
				pics="";

                 $j(document).ready(function(){
                    clicked="";var api;
					
                    $("div#list ul").hide();
            //            $(".dropdown dt a").live('click',function() {
                    $(".dropdown dt a").click(function() {
                        $j.fancybox.toggle();
                    if($('div#list ul').is(':visible')==false)
                                clicked=($(this).attr('id'));
                        $("div#list ul").slideToggle();

                    });

                    $("div#list ul li a").live('click',(function() {
                        
						var text = $(this).html();
                        $(".dropdown dt a#"+clicked+" span").html(text);
                        $("div#list ul").hide();
                        $("#result").html(getSelectedValue(clicked));
						
                        if($('div#sample').find('dt a span.value').text()!="")
						{	
							pics=$('div#sample').find('dt a span.value').text();
                            $.ajax({
							  type: "GET",
							  url: "get_size.php",
							  data: { url:pics },
							  success: function(data)
								{
									var dims=data.split(",");
									img_width=dims[0];
									img_height=dims[1];
									if (parseInt(dims[0])>def_width && parseInt(dims[1])>def_height)
									{
										if (api!=null)
										{
											api.destroy();
											$('#testImage').attr('src',domain+"/" +pics);
											$j.fancybox.toggle();
										}
										else
										{
											$('#testImage').attr('src',domain+"/" +pics);
											$j.fancybox.toggle();
										}
										$('#testImage').Jcrop({
										onChange:   getCoords,
										// start off with jcrop-light class
										bgOpacity: 0.25,
										bgColor: 'gray',
										addClass: 'jcrop-dark'
									  },function(){
										api = this;
										ch_width= def_width*800/dims[0];
										ch_height= def_height*600/dims[1];
										api.setSelect([30,65,30+ch_width,65+ch_height]);
										api.setOptions({ bgFade: true,allowResize:false,allowSelect:false,allowMove: true});
										//api.ui.selection.addClass('jcrop-selection');
									  });
									}
									else
									{
										document.getElementById("error_reporting").innerHTML="ابعاد تصویر انتخاب شده کوچکتر از مقادیر مشخص شده است.تصویر دیگری را امتحان کنید.";
										$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
									}
									
								}
							});						
						
                        }
                    }));

                    function getSelectedValue(id) {
                        return $("div#" + id).find("dt a span.value").html();
                    }
					
					function getCoords(c)
					{
						$('#x1').val(c.x);
						$('#y1').val(c.y);
					}
					
                  });
				function create_image()
				{
					 
					if (pics!="")
					{
						x1=$('#x1').attr('value')*img_width/800;
						//x1=$('#x1').attr('value');
						y1=$('#y1').attr('value')*img_height/600;
						//y1=$('#y1').attr('value');
						
						$.ajax({
							  type: "GET",
							  url: "vnews.php",
							  data: { url:pics,x1_r:x1,y1_r:y1,width:def_width,height:def_height},
							  success: function(data)
								{
									alert('تصویر مورد نظر با موفقیت ایجاد گردید');
									$j.fancybox.close();
								}	
							});
					}	
					else
					{
					alert("تصویری انتخاب نشده است!");
					}
				}
				
				    //----------------upload-------------------------
             
					  {/literal}
					  var uid="{$auth_id}";
					  {literal}
					  function upload(x)
					  {
					  var file = x.files[0];
						name = file.name;
						var result = [];
						var ext=name.split('.').pop();
						if (ext=="jpg" || ext=="jpeg" )
						{
							size = (file.size/1024)/1024;
							if (size<=5)
							{
								$('#progress').show();
								$('#upload').submit();
							}
							else
							{
								alert('آپلود فایل با حجم بیش از 5 مگا بایت امکان پذیر نمی باشد');
							}
						}
						else
						{
							alert("فایل های با پسوند jpg و jpeg تنها پشتیبانی می شوند");
						}
					  }
					   
					  function do_del(path)
					  {
						path=path.replace('//','/','g');
						$.ajax({
						  type: "GET",
						  url: "delete_file.php",
						  data: { path:path},
						  success: function(data)
							{
								if (data =="1")
								{
								alert('فایل مورد نظر با موفقیت حذف شد');
								refresh();
								}
								else
								alert('متاسفانه فایل پاک نشده است...!');
							}
						});
					  }
					  function refresh()
					  {
						var contentText = $.ajax({

									url: "pics_crop.php",
									async: false

								}).responseText;

								$j.fancybox.close();

								$j.fancybox(contentText);
					  }
					  
					  function test_upload()
					  {
					  $j('#progress').hide();
					  if($('#upload_target').contents().find('body').text()=="1")
					  {
					  alert('آپلود فایل با موفقیت انجام شد');
					  refresh();
					  }
					  else if ($('#upload_target').contents().find('body').text()=="0")
					  alert('متاسفانه فایل آپلود نشده است!');
					  }
					  
					//---------------------------------------------------------------------  

            </script>

        {/literal}

    </head>
	
    <body>

        <div id="error_reporting" style="position: fixed;">
        </div>
		<input type="hidden" id="x1" value="30"/>
		<input type="hidden" id="y1" value="65"/>

		<fieldset style="width:800px;margin-top:50px;">
            <p style="color:red;">لازم به ذکر است که ایجاد تصاویر بخش خبر تصویری تنها از تصاویر با پسوند jpeg,jpg انجام میگردد.</p>
			<p style="color:black;">برای ایجاد تصویر کادر ایجاد شده بر روی تصویر را حرکت داده و برای ایجاد تصویر بر روی دکمه پایین صفحه کلیک نمائید.</p>
			<legend>تصاویر سایت</legend>
            برای انتخاب تصاویر خبر تصویری بر روی<span style="font-weight:bold" onmouseover="$('div.dropdown dt a').css('border','1px red solid');" onmouseout="$('div.dropdown dt a').css('border','1px solid #D4CA9A');"> گزینه</span> زیر کلیک نمائید...
            <br/>
            <div id="sample" class="dropdown">
                <dt><a id="sample"><span>انتخاب تصویر</span></a></dt>
            </div>

			<div id="inline_upload">
			<form id="upload" method="POST" action="upload_files.php" enctype="multipart/form-data" target="upload_target" >
			<input type="file" name="myfile" style="visibility:hidden;" onchange="upload(this);"/>
			<input type="hidden" value="{$auth_id}" name="uid"/>
			<input type="hidden" value="{$script_name}" name="decision" id="decision"/>
			<iframe id="upload_target" name="upload_target" src="#" style="width:0px;height:0px;border:0px solid #fff;" onload="test_upload();"></iframe>
			</form>
			</div>
			
			<a href="javascript:;" onclick="$('input[type=file]').click();" style="color:blue;text-decoration:none;">آپلود سریع فایل<img src="{$site_domain}/admin/templates/images/upload.png" style="margin-bottom:-15px;"/></a>
			<br/>
			<span id="progress" style="width:100%;text-align:center;position:absolute;display:none;margin-top:-25px;" >در حال بارگذاری فایل...<img src="{$site_domain}/admin/templates/images/up_loading.gif"/></span>
			
            <div id="list">
                <ul>
                    
					{for $i=0 to $image_files|count-1}
					<li style="text-align:center;"><a href="javascript:;" style="text-align:center;color:black;"><img alt="" src="{$site_domain}/admin/{$image_files[$i][1]|replace:'//':'/'}" title="{$site_domain}/{$image_files[$i][0]}"  /><span class="value" style="display:none;">{$image_files[$i][0]}</span><br/><span style="text-align:center;font-size:9px;direction:ltr;">{assign f_info pathinfo($image_files[$i][0])}<b>{$f_info['filename']}.{$f_info['extension']}</b></span></a><span onclick="event.stopPropagation();do_del('{$image_files[$i][0]|replace:'//':'/'}');" style="color:red;font-weight:bold;cursor:pointer;">حذف</span>/<span onclick="event.stopPropagation();alert('{$site_domain}/{$image_files[$i][0]|replace:'//':'/'}');" style="color:red;font-weight:bold;cursor:pointer;">آدرس</span></li>
					{/for}
					
                </ul>
            </div>

        </fieldset>
        <div id="testWrap">
            <img  alt ="مدیریت تصاویر خبر تصویری" id="testImage" width="800px" height="600px"/>
        </div>
		<br/>
		<input type="button" value="ایجاد تصویر از نمونک" onclick="create_image();"/>
    </body>
</html>



