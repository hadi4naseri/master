<div style="width:100%;text-align:justify;">
------------------------------------------------------------------
{for $i=0 to $content["addons"]["news1Addon1"]["content"]|count-1}

<h2 style="color:green">{$content["addons"]["news1Addon1"]["content"][$i]["title"]}</h2>

<h3>{$content["addons"]["news1Addon1"]["content"][$i]["shortDescription"]}</h3>

<h4>{$content["addons"]["news1Addon1"]["content"][$i]["longDescription"]}</h4>

{/for}
------------------------------------------------------------------
</div>