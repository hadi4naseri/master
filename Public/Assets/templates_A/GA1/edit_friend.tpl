<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta content="text/html; charset=utf-8" http-equiv="content-type" />
        <link rel="stylesheet" href="../{$adm_path}/templates/css/file_preview.css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>

        {literal}

            <script language="javascript" type="text/javascript">
            {/literal}
              var news_id="{$friend_id}";
            {literal}
        function do_friend_update()
            {
            $j("#btn").attr("value", "در حال بررسی ...");
            $j("#btn").attr("disabled", "disabled");
            var xmlhttp;
            if (window.XMLHttpRequest)
              xmlhttp=new XMLHttpRequest();
            else
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");

              xmlhttp.open("GET","friend_update_db.php?nid="+news_id+"&name="+document.getElementById("friend_name").value+"&link="+document.getElementById("friend_addrs").value,true);
              xmlhttp.send();
              xmlhttp.onreadystatechange=function()
              {
              if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                        document.getElementById("error_reporting").innerHTML=xmlhttp.responseText;
                        $j("#error_reporting").css("background-color","yellow").fadeIn("slow").delay(2500).fadeOut("slow");
                        $j("#btn").removeAttr("disabled");
                        $j("#btn").attr("value", "ویرایش اطلاعات دوست سایت");
                        //setTimeout('$j.fancybox.close();', 4000);
                       }
                }
            }
            {/literal}
        </script>
    </head>

    <body>

        <div id="error_reporting" style="position: fixed;">
        </div>

        <p style="padding-top:20px;">برای ویرایش دوست سایت اطلاعات فرم زیر را کامل نمائید........</p>
        <br/>

        نام سایت جهت نمایش در صفحه سایت : <input type="text" size="50" value="{$friend[0][0]}" id="friend_name"/>
        <br/>
        لینک آدر س سایت : <input type="text" size="80" id="friend_addrs" dir="ltr" value="{$friend[0][1]}"/>
        <br/>
        <ul>
            <li style="color:red"> ترجیحاً بهتر است آدرس سایت برای درج شدن با <span lang="en" dir="ltr">  http://  </span>   شروع شود.مثلاً <span dir="ltr">http://www.idehandish.com</span>  </li>
            <li>پروتکل پیش فرض http در نظر گرفته خواهد شد.</li>
        </ul>
        <input type="button" id="btn" onclick="do_friend_update();" value="ویرایش اطلاعات دوست سایت"/>
    </body>
</html>
