<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<script type="text/javascript" src="../admin/js/jquery.idTabs.min.js"></script>
<link rel="stylesheet" href="../{$adm_path}/templates/css/file_preview.css"/>
{literal}


<script type="text/javascript">
           $j(document).ready(function() {

            $('.color').live('click' ,function(){
               jscolor.init();
            });
		clicked="";
            $("div#list ul").hide();
            //$(".dropdown dt a").live('click',function() {
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
            }));

            function getSelectedValue(id) {
                return $("div#" + id).find("dt a span.value").html();
            }
        });
    </script>

<script language="javascript" type="text/javascript">


function change_color()
{

if (document.getElementById("box_color").value == "" ||document.getElementById("site_bg_color").value == "")
{
    document.getElementById("error_reporting").innerHTML='لطفا با کلیک بر روی جعبه متن رنگ دلخواه خود را انتخاب نمائید';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{
  $.ajax({
  type: "GET",
  url: "update_colors.php",
  data: { bg_color: document.getElementById("site_bg_color").value,box_color: document.getElementById("box_color").value},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		setTimeout('$j.fancybox.close();', 3500);
	}
});
}
}

function change_pic()
{

if($('div#sample').find('dt a span.value').text()=="")
   {
document.getElementById("error_reporting").innerHTML='لطفابا کلیک بر روی دکمه انتخاب تصویر یکی از تصاویر را انتخاب نمائید';
	$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
}
else
{
pics="";
    pics=$('div#sample').find('dt a span.value').text();

  $.ajax({
  type: "GET",
  url: "update_bg_pic.php",
  data: { bg_pic: pics},
  success: function(data)
	{
  	    document.getElementById("error_reporting").innerHTML=data;
		$j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
		setTimeout('$j.fancybox.close();', 3500);
	}
});
}
}

</script>
<style>
.usual .tab {

background:orange;
  color:#111;
  width:850px;
}
.usual li { list-style:none; float:right;padding-top:5px; }
.usual ul { list-style:none; float:right;margin-top:-20px;padding-right:0; }
.usual ul a {
  display:block;
  padding:6px 10px;
  text-decoration:none!important;
  margin:1px;
  margin-right:0;

}
.usual ul a:hover {
  color:#FFF;
  background:#111;
  }
.usual ul a.selected {
  margin-bottom:0;
  color:#000;
  background:snow;
  border-bottom:1px solid snow;
  cursor:default;
  }
.usual,.tab {
  padding:20px 10px 8px 10px;
  margin-top:20px;
  clear:left;
  background:snow;
}

</style>
{/literal}
</head>

<body dir="rtl">

<div id="error_reporting" style="position: fixed;">
</div>

{if $data[0][2] != ""}
    <script>
    $(".dropdown dt a#sample span").html("<img src=\"{$image_thumb}\" /><span class=\"value\" style=\"display:none;\">{$image_thumb}</span>");
    </script>
{/if}
<p style="padding-top: 20px;font-weight: bold;">تنظیمات نمایشی صفحه :</p>
<div id="usual1" class="usual">
  <ul>
      <li><a class="selected" href="#tab1" style="background-color: red;" onclick="$j.fancybox.toggle();">رنگ</a></li>
    <li><a href="#tab2" style="background-color: red;" onclick="$j.fancybox.toggle();">تصویر</a></li>
  </ul>
    <div id="tab1" class="tab">
        <table>
            <tr>
                <td>لطفاً رنگ مورد نظر خود را برای زمینه اصلی انتخاب نمائید :</td>
                <td><input type="text" class="color" id="site_bg_color" value="{$data[0][0]}"/></td>
            </tr>
            <tr>
                <td>لطفاً رنگ مورد نظر خود را برای رنگ زمینه باکس ها انتخاب نمائید :</td>
                <td><input type="text" class="color" id="box_color" value="{$data[0][1]}"/></td>
            </tr>
  </table>
  <input type="button" value="تغییر رنگ" onclick="change_color();"/>
    </div>
  <div id="tab2" class="tab">
  لطفاً تصویر مورد نظر خود را برای نمایش در زمینه سایت انتخاب نمائید:
 <br/>
  <div id="sample" class="dropdown">
	<dt><a id="sample"><span>انتخاب تصویر زمینه سایت</span></a></dt><a style="cursor:pointer" onclick="$('.dropdown dt a#sample span').html('انتخاب تصویر زمینه سایت');">حذف تصویر</a>

</div>

    <div id="list">
	<ul>
		{for $i=0 to $image_files|count-1}
		<li><a><img alt="" src="{$image_files[$i][1]}" /><span class="value" style="display:none;">{$image_files[$i][0]}</span></a></li>
		{/for}
	</ul>
</div>
        <input type="button" value="تغییر تصویر زمینه سایت" onclick="change_pic();"/>
  </div>
</div>

<script type="text/javascript">
  $("#usual1 ul").idTabs();
</script>

</body>
</html>
