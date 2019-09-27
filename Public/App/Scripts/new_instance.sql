

CREATE TABLE `site_auto_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `link` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4358 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_auto_news VALUES("4349","Profit from prisoners: How UNICOR capitalizes on convict labor","http://www.tehrantimes.com/component/content/article/52-guests/115285-profit-from-prisoners-how-unicor-capitalizes-on-convict-labor");
INSERT INTO site_auto_news VALUES("4350","12km section of Tehran Metro inaugurated ","http://www.tehrantimes.com/economy-and-business/115284-12km-section-of-tehran-metro-inaugurated-");
INSERT INTO site_auto_news VALUES("4351","Syrian opposition is a movement of clubs, squares, and festivals: Maliki","http://www.tehrantimes.com/world/115283-syrian-opposition-is-a-movement-of-clubs-squares-and-festivals-maliki");
INSERT INTO site_auto_news VALUES("4352","Tehran keen to expand ties with Sarajevo","http://www.tehrantimes.com/politics/115280-tehran-keen-to-expand-ties-with-sarajevo");
INSERT INTO site_auto_news VALUES("4353","Venezuelan FM to visit Tehran in May","http://www.tehrantimes.com/politics/115278-venezuelan-fm-to-visit-tehran-in-may");
INSERT INTO site_auto_news VALUES("4354","What Iran really wants","http://www.tehrantimes.com/component/content/article/52-guests/115277-what-iran-really-wants");
INSERT INTO site_auto_news VALUES("4355","Expansion of Iran-Saudi Arabia ties can boost relations between Islamic countries: Rafsanjani","http://www.tehrantimes.com/politics/115276-expansion-of-iran-saudi-arabia-ties-can-boost-relations-between-islamic-countries-rafsanjani");
INSERT INTO site_auto_news VALUES("4356","Iran beats S. Africa’s Moroka Swallows 5-0 in friendly","http://www.tehrantimes.com/sports/115275-iran-beats-s-africas-moroka-swallows-5-0-in-friendly");
INSERT INTO site_auto_news VALUES("4357","Turkey to boost electricity imports from Iran: energy minister ","http://www.tehrantimes.com/economy-and-business/115274-turkey-to-boost-electricity-imports-from-iran-energy-minister-");





CREATE TABLE `site_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `colmn` smallint(6) NOT NULL,
  `vposition` smallint(6) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;


INSERT INTO site_blocks VALUES("13","","مراقبت از زانوها ","<p>\n	- از فشار زیاد روی زانو با انجام حرکات سنگین خودداری کنید.<br />\n	&nbsp;<br />\n	- توت&zwnj;ها، زنجبیل، آووکادو، دانه کتان، امگا &ndash; 3 و سویا منابع خوراکی مفید برای زانوها هستند.<br />\n	&nbsp;<br />\n	- از پوشیدن کفش&zwnj;های نامناسب و غیر استاندارد جدا پرهیز کنید.<br />\n	&nbsp;<br />\n	- با مشورت یک متخصص ارتوپد، تمرینات ورزشی برای تقویت عضلات را انجام دهید. قدرتمند شدن عضلات راهکاری موثر برای حفظ سلامت استخوان&zwnj;ها از جمله زانوها است.<br />\n	&nbsp;<br />\n	- از مصرف زیاد سدیم خودداری کنید چون موجب تورم شده و فشار و درد روی زانوها را تشدید می&zwnj;کند.<br />\n	&nbsp;<br />\n	- ویتامین C نیز برای سلامت زانوها بسیار مفید است.</p>\n","1","3","16","1");



CREATE TABLE `site_book_briefcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `visit` int(11) NOT NULL,
  `books` varchar(1000) CHARACTER SET latin1 NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `acpd` tinyint(4) NOT NULL DEFAULT '0',
  `author` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `relation` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_book_briefcase VALUES("1","جزوه آـموزشی طراحی صفحات وب","<p>\n	در این جزوه آموزش مقدماتی از شروع کار با html را یاد خواهیم گرفت.</p>\n","99","admin/Files/Books//WEB.pdf","1","1","","0","");
INSERT INTO site_book_briefcase VALUES("4","طراحی وب","<p>\n	کتاب آشنایی با استانداردهای طراحی صفحات وب</p>\n","31","admin/Files/Books//Standardhaye Tarahi Toolid Website.pdf","1","1","","0","");
INSERT INTO site_book_briefcase VALUES("5","برنامه نویسی سه لایه","<p>\n	برنامه نویسی سه لایه برنامه نویسی سه لایه برنامه نویسی سه لایه</p>\n","7","admin/Files/Users/farhad/www.irpdf.com(8098).pdf","1","1","فرهاد آئیش","6","");



CREATE TABLE `site_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `mail` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `category` varchar(100) NOT NULL,
  `message` varchar(2000) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `reg_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;


INSERT INTO site_comments VALUES("5","0","","elmi_amirhossein@yahoo.com","contact_admin","خوبه ولی بهترم میتونه باشه","شش خرداد هزار و سیصد و نود و دو ۱۹:۲۳:۰۹","1");



CREATE TABLE `site_config` (
  `id` int(11) NOT NULL,
  `site_title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `site_keywords` varchar(1000) COLLATE utf8_persian_ci NOT NULL,
  `db_info` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `template_name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `visit_count` bigint(20) NOT NULL DEFAULT '0',
  `news_count` int(11) NOT NULL DEFAULT '5',
  `short_desc` varchar(1000) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `site_images` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `site_slogan` varchar(2000) COLLATE utf8_persian_ci NOT NULL,
  `site_color` varchar(10) COLLATE utf8_persian_ci NOT NULL,
  `box_color` varchar(10) COLLATE utf8_persian_ci NOT NULL,
  `site_bg_pic` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `image_width` int(11) NOT NULL DEFAULT '200',
  `image_height` int(11) NOT NULL DEFAULT '200',
  `site_width` int(11) NOT NULL ,
  `site_layout` smallint(6) NOT NULL ,
  `columns_width` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `site_box` varchar(20) COLLATE utf8_persian_ci NOT NULL DEFAULT 'box2',
  `maintain_mode` smallint(6) NOT NULL DEFAULT '0',
  `maintain_msg` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `relation` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;


CREATE TABLE `site_content_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groups_permission` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;



CREATE TABLE `site_contributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `module_ref` int(11) NOT NULL,
  `ip` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;




CREATE TABLE `site_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;




CREATE TABLE `site_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) COLLATE utf8_persian_ci NOT NULL,
  `answer` text COLLATE utf8_persian_ci NOT NULL,
  `visit` int(11) NOT NULL,
  `images` varchar(1000) COLLATE utf8_persian_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `relation` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_faq VALUES("1","<p>\n	مبینا چی هست؟</p>\n","<p>\n	مبینا سیستم مدیرت محتوای این سایت هست. این سیستم در مراحل تکمیل و طراحی هست و به مرور زمان قایلیتها و امکاناتش بیشتر خواهد شد.</p>\n","1","Files//Tulips.jpg","1","");




CREATE TABLE `site_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `address` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_feeds VALUES("1","تابناک","http://tabnak.ir/fa/rss/1/mostvisited","0");
INSERT INTO site_feeds VALUES("3","اجتماعی","http://tabnak.ir/fa/rss/3","0");
INSERT INTO site_feeds VALUES("4","اقتصادی","http://tabnak.ir/fa/rss/6","0");





CREATE TABLE `site_file_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `file_title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_offset` int(11) NOT NULL,
  `group_title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `group_logo` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `valid_groups` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_file_access VALUES("1","vnews_delete_db.php","","7","3","خبر تصویری","photo_news.png","1,");
INSERT INTO site_file_access VALUES("2","vnews.php","","7","2","خبر تصویری","photo_news.png","1,");
INSERT INTO site_file_access VALUES("3","visual_settings.php","تنظیمات نمایشی","15","1","تنظیمات کلی سایت","settings.png","1,");
INSERT INTO site_file_access VALUES("4","video_update_db.php","","13","2","مدیریت کلیپ های تصویری","movie.png","1,");
INSERT INTO site_file_access VALUES("5","video_update.php","","13","2","مدیریت کلیپ های تصویری","movie.png","1,");
INSERT INTO site_file_access VALUES("6","video_delete_db.php","","13","2","مدیریت کلیپ های تصویری","movie.png","1,");
INSERT INTO site_file_access VALUES("7","user_delete_db.php","","2","1","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("8","upload_files.php","","0","0","","","1,");
INSERT INTO site_file_access VALUES("9","update_size.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("10","update_site_settings.php","","10","1","اطلاعات اولیه سایت","info.png","1,");
INSERT INTO site_file_access VALUES("11","update_pdata.php","","40","0","","","1,");
INSERT INTO site_file_access VALUES("12","update_news_count.php","","1","3","مدیریت اخبار","news.png","1,");
INSERT INTO site_file_access VALUES("13","update_image_dimentions.php","","7","1","خبر تصویری","photo_news.png","1,");
INSERT INTO site_file_access VALUES("14","update_colors.php","","15","1","تنظیمات کلی سایت","settings.png","1,");
INSERT INTO site_file_access VALUES("15","update_bg_pic.php","","15","1","تنظیمات کلی سایت","settings.png","1,");
INSERT INTO site_file_access VALUES("16","sound_update_db.php","","12","2","مدیریت کلیپ های صوتی","audio.png","1,");
INSERT INTO site_file_access VALUES("17","sound_update.php","","12","2","مدیریت کلیپ های صوتی","audio.png","1,");
INSERT INTO site_file_access VALUES("18","sound_delete_db.php","","12","2","مدیریت کلیپ های صوتی","audio.png","1,");
INSERT INTO site_file_access VALUES("19","site_settings.php","تنظیمات اولیه سایت","10","1","اطلاعات اولیه سایت","info.png","1,");
INSERT INTO site_file_access VALUES("20","show_all_users.php","لیست کاربران","2","1","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("21","pics_crop.php","ایجاد تصویر","7","2","خبر تصویری","photo_news.png","1,");
INSERT INTO site_file_access VALUES("22","pdata.php","","40","0","","","1,");
INSERT INTO site_file_access VALUES("23","page_update_db.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("24","page_update.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("25","page_delete_db.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("26","news_update_db.php","","1","2","مدیریت اخبار","news.png","1,");
INSERT INTO site_file_access VALUES("27","news_update.php","","1","2","مدیریت اخبار","news.png","1,");
INSERT INTO site_file_access VALUES("28","news_settings.php","تنظیمات اخبار","1","3","مدیریت اخبار","news.png","1,");
INSERT INTO site_file_access VALUES("29","news_delete_db.php","","1","2","مدیریت اخبار","news.png","1,");
INSERT INTO site_file_access VALUES("30","new_video_db.php","","13","1","مدیریت کلیپ های تصویری","movie.png","1,");
INSERT INTO site_file_access VALUES("31","new_video.php","کلیپ تصویری جدید","13","1","مدیریت کلیپ های تصویری","movie.png","1,");
INSERT INTO site_file_access VALUES("32","new_sound_db.php","","12","1","مدیریت کلیپ های صوتی","audio.png","1,");
INSERT INTO site_file_access VALUES("33","new_sound.php","کلیپ صوتی جدید","12","1","مدیریت کلیپ های صوتی","audio.png","1,");
INSERT INTO site_file_access VALUES("34","new_page_db.php","","16","2","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("35","new_page.php","درج صفحه جدید","16","2","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("36","new_message_db.php","","3","1","پیام رسانی","messaging.png","1,");
INSERT INTO site_file_access VALUES("37","new_message.php","ارسال پیام جدید","3","1","پیام رسانی","messaging.png","1,2,");
INSERT INTO site_file_access VALUES("38","new_img_db.php","","20","1","مدیریت گالری تصاویر","img_gallery.png","1,");
INSERT INTO site_file_access VALUES("39","new_group_db.php","","2","2","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("40","new_group.php","مدیریت گروه کاربری","2","2","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("41","new_faq_db.php","","6","1","سوالات پر تکرار","faq.png","1,");
INSERT INTO site_file_access VALUES("42","new_faq.php","درج سوال جدید","6","1","سوالات پر تکرار","faq.png","1,");
INSERT INTO site_file_access VALUES("43","new_book_db.php","","19","1","کتابخانه و مقالات","library.png","1,");
INSERT INTO site_file_access VALUES("44","new_book.php","کتاب/مقاله جدید","19","1","کتابخانه و مقالات","library.png","1,");
INSERT INTO site_file_access VALUES("45","new_block_db.php","","16","1","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("46","new_block.php","درج بلوک جدید","16","1","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("47","modify_activity_vnews.php","","7","3","خبر تصویری","photo_news.png","1,");
INSERT INTO site_file_access VALUES("48","modify_activity_video.php","","13","2","مدیریت کلیپ های تصویری","movie.png","1,");
INSERT INTO site_file_access VALUES("49","modify_activity_user.php","","2","1","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("50","modify_activity_sound.php","","12","2","مدیریت کلیپ های صوتی","audio.png","1,");
INSERT INTO site_file_access VALUES("51","modify_activity_page.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("52","modify_activity_image.php","","20","2","مدیریت گالری تصاویر","img_gallery.png","1,");
INSERT INTO site_file_access VALUES("53","modify_activity_friends.php","","18","2","مدیریت دوستان","link.png","1,");
INSERT INTO site_file_access VALUES("54","modify_activity_feeds.php","","4","2","اخبار اتوماتیک","rss.png","1,");
INSERT INTO site_file_access VALUES("55","modify_activity_faq.php","","6","2","سوالات پر تکرار","faq.png","1,");
INSERT INTO site_file_access VALUES("56","modify_activity_book.php","","19","2","کتابخانه و مقالات","library.png","1,");
INSERT INTO site_file_access VALUES("57","modify_activity_block.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("58","modify_activity.php","","1","2","مدیریت اخبار","news.png","1,");
INSERT INTO site_file_access VALUES("59","modify_accept_video.php","","13","2","مدیریت کلیپ های تصویری","movie.png","1,");
INSERT INTO site_file_access VALUES("60","modify_accept_sound.php","","12","2","مدیریت کلیپ های صوتی","audio.png","1,");
INSERT INTO site_file_access VALUES("61","modify_accept_book.php","","19","2","کتابخانه و مقالات","library.png","1,");
INSERT INTO site_file_access VALUES("62","modify_accept.php","","1","2","مدیریت اخبار","news.png","1,");
INSERT INTO site_file_access VALUES("63","mng_admin_msg.php","پیام های ارتباط با مدیریت","9","1","مدیریت نظرات","comments.png","1,");
INSERT INTO site_file_access VALUES("65","index.php","","0","0","","","1,");
INSERT INTO site_file_access VALUES("66","img_dimention.php","تنظیم ابعاد تصویر","7","1","خبر تصویری","photo_news.png","1,");
INSERT INTO site_file_access VALUES("67","image_delete_db.php","","20","2","مدیریت گالری تصاویر","img_gallery.png","1,");
INSERT INTO site_file_access VALUES("68","get_size.php","","7","1","خبر تصویری","photo_news.png","1,");
INSERT INTO site_file_access VALUES("70","friends_update.php","","18","2","مدیریت دوستان","link.png","1,");
INSERT INTO site_file_access VALUES("71","friend_update_db.php","","18","2","مدیریت دوستان","link.png","1,");
INSERT INTO site_file_access VALUES("72","friend_delete_db.php","","18","2","مدیریت دوستان","link.png","1,");
INSERT INTO site_file_access VALUES("73","feed_update_db.php","","4","2","اخبار اتوماتیک","rss.png","1,");
INSERT INTO site_file_access VALUES("74","feed_update.php","","4","2","اخبار اتوماتیک","rss.png","1,");
INSERT INTO site_file_access VALUES("75","feed_delete_db.php","","4","2","اخبار اتوماتیک","rss.png","1,");
INSERT INTO site_file_access VALUES("76","faq_update_db.php","","6","2","سوالات پر تکرار","faq.png","1,");
INSERT INTO site_file_access VALUES("77","faq_update.php","","6","2","سوالات پر تکرار","faq.png","1,");
INSERT INTO site_file_access VALUES("78","fag_delete_db.php","","6","2","سوالات پر تکرار","faq.png","1,");
INSERT INTO site_file_access VALUES("80","edit_vnews.php","مدیریت تصاویر","7","3","خبر تصویری","photo_news.png","1,");
INSERT INTO site_file_access VALUES("81","edit_del_videos.php","مدیریت کلیپ های تصویری","13","2","مدیریت کلیپ های تصویری","movie.png","1,");
INSERT INTO site_file_access VALUES("82","edit_del_sounds.php","مدیریت کلیپ های صوتی","12","2","مدیریت کلیپ های صوتی","audio.png","1,");
INSERT INTO site_file_access VALUES("83","edit_del_news.php","مدیریت اخبار","1","2","مدیریت اخبار","news.png","1,2,");
INSERT INTO site_file_access VALUES("84","edit_del_images.php","مدیریت تصاویر","20","2","مدیریت گالری تصاویر","img_gallery.png","1,");
INSERT INTO site_file_access VALUES("85","edit_del_friends.php","مدیریت دوستان","18","2","مدیریت دوستان","link.png","1,");
INSERT INTO site_file_access VALUES("86","edit_del_feeds.php","مدیریت منابع خبری","4","2","اخبار اتوماتیک","rss.png","1,");
INSERT INTO site_file_access VALUES("87","edit_del_faq.php","مدیریت سوالات پرتکرار","6","2","سوالات پر تکرار","faq.png","1,");
INSERT INTO site_file_access VALUES("88","edit_del_books.php","مدیریت کتابخانه","19","2","کتابخانه و مقالات","library.png","1,");
INSERT INTO site_file_access VALUES("89","delete_file.php","","0","0","","","1,");
INSERT INTO site_file_access VALUES("90","delete_backup.php","","21","1","مدیریت پایگاه داده","db.png","1,");
INSERT INTO site_file_access VALUES("91","delete_alert_vnews.php","","7","3","خبر تصویری","img_gallery.png","1,");
INSERT INTO site_file_access VALUES("92","delete_alert_video.php","","13","2","مدیریت کلیپ های تصویری","movie.png","1,");
INSERT INTO site_file_access VALUES("93","delete_alert_user.php","","2","1","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("94","delete_alert_sound.php","","12","2","مدیریت کلیپ های صوتی","audio.png","1,");
INSERT INTO site_file_access VALUES("95","delete_alert_page.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("96","delete_alert_news.php","","1","2","مدیریت اخبار","news.png","1,");
INSERT INTO site_file_access VALUES("97","delete_alert_image.php","","20","2","مدیریت گالری تصاویر","img_gallery.png","1,");
INSERT INTO site_file_access VALUES("98","delete_alert_friends.php","","18","2","مدیریت دوستان","link.png","1,");
INSERT INTO site_file_access VALUES("99","delete_alert_feeds.php","","4","2","اخبار اتوماتیک","rss.png","1,");
INSERT INTO site_file_access VALUES("100","delete_alert_faqs.php","","6","2","سوالات پر تکرار","faq.png","1,");
INSERT INTO site_file_access VALUES("101","delete_alert_book.php","","19","2","کتابخانه و مقالات","library.png","1,");
INSERT INTO site_file_access VALUES("102","delete_alert_block.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("103","delete_alert_admin_comment.php","","9","1","مدیریت نظرات","comments.png","1,");
INSERT INTO site_file_access VALUES("104","change_role.php","","2","1","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("105","change_password.php","","11","1","تنظیمات مدیریت","Admin.png","1,");
INSERT INTO site_file_access VALUES("106","change_pass.php","تغییر کلمه عبور","11","1","تنظیمات مدیریت","Admin.png","1,");
INSERT INTO site_file_access VALUES("107","book_update_db.php","","19","2","کتابخانه و مقالات","library.png","1,");
INSERT INTO site_file_access VALUES("108","book_update.php","","19","2","کتابخانه و مقالات","library.png","1,");
INSERT INTO site_file_access VALUES("109","book_delete_db.php","","19","2","کتابخانه و مقالات","library.png","1,");
INSERT INTO site_file_access VALUES("110","block_update_db.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("111","block_update.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("112","block_settings.php","مدیریت بلوک / صفحه","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("113","block_delete_db.php","","16","3","مدیریت صفحات و بلاکها","layout.png","1,");
INSERT INTO site_file_access VALUES("114","backup_db.php","پشتییبان پایگاه داده","21","1","مدیریت پایگاه داده","db.png","1,");
INSERT INTO site_file_access VALUES("115","admin_comment_delete_db.php","","9","1","مدیریت نظرات","comments.png","1,");
INSERT INTO site_file_access VALUES("116","addnews_db.php","","1","1","مدیریت اخبار","news.png","1,6,");
INSERT INTO site_file_access VALUES("117","addnews.php","درج خبر جدید","1","1","مدیریت اخبار","news.png","1,6,");
INSERT INTO site_file_access VALUES("118","addimg.php","تصویر جدید","20","1","مدیریت گالری تصاویر","img_gallery.png","1,");
INSERT INTO site_file_access VALUES("120","add_friend_db.php","","18","1","مدیریت دوستان","link.png","1,");
INSERT INTO site_file_access VALUES("121","add_friend.php","درج دوست جدید","18","1","مدیریت دوستان","link.png","1,");
INSERT INTO site_file_access VALUES("122","add_feed_db.php","","4","1","اخبار اتوماتیک","rss.png","1,");
INSERT INTO site_file_access VALUES("123","add_feed.php","درج منبع خبری","4","1","اخبار اتوماتیک","rss.png","1,");
INSERT INTO site_file_access VALUES("124","aboutus_update_db.php","","14","1","درباره ما","contactus.png","1,");
INSERT INTO site_file_access VALUES("125","aboutus.php","اطلاعات درباره ما","14","1","درباره ما","contactus.png","1,");
INSERT INTO site_file_access VALUES("126","inbox.php","مدیریت پیام ها","3","2","پیام رسانی","messaging.png","1,2,");
INSERT INTO site_file_access VALUES("128","delete_alert_message.php","","3","2","پیام رسانی","messaging.png","1,");
INSERT INTO site_file_access VALUES("129","message_delete_db.php","","3","2","پیام رسانی","messaging.png","1,");
INSERT INTO site_file_access VALUES("130","maintain_mode.php","وضعیت فعالیت سایت","11","2","تنظیمات مدیریت","Admin.png","1,");
INSERT INTO site_file_access VALUES("131","change_maintain_mode.php","","11","2","تنظیمات مدیریت","Admin.png","1,");
INSERT INTO site_file_access VALUES("132","change_maintain_mode_db.php","","11","2","تنظیمات مدیریت","Admin.png","1,");
INSERT INTO site_file_access VALUES("133","add_relation.php","ایجاد ارتباط","5","1","مدیریت ماژول ها","modules.png","1,");
INSERT INTO site_file_access VALUES("134","load_items.php","","5","1","مدیریت ماژول ها","modules.png","1,");
INSERT INTO site_file_access VALUES("135","creat_relation.php","","5","1","مدیریت ماژول ها","modules.png","1,");
INSERT INTO site_file_access VALUES("136","edit_del_relation.php","مدیریت ارتباط ماژول ها","5","2","مدیریت ماژول ها","modules.png","1,");
INSERT INTO site_file_access VALUES("137","delete_alert_relation.php","","5","2","مدیریت ماژول ها","modules.png","1,");
INSERT INTO site_file_access VALUES("138","relation_delete.php","","5","2","مدیریت ماژول ها","modules.png","1,");
INSERT INTO site_file_access VALUES("139","mng_messages.php","پیام های ارسالی مطالب","9","2","مدیریت نظرات","comments.png","1,");
INSERT INTO site_file_access VALUES("140","delete_alert_groups.php","","2","2","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("141","group_delete_db.php","","2","2","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("142","modify_avtivity_message.php","","9","2","مدیریت نظرات","comments.png","1,");
INSERT INTO site_file_access VALUES("143","new_role.php","تعريف نقش كاربري","2","3","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("144","load_files.php","","2","3","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("145","creat_role.php","","2","3","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("146","mng_roles.php","مدیریت نقش ها","2","3","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("147","edit_pages.php","ویرایش قالب صفحات","22","1","ویرایش قالب","edit_page.png","1,");
INSERT INTO site_file_access VALUES("148","load_file.php","","22","1","ویرایش قالب","edit_page.png","1,");
INSERT INTO site_file_access VALUES("149","update_file.php","","22","1","ویرایش قالب","edit_page.png","1,");
INSERT INTO site_file_access VALUES("150","delete_alert_role.php","","2","3","مدیریت کاربران","users.png","1,");
INSERT INTO site_file_access VALUES("151","delete_role.php","","2","3","مدیریت کاربران","users.png","1,");





CREATE TABLE `site_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `address` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `visited` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_friends VALUES("3","موتور جستجوی یاهو","http://yahoo.com","17","1");
INSERT INTO site_friends VALUES("5","گوگل","http://google.com","2","1");




CREATE TABLE `site_img_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `path` varchar(500) NOT NULL,
  `date` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

INSERT INTO site_img_gallery VALUES("13","25.jpg","Files//25.jpg","چهارده آذر هزار و سیصد و نود و یک ۱۳:۲۱:۲۶","1");
INSERT INTO site_img_gallery VALUES("14","Hydrangeas238.jpg","Files//vnews/Hydrangeas238.jpg","چهارده آذر هزار و سیصد و نود و یک ۱۳:۲۱:۲۶","0");
INSERT INTO site_img_gallery VALUES("15","Desert.jpg","Files//Desert.jpg","چهارده آذر هزار و سیصد و نود و یک ۱۳:۲۱:۲۶","0");
INSERT INTO site_img_gallery VALUES("16","Tulips.jpg","Files//Tulips.jpg","چهارده آذر هزار و سیصد و نود و یک ۱۳:۳۰:۳۵","1");
INSERT INTO site_img_gallery VALUES("18","Lighthouse.jpg","Files//Lighthouse.jpg","چهارده آذر هزار و سیصد و نود و یک ۱۳:۳۰:۳۵","0");
INSERT INTO site_img_gallery VALUES("19","blue-light-blur-2-20081109.jpg","Files//blue-light-blur-2-20081109.jpg","چهارده آذر هزار و سیصد و نود و یک ۱۳:۳۰:۳۵","0");
INSERT INTO site_img_gallery VALUES("20","20081122-metal-hex-abstract235.jpg","Files//vnews/20081122-metal-hex-abstract235.jpg","چهارده آذر هزار و سیصد و نود و یک ۱۳:۳۵:۵۸","0");
INSERT INTO site_img_gallery VALUES("22","Penguins863.jpg","Files//vnews/Penguins863.jpg","چهارده آذر هزار و سیصد و نود و یک ۱۳:۳۵:۵۸","0");
INSERT INTO site_img_gallery VALUES("23","blue-light-blur-2-2008110980.jpg","Files//vnews/blue-light-blur-2-2008110980.jpg","پانزده آذر هزار و سیصد و نود و یک ۱۸:۰۶:۲۷","0");
INSERT INTO site_img_gallery VALUES("24","Desert999.jpg","Files//vnews/Desert999.jpg","پانزده آذر هزار و سیصد و نود و یک ۱۸:۰۶:۲۷","0");
INSERT INTO site_img_gallery VALUES("26","03122010128.jpg","Files//03122010128.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۶:۵۶:۱۴","1");
INSERT INTO site_img_gallery VALUES("27","12112010090.jpg","Files//12112010090.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۶:۵۶:۱۴","1");
INSERT INTO site_img_gallery VALUES("28","12112010092.jpg","Files//12112010092.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۶:۵۶:۱۴","1");
INSERT INTO site_img_gallery VALUES("29","12112010093.jpg","Files//12112010093.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۶:۵۶:۱۴","1");
INSERT INTO site_img_gallery VALUES("30","12112010094.jpg","Files//12112010094.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۶:۵۶:۳۶","1");
INSERT INTO site_img_gallery VALUES("31","19112010096.jpg","Files//19112010096.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۶:۵۶:۳۶","1");
INSERT INTO site_img_gallery VALUES("32","20120114045.jpg","Files//20120114045.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۶:۵۶:۳۶","1");
INSERT INTO site_img_gallery VALUES("33","20120114047.jpg","Files//20120114047.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۶:۵۶:۳۶","1");
INSERT INTO site_img_gallery VALUES("34","20120601147.jpg","Files//20120601147.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۷:۰۲:۱۷","1");
INSERT INTO site_img_gallery VALUES("35","20120713184.jpg","Files//20120713184.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۷:۰۲:۱۷","1");
INSERT INTO site_img_gallery VALUES("36","20120713185.jpg","Files//20120713185.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۷:۰۲:۱۷","0");
INSERT INTO site_img_gallery VALUES("37","27082010065.jpg","Files//27082010065.jpg","نوزده اسفند هزار و سیصد و نود و یک ۱۷:۰۲:۱۷","1");
INSERT INTO site_img_gallery VALUES("39","9efe28f4a28d2bdf49cefd18dbaf194c_112.jpg","Files//9efe28f4a28d2bdf49cefd18dbaf194c_112.jpg","سیزده اردیبهشت هزار و سیصد و نود و دو ۱۳:۱۸:۵۶","1");





CREATE TABLE `site_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good` int(11) NOT NULL,
  `bad` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;



CREATE TABLE `site_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `action` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `timestamp` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `fields` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `data` text COLLATE utf8_persian_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `ip` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;






CREATE TABLE `site_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;






CREATE TABLE `site_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `to_user` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `subject` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `message` text COLLATE utf8_persian_ci NOT NULL,
  `attachment` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `read_status` tinyint(4) NOT NULL,
  `sent_date` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;



CREATE TABLE `site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `title` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `content` text COLLATE utf8_persian_ci NOT NULL,
  `mapped_table` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `field2display` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `available_langs` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `language` varchar(5) COLLATE utf8_persian_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `is_center` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_modules VALUES("1","faq","سوالات پرتکرار","<head>\n    {literal}\n	<script type=\"text/javascript\" language=\"javascript\">\n	{/literal}\n    var faq_cnt={count($faq_ini_data)};\n    //var news_filter={$faq_ini_data[count($faq_ini_data)-1][0]};\n    {literal}\n	\n	function more_faq(index)\n	{\n		$(\'.faq_nav\').css(\'border\',\'1px solid black\');\n		$(\'#nav\'+index).css(\"border\",\"3px solid black\");\n		for (i=0;i<faq_cnt;i++)\n		   $(\'#faq\'+i).hide();\n		for (i=index*2;i<index*2+2;i++)\n			$(\'#faq\'+i).show();\n	}\n	\n	{/literal}\n	var path=\"{$modules_path}\";\n	{literal}\n	function update_counter(evnt,fid,eid)\n	{\n\n	cnt=$(\'#\'+eid).text();\n	if (\'which\' in evnt)\n	{\n		switch (evnt.which) {\n		case 1:\n		case 2:\n		{\n			cnt++;\n			\n			$(\"#\"+eid).text(cnt);\n			\n			$.ajax({\n			  type: \"GET\",\n			  url: path+\"/faq/\"+\"update_faq_visit.php\",\n			  data:{faq_id:fid,visit:cnt}\n			});\n		}\n		}\n	}\n	else {\n		// Internet Explorer before version 9\n		if (\'button\' in evnt)\n		{\n			var buttons = \"\";\n			if (evnt.button & 1 ||evnt.button & 4)\n			{\n				cnt++;\n				\n				$(\"#\"+eid).text(cnt);\n				\n				$.ajax({\n				  type: \"GET\",\n				  url: path+\"/faq/\"+\"update_faq_visit.php\",\n				  data:{faq_id:fid,visit:cnt}\n				});\n\n			\n			}\n		}\n		\n		}//else\n\n	}\n	\n	\n	</script>\n	{/literal}\n    <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\n</head>\n<div dir=\"rtl\" style=\"width: 100%;overflow:hidden;height:250px;\" id=\"faq_placeholder\">\n    {if count($faq_ini_data) eq 0}\n        <p>سوالی برای مشاهده وچود ندارد و یا تمامی موارد غیر فعال شده اند.</p>\n    {else}\n        {for $i=0 to count($faq_ini_data)-1}\n        {if $i lt 2}\n            <table width=\"100%\" id=\"faq{$i}\">\n                <tr class=\"faq\">\n					<td colspan=\"2\" width=\"100%\">\n					<a href=\"{$modules_path}/faq/show_details.php?faqid={$faq_ini_data[$i][0]}#content\" onmouseup=\"update_counter(event,{$faq_ini_data[$i][0]},\'vst_faq{$i}\');\">\n					<strong>{$faq_ini_data[$i][1]}</strong>\n					</a>\n					</td>\n					<td rowspan=\"2\">\n                        <img src=\"{$site_domain}/admin/{$faq_ini_data[$i][3]}\"  alt=\"{$faq_ini_data[$i][1]}\"/>\n                    </td>\n				</tr>\n                <tr>\n                    <td style=\"text-align:justify;width:100%\">\n                      <!--  تعداد بازدید : <span id=\"vst_faq{$i}\">{$faq_ini_data[$i][2]}</span> -->\n						\n                    </td>\n                </tr>\n            </table>\n        {else}\n            <table width=\"100%\" id=\"faq{$i}\" style=\"display:none;\">\n                <tr class=\"faq\">\n					<td colspan=\"2\" width=\"100%\">\n					<a href=\"{$modules_path}/faq/show_details.php?faqid={$faq_ini_data[$i][0]}#content\" onmouseup=\"update_counter(event,{$faq_ini_data[$i][0]},\'vst_faq{$i}\');\">\n					<strong>{$faq_ini_data[$i][1]}</strong>\n					</a>\n					</td>\n					<td rowspan=\"2\">\n                        <img src=\"{$site_domain}/admin/{$faq_ini_data[$i][3]}\" alt=\"{$faq_ini_data[$i][1]}\"/>\n                    </td>\n				</tr>\n                <tr>\n                    <td style=\"text-align:justify;width:100%\">\n                       <!-- تعداد بازدید : <span id=\"vst_faq{$i}\">{$faq_ini_data[$i][2]}</span> -->\n						\n                    </td>\n                </tr>\n            </table>\n        {/if}\n        {/for}\n\n\n    {/if}\n	    {if count($faq_ini_data) > 2}\n			<div style=\"padding-top: 20px;\">\n			ادامه سوالات : <span style=\"text-align:center;width:inherit;\">\n\n				{for $i=0 to (count($faq_ini_data)%2 eq 0)?count($faq_ini_data)/2:count($faq_ini_data)/2-1}\n				{if $i eq 0}\n				<b> <a onclick=\"more_faq({$i});\" class=\"faq_nav\" style=\"cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white; height: 15px; border: 3px solid black;color:black; \" onmouseover=\"$(this).css(\'background-color\',\'red\');\" onmouseout=\"$(this).css(\'background-color\',\'white\');\" id=\"nav{$i}\">{$i+1}</a></b>\n				{else}\n				<b> <a onclick=\"more_faq({$i});\" class=\"faq_nav\" style=\"cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white;height: 15px; border: 1px solid black;color:black; \" onmouseover=\"$(this).css(\'background-color\',\'red\');\" onmouseout=\"$(this).css(\'background-color\',\'white\');\" id=\"nav{$i}\">{$i+1}</a></b>\n				{/if}\n				{/for}\n\n				</div>\n		{/if}\n    </span>\n</div>","faq","question","","","0","0","1");
INSERT INTO site_modules VALUES("2","news","اخبار","&lt;p&gt;\n	{literal} &lt;script language=&quot;javascript&quot;&gt;\n        {/literal}\n		\n    var news_cnt={count($news_ini_data)};\n    var news_filter={$news_ini_data[count($news_ini_data)-1][0]};\n        {literal}\n\nfunction more_news(index)\n{\n    $(\'.news_nav\').css(\'border\',\'1px solid black\');\n\n    $(\'#newsnav\'+index).css(&quot;border&quot;,&quot;3px solid black&quot;);\nfor (i=0;i&lt;news_cnt;i++)\n   {\n   $(\'#nws\'+i).hide();\n   $(\'#ln\'+i).css(\'display\',\'none\');\n   }\nfor (i=index*news_filter;i&lt;index*news_filter+news_filter;i++)\n    {\n	$(\'#nws\'+i).show();\n	$(\'#ln\'+i).css(\'display\',\'table\');\n	}\n}\n        &lt;/script&gt;{/literal}&lt;/p&gt;\n&lt;p&gt;\n	&lt;meta content=&quot;text/html; charset=utf-8&quot; http-equiv=&quot;Content-Type&quot; /&gt;\n&lt;/p&gt;\n&lt;div dir=&quot;rtl&quot; id=&quot;news_placeholder&quot; style=&quot;width: 100%;overflow:visible;height:100%;&quot;&gt;\n	{if count($news_ini_data) eq 0}\n	&lt;p&gt;\n		اخباری برای مشاهده وجود ندارد و یا تمامی اخبار غیرفعال شده اند.&lt;/p&gt;\n	{else} {for $i=0 to count($news_ini_data)-2} {if $i lt $news_ini_data[count($news_ini_data)-1][0]}\n	&lt;table id=&quot;nws{$i}&quot; width=&quot;100%&quot;&gt;\n		&lt;tbody&gt;\n			&lt;tr class=&quot;news&quot;&gt;\n				&lt;td colspan=&quot;2&quot; width=&quot;100%&quot;&gt;\n					&lt;strong&gt;{$news_ini_data[$i][1]}&lt;/strong&gt;&lt;/td&gt;\n			&lt;/tr&gt;\n			&lt;tr class=&quot;news&quot;&gt;\n				&lt;td style=&quot;text-align:justify;width:100%&quot;&gt;\n					&lt;a href=&quot;javascript:;&quot; onclick=&quot;window.location=\'{$modules_path}/news/show_details.php?id={$news_ini_data[$i][0]}&amp;stid=\'+get_site_id()+\'#content\'&quot;&gt;{$news_ini_data[$i][2]} &lt;/a&gt;&lt;/td&gt;\n				&lt;td&gt;\n					&lt;img alt=&quot;{$news_ini_data[$i][1]}&quot; src=&quot;admin/{$news_ini_data[$i][4]}&quot; /&gt;\n					&lt;/td&gt;\n					&lt;img  id =&quot;ln{$i}&quot; src=&quot;{$site_domain}/main/templates/images/line.png&quot; style=&quot;display:table;margin:0 auto;&quot; /&gt;\n			&lt;/tr&gt;\n		&lt;/tbody&gt;\n		\n	&lt;/table&gt;\n	\n	{else}\n	&lt;table id=&quot;nws{$i}&quot; style=&quot;display:none&quot; width=&quot;100%&quot;&gt;\n		&lt;tbody&gt;\n			&lt;tr class=&quot;news&quot;&gt;\n				&lt;td colspan=&quot;2&quot; width=&quot;100%&quot;&gt;\n					&lt;strong&gt;{$news_ini_data[$i][1]}&lt;/strong&gt;&lt;/td&gt;\n			&lt;/tr&gt;\n			&lt;tr class=&quot;news&quot;&gt;\n				&lt;td style=&quot;text-align:justify;width:100%&quot;&gt;\n					&lt;a href=&quot;javascript:;&quot; onclick=&quot;window.location=\'{$modules_path}/news/show_details.php?id={$news_ini_data[$i][0]}&amp;stid=\'+get_site_id()+\'#content\'&quot;&gt;{$news_ini_data[$i][2]} &lt;/a&gt;&lt;/td&gt;\n				&lt;td&gt;\n					&lt;img alt=&quot;{$news_ini_data[$i][1]}&quot; src=&quot;admin/{$news_ini_data[$i][4]}&quot; /&gt;\n					&lt;/td&gt;\n					&lt;img id =&quot;ln{$i}&quot; src=&quot;{$site_domain}/main/templates/images/line.png&quot; style=&quot;display:none;margin:0 auto;&quot;/&gt;\n			&lt;/tr&gt;\n		&lt;/tbody&gt;\n	\n	&lt;/table&gt;\n	\n	{/if} {/for} {/if} {if $news_ini_data[count($news_ini_data)-1][0] lt count($news_ini_data)}\n	&lt;div style=&quot;padding-top: 20px;&quot;&gt;\n		ادامه اخبار : &lt;span style=&quot;text-align:center;width:inherit;&quot;&gt; {for $i=0 to ((count($news_ini_data)-1)/$news_ini_data[count($news_ini_data)-1][0])-1} {if $i eq 0} &lt;b&gt; &lt;a class=&quot;news_nav&quot; id=&quot;newsnav{$i}&quot; onclick=&quot;more_news({$i});&quot; onmouseout=&quot;$(this).css(\'background-color\',\'white\');&quot; onmouseover=&quot;$(this).css(\'background-color\',\'red\');&quot; style=&quot;cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white; height: 15px; border: 3px solid black;color:black; &quot;&gt;{$i+1}&lt;/a&gt;&lt;/b&gt; {else} &lt;b&gt; &lt;a class=&quot;news_nav&quot; id=&quot;newsnav{$i}&quot; onclick=&quot;more_news({$i});&quot; onmouseout=&quot;$(this).css(\'background-color\',\'white\');&quot; onmouseover=&quot;$(this).css(\'background-color\',\'red\');&quot; style=&quot;cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white;height: 15px; border: 1px solid black;color:black; &quot;&gt;{$i+1}&lt;/a&gt;&lt;/b&gt; {/if} {/for} &lt;/span&gt;&lt;/div&gt;\n	{/if} {if array_key_exists(&amp;quot;current_user&amp;quot;,$smarty.cookies) eq true} {assign &amp;quot;user_info&amp;quot; explode(&amp;quot;/&amp;quot;,$smarty.cookies.current_user|translate_cookie)} {if $user_info[3]==1 }\n	&lt;div style=&quot;width:100%;background-color:black;color:white;height:30px;&quot;&gt;\n		&lt;a class=&quot;general fancybox fancybox.ajax &quot; href=&quot;{$site_domain}/admin/news_settings.php&quot; style=&quot;background-color:#518495;color:white;margin-right:5px;font-weight:bold;font-size:10px;border-radius:4px;height:20px;display:inline-block;padding-top:0px;padding-left:4px;padding-right:4px;margin-top:5px;&quot;&gt;تعداد خبر برای نمایش&lt;/a&gt; &lt;a class=&quot;general fancybox fancybox.ajax &quot; href=&quot;{$site_domain}/admin/edit_del_news.php&quot; style=&quot;background-color:#518495;color:white;margin-right:5px;font-weight:bold;font-size:10px;border-radius:4px;height:20px;display:inline-block;padding-top:0px;padding-left:4px;padding-right:4px;margin-top:5px;&quot;&gt;تنظیمات اخبار&lt;/a&gt; &lt;a href=&quot;#&quot; onclick=&quot;location.reload();&quot; style=&quot;background-color:#518495;color:white;margin-right:5px;font-weight:bold;font-size:10px;border-radius:4px;height:20px;display:inline-block;padding-top:0px;padding-left:4px;padding-right:4px;margin-top:5px;&quot;&gt;به روز رسانی صفحه&lt;/a&gt;&lt;/div&gt;\n	{/if} {/if}&lt;/div&gt;\n","news","title","","","0","1","1");
INSERT INTO site_modules VALUES("3","counter","شمارنده","","counter","","","","1","0","1");
INSERT INTO site_modules VALUES("4","header2","سر صفحه 2","<div id=\"wrapper\">\n	\n    <div class=\"slider-wrapper theme-default\">\n        <div id=\"slider\" class=\"nivoSlider\">\n            \n			{for $i=0 to count($header2_ini_data)-1}\n			<a href=\"google.com\"><img src=\"{$site_domain}/admin/{$header2_ini_data[$i][0]}\" alt=\"\"/></a>\n			{/for}\n        </div>\n    </div>\n\n</div>\n<script type=\"text/javascript\" src=\"{$modules_path}/header2/scripts/jquery-1.7.1.min.js\"></script>\n<script type=\"text/javascript\" src=\"{$modules_path}/header2/jquery.nivo.slider.js\"></script>\n<script type=\"text/javascript\">\nvar $header2 = jQuery.noConflict();\n$header2(window).load(function() {\n    $header2(\'#slider\').nivoSlider();\n});\n</script>","vnews","","","","2","0","1");
INSERT INTO site_modules VALUES("5","img_gallery","گالری تصاویر","\n<!--<span id=\"rightnav\" onclick=\"$(\'#pholder\').animate({ scrollLeft: \'-=100\' }, \'slow\');\"><img src=\"{$site_domain}/modules/img_gallery/next.png\" style=\"margin-right:-27px;margin-top:22px;\"/></span>\n<span id=\"leftnav\" onclick=\"$(\'#pholder\').animate({ scrollLeft: \'+=100\' }, \'slow\');\"><img src=\"{$site_domain}/modules/img_gallery/prev.png\" style=\"padding-top:22px;\"></span>-->\n\n<div id=\"pics\" style=\"width:405px;margin-top:7px;overflow:visible;height:auto;\">\n{for $i=0 to count($img_gallery_ini_data)-1}\n<div style=\"display:inline;\" style=\"height:100px;\">\n<span style=\"display:none;\" class=\"fancybox path\">{$site_domain}/admin/{$img_gallery_ini_data[$i][1]}</span>\n<img src=\"{$site_domain}/admin/Files/thumbs/{$img_gallery_ini_data[$i][0]}\" class=\"fancybox\" style=\"cursor:pointer;\"/></div>\n{/for}\n</div>","img_gallery","","","","2","0","1");
INSERT INTO site_modules VALUES("7","site_friends","دوستان سایت","<script type=\"text/javascript\" language=\"javascript\">\nvar path=\"{$modules_path}\";\nvar site_domain=\"{$site_domain}\";\n{literal}\nfunction update_counter_fr(evnt,fid,eid)\n{\n\ncnt=$(\'#\'+eid).text();\nif (\'which\' in evnt)\n{\n	switch (evnt.which) {\n	case 1:\n	case 2:\n	{\n		cnt++;\n		\n		$(\"#\"+eid).text(cnt);\n		\n		$.ajax({\n		  type: \"GET\",\n		  url: path+\"/site_friends/\"+\"update_friend_visit.php\",\nasync:false,\n		  data:{friend_id:fid,visit:cnt}\n		});\n	}\n	}\n}\nelse {\n	// Internet Explorer before version 9\n	if (\'button\' in evnt)\n	{\n	    var buttons = \"\";\n	    if (evnt.button & 1 ||evnt.button & 4)\n	    {\n	    	cnt++;\n			\n			$(\"#\"+eid).text(cnt);\n			\n			$.ajax({\n			  type: \"GET\",\n			  url: path+\"/site_friends/\"+\"update_friend_visit.php\",\nasync:false,\n			  data:{friend_id:fid,visit:cnt}\n			});\n\n	    \n	    }\n	}\n	\n	}//else\n\n}\nfunction change_lang(mdl_name,lang)\n{\n	$.ajax({\n			  type: \"GET\",\n			  url: site_domain+\"/modules/template_functions/actions.php\",\n			  data:{param:\"123\",module_name:mdl_name,new_lang:lang},\n			success:function(data)\n			{\n				if (data==\"1\")\n				location.reload();\n			}\n			});\n}\n{/literal}\n</script>\n\n\n{assign \"langs\" explode(\",\",$site_friends_ini_data[count($site_friends_ini_data) -1])}\n<span>زبان نمایش : </span>\n<select id=\"site_friends_lang\" onchange=\"change_lang(\'site_friends\',$(this).val());\">\n{for $i=0 to count($langs)-2}\n{if $langs[$i]==$site_friends_ini_data[count($site_friends_ini_data) -2]}\n<option selected=\"selected\">{$langs[$i]}</option>\n{else}\n<option>{$langs[$i]}</option>\n{/if}\n{/for}\n</select>\n\n{if $site_friends_ini_data[count($site_friends_ini_data) -2] == \"FA\"}\n\n<div dir=\"rtl\" style=\"width: 100%\">\nدوستان سایت : <br/>\n{for $i=0 to count($site_friends_ini_data)-3}\n\n<img src=\"{$site_domain}/main/templates/images/friends.png\" style=\"width:24px;height:24px;\"/><a href=\"{$site_friends_ini_data[$i][2]}\" style=\"background-color:transparent;\"  target=\"_blank\" onmouseup=\"update_counter_fr(event,{$site_friends_ini_data[$i][0]},\'frnd{$i+1}\');\" {literal} onmouseover=\"$(this).css({\'text-decoration\':\'underline\',\'font-weight\':\'bolder\'})\"   onmouseout=\"$(this).css({\'text-decoration\':\'none\',\'font-weight\':\'normal\'})\">{/literal}{$site_friends_ini_data[$i][1]} تعداد بازدید :(<span id=\"frnd{$i+1}\">\n{$site_friends_ini_data[$i][3]}</span> )</a>\n<br/>\n\n{/for}\n</div>\n{else}\n<div style=\"direction:ltr;text-align:left;\">\nThis part is in English theme\nsite friends :  <br/>\nNo data available in current theme...!\n</div>\n{/if}\n","friends","","FA,EN,","FA","2","0","1");
INSERT INTO site_modules VALUES("8","site_pages","صفحات سایت","&lt;div dir=&quot;rtl&quot; style=&quot;width: 100%&quot;&gt;\n&lt;b&gt;&lt;a href=&quot;{$site_domain}&quot;&gt;صفحه اصلی &lt;/a&gt;&lt;/b&gt;&lt;br/&gt;\n{for $i=0 to count($site_pages_ini_data)-1}\n{literal}\n&lt;a onmouseover=&quot;$(this).css({\'text-decoration\':\'underline\',\'font-weight\':\'bolder\'})&quot;   onmouseout=&quot;$(this).css({\'text-decoration\':\'none\',\'font-weight\':\'normal\'})&quot; {/literal} href=&quot;{$site_domain}/modules/site_pages/show_details.php?pid={$site_pages_ini_data[$i][0]}&amp;title={$site_pages_ini_data[$i][1]}#content&quot;&gt;&lt;img src=&quot;{$site_domain}/main/templates/images/pages.png&quot;/&gt;{$site_pages_ini_data[$i][1]}&lt;/a&gt;\n&lt;br/&gt;\n{/for}\n&lt;/div&gt;\n","pages","title","","","0","0","1");
INSERT INTO site_modules VALUES("9","video_clips","کلیپ های تصویری","<head>\n    {literal}\n	<script type=\"text/javascript\" language=\"javascript\">\n	{/literal}\n    var video_cnt={count($video_clips_ini_data)};\n    //var news_filter={$video_clips_ini_data[count($video_clips_ini_data)-1][0]};\n    {literal}\n	\n	function more_video_clips(index)\n	{\n		$(\'.video_nav\').css(\'border\',\'1px solid black\');\n		$(\'#videonav\'+index).css(\"border\",\"3px solid black\");\n		for (i=0;i<video_cnt;i++)\n		   $(\'#vclip\'+i).hide();\n		for (i=index*2;i<index*2+2;i++)\n			$(\'#vclip\'+i).show();\n	}\n	\n	{/literal}\n	var path=\"{$modules_path}\";\n	{literal}\n	function update_counter_videos(evnt,sid,eid)\n	{\n	cnt=$(\'#\'+eid).text();\n	if (\'which\' in evnt)\n	{\n		switch (evnt.which) {\n		case 1:\n		case 2:\n		{\n			cnt++;\n			\n			$(\"#\"+eid).text(cnt);\n			\n			$.ajax({\n			  type: \"GET\",\n			  async: false,\n			  url: path+\"/video_clips/\"+\"update_video_visit.php\",\n			  data:{video_id:sid,visit:cnt}\n			});\n		}\n		}\n	}\n	else {\n		// Internet Explorer before version 9\n		if (\'button\' in evnt)\n		{\n			var buttons = \"\";\n			if (evnt.button & 1 ||evnt.button & 4)\n			{\n				cnt++;\n				\n				$(\"#\"+eid).text(cnt);\n				\n				$.ajax({\n				  type: \"GET\",\n				  async: false,\n				  url: path+\"/video_clips/\"+\"update_video_visit.php\",\n				  data:{video_id:sid,visit:cnt}\n				});\n\n			\n			}\n		}\n		\n		}//else\n\n	}\n	\n	\n	</script>\n	{/literal}\n    <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\n</head>\n<div dir=\"rtl\" style=\"width: 100%;overflow:visible;height:100%;\" id=\"sound_placeholder\">\n	{if count($video_clips_ini_data) eq 0}\n        <p>کلیپ تصویری برای مشاهده وچود ندارد و یا تمامی موارد غیر فعال شده اند.</p>\n    {else}\n        {for $i=0 to count($video_clips_ini_data)-1}\n        {if $i lt 2}\n            <table width=\"100%\" id=\"vclip{$i}\">\n                <tr class=\"video\">\n					<td colspan=\"2\" width=\"100%\">\n					<a href=\"{$modules_path}/video_clips/show_details.php?videoid={$video_clips_ini_data[$i][0]}#content\" onmouseup=\"update_counter_videos(event,{$video_clips_ini_data[$i][0]},\'vst_video{$i}\');\">\n					<strong>{$video_clips_ini_data[$i][1]}</strong>\n					</a>\n					</td>\n					<td rowspan=\"2\">\n                        <img src=\"{$video_clips_ini_data[$i][3]}\"  alt=\"{$video_clips_ini_data[$i][1]}\"/>\n                    </td>\n				</tr>\n                <tr>\n                    <td style=\"text-align:justify;width:100%\">\n                        تعداد بازدید : <span id=\"vst_video{$i}\">{$video_clips_ini_data[$i][2]}</span>\n						\n                    </td>\n                </tr>\n            </table>\n        {else}\n            <table width=\"100%\" id=\"vclip{$i}\" style=\"display:none;\">\n                <tr class=\"video\">\n					<td colspan=\"2\" width=\"100%\">\n					<a href=\"{$modules_path}/video_clips/show_details.php?videoid={$video_clips_ini_data[$i][0]}#content\" onmouseup=\"update_counter_videos(event,{$video_clips_ini_data[$i][0]},\'vst_video{$i}\');\">\n					<strong>{$video_clips_ini_data[$i][1]}</strong>\n					</a>\n					</td>\n					<td rowspan=\"2\">\n                        <img src=\"{$video_clips_ini_data[$i][3]}\"  alt=\"{$video_clips_ini_data[$i][1]}\"/>\n                    </td>\n				</tr>\n                <tr>\n                    <td style=\"text-align:justify;width:100%\">\n                        تعداد بازدید : <span id=\"vst_video{$i}\">{$video_clips_ini_data[$i][2]}</span>\n						\n                    </td>\n                </tr>\n            </table>\n        {/if}\n        {/for}\n\n\n    {/if}\n	    {if count($video_clips_ini_data) > 2}\n        <div style=\"padding-top: 20px;\">\n        ادامه کلیپ های تصویری : <span style=\"text-align:center;width:inherit;\">\n\n			{for $i=0 to (count($video_clips_ini_data)%2 eq 0)?count($video_clips_ini_data)/2:count($video_clips_ini_data)/2-1}\n            {if $i eq 0}\n            <b> <a onclick=\"more_video_clips({$i});\" class=\"video_nav\" style=\"cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white; height: 15px; border: 3px solid black; \" onmouseover=\"$(this).css(\'background-color\',\'red\');\" onmouseout=\"$(this).css(\'background-color\',\'white\');\" id=\"videonav{$i}\">{$i+1}</a></b>\n            {else}\n            <b> <a onclick=\"more_video_clips({$i});\" class=\"video_nav\" style=\"cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white;height: 15px; border: 1px solid black; \" onmouseover=\"$(this).css(\'background-color\',\'red\');\" onmouseout=\"$(this).css(\'background-color\',\'white\');\" id=\"videonav{$i}\">{$i+1}</a></b>\n            {/if}\n            {/for}\n\n            </div>\n        {/if}\n    </span>\n</div>","video_briefcase","name","","","0","0","1");
INSERT INTO site_modules VALUES("10","library","کتابخانه","<head>\n    {literal}\n	<script type=\"text/javascript\" language=\"javascript\">\n	{/literal}\n    var book_cnt={count($library_ini_data)};\n    //var news_filter={$library_ini_data[count($library_ini_data)-1][0]};\n    {literal}\n	\n	function more_books(index)\n	{\n		$(\'.book_nav\').css(\'border\',\'1px solid black\');\n		$(\'#booknav\'+index).css(\"border\",\"3px solid black\");\n		for (i=0;i<book_cnt;i++)\n		   $(\'#book\'+i).hide();\n		for (i=index*2;i<index*2+2;i++)\n			$(\'#book\'+i).show();\n	}\n	\n	{/literal}\n	var path=\"{$modules_path}\";\n	{literal}\n	function update_counter_books(evnt,bid,eid)\n	{\n	cnt=$(\'#\'+eid).text();\n	if (\'which\' in evnt)\n	{\n		switch (evnt.which) {\n		case 1:\n		case 2:\n		{\n			cnt++;\n			\n			$(\"#\"+eid).text(cnt);\n			\n			$.ajax({\n			  type: \"GET\",\n			  async: false,\n			  url: path+\"/library/\"+\"update_book_visit.php\",\n			  data:{book_id:bid,visit:cnt}\n			});\n		}\n		}\n	}\n	else {\n		// Internet Explorer before version 9\n		if (\'button\' in evnt)\n		{\n			var buttons = \"\";\n			if (evnt.button & 1 ||evnt.button & 4)\n			{\n				cnt++;\n				\n				$(\"#\"+eid).text(cnt);\n				\n				$.ajax({\n				  type: \"GET\",\n				  async: false,\n				  url: path+\"/library/\"+\"update_book_visit.php\",\n				  data:{book_id:bid,visit:cnt}\n				});\n\n			\n			}\n		}\n		\n		}//else\n\n	}\n	\n	\n	</script>\n	{/literal}\n    <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\n</head>\n<div dir=\"rtl\" style=\"width: 100%;overflow:visible;height:100%;\" id=\"books_placeholder\">\n    {if count($library_ini_data) eq 0}\n        <p>کتاب / مقاله ای برای مشاهده وچود ندارد و یا تمامی موارد غیر فعال شده اند.</p>\n    {else}\n        {for $i=0 to count($library_ini_data)-1}\n        {if $i lt 2}\n            <table width=\"100%\" id=\"book{$i}\">\n                <tr class=\"book\">\n					<td colspan=\"2\" width=\"100%\">\n					<a href=\"{$modules_path}/library/show_details.php?bookid={$library_ini_data[$i][0]}#content\" onmouseup=\"update_counter_books(event,{$library_ini_data[$i][0]},\'vst_book{$i}\');\">\n					<strong>{$library_ini_data[$i][1]}</strong>\n					</a>\n					</td>\n					<td rowspan=\"2\">\n                        <img src=\"{$library_ini_data[$i][3]}\"  alt=\"{$library_ini_data[$i][1]}\"/>\n                    </td>\n				</tr>\n                <tr>\n                    <td style=\"text-align:justify;width:100%\">\n                        تعداد بازدید : <span id=\"vst_book{$i}\">{$library_ini_data[$i][2]}</span>\n						\n                    </td>\n                </tr>\n            </table>\n        {else}\n            <table width=\"100%\" id=\"book{$i}\" style=\"display:none;\">\n                <tr class=\"book\">\n					<td colspan=\"2\" width=\"100%\">\n					<a href=\"{$modules_path}/library/show_details.php?bookid={$library_ini_data[$i][0]}#content\" onmouseup=\"update_counter_books(event,{$library_ini_data[$i][0]},\'vst_book{$i}\');\">\n					<strong>{$library_ini_data[$i][1]}</strong>\n					</a>\n					</td>\n					<td rowspan=\"2\">\n                        <img src=\"{$library_ini_data[$i][3]}\"  alt=\"{$library_ini_data[$i][1]}\"/>\n                    </td>\n				</tr>\n                <tr>\n                    <td style=\"text-align:justify;width:100%\">\n                        تعداد بازدید : <span id=\"vst_book{$i}\">{$library_ini_data[$i][2]}</span>\n						\n                    </td>\n                </tr>\n            </table>\n        {/if}\n        {/for}\n\n\n    {/if}\n	    {if count($library_ini_data) > 2}\n        <div style=\"padding-top: 20px;\">\n        ادامه کتابها / مقالات : <span style=\"text-align:center;width:inherit;\">\n\n			{for $i=0 to (count($library_ini_data)%2 eq 0)?count($library_ini_data)/2:count($library_ini_data)/2-1}\n            {if $i eq 0}\n            <b> <a onclick=\"more_books({$i});\" class=\"book_nav\" style=\"cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white; height: 15px; border: 3px solid black; \" onmouseover=\"$(this).css(\'background-color\',\'red\');\" onmouseout=\"$(this).css(\'background-color\',\'white\');\" id=\"booknav{$i}\">{$i+1}</a></b>\n            {else}\n            <b> <a onclick=\"more_books({$i});\" class=\"book_nav\" style=\"cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white;height: 15px; border: 1px solid black; \" onmouseover=\"$(this).css(\'background-color\',\'red\');\" onmouseout=\"$(this).css(\'background-color\',\'white\');\" id=\"booknav{$i}\">{$i+1}</a></b>\n            {/if}\n            {/for}\n\n            </div>\n        {/if}\n    </span>\n</div>","book_briefcase","name","","","0","0","1");
INSERT INTO site_modules VALUES("11","audio_clips","کلیپ های صوتی","    {literal}\n	<script type=\"text/javascript\" language=\"javascript\">\n	{/literal}\n    var sound_cnt={count($audio_clips_ini_data)};\n    //var news_filter={$audio_clips_ini_data[count($audio_clips_ini_data)-1][0]};\n    {literal}\n	\n	function more_audio_clips(index)\n	{\n		$(\'.sound_nav\').css(\'border\',\'1px solid black\');\n		$(\'#soundnav\'+index).css(\"border\",\"3px solid black\");\n		for (i=0;i<sound_cnt;i++)\n		   $(\'#sound\'+i).hide();\n		for (i=index*2;i<index*2+2;i++)\n			$(\'#sound\'+i).show();\n	}\n	\n	{/literal}\n	var path=\"{$modules_path}\";\n	{literal}\n	function update_counter_sounds(evnt,sid,eid)\n	{\n	cnt=$(\'#\'+eid).text();\n	if (\'which\' in evnt)\n	{\n		switch (evnt.which) {\n		case 1:\n		case 2:\n		{\n			cnt++;\n			\n			$(\"#\"+eid).text(cnt);\n			\n			$.ajax({\n			  type: \"GET\",\n			  async: false,\n			  url: path+\"/audio_clips/\"+\"update_sound_visit.php\",\n			  data:{sound_id:sid,visit:cnt}\n			});\n		}\n		}\n	}\n	else {\n		// Internet Explorer before version 9\n		if (\'button\' in evnt)\n		{\n			var buttons = \"\";\n			if (evnt.button & 1 ||evnt.button & 4)\n			{\n				cnt++;\n				\n				$(\"#\"+eid).text(cnt);\n				\n				$.ajax({\n				  type: \"GET\",\n				  async: false,\n				  url: path+\"/audio_clips/\"+\"update_sound_visit.php\",\n				  data:{sound_id:sid,visit:cnt}\n				});\n\n			\n			}\n		}\n		\n		}//else\n\n	}\n	\n	\n	</script>\n	{/literal}\n    <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\n<div dir=\"rtl\" style=\"width: 100%;overflow:visible;height:100%;\" id=\"sound_placeholder\">\n	{if count($audio_clips_ini_data) eq 0}\n        <p>کلیپ صوتی برای مشاهده وچود ندارد و یا تمامی موارد غیر فعال شده اند.</p>\n    {else}\n        {for $i=0 to count($audio_clips_ini_data)-1}\n        {if $i lt 2}\n            <table width=\"100%\" id=\"sound{$i}\">\n                <tr class=\"sound\">\n					<td colspan=\"2\" width=\"100%\">\n					<a href=\"{$modules_path}/audio_clips/show_details.php?soundid={$audio_clips_ini_data[$i][0]}#content\" onmouseup=\"update_counter_sounds(event,{$audio_clips_ini_data[$i][0]},\'vst_sound{$i}\');\">\n					<strong>{$audio_clips_ini_data[$i][1]}</strong>\n					</a>\n					</td>\n					<td rowspan=\"2\">\n                        <img src=\"{$audio_clips_ini_data[$i][3]}\"  alt=\"{$audio_clips_ini_data[$i][1]}\"/>\n                    </td>\n				</tr>\n                <tr>\n                    <td style=\"text-align:justify;width:100%\">\n                        تعداد بازدید : <span id=\"vst_sound{$i}\">{$audio_clips_ini_data[$i][2]}</span>\n						\n                    </td>\n                </tr>\n            </table>\n        {else}\n            <table width=\"100%\" id=\"sound{$i}\" style=\"display:none;\">\n                <tr class=\"sound\">\n					<td colspan=\"2\" width=\"100%\">\n					<a href=\"{$modules_path}/audio_clips/show_details.php?soundid={$audio_clips_ini_data[$i][0]}#content\" onmouseup=\"update_counter_sounds(event,{$audio_clips_ini_data[$i][0]},\'vst_sound{$i}\');\">\n					<strong>{$audio_clips_ini_data[$i][1]}</strong>\n					</a>\n					</td>\n					<td rowspan=\"2\">\n                        <img src=\"{$audio_clips_ini_data[$i][3]}\"  alt=\"{$audio_clips_ini_data[$i][1]}\"/>\n                    </td>\n				</tr>\n                <tr>\n                    <td style=\"text-align:justify;width:100%\">\n                        تعداد بازدید : <span id=\"vst_sound{$i}\">{$audio_clips_ini_data[$i][2]}</span>\n						\n                    </td>\n                </tr>\n            </table>\n        {/if}\n        {/for}\n\n\n    {/if}\n	    {if count($audio_clips_ini_data) > 2}\n        <div style=\"padding-top: 20px;\">\n        ادامه کلیپ های صوتی : <span style=\"text-align:center;width:inherit;\">\n\n			{for $i=0 to (count($audio_clips_ini_data)%2 eq 0)?count($audio_clips_ini_data)/2:count($audio_clips_ini_data)/2-1}\n            {if $i eq 0}\n            <b> <a onclick=\"more_audio_clips({$i});\" class=\"sound_nav\" style=\"cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white; height: 15px; border: 3px solid black; \" onmouseover=\"$(this).css(\'background-color\',\'red\');\" onmouseout=\"$(this).css(\'background-color\',\'white\');\" id=\"soundnav{$i}\">{$i+1}</a></b>\n            {else}\n            <b> <a onclick=\"more_audio_clips({$i});\" class=\"sound_nav\" style=\"cursor: pointer;padding-right:4px;padding-left: 4px;background-color: white;height: 15px; border: 1px solid black; \" onmouseover=\"$(this).css(\'background-color\',\'red\');\" onmouseout=\"$(this).css(\'background-color\',\'white\');\" id=\"soundnav{$i}\">{$i+1}</a></b>\n            {/if}\n            {/for}\n\n            </div>\n		{/if}\n    </span>\n</div>","sound_briefcase","name","","","0","0","1");
INSERT INTO site_modules VALUES("12","aboutus","درباره ی ما","<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\n\n<div dir=\"rtl\" style=\"width: 100%;overflow:hidden;height:250px;\">\n{if count($aboutus_ini_data[0]) eq 0}\n<p>متنی برای معرفی  اولیه وجود ندارد و یا تعریف نشده است.</p>\n{else}\n <table>\n        <tr>\n            <td>{$aboutus_ini_data[0][0]}\n            </td>\n        </tr>\n        <tr>\n            <td align=\"center\"><img src=\"{$site_domain}/admin/{$aboutus_ini_data[0][2]}\"/></td>\n        </tr>\n        <tr>\n            <td>{literal}<a onmouseover=\"$(this).css({\'text-decoration\':\'underline\',\'font-weight\':\'bolder\'})\"   onmouseout=\"$(this).css({\'text-decoration\':\'none\',\'font-weight\':\'normal\'})\" {/literal}href=\"{$site_domain}/modules/aboutus/show_details.php#content\">برای مشاهده جزئیات بیشتر کلیک نمائید...</a></td>\n        </tr>\n    </table>\n    {/if}\n    </div>","config","short_desc","","","0","0","1");
INSERT INTO site_modules VALUES("13","login","ورود به سیستم","&lt;p&gt;\n	{if array_key_exists(&amp;quot;current_user&amp;quot;,$smarty.cookies) eq false}&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;\n	&lt;meta content=&quot;text/html; charset=utf-8&quot; http-equiv=&quot;Content-Type&quot; /&gt;\n	&lt;script language=&quot;javascript&quot; type=&quot;text/javascript&quot;&gt;\n\nvar adres=&quot;{$site_domain}&quot;;\n{literal}\n\nfunction login_ajax()\n{\nif (document.getElementById(\'username\').value==&quot;&quot; ||document.getElementById(\'password\').value==&quot;&quot;)\n   return false;\n\n\nif (document.getElementById(\'captcha\').value==&quot;&quot;)\n	{\n		document.getElementById(\'lg_error_reporting\').innerHTML=\'&lt;span style=&quot;color:white;background-color:red;text-align:center;&quot;&gt;کد امنیتی وارد نشده است.&lt;/span&gt;\';       \n		$j(&quot;#lg_error_reporting&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n	}\n	else\n	{\n		$ret=$j.ajax({\n		url: adres+&quot;/modules/login/login.php&quot;,\n		type:\'POST\',\n		data:{user_val:document.getElementById(\'captcha\').value,val:document.getElementById(\'cap_val\').value,uname:document.getElementById(\'username\').value,pass:document.getElementById(\'password\').value},\n		success:function(data)\n		{\n			\n			if (data==-2)\n			{\n				document.getElementById(\'lg_error_reporting\').innerHTML=\'&lt;span style=&quot;color:white;background-color:red;text-align:center;&quot;&gt;عبارت امنیتی اشتباه وارد شده است.&lt;/span&gt;\';       \n				$j(&quot;#lg_error_reporting&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				renew_captcha();\n			}\n			else if(data==-1)\n			{\n				document.getElementById(\'lg_error_reporting\').innerHTML=\'&lt;span style=&quot;color:white;background-color:red;text-align:center;&quot;&gt;چنین کاربری در سیستم وجود ندارد&lt;/span&gt;\';       \n				$j(&quot;#lg_error_reporting&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				renew_captcha();\n			}\n			else if (data==-100)\n			{\n				document.getElementById(\'lg_error_reporting\').innerHTML=\'&lt;span style=&quot;color:white;background-color:red;text-align:center;&quot;&gt;حساب کاربری شما در سیستم موجود و توسط مدیر سیستم غیرفعال شده است.با مدیریت سیستم تماس بگیرید.&lt;/span&gt;\';       \n				$j(&quot;#lg_error_reporting&quot;).fadeIn(&quot;slow&quot;).delay(5000).fadeOut(&quot;slow&quot;);\n				renew_captcha();\n			}\n			else if (data==-99)\n			{\n				document.getElementById(\'lg_error_reporting\').innerHTML=\'&lt;span style=&quot;color:white;background-color:red;text-align:center;&quot;&gt;کاربر دیگری با نام کاربری شما در سیستم فعال است&lt;/span&gt;\';       \n				$j(&quot;#lg_error_reporting&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				renew_captcha();\n			}\n			else if (data==-88)\n			{\n				document.getElementById(\'lg_error_reporting\').innerHTML=\'&lt;span style=&quot;color:white;background-color:red;text-align:center;&quot;&gt;در حال حاضر تنها مدیران سایت اجازه ورود به بخش مدیریت را دارا می باشند و کاربران دیگر مجاز به ورود به بخش کاربری نمی باشند&lt;/span&gt;\';       \n				$j(&quot;#lg_error_reporting&quot;).fadeIn(&quot;slow&quot;).delay(5000).fadeOut(&quot;slow&quot;);\n				renew_captcha();\n			}\n			else\n			{\n				document.getElementById(\'lg_error_reporting\').innerHTML=\'&lt;span style=&quot;color:white;background-color:green;&quot;&gt;انتقال به پنل کاربري...&lt;/span&gt;\';\n				$j(&quot;#lg_error_reporting&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				window.location.href ={/literal}&quot;{$site_domain}/admin/index.php?uid=&quot;+data;{literal}\n			}\n		\n		}\n		});\n	}\n\n}\nfunction renew_captcha()\n{\n	document.getElementById(\'username\').value=&quot;&quot;;\n	document.getElementById(\'password\').value=&quot;&quot;;\n	document.getElementById(\'captcha\').value=&quot;&quot;;\n	$j.ajax({\n	url: adres+&quot;/modules/captcha/captcha.php&quot;,\n	data:{action:10},\n	datatype:&quot;json&quot;,\n	success:function(data)\n	{\n		$j(\'#cap_img\').attr(\'src\',adres+\'/modules/captcha/\'+data.f);\n		document.getElementById(\'cap_val\').value=data.r;\n	}\n\n	});\n			\n}\nfunction isNumberKey(evt)\n      {\n         var charCode = (evt.which) ? evt.which : event.keyCode\n         if (charCode &gt; 31 &amp;&amp; (charCode &lt; 48 || charCode &gt; 57))\n            return false;\n\n         return true;\n      }\n\n&lt;/script&gt;{/literal}&lt;/p&gt;\n&lt;div dir=&quot;rtl&quot; style=&quot;width: 100%;height:250px;margin-top:70px;margin-bottom:-80px;&quot;&gt;\n	&lt;p style=&quot;text-align:justify;font-size:11px;&quot;&gt;\n		لطفاٍ به منظور استفاده از امکانات و دسترسی های فراهم شده برای کاربران سایت وارد سیستم شده و یا از &lt;a href=&quot;{$site_domain}/modules/login/show_details.php#content&quot; style=&quot;font-weight:bold;&quot;&gt;اینجا&lt;/a&gt; ثبت نام نمائید.&lt;/p&gt;\n	&lt;form&gt;\n		&lt;div id=&quot;lg_error_reporting&quot; style=&quot;text-align:center;&quot;&gt;\n			&amp;nbsp;&lt;/div&gt;\n		&lt;table&gt;\n			&lt;tbody&gt;\n				&lt;tr&gt;\n					&lt;td&gt;\n						نام کاربری :&lt;/td&gt;\n					&lt;td&gt;\n						&lt;input aria-required=&quot;true&quot; autocomplete=&quot;on&quot; id=&quot;username&quot; required=&quot;&quot; size=&quot;20&quot; style=&quot;width:150px;height:15px;&quot; type=&quot;text&quot; /&gt;&lt;/td&gt;\n					&lt;td&gt;\n						کلمه عبور :&lt;/td&gt;\n					&lt;td&gt;\n						&lt;input aria-required=&quot;true&quot; id=&quot;password&quot; required=&quot;&quot; size=&quot;20&quot; style=&quot;width:150px;height:15px;&quot; type=&quot;password&quot; /&gt;&lt;/td&gt;\n				&lt;/tr&gt;\n				&lt;tr&gt;\n					&lt;td colspan=&quot;4&quot;&gt;\n						&lt;table width=&quot;350px&quot;&gt;\n							&lt;tbody&gt;\n								&lt;tr&gt;\n									&lt;td colspan=&quot;2&quot;&gt;\n										کد امنیتی :&lt;/td&gt;\n									&lt;td&gt;\n										&lt;img id=&quot;cap_img&quot; src=&quot;{$site_domain}/modules/captcha/{$login_ini_data[0]}&quot; style=&quot;vertical-align:middle;&quot; /&gt;&lt;/td&gt;\n									&lt;td&gt;\n										&lt;input aria-required=&quot;true&quot; dir=&quot;ltr&quot; id=&quot;captcha&quot; onkeypress=&quot;return isNumberKey(event)&quot; required=&quot;&quot; size=&quot;5&quot; style=&quot;height:15px;&quot; type=&quot;text&quot; /&gt;&lt;img onclick=&quot;renew_captcha();&quot; src=&quot;{$site_domain}/modules/captcha/retry.ico&quot; style=&quot;width:20px;height:20px;vertical-align:middle;&quot; /&gt;&lt;span style=&quot;font-size:10px;&quot;&gt;ارزیابی از چپ به راست&lt;/span&gt;&lt;/td&gt;\n								&lt;/tr&gt;\n							&lt;/tbody&gt;\n						&lt;/table&gt;\n					&lt;/td&gt;\n				&lt;/tr&gt;\n				&lt;tr&gt;\n				&lt;/tr&gt;\n			&lt;/tbody&gt;\n		&lt;/table&gt;\n		&lt;table&gt;\n			&lt;tbody&gt;\n				&lt;tr&gt;\n					&lt;td style=&quot;text-align:center&quot;&gt;\n						&lt;input class=&quot;btn&quot; onclick=&quot;login_ajax();&quot; type=&quot;button&quot; value=&quot;ورود به سیستم&quot; /&gt;&lt;/td&gt;\n					&lt;td&gt;\n						&lt;div style=&quot;text-align:center;width:100%;font-size:12px;&quot;&gt;\n							&lt;a href=&quot;{$site_domain}/modules/login/show_details.php#content&quot;&gt;هنوز عضو سایت نشده ام....&lt;/a&gt;&lt;/div&gt;\n					&lt;/td&gt;\n				&lt;/tr&gt;\n			&lt;/tbody&gt;\n		&lt;/table&gt;\n		&lt;input id=&quot;cap_val&quot; type=&quot;hidden&quot; value=&quot;{$login_ini_data[1]}&quot; /&gt;&lt;/form&gt;\n&lt;/div&gt;\n&lt;p&gt;\n	{else}&lt;/p&gt;\n&lt;p&gt;\n	{assign &amp;quot;user_info&amp;quot; explode(&amp;quot;/&amp;quot;,$smarty.cookies.current_user|translate_cookie)}کاربر گرامی،&lt;b&gt;{$user_info[1]}&lt;/b&gt;،شما وارد سیستم شده اید...&lt;/p&gt;\n&lt;p&gt;\n	&lt;a href=&quot;{$site_domain}/admin/index.php?uid={$user_info[0]}&quot;&gt;مشاهده صفحه کاربری&lt;/a&gt;&lt;br /&gt;\n	&lt;a href=&quot;{$site_domain}/admin/logout.php?uid={$user_info[2]}&quot;&gt;خروج از حساب کاربری&lt;/a&gt; {/if}&lt;/p&gt;\n","users","","","","2","0","1");
INSERT INTO site_modules VALUES("14","footer","ته برگ","<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\n<div id=\"footer_space\">\n\n<div class=\"part\">\n{include file=\"newsletter_membership.tpl\"}\n</div>\n\n<div class=\"part\">\n{include file=\"rss_reader.tpl\"}\n</div>\n\n<div class=\"part\">{include file=\"contact_admin.tpl\"}</div>\n</div>","","","","","2","0","1");
INSERT INTO site_modules VALUES("15","newsletter_membership","عضویت در خبرنامه","<heads>\n<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\n{literal}\n<script language=\"javascript\" type=\"text/javascript\">\n\nfunction do_ajax()\n{\nif (document.getElementById(\'user_mail\').value==\"\")\n   return false;\n{/literal}\nvar path=\"{$modules_path}\";\n{literal}\nvar xmlhttp;\nif (window.XMLHttpRequest)\n  {// code for IE7+, Firefox, Chrome, Opera, Safari\n  xmlhttp=new XMLHttpRequest();\n  }\nelse\n  {// code for IE6, IE5\n  xmlhttp=new ActiveXObject(\"Microsoft.XMLHTTP\");\n  }\n  //x=document.getElementById(\'user_mail\').value;\n  if (document.getElementById(\'membership\').checked)\n	  xmlhttp.open(\"GET\",path+\"/newsletter_membership/newsletter_membership.php?user_mail=\"+document.getElementById(\'user_mail\').value+\"&status=mem\",true);\n  else\n  		  xmlhttp.open(\"GET\",path+\"/newsletter_membership/newsletter_membership.php?user_mail=\"+document.getElementById(\'user_mail\').value+\"&status=nmem\",true);\n  xmlhttp.send();\n  \n  xmlhttp.onreadystatechange=function()\n  {\n  if (xmlhttp.readyState==4 && xmlhttp.status==200)\n    {\n    document.getElementById(\'nl_error_reporting\').innerHTML=xmlhttp.responseText;\n    $(\"#nl_error_reporting\").fadeIn(\"slow\").delay(2500).fadeOut(\"slow\");\n	\n    }\n  }\n}\n\n</script>\n{/literal}\n</heads>\n<div align=\"center\" dir=\"rtl\" style=\"width: 100%\">\n	<form>\n		<div id=\"nl_error_reporting\" style=\"display: none\">\n		</div>\n		<table>\n			<tr>\n				<td colspan=\"2\">ایمیل شما : </td>\n			</tr>\n			<tr>\n				<td align=\"center\" colspan=\"2\">\n				<input id=\"user_mail\" name=\"user_mail\" type=\"text\"/>\n				</td>\n			</tr>\n			<tr>\n				<td>عضویت<input name=\"membership\" type=\"radio\" checked=\"checked\" id=\"membership\"/></td>\n				<td>عدم عضویت<input name=\"membership\" type=\"radio\"/></td>\n			</tr>\n			<tr>\n				<td align=\"center\" colspan=\"2\" valign=\"middle\">\n				<input onclick=\"do_ajax();\" type=\"button\" value=\"ثبـــت\"  class=\"btn\"/> </td>\n			</tr>\n		</table>\n	</form>\n</div>\n<script src=\"{$modules_path}/newsletter_membership/js/jquery-1.6.2.min.js\" type=\"text/javascript\"></script>","newsletter_members","","","","2","0","1");
INSERT INTO site_modules VALUES("16","rss_reader","خبر خوان RSS","<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\" />\n\n<div style=\"text-align:right\">\n{if $rss_reader_ini_data!=false}\nاخبار تصادفی Rss :<br/>\n{for $i=0 to {$rss_reader_ini_data|@count}-1}\n\n<img src=\"{$site_domain}/main/templates/images/rss.png\" style=\"margin-bottom:-5px;\"/>{literal}<span onmouseover=\"$(this).css({\'text-decoration\':\'underline\'})\"   onmouseout=\"$(this).css({\'text-decoration\':\'none\'})\">{/literal}{$rss_reader_ini_data[$i][0]}</span>(<a class=\"rss_view\"  target=\"_blank\" href=\"{$rss_reader_ini_data[$i][1]}\" style=\"color:yellow;\">بازدید</a>)\n<br/>\n{/for}\n\n{else}\n<span style=\"color:red;\">عدم برقراری اتصال با سرور...·</span>\n{/if}\n</div>","auto_news","","","","2","0","1");
INSERT INTO site_modules VALUES("17","contact_admin","ارتباط با مدیریت","<head>\n<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\n{literal}\n<script language=\"javascript\" type=\"text/javascript\">\n\n{/literal}\nadres=\"{$site_domain}\";\n{literal}\n\nfunction reg_message()\n{\n\nif (document.getElementById(\'contact_mail\').value==\"\" || $(\'#umsg\').val().length==0)\n   return false;\n\nelse if($.ajax({\n	url: adres+\"/modules/login/check_mail.php\",\n	data:{mail:document.getElementById(\'contact_mail\').value},\n	async:false\n	}).responseText==0)   \n	{\n		document.getElementById(\'ca_error_reporting\').innerHTML=\"<span style=\'color:white;background-color:red;\'>ایمیل وارد شده صحیح نمی باشد</span>\";\n		$(\"#ca_error_reporting\").fadeIn(\"slow\").delay(2500).fadeOut(\"slow\");\n	}\n	else\n	{\n\n		if (document.getElementById(\'captcha_contact\').value==\"\")\n			{\n				document.getElementById(\'ca_error_reporting\').innerHTML=\'<span style=\"color:white;background-color:red;text-align:center;\">کد امنیتی وارد نشده است.</span>\';       \n				$(\"#ca_error_reporting\").fadeIn(\"slow\").delay(2500).fadeOut(\"slow\");\n			}\n		\n		else\n		{\n			$ret=$.ajax({\n			url: adres+\"/modules/contact_admin/reg_message.php\",\n			type:\'POST\',\n			data:{user_val:document.getElementById(\'captcha_contact\').value,val:document.getElementById(\'cap_val3\').value,user_mail:document.getElementById(\'contact_mail\').value,msg:$(\'#umsg\').val()},\n			success:function(data)\n			{\n				\n				if (data==-2)\n				{\n					document.getElementById(\'ca_error_reporting\').innerHTML=\'<span style=\"color:white;background-color:red;text-align:center;\">عبارت امنیتی اشتباه وارد شده است.</span>\';       \n					$(\"#ca_error_reporting\").fadeIn(\"slow\").delay(2500).fadeOut(\"slow\");\n					renew_contact_captcha();\n				}\n				else\n				{\n					document.getElementById(\'ca_error_reporting\').innerHTML=\'<span style=\"color:white;background-color:green;text-align:center;\">پیام شما با موفقیت در سیستم ثبت شد.</span>\';       \n					$(\"#ca_error_reporting\").fadeIn(\"slow\").delay(2500).fadeOut(\"slow\");\n					user_mail:document.getElementById(\'contact_mail\').value=\"\";\n					$(\'#umsg\').val(\'\');\n					renew_contact_captcha();\n				}		\n			}\n			});\n		}\n	\n	}\n}\n\nfunction renew_contact_captcha()\n{\n	document.getElementById(\'captcha_contact\').value=\"\";\n	$.ajax({\n	url: adres+\"/modules/captcha/captcha.php\",\n	data:{action:1},\n	datatype:\"json\",\n	success:function(data)\n	{\n		$(\'#cap_img3\').attr(\'src\',adres+\'/modules/captcha/\'+data.f);\n		document.getElementById(\'cap_val3\').value=data.r;\n	}\n\n	});\n			\n}\n\n</script>\n{/literal}\n</head>\n<div align=\"center\" dir=\"rtl\" style=\"width: 100%\">\n	<form>\n		<div id=\"ca_error_reporting\" style=\"display: none\">\n		</div>\n		<p>\n		برای ارتباط مستقیم با مدیریت از فرم زیر استفاده نمائید :</p>\n		<table width=\"400px\">\n			<tr>\n				<td>ایمیل شما</td>\n				<td><input type=\"text\" id=\"contact_mail\" size=\"26\"/></td>\n\n				\n			</tr>\n			<tr>\n				<td>متن پیام</td>\n				<td>\n				<textarea id=\"umsg\" style=\"resize:none;width:250px;font-family:Bnazanin,tahoma;\"></textarea>\n				</td>\n			</tr>\n			</table>\n			<table style=\"width:338px;\">\n			<tr>\n				<td valign=\"middle\"><img src=\"{$site_domain}/modules/captcha/{$login_ini_data[0]}\" id=\"cap_img3\" style=\"vertical-align:middle;\"/>&nbsp;<input type=\"text\" size=\"5\" id=\"captcha_contact\" dir=\"ltr\"/><img src=\"{$site_domain}/modules/captcha/retry.ico\" onclick=\"renew_contact_captcha();\" style=\"width:20px;height:20px;vertical-align:middle;\"/></td>\n				<td>\n				<input onclick=\"reg_message();\" type=\"button\" value=\"ثبـــت\"  class=\"btn\"/>\n				<input type=\"hidden\" value=\"{$login_ini_data[1]}\" id=\"cap_val3\"/>\n				</td>\n				<td><font style=\"font-size:10px;\">ارزیابی از چپ به راست</font></td>\n			</tr>\n		</table>\n	</form>\n</div>\n","comments","","","","2","0","1");
INSERT INTO site_modules VALUES("18","txt_rotator","متن متحرک","<head>\n<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\n<style>\n#ticker {\n	height: 40px;\n	overflow: hidden;\n	text-align:center;\n\n}\n#ticker li {\n	height: 40px;\n	list-style-type:none;\n}\n</style>\n</head>\n\n<ul id=\"ticker\">\n\n		{if !empty($txt_rotator_ini_data)}\n		{for $i=0 to count($txt_rotator_ini_data)-1}\n		<li class=\"t_r\"><a href=\"{$modules_path}/news/show_details.php?nwsid={$txt_rotator_ini_data[$i][0]}#content\">\n		{$txt_rotator_ini_data[$i][1]}</a></li>\n		{/for}\n		{/if}\n	</ul>\n\n\n<script>\n\n	function tick(){\n		$fancy(\'#ticker li:first\').slideUp( function () { $fancy(this).appendTo($fancy(\'#ticker\')).slideDown(); });\n	}\n	setInterval(function(){ tick () }, 5000);\n\n\n</script>","news","","","","2","0","1");
INSERT INTO site_modules VALUES("20","template_functions","توابع قالب","&lt;script type=&quot;text/javascript&quot; language=&quot;javascript&quot;&gt;\nvar site_domain=&quot;{$site_domain}&quot;;\n{literal}\nfunction register_like(state,dt,lid)\n{\n	$j(\'#waiting\').css(\'visibility\',\'visible\');\n	  if (state==1)\n	  {\n		  $.ajax({\n		  type: &quot;GET&quot;,\n		  url:site_domain + &quot;/modules/template_functions/actions.php&quot;,\n		  data:{param:100,likeid:lid,dat:dt},\n		  success: function(data)\n			{\n				if (data==-1)\n				{\n				document.getElementById(&quot;error_reporting&quot;).innerHTML=&quot;برای مشارکت در ثبت نظر وارد سیستم شوید...&quot;;\n				$j(&quot;#error_reporting&quot;).css(&quot;background-color&quot;,&quot;red&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				}\n				else if (data==-2)\n				{\n				document.getElementById(&quot;error_reporting&quot;).innerHTML=&quot;زمان رای دادن فقط یک بار در روز می باشد. شما قبلا به این مطلب رای داده اید!&quot;;\n				$j(&quot;#error_reporting&quot;).css(&quot;background-color&quot;,&quot;yellow&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				}\n				else if (data==1)\n				{\n				document.getElementById(&quot;error_reporting&quot;).innerHTML=&quot;رای شما با موفقیت در سیستم ثبت شد&quot;;\n				$j(\'#good_val\').text(parseInt($j(\'#good_val\').text())+1);\n				$j(&quot;#error_reporting&quot;).css(&quot;background-color&quot;,&quot;green&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				}\n			}\n			});\n	}\n	else\n	{\n		$.ajax({\n		  type: &quot;GET&quot;,\n		  url:site_domain + &quot;/modules/template_functions/actions.php&quot;,\n		  data:{param:200,likeid:lid,dat:dt},\n		  success: function(data)\n			{\n				if (data==-1)\n				{\n				document.getElementById(&quot;error_reporting&quot;).innerHTML=&quot;برای مشارکت در ثبت نظر وارد سیستم شوید...&quot;;\n				$j(&quot;#error_reporting&quot;).css(&quot;background-color&quot;,&quot;red&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				}\n				else if (data==-2)\n				{\n				document.getElementById(&quot;error_reporting&quot;).innerHTML=&quot;زمان رای دادن فقط یک بار در روز می باشد. شما قبلا به این مطلب رای داده اید!&quot;;\n				$j(&quot;#error_reporting&quot;).css(&quot;background-color&quot;,&quot;yellow&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				}\n				else if (data==1)\n				{\n				document.getElementById(&quot;error_reporting&quot;).innerHTML=&quot;رای شما با موفقیت در سیستم ثبت شد&quot;;\n				$j(\'#bad_val\').text(parseInt($j(\'#bad_val\').text())+1);\n				$j(&quot;#error_reporting&quot;).css(&quot;background-color&quot;,&quot;green&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				}\n			}\n			});\n	}\n	$j(\'#waiting\').css(\'visibility\',\'hidden\');\n}\nfunction register_comment(name,mail,comment,cid)\n{\n	$j(\'#c_waiting\').css(\'visibility\',\'visible\');\n	  if (name==&quot;&quot;)\n	  {\n		document.getElementById(&quot;c_error_reporting&quot;).innerHTML=&quot;نام خود را وارد نمائید...&quot;;\n		$j(&quot;#c_error_reporting&quot;).css(&quot;background-color&quot;,&quot;red&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n	  }\n	  else if (mail==&quot;&quot;)\n	  {\n		document.getElementById(&quot;c_error_reporting&quot;).innerHTML=&quot;ایمیل خود را وارد نمائید...&quot;;\n		$j(&quot;#c_error_reporting&quot;).css(&quot;background-color&quot;,&quot;red&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n	  }\n	  else if (comment==&quot;&quot;)\n	  {\n		document.getElementById(&quot;c_error_reporting&quot;).innerHTML=&quot;نظری برای درج شدن وارد نشده است...!&quot;;\n		$j(&quot;#c_error_reporting&quot;).css(&quot;background-color&quot;,&quot;red&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n	  }\n	  else\n	  {\n		  $.ajax({\n		  type: &quot;POST&quot;,\n		  url:site_domain + &quot;/modules/template_functions/actions.php&quot;,\n		  data:{param:300,comm_id:cid,nme:name,email:mail,comm:comment},\n		  success: function(data)\n			{\n				if (data==-1)\n				{\n				document.getElementById(&quot;c_error_reporting&quot;).innerHTML=&quot;ایمیل وارد شده صحیح نمیباشد!&quot;;\n				$j(&quot;#c_error_reporting&quot;).css(&quot;background-color&quot;,&quot;yellow&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				}\n				else if (data==-2)\n				{\n				document.getElementById(&quot;c_error_reporting&quot;).innerHTML=&quot;تعداد نظر برای میهمانان سایت محدود می باشد. در یک ساعت آینده مجدداً امتحان نمائید!&quot;;\n				$j(&quot;#c_error_reporting&quot;).css(&quot;background-color&quot;,&quot;yellow&quot;).fadeIn(&quot;slow&quot;).delay(3500).fadeOut(&quot;slow&quot;);\n				}\n				else if (data==1)\n				{\n				document.getElementById(&quot;c_error_reporting&quot;).innerHTML=&quot;نظر شما با موفقیت در سیستم ثبت شد و پس از تائید مدیر نمایش داده خواهد شد&quot;;\n				$j(&quot;#c_error_reporting&quot;).css(&quot;background-color&quot;,&quot;green&quot;).fadeIn(&quot;slow&quot;).delay(2500).fadeOut(&quot;slow&quot;);\n				$j(\'#user_name\').val(&quot;&quot;);\n				$j(\'#user_mail\').val(&quot;&quot;);\n				$j(\'#user_comment\').val(&quot;&quot;);\n				}\n			}\n			});\n	}\n	$j(\'#c_waiting\').css(\'visibility\',\'hidden\');\n}\nfunction get_site_id()\n{\n	return $(\'#site_index\').val();\n}\n&lt;/script&gt;\n{/literal}\n\n&lt;input type=&quot;hidden&quot; id=&quot;site_index&quot; value=&quot;{$site_index}&quot;/&gt;\n\n\n{function name=counter}\n&lt;div&gt;تعداد بازدید : &lt;b&gt;{$vals|round}&lt;/b&gt;&lt;/div&gt;\n{/function}\n\n\n{function name=like}\n&lt;div style=&quot;float:right;&quot;&gt;میزان رضایت از مطلب : \n&lt;span style=&quot;width:20px;background-color:red;color:white;height:20px;float:left;position:absolute;right:135px;text-align:center;cursor:pointer;&quot; onclick=&quot;register_like(0,{$vals[0][1]},{$vals[0][2]});&quot;&gt;\n&lt;b id=&quot;bad_val&quot;&gt;{$vals[0][1]}&lt;/b&gt;&lt;/span&gt;\n&lt;span style=&quot;width:20px;background-color:blue;color:white;height:20px;text-align:center;position:absolute;right:155px;cursor:pointer;margin-top:-24px;&quot; onclick=&quot;register_like(1,{$vals[0][0]},{$vals[0][2]});&quot;&gt;&lt;b id=&quot;good_val&quot;&gt;{$vals[0][0]}&lt;/b&gt;&lt;/span&gt;\n\n&lt;span id=&quot;waiting&quot; style=&quot;position:absolute;right:180px;margin-top:-15px;visibility:hidden;&quot;&gt;&lt;img  style=&quot;margin-top:-7px;&quot; src=&quot;{$site_domain}/admin/templates/images/wait.gif&quot;/&gt;&lt;/span&gt;\n\n&lt;div id=&quot;error_reporting&quot; style=&quot;position:absolute;height:20px;right:200px;margin-top:-25px;&quot;&gt;&lt;/div&gt;\n\n&lt;/div&gt;\n&lt;br/&gt;\n{/function}\n\n\n{function name=comments}\n\n&lt;div id =&quot;comment_place&quot;&gt;\nنظر شما در خصوص این موضوع :\n&lt;form&gt;\n&lt;table style=&quot;border:none;&quot;&gt;\n&lt;tr&gt;\n&lt;td&gt;نام شما :&lt;/td&gt;\n&lt;td&gt;&lt;input type=&quot;text&quot; size==&quot;20&quot; id=&quot;user_name&quot;/&gt;&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr&gt;\n&lt;td&gt;ایمیل شما :&lt;/td&gt;\n&lt;td&gt;&lt;input type=&quot;text&quot; size==&quot;20&quot; id=&quot;user_mail&quot;/&gt;&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr&gt;\n&lt;td&gt;نظر شما :&lt;/td&gt;\n&lt;td &gt;&lt;textarea id=&quot;user_comment&quot; style=&quot;font-family:inherit;width:300px;&quot;&gt;&lt;/textarea&gt;&lt;/td&gt;\n&lt;/tr&gt;\n&lt;/table&gt;\n\n&lt;br/&gt;\n{if count($vals[0])==1}\n&lt;input type=&quot;button&quot; value=&quot;ثبت نظر&quot; class=&quot;btn&quot; onclick=&quot;register_comment($(\'#user_name\').val(),$(\'#user_mail\').val(),$(\'#user_comment\').val(),{$vals[0][0]})&quot;/&gt;\n{else}\n&lt;input type=&quot;button&quot; value=&quot;ثبت نظر&quot; class=&quot;btn&quot; onclick=&quot;register_comment($(\'#user_name\').val(),$(\'#user_mail\').val(),$(\'#user_comment\').val(),{$vals[0][count($vals[0])-1]})&quot;/&gt;\n{/if}\n&lt;input type=&quot;reset&quot; value=&quot;پاک کردن&quot; class=&quot;btn&quot;/&gt;\n&lt;span id=&quot;c_waiting&quot; style=&quot;position:absolute;right:150px;visibility:hidden;&quot;&gt;&lt;img  style=&quot;margin-top:6px;&quot; src=&quot;{$site_domain}/admin/templates/images/wait.gif&quot;/&gt;&lt;/span&gt;\n&lt;div id=&quot;c_error_reporting&quot; style=&quot;position:absolute;height:20px;right:160px;margin-top:-25px;&quot;&gt;&lt;/div&gt;\n&lt;/form&gt;\n&lt;img src=&quot;{$site_domain}/main/templates/images/line2.png&quot; style=&quot;display:table;margin:0 auto;&quot;/&gt;\n&lt;div&gt;\n&lt;b&gt;نظرات ثبت شده : &lt;/b&gt;\n\n&lt;br/&gt;\n\n&lt;div id=&quot;comments&quot;&gt;\n{if count($vals[0])&gt;1}\n{for $i=0 to $vals[0]|count-2}\n&lt;span&gt;{$vals[0][$i][0]}&lt;/span&gt; گفته است : {$vals[0][$i][1]}\n&lt;br/&gt;\n در تاریخ : {$vals[0][$i][2]}\n&lt;img src=&quot;{$site_domain}/main/templates/images/line2.png&quot; style=&quot;display:table;margin:0 auto;&quot;/&gt;\n {/for}\n {else}\n &lt;span&gt;نظری برای این آیتم ثبت نشده است!&lt;/span&gt;\n {/if}\n &lt;/div&gt;\n&lt;/div&gt;\n&lt;/div&gt;\n{/function}\n\n{function name=not_found}\n&lt;p style=&quot;font-weight:bold;&quot;&gt;&lt;img src=&quot;{$site_domain}/main/templates/images/notice.png&quot; style=&quot;margin-bottom:-25px;margin-top:-25px;padding-bottom:10px;&quot;/&gt;مطلب مورد نظر شما با مشخصات داده شده یافت نشد!&lt;/p&gt;\n{/function}\n\n\n{function name=is_active_module}\n{if in_array($module_name,$modules)}\n{include file=&quot;$module_name.tpl&quot;}\n{/if}\n{/function}\n\n\n{function name=box2}\n&lt;div class=&quot;main-block&quot; style=&quot;background-color:{$box_color}&quot;&gt;\n&lt;div class=&quot;title-block&quot;&gt;&lt;div class=&quot;title-block&quot;&gt;{$caption}&lt;/div&gt;&lt;/div&gt;\n{if $block_type==0}\n&lt;div class=&quot;content&quot;&gt;{include file=&quot;{$dt}&quot;}&lt;/div&gt;\n{else}\n&lt;div class=&quot;content&quot;&gt;{$dt}&lt;/div&gt;\n{/if}\n&lt;/div&gt;              \n{/function}","","","","","2","0","1");
INSERT INTO site_modules VALUES("21","comments","توضیحات","","comments","","","","1","0","1");
INSERT INTO site_modules VALUES("22","site_statistics","آمار سایت","<div dir=\"rtl\" style=\"width: 100%\">\n<p>تعداد مشاهده : {$site_statistics_ini_data[3]}</p>\n</div>\n","visitors","","","FA","2","0","1");
INSERT INTO site_modules VALUES("23","like","محبوبیت مطلب","","like","","","FA","1","0","1");
INSERT INTO site_modules VALUES("24","access","سطح دسترسی","","content_access","","","","1","0","1");





CREATE TABLE `site_modules_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `mapped_table` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `row_index` int(11) NOT NULL,
  `module_name2` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `reference` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;




CREATE TABLE `site_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `abstract` text COLLATE utf8_persian_ci NOT NULL,
  `full_text` text COLLATE utf8_persian_ci NOT NULL,
  `date_registered` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `images` varchar(600) COLLATE utf8_persian_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `acpd` tinyint(4) NOT NULL DEFAULT '0',
  `author` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `relation` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_news VALUES("16","مردم ایران چگونه زندگی می‌کنند و لازم است چگونه زندگی کنند؟ ","<p>\n	در گزارش خوانده می&zwnj;شوید امروز &laquo;تابناک&raquo;، دکتر محمود سریع&zwnj;القلم، چهار نقطه منفی زندگی ایرانیان را برشمرده و در این باره چهار راهکار پیشنهاد کرده است؛ این که ایرانیان کوتاه&zwnj;مدت، خود&zwnj;محور، دنیا&zwnj;دوست و خوشگذران هستند و راهکار&zwnj;هایی برای آن. شما چه نقاط منفی در زندگی ایرانیان می&zwnj;بینید و چه راهکار&zwnj;هایی برای آن در نظر دارید؟ این گزارش با دیدگاه&zwnj;&zwnj;های شما مخاطبان کامل می&zwnj;شود.</p>\n","<p>\n	دکتر محمود سریع&zwnj;القلم، استاد دانشگاه شهید بهشتی که از اساتید پیشرو در حوزه توسعه و پیشرفت کشور است، بر این باور است ما به سبک زندگی هیچ ملتی اصالتاً نمی&zwnj;توانیم ایراد بگیریم، چون سبک زندگی نتیجه انباشت تجربیات تاریخی یک ملت است؛ اما می&zwnj;توانیم معیارهایی را مشخص و از آن زاویه آسیب&zwnj;شناسی کنیم.<br />\n	<br style=\"font-weight: bold; color: rgb(0, 0, 205);\" />\n	<span style=\"font-weight: bold; color: rgb(0, 0, 205);\">آسیب&zwnj;شناسی سبک زندگی ایرانی</span><br />\n	<br />\n	در این راستا نخستین وجه مقایسه&zwnj;ای که می&zwnj;توان درباره سبک زندگی ایرانی و همه این کشور&zwnj;ها در نظر گرفت و البته بر خلاف ادعاهایی که عموماً در میان ما وجود دارد، اینکه میانگین ایرانی خیلی دنیا دوست است. علاقه عمیقی به دنیا و مال دنیا دارد، ولی هنرمندانه و با ادا و ظاهرسازی آن را می&zwnj;پوشاند. ظاهر و باطن میانگین ایرانی بالای ۵۰ درصد شکاف دارد.<br />\n	<br />\n	نکته دوم آن که بخشی از فرهنگ ما تکرار آموزه&zwnj;های اخلاقی و دینی است. واژگانی مانند انسانیت، خدا، پیغمبر، پاکی، وجدان، محبت، صداقت، شرافت، راستگویی و وظیفه دائماً مورد استفاده ماست، اما پرسش اینجاست که بازتاب این واژه&zwnj;ها در زندگی و عمل ما چیست؟ بازتاب اخلاق و معنویت و انسانیت در زندگی و عمل ما بسیار محدود است. تحقیقاً هیچ ملتی در دنیا به اندازه ایرانی&zwnj;ها از اخلاق و معنویت و انسانیت صحبت نمی&zwnj;کنند، اما بازتاب این در زندگی و عمل ما بسیار محدود است. این نخستین نقدی است که به زندگی ایرانی وارد است که چرا اینقدر ظاهر اخلاقی و معنوی دارد، ولی باطن مادی.<br />\n	<br />\n	نقد سوم بر سبک زندگی ایرانی این است که در مقایسه با ملت&zwnj;های دیگر سهم تفریح و خوشگذارانی و دور هم جمع شدن&zwnj;های متعدد و طولانی بسیار بالاست. سخن من این نیست که همه ایرانیان این ویژگی&zwnj;ها را دارند، ولی بیشتر آن&zwnj;ها چه در داخل و چه در خارج این خصایص را دارند.<br />\n	<br />\n	نقد چهارم این که سبک زندگی ما به شدت خودمحور است. ما بیشتر به دنبال حریم فردی خود هستیم و به آن حریم بیشتر توجه داریم، زیرا اگر کسی اجتماعی فکر کند، بسیاری از کار&zwnj;ها را انجام نمی&zwnj;دهد. به طور کلی ما به گونه&zwnj;ای در خانواده، مدرسه و جامعه تربیت می&zwnj;شویم که نگاهمان نگاه اجتماعی و نگاه عمومی نیست.<br />\n	<br />\n	من بر این باورم، در این جغرافیایی که ما زندگی می&zwnj;کنیم، هنوز دو مفهوم در میان ما شکل نگرفته است. یکی این که ما هنوز کشور و جامعه نداریم. ما عده&zwnj;ای هستیم که با سنن و خلقیات مشترک در جغرافیایی زندگی می&zwnj;کنیم. در علم جامعه&zwnj;شناسی، جامعه این گونه تعریف می&zwnj;شود که عده&zwnj;ای در آن دارای اهداف مشترک و جهت&zwnj;گیری مشترک هستند. ما هنوز به آن مرحله نرسیده&zwnj;ایم. شاید یک دلیل این باشد که ما امپراتوری بوده&zwnj;ایم؛ بنابراین، معتقد هستم که ما هنوز کشور ـ ملت نشده&zwnj;ایم. البته ملت هستیم؛ ما ایرانی هستیم و با زبان فارسی صحبت می&zwnj;کنیم و دارای ادبیات غنی و تاریخ کهن و سرزمین گسترده هستیم. این&zwnj;ها همه شاخصهای یک ملت است. اما ما کشور ـ ملت نیستیم.<br />\n	<br />\n	این یک پرسش جدی است که آیا مجموعه فعالیت&zwnj;هایی که ما ایرانی&zwnj;ها انجام می&zwnj;دهیم، تبدیل به سرمایه اجتماعی، ثروت ملی و پرستیژ جهانی می&zwnj;شود یا نه؟ آن موقع می&zwnj;توانیم بگوییم سبک زندگی کارآمدی داریم و نتیجه داده است و توانسته این متغیر&zwnj;ها را به صورت کمی و کیفی افزایش بدهد. هر کدام از ما می&zwnj;تواند بر اساس وجدان خود به این&zwnj;ها پاسخ بدهد. سبک زندگی ما دارای این ضعف جدی است که خیلی خودمحور بار می&zwnj;آییم که برای تبیین این نکته مثال&zwnj;های فراوانی نیز وجود دارد.<br />\n	<br style=\"font-weight: bold; color: rgb(0, 0, 205);\" />\n	<span style=\"font-weight: bold; color: rgb(0, 0, 205);\">چرایی مشکلات زندگی ایرانی</span><br />\n	<br />\n	چندین مسأله در بروز این مشکلات موثر هستند. رانت باعث به هم ریختگی طبقاتی و اجتماعی در جامعه شده است و بر خلاف کشورهای صنعتی و یا ملت&zwnj;هایی چون ترکیه و مالزی و یا حتی ملت&zwnj;های منطقه حاشیه خلیج&zwnj;فارس که بسیار مدنی شده&zwnj;اند، ما در جامعه&zwnj;ای زندگی می&zwnj;کنیم که آنهایی که بر اساس رانت، ارتباطات و تلفن صاحب امکانات و پول شده&zwnj;اند از مدنیت بسیار پایین&zwnj;تری برخوردارند. اصطلاحاً در فرهنگ ما به این افراد &laquo;تازه به دوران رسیده&zwnj;ها&raquo; گفته می&zwnj;شود. این پدیده نشان از &laquo;به هم&zwnj;ریختگی طبقاتی&raquo; در جامعه ماست. هر فردی در هر سمت و جایگاهی که هست، اگر یکباره حالت جهشی پیدا کند، حتماً نوعی نارسایی رفتاری در او پدیدار می&zwnj;شود.<br />\n	<br />\n	از سوی دیگر، استبداد تاریخی دلیل تفاوت در نظر و عمل دانسته می&zwnj;شود. ما به دلایل تاریخی و سیاسی ما در جایی آموزش نمی&zwnj;بینیم که مورد نقد قرار بگیریم. شما اگر ملایم&zwnj;ترین انتقاد را به میانگین ایرانی داشته باشید احتمالاً دوستی آن شخص را از دست می&zwnj;دهید. ما به سختی می&zwnj;توانیم به همدیگر تذکر بدهیم و یکدیگر را نقد بکنیم. هم روش این کار را بلد نیستیم و هم آمادگی روحی برای پذیرش نقد نداریم.<br />\n	<br />\n	بر خلاف بسیاری از تحصیل&zwnj;کرده&zwnj;های ایرانی که دولت را مقصر این مسائل و مشکلات می&zwnj;دانند، معتقد هستم که جامعه سهم خیلی مهمتری دارد. جامعه، تشکل&zwnj;های مردمی و اصناف و انجمن&zwnj;ها در این مسائل خیلی مهم&zwnj;تر از دولت هستند.<br />\n	<br style=\"font-weight: bold; color: rgb(0, 0, 205);\" />\n	<span style=\"font-weight: bold; color: rgb(0, 0, 205);\">رابطه با تجربه توسعه کشورهای دیگر</span><br />\n	<br />\n	اصول توسعه را می&zwnj;توان از کشورهای دیگر گرفت و برای توسعه یافتگی به کار برد. اما الگوهای توسعه الزاماً از یک جامعه به جامعه دیگر قابل کاربست نیستند. حضرت امیر (ع) می&zwnj;گویند شما را دعوت می&zwnj;کنم به ترس از خدا و نظم در امور. شاید نظم در امور را بتوان اینگونه تجزیه کرد: عقلانیت، علم&zwnj;گرایی، قانون&zwnj;گرایی، انسجام فکری نخبگان سیاسی، قوه مقننه قابل کارآمد و قوه قضائیه بی&zwnj;طرف. این اصول جهانشمول هستند و نتیجه تجربه بشری. هیچ جامعه&zwnj;ای نمی&zwnj;تواند بدون علم، نظم و عقلانیت و انسجام و قانون&zwnj;گرایی توسعه پیدا کند.<br />\n	<br style=\"font-weight: bold; color: rgb(0, 0, 205);\" />\n	<span style=\"font-weight: bold; color: rgb(0, 0, 205);\">اصول زندگی ناشی از توسعه&zwnj;یافتگی</span><br />\n	<br />\n	سبک زندگی ناشی از توسعه یافتگی، دارای اصولی است. نخستین اصل مسأله قانون&zwnj;گرایی است. یعنی افراد باید بیاموزند که در چهارچوب قانون عمل کنند. مهم&zwnj;ترین وجه توسعه یافتگی در سبک زندگی، رعایت قاعده و قانون در یک جامعه است. به دلایل بسیار پیچیده روانی و تاریخی و اجتماعی، میانگین ایرانی علاقه&zwnj;مند به قاعده نیست. در عوض خیلی علاقه&zwnj;مند است از هر روشی استفاده کند تا به منافعش برسد که عموماً هم منافع دنیوی هستند. این آسیب باید در یک مقطعی اصلاح شود.<br />\n	<br />\n	رعایت قانون و قاعده&zwnj;مندی کانون سبک زندگی معطوف به توسعه&zwnj;یافتگی است. وقتی انگلستان، آلمان، آمریکا، ژاپن و بعد&zwnj;ها برزیل و دیگران را با خود مقایسه می&zwnj;کنیم، درمی&zwnj;یابیم که کانون توسعه&zwnj;یافتگی آن&zwnj;ها قانون&zwnj;گرایی است. ثباتی که در اندیشه و تفکرات آلمانی&zwnj;ها و ژاپنی&zwnj;ها وجود دارد بدون تردید آن&zwnj;ها را در موقعیت بر&zwnj;تر جهانی قرار داده است؛ بنابراین، رعایت قانون و قاعده&zwnj;مندی را در کانون سبک زندگی معطوف به توسعه&zwnj;یافتگی می&zwnj;دانم.<br />\n	<br />\n	متون توسعه و تجربیات کشورهای توسعه یافته چه قدیمی مثل آلمان و چه جدید مثل کره جنوبی به ما می&zwnj;گوید که مبنا فکر و اندیشه است؛ مبنا تفکرات یک حکومت و یک ملت است. نهاد&zwnj;ها و ساختار&zwnj;ها مبتنی بر اندیشه&zwnj;ها ساخته می&zwnj;شود. لذا فکر بر نهادسازی تقدم دارد. دقیق&zwnj;ترین و در عین حال ساده&zwnj;ترین تعریفی که از توسعه شده این که توسعه&zwnj;یافتگی سطحی از فکر انسان است؛<br />\n	<br />\n	برای اینکه این افکار را اصلاح کنیم، باید چند اتفاق رخ دهد. یکی اینکه باید در جامعه ما مناظره شکل گیرد. ما نمی&zwnj;توانیم دو فرد دولتی را بیاوریم بعد بخواهیم که در مورد سیاست خارجی ایران صحبت کرده و مدام یکدیگر را تأیید کنند. حتی فردی دانشگاهی را بیاوریم که نظر فرد دولتی را بیش از خود او تأیید کند این دیگر مناظره نیست. در جامعه&zwnj;ای که مناظره نیست، فکر، منجمد باقی می&zwnj;ماند.<br />\n	<br />\n	اتفاقاً در کشور ما اطلاعات بسیار زیاد است. یعنی رسمی و غیررسمی و مستقیم و غیرمستقیم اطلاعات فوق العاده زیاد است اما مناظره وجود ندارد. با اطمینان بالا می&zwnj;توان گفت که در جامعه و در موضوعات مختلف مناظره نداریم و یک نوع یکسان سازی فکری در عموم مسائل در جامعه وجود دارد. این موضوع مانع تولید فکر و اندیشه است.<br />\n	<br />\n	تجربه بشری نشان داده که توسعه یافتگی سیاسی تابع و محصول مناظره است؛ یعنی هر چه مناظره بیشتر داشته باشیم، جامعه به سمت مدنیت بیشتر حرکت می&zwnj;کند و این مدنیت بیشتر باعث می&zwnj;شود در حوزه مسائل سیاسی بتوانیم کارکرد&zwnj;ها را اصلاح کنیم. مبنای توسعه یافتگی سیاسی رقابت حزبی است. مبنای رقابت حزبی کار تشکیلاتی و جمعی است. ما کار جمعی و تشکیلاتی را هنوز در جامعه نیاموخته&zwnj;ایم. ما کار محفلی را آموخته&zwnj;ایم ولی کار تشکیلاتی را نیاموخته&zwnj;ایم. ما برای اینکه بتوانیم به نظام رقابت حزبی برسیم راه بسیار طولانی در پیش داریم. ما هنوز فرهنگ این کار را نداریم که حزبی فکر کنیم ولی محفلی فکر می&zwnj;کنیم.<br />\n	<br />\n	اعتقاد دارم بسیاری از افکار اقتصادی و سیاست خارجی که امروز وجود دارد ریشه&rlm;&zwnj;های چپ مارکسیستی دارد. ما هنوز از تفکر چپ&zwnj;&zwnj;&zwnj; رها نشده&rlm;ایم. اگر ما کشوری و ملی فکر کنیم و ببینیم برای کل ایران چه پارادایمی مناسب است، تفکر چپ را&zwnj;&zwnj;&zwnj; رها می&zwnj;&lrm;کنیم. زیرا تفکر چپ در دنیا شکست خورد. سرنوشت توسعه یافتگی ایران خارج از حلقه تجربیات بشری نیست.<br />\n	<br />\n	نمی&zwnj;&lrm;توانیم بگوییم که ما یک تافته جدا بافته&rlm;&zwnj;ای در نظم جهانی هستیم و پیشرفت ما هیچ وجه مشترکی با کره جنوبی، ترکیه و برزیل ندارد. اتفاقاً ما که حتی در حوزه الگو&zwnj;ها باید بومی سازی کنیم، در این بومی سازی می&zwnj;&lrm;توانیم الگوهای جدی از این کشور&zwnj;ها بگیریم؛ برای نمونه، با توجه به اینکه ذخایر عظیم فسیلی داریم حتماً تولید ثروت ملی در ایران تابع ذخایر فسیلی است که ما با چه فرمولی &zwnj;&zwnj;&zwnj;نهایت بهره برداری را از آن&zwnj;ها بکنیم.<br />\n	<br />\n	از جهان باید بیاموزیم. سرنوشتمان به این جهان گره خورده است. این تفکر در کشور که به دنبال اندیشه&rlm;&zwnj;ها و راهکار درونی در داخل هست؛ غافل از اینکه می&zwnj;توان از تجربه دیگر کشور&zwnj;ها آموخت. ما می&zwnj;&rlm;توانیم از تجربیات کشورهای دیگر بیاموزیم و خیلی سریع&zwnj;تر مسیر توسعه یافتگی را طی کنیم.<br />\n	<br style=\"font-weight: bold; color: rgb(0, 0, 205);\" />\n	<span style=\"font-weight: bold; color: rgb(0, 0, 205);\">نسخه&rlm;&zwnj;ای برای اصلاح سبک زندگی ایرانیان</span><br />\n	<br />\n	نخستین شاخص کتاب خواندن و مناظره کردن است. نمی&zwnj;&lrm;پذیرم که میانگین ایرانیان پولی برای کتاب خریدن ندارند، چرا که ایرانیان برای غذا و تفریح پول به اندازه کافی دارند ولی برای مطالعه و بالا بردن سطح فکری پول خرج نمی&zwnj;&lrm;کنند. یکی از پیامدهای بسیار مثبت کتاب خواندن این است که خود&zwnj;شناسی انسان افزایش می&zwnj;&rlm;یابد.<br />\n	<br />\n	نکته دوم در رابطه با سبک زندگی، رعایت حقوق انسان&zwnj;های دیگر است. در این زمینه خیلی سقوط کرده&zwnj;ایم. رعایت حقوق دیگران بسیار مهم و کلیدی است. اتفاقاً قواعد دینی ما در این رابطه بسیار آموزنده است. الان فرهنگ عمومی و اخلاقی ما بسیار انحطاط پیدا کرده است. این مسأله باید در یک جایی بحث شود. باید تعریف کردن از خودمان را هم متوقف کنیم اینکه می&zwnj;گوییم ما شاخص هستیم و در دنیا بسیار ممتاز هستیم به هیچ وجه درست نیست.<br />\n	<br />\n	نکته سوم در این رابطه این است که اگر بخواهیم سبک زندگی خود را تغییر دهیم باید افراد فکری منصفی باشیم. در فرهنگ میانگین ایرانی کتمان، مماشات و توجیه زیاد داریم که برای توسعه یافتگی و سبک زندگی معقول مضر هستند.<br />\n	<br />\n	موضوع چهارم این است که میانگین ایرانی، دامنه لذاتش خیلی محدود است. سبک زندگی ما لذات ما را به موارد خاصی محدود می&zwnj;کند. قدم زدن در خزان، با دوستان فرهنگی بودن، کمک کردن به ایتام، پنج دقیقه به یک گل نگاه کردن، چهل صفحه در مورد خود نوشتن، احترام به عابر پیاده، نپریدن وسط حرف دیگران، سکوت فراوان، آشغال پرت نکردن از اتومبیل، جواب تلفن مردم را دادن، مؤدب بودن، تقدیر از کار خوب، ویژگیهای مثبت افراد را دیدن، گفتن ده بار در روز: من اشتباه کردم، زبان&zwnj;های خارجی آموختن و سرزدن به حلقه&rlm;&zwnj;های ۱و ۲ و ۳ زندگی خودمان در زندگی ما ایرانی&zwnj;ها بسیار محدود است.<br />\n	<br />\n	نکته پنجم این است که اگر بخواهیم سبک زندگی معقول داشته باشیم باید نظام اجتماعی با ثباتی داشته باشیم. برای این کار باید قوه&rlm;&zwnj;های مقننه و قضائیه بیش از وضعیت فعلی، با قاعده&zwnj;مندی و انصاف بیشتری عمل کنند تا اینکه توازنی میان قوه مجریه و دستگاه&rlm;&zwnj;های اجرایی و دستگاه&rlm;&zwnj;های نظارتی کشور به وجود آید.</p>\n","دو اسفند هزار و سیصد و نود و یک ۱۷:۰۱:۱۷","Files//9efe28f4a28d2bdf49cefd18dbaf194c_112.jpg","1","1","علی شیروانی","1","");
INSERT INTO site_news VALUES("19","بهترین ورزشکاران سال ۹۱ از نگاه شما ","<p>\n	در این ۲۴ ساعت، ۱۰۶۵ تن، ورزشکار مورد علاقه خود را برگزیدند؛ ۱۲۳ نظر از عزیزانی که نام ورزشکار را ذکر نکردند، همان گونه که پیش از انتخاب ورزشکاران اعلام کردیم، نظراتشان را منتشر نکردیم. همچنین دیگر دیدگاه&zwnj;های &zwnj;&zwnj;&zwnj;دوستانی را که پس از زمان معین، فرستاده شده، &zwnj;لحاظ نکردیم تا حقی ضایع نشود.</p>\n","<p>\n	<br />\n	۱- علی کریمی با ۱۸۶ رأی شما</p>\n<div style=\"text-align: center;\">\n	<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239939_854.jpg\" style=\"border: medium none ;\" title=\"\" /></div>\n<p>\n	۲- احسان حدادی با ۱۲۱ رأی<br />\n	&nbsp;</p>\n<div style=\"text-align: center;\">\n	<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239940_632.jpg\" style=\"border: medium none ;\" title=\"\" /></div>\n<p>\n	پرتابگر دیسک ایران به نشان نقره المپیک لندن و مدالی بسیار با ارزش دست یافت. این در حالی است که پیش از این، احسان حدادی در رقابت&zwnj;های قهرمانی جهان در کره جنوبی، موفق شده بود به مدال برنز دست پیدا کند. احسان حدادی، رکورددار پرتاب دیسک آسیا با به دست آوردن مدال خوشرنگ نقره در بازی&zwnj;های المپیک ۲۰۱۲ لندن در تاریخ دوومیدانی ایران جاودانه شد.<br />\n	<br />\n	۳ ـ محمد بنا با ۱۰۶ رأی</p>\n<div style=\"text-align: center;\">\n	<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239943_199.jpg\" style=\"border: medium none ;\" title=\"\" /></div>\n<p>\n	کشتی فرنگی ایران با هدایت محمد بنا، بهترین نتیجه تاریخ المپیک را گرفت.<br />\n	<br />\n	۴ـ سیامند رحمان با ۱۰۲ رأی<br />\n	<br />\n	سیامند رحمان با رکوردشکنی، موفق به کسب مدال طلای دسته فوق سنگین وزنه&zwnj;برداری و هشتمین مدال طلای ایران در پارالمپیک شد و با این مدال، چهارمین مدال طلای وزنه&zwnj;بردارهای ایران و هشتمین مدال طلای کاروان ورزشی ایران در لندن به دست آمد.</p>\n<div style=\"text-align: center;\">\n	<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239944_903.jpg\" style=\"border: medium none ;\" title=\"\" /></div>\n<p>\n	۵- بهداد سلیمی با ۹۸ رای<br />\n	<br />\n	بهداد سلیمی در رقابت فوق سنگین وزنه&zwnj;برداری المپیک ۲۰۱۲ لندن به مدال طلا رسید. سلیمی با به دست&zwnj; آوردن مدال طلا، قوی&zwnj;ترین مرد المپیک شد.</p>\n<div style=\"text-align: center;\">\n	<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239945_937.jpg\" style=\"border: medium none ;\" title=\"\" /><br />\n	<div style=\"text-align: right;\">\n		۶- فرهاد مجیدی با ۷۴ رأی</div>\n</div>\n<p>\n	<br />\n	<div style=\"text-align: center;\">\n		<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239946_473.jpg\" style=\"border: medium none ;\" title=\"\" /></div>\n	۷- حمید سوریان با ۶۶ رأی<br />\n	<br />\n	حمید سوریان با درخشش در رقابت&zwnj;های کشتی فرنگی المپیک، سرانجام کاروان ایران را در نهمین روز رقابت&zwnj;ها صاحب مدال طلا کرد. مدال طلای حمید سوریان، نخستین مدال کشتی فرنگی ایران در المپیک پس از چهل سال بود.</p>\n<p>\n	<br />\n	<div style=\"text-align: center;\">\n		<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239947_941.jpg\" style=\"border: medium none ;\" title=\"\" /></div>\n	۸- نیما عالمیان با ۲۶ رأی<br />\n	<br />\n	درخشش بی&zwnj;نظیر در لیگ جهانی تنیس روی میز</p>\n<p>\n	<br />\n	<p>\n		<br />\n		<div style=\"text-align: center;\">\n			<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239948_230.jpg\" style=\"border: medium none ; width: 352px; height: 300px;\" title=\"\" /></div>\n		۹- صادق گودرزی با ۲۵ رای&nbsp;<br />\n		<br />\n		مرد نقره&zwnj;ای کشتی آزاد در المپیک</p>\n</p>\n<p>\n	<br />\n	<div style=\"text-align: center;\">\n		<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239952_116.jpg\" style=\"border: medium none ;\" title=\"\" /></div>\n</p>\n<div style=\"text-align: center;\">\n	&nbsp;</div>\n<p>\n	10- رضا یزدانی با 23 رای<br />\n	<br />\n	رضا يزداني به نيمه نهايي المپيك رسيد اما بخاطر آسیب دیدگی مدال المپیک را از دست داد .<br />\n	&nbsp;</p>\n<div style=\"text-align: center;\">\n	<img alt=\"\" src=\"http://www.tabnak.ir/files/fa/news/1391/12/22/239950_193.jpg\" style=\"border: medium none ;\" title=\"\" /></div>\n<p>\n	آزادکار وزن ۹۶ کیلوگرم ایران به جمع چهار کشتی&zwnj;گیر بر&zwnj;تر المپیک راه یافت.<br />\n	<br />\n	رضا یزدانی پس از یک کشتی سخت مقابل عبدالسلام گادیسوف روس، مقابل ماگمدف موسائف از قرقیزستان قرار گرفت و در دو تایم (دو بر صفر ـ چهار بر دو) حریفش را شکست داد.<br />\n	<br />\n	البته ورزشکارانی همچون قاسم رضایی، سعید عبد ولی، امید نوروزی و رسول خادم با اختلاف اندک در جمع ده ورزشکار بر&zwnj;تر قرار نگرفتند.</p>\n","بیست و دو اسفند هزار و سیصد و نود و یک ۱۹:۳۵:۴۲","","1","1","علی شیروانی","1","");


CREATE TABLE `site_newsletter_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `date` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;




CREATE TABLE `site_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `relation` varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



CREATE TABLE `site_poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(1000) COLLATE utf8_persian_ci NOT NULL,
  `choices` varchar(1000) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;






CREATE TABLE `site_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(32) COLLATE utf8_persian_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;






CREATE TABLE `site_sound_briefcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `visit` int(11) NOT NULL,
  `sounds` varchar(1000) COLLATE utf8_persian_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `acpd` tinyint(4) NOT NULL DEFAULT '0',
  `author` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `relation` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_sound_briefcase VALUES("1","کلیپ صوتی احسان خواجه","<p>\n	کلیپ صوتی احسان خواجه امیری</p>\n<p>\n	کلیپ صوتی احسان خواجه امیری</p>\n<p>\n	کلیپ صوتی احسان خواجه امیری</p>\n","74","admin/Files/Sounds//Ehsan Khaje Amiri - Shaghayegh.mp3","1","1","","0","");


CREATE TABLE `site_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grp` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `slt` varchar(10) COLLATE utf8_persian_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `last_login` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `last_logout` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `isActive` tinyint(2) NOT NULL DEFAULT '1',
  `isDeleted` tinyint(2) NOT NULL DEFAULT '0',
  `fpassword` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;




CREATE TABLE `site_users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_users_groups VALUES("1","administrator");
INSERT INTO site_users_groups VALUES("2","user");



CREATE TABLE `site_video_briefcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `visit` int(11) NOT NULL,
  `videos` varchar(1000) COLLATE utf8_persian_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `acpd` tinyint(4) NOT NULL DEFAULT '0',
  `author` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `relation` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

INSERT INTO site_video_briefcase VALUES("5","یرکه آب","<p>\n	یرکه آب یرکه آب یرکه آب</p>\n","49","admin/Files//videos/barsandtone.flv","1","1","علی شیروانی","1","");



CREATE TABLE `site_visitors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `user_agent` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `referer` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `time` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `platform` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1177 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;


CREATE TABLE `site_vnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(500) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_persian_ci,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

INSERT INTO site_vnews VALUES("7","Files/vnews/Tulips176.jpg","","0");
INSERT INTO site_vnews VALUES("20","Files/vnews/9d12b249f4e5528a455acbeb7c1bbb7b_114163.jpg","","1");
INSERT INTO site_vnews VALUES("21","Files/vnews/9efe28f4a28d2bdf49cefd18dbaf194c_112102.jpg","","1");
INSERT INTO site_vnews VALUES("22","Files/vnews/c0519213e092925913a3fe7a82045788_Untitled - 10342.jpg","","1");
INSERT INTO site_vnews VALUES("31","Files/vnews/1286.jpg","","1");
INSERT INTO site_vnews VALUES("32","Files/vnews/3131.jpg","","1");
INSERT INTO site_vnews VALUES("33","Files/vnews/admin397.jpg","","1");

