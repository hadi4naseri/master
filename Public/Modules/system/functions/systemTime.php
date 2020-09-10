<?php

trait systemTimeT
{

	public static function systemTime()
	{
		return time();		
	}

	public static function hourOfDay()
	{
		return date('H:i');		
	}		
}
?>