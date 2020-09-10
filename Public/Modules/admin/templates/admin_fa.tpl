<div style="width:100%;text-align:justify;">

Test for admin panel
<br/>

<a class="general fancybox fancybox.ajax" href="A.php">تست</a>

{*
{include file=loadTemplate($news_mainNews_ini_data["addons"]["like_news_main"]["moduleName"],$news_mainNews_ini_data["addons"]["like_news_main"]["handle"],$news_mainNews_ini_data["addons"]["like_news_main"]["template"],NULL)}


{for $i=0 to $news_mainNews_ini_data["content"]|count-1}


<p onmouseover='color=$(this).css("background-color");$(this).css("background-color","darkgreen")' onmouseout='$(this).css("background-color",color)'>
<span style="font-weight:bold"><a href='{$tenantDomain}Tenants/{$tenantName}/Modules/news/functions/details.php?handle={$news_mainNews_ini_data["handle"]}&id={$news_mainNews_ini_data["content"][$i]["id"]}'>{$news_mainNews_ini_data["content"][$i]["title"]}</a></span>
<br/>
{$news_mainNews_ini_data["content"][$i]["shortDescription"]}
</p>
{/for}
*}

<br/>

<small>template from global tenant</small>
</div>