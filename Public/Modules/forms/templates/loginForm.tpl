<div style="text-align:center">
{if !isset($smarty.cookies.userToken) or validatetoken($tenantName,$smarty.cookies.userToken)==false}
<span>برای ورود به سیستم اطلاعات زیر را تکمیل نمائید :</span><br/><br/>
{$forms_loginForm_ini_data["content"]["form"]}

<br/>
{for $ii=0 to count($forms_loginForm_ini_data["addons"])-1}
{*cat for concatinate two strings*}

{assign var=addon_ini value=""}
{assign var=moduleName value=$forms_loginForm_ini_data["addons"][$ii]["moduleName"]}
{assign var=handle value=$forms_loginForm_ini_data["addons"][$ii]["handle"]}

{assign var=addon_ini value='{$'|cat:$moduleName|cat:"_"|cat:$handle|cat:"_ini_data"|cat:'}'}

{assign var=ab value={eval var=$addon_ini}}


{include file=loadTemplate($forms_loginForm_ini_data["addons"][$ii]["moduleName"],$forms_loginForm_ini_data["addons"][$ii]["handle"],$forms_loginForm_ini_data["addons"][$ii]["addonData"]["template"])}
{/for}

{else}
{if validateToken($tenantName,$smarty.cookies.userToken)}
<span><b>{$userName}</b>، شما به سیستم وارد شده اید...</span><br/><br/>

<span><a onmouseover='$(this).css("font-weight","bold");' onmouseout='$(this).css("font-weight","normal");' class="general fancybox fancybox.ajax" style="color:black;text-decoration:black" href="{$siteDomain}Public/modules/admin/functions/systemCenter.php?tenant={$tenantName}&Sid={$smarty.cookies.userToken}">مرکز کنترل سیستم</a></span><br/>

<span><a onmouseover='$(this).css("font-weight","bold");' onmouseout='$(this).css("font-weight","normal");' class="general fancybox fancybox.ajax" style="color:black;text-decoration:black" href="{$siteDomain}Public/modules/admin/functions/moduleStore.php?tenant={$tenantName}&Sid={$smarty.cookies.userToken}">فروشگاه ماژول</a></span><br/>

<span><a onmouseover='$(this).css("font-weight","bold");' onmouseout='$(this).css("font-weight","normal");' href="{$siteDomain}Public/modules/admin/functions/logout.php?tenant={$tenantName}&Sid={$smarty.cookies.userToken}" style="color:red;text-decoration:red">خروج از سیستم</a></span>
{/if}
{/if}

</div>