<?php
include_once("Db/functions.php");

if (@!$_SERVER['HTTP_REFERER'])
$tenant=findTenant($_SERVER['REQUEST_URI']);
else
$tenant=findTenant($_SERVER['HTTP_REFERER']);

$tenant_ini=select($tenant,"config",array(),array());