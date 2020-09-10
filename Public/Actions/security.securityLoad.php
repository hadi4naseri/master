<?php

function securityLoad($data)
{
	
	require_once "/Modules/like/likeClass.php";
	require_once "/Modules/system/systemClass.php";
	
	if (system::userLoggedIn($data["tenant"])==false)
		like::disableView($data);
	else
		like::enableView($data);
}