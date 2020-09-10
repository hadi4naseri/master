<div style="width:100%;text-align:justify;">
{for $i=0 to $news_loginNews_ini_data["content"]|count-1}
<p onmouseover='$(this).css("border","2px solid red")' onmouseout='$(this).css("border","0px")'>
<div style="font-weight:bold">*<a href='{$tenantDomain}Tenants/{$tenantName}/Modules/news/functions/details.php?handle={$news_loginNews_ini_data["handle"]}&id={$news_loginNews_ini_data["content"][$i]["id"]}'>{$news_loginNews_ini_data["content"][$i]["title"]}</a>*</div>
<br/>
{$news_loginNews_ini_data["content"][$i]["shortDescription"]}
</p>
{/for}
</div>