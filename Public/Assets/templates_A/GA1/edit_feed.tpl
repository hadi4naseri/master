<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta content="text/html; charset=utf-8" http-equiv="content-type" />
        <link rel="stylesheet" href="../{$adm_path}/templates/css/file_preview.css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>

        {literal}

            <script language="javascript" type="text/javascript">
            {/literal}
              var feed_id="{$feed_id}";
            {literal}
        function do_feed_update()
            {
            $j("#btn").attr("value", "در حال بررسی ...");
            $j("#btn").attr("disabled", "disabled");
            var xmlhttp;
            if (window.XMLHttpRequest)
              xmlhttp=new XMLHttpRequest();
            else
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");

              xmlhttp.open("GET","feed_update_db.php?fid="+feed_id+"&name="+document.getElementById("feed_name").value+"&link="+document.getElementById("feed_addrs").value,true);
              xmlhttp.send();
              xmlhttp.onreadystatechange=function()
              {
              if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                        document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
                        $j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
                        $j("#btn").removeAttr("disabled");
                        $j("#btn").attr("value", "ویرایش اطلاعات منبع خبری");
                       }
                }
            }
            {/literal}
        </script>
    </head>

    <body>

        <p style="padding-top:20px;">برای ویرایش منبع خبری سایت اطلاعات فرم زیر را کامل نمائید........</p>
        <br/>

        نام منبع خبری : <input type="text" size="50" value="{$feed[0][0]}" id="feed_name"/>
        <br/>
        لینک آدرس : <input type="text" size="80" id="feed_addrs" dir="ltr" value="{$feed[0][1]}"/>
        <br/>
        <ul>
            <li style="color:red"> ترجیحاً بهتر است آدرس سایت برای درج شدن با <span lang="en" dir="ltr">  http://  </span>   شروع شود.مثلاً <span dir="ltr">http://www.idehandish.com</span>  </li>
            <li>پروتکل پیش فرض http در نظر گرفته خواهد شد.</li>
        </ul>
        <input type="button" id="btn" onclick="do_feed_update();" value="ویرایش اطلاعات منبع خبری"/><div id="error_reporting" style="position: absolute;height:20px;right:100px;margin-top:3px;">
</div>
    </body>
</html>
