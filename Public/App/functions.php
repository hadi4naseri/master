<?php
/*
App-related public functions for whole of system.
*/

function validateInput($input)
{
	return htmlspecialchars($input, ENT_QUOTES, 'UTF-8');
}

//تابع تاریخ شمسی به میلادی
//تاریخ تبدیل مسلادی به شمی
