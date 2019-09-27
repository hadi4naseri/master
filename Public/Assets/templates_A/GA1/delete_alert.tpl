{function admin_comment_alert}

آیا شما مایل به حذف این پیام ارسالی هستید؟
<input type="button" value="بله" onclick="$j('#msg').fadeOut();do_delete({$com_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function news_alert}

آیا شما مایل به حذف این خبر هستید؟
<input type="button" value="بله" onclick="do_delete({$news_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function sites_alert}

آیا شما مایل به حذف این سایت هستید؟تمام اطلاعات زیر سایت از بین خواهد رفت!
<input type="button" value="بله" onclick="do_delete({$site_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function group_alert}

آیا شما مایل به حذف این گروه هستید؟ کاربران گروه به User تبدیل خواهند شد!
<input type="button" value="بله" onclick="do_delete({$group_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function role_alert}

آیا شما مایل به حذف دسترسی از کاربر انتخابی هستید؟
<input type="button" value="بله" onclick="del_role({$f_id},{$grp_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function block_alert}

آیا شما مایل به حذف این بلاک از سایت هستید؟
<input type="button" value="بله" onclick="do_delete({$block_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function book_alert}

آیا شما مایل به حذف این کتاب / مقاله هستید؟
<input type="button" value="بله" onclick="do_delete({$book_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function relation_alert}

آیا شما مایل به حذف این رابطه هستید؟تمامی اطلاعات رابطه از بین خواهد رفت!!!
<input type="button" value="بله" onclick="do_delete('{$table}','{$mrgmdl}','{$ref}','{$item_id}');"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function faq_alert}

آیا شما مایل به حذف این سوال هستید؟
<input type="button" value="بله" onclick="do_delete({$faq_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function page_alert}

آیا شما مایل به حذف این صفحه از سایت هستید؟
<input type="button" value="بله" onclick="do_delete_p({$page_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function sound_alert}

آیا شما مایل به حذف این کلیپ صوتی هستید؟
<input type="button" value="بله" onclick="do_delete({$sound_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function feed_alert}

آیا شما مایل به حذف این منبع خبری هستید؟
<input type="button" value="بله" onclick="do_delete({$feed_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function friend_alert}

آیا شما مایل به حذف این لینک هستید؟
<input type="button" value="بله" onclick="do_delete({$friend_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function image_alert}

آیا شما مایل به حذف این تصویر از گالری سایت هستید؟
<input type="button" value="بله" onclick="do_delete({$image_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function user_alert}

آیا شما مایل به حذف این کاربر هستید؟
<input type="button" value="بله" onclick="do_delete({$user_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function video_alert}

آیا شما مایل به حذف این کلیپ تصویری هستید؟
<input type="button" value="بله" onclick="do_delete({$video_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function vnews_alert}

آیا شما مایل به حذف این تصویر هستید؟
<input type="button" value="بله" onclick="do_delete({$vpic_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}

{function message_alert}

آیا شما مایل به حذف این پیام هستید؟
<input type="button" value="بله" onclick="do_delete({$message_id});"/>
<input type="button" value="خیر" onclick="$j('#msg').fadeOut();"/>

{/function}


<!-- ######################################################################## -->


<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
</head>

<body>
<div id="msg">
{call $func_name}
</div>
</body>
</html>
