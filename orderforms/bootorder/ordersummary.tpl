<div class="summaryproduct">{$producttotals.productinfo.groupname} - <b>{$producttotals.productinfo.name}</b></div>
<table class="ordersummarytbl">
<tr><td>{$producttotals.productinfo.name}</td><td class="textright">{$producttotals.pricing.baseprice}</td></tr>
{foreach from=$producttotals.configoptions item=configoption}{if $configoption}
<tr><td style="padding-left:10px;">&raquo; {$configoption.name}: {$configoption.optionname}</td><td class="textright">{$configoption.recurring}{if $configoption.setup} + {$configoption.setup} {$LANG.ordersetupfee}{/if}</td></tr>
{/if}{/foreach}
{foreach from=$producttotals.addons item=addon}
<tr><td>+ {$addon.name}</td><td class="textright">{$addon.recurring}</td></tr>
{/foreach}
</table>
{if $producttotals.pricing.setup || $producttotals.pricing.recurring || $producttotals.pricing.addons}
<div class="summaryproduct"></div>
<table width="100%">
{if $producttotals.pricing.setup}<tr><td>{$LANG.cartsetupfees}:</td><td class="textright">{$producttotals.pricing.setup}</td></tr>{/if}
{foreach from=$producttotals.pricing.recurringexcltax key=cycle item=recurring}
<tr><td>{$cycle}:</td><td class="textright">{$recurring}</td></tr>
{/foreach}
{if $producttotals.pricing.tax1}<tr><td>{$carttotals.taxname} @ {$carttotals.taxrate}%:</td><td class="textright">{$producttotals.pricing.tax1}</td></tr>{/if}
{if $producttotals.pricing.tax2}<tr><td>{$carttotals.taxname2} @ {$carttotals.taxrate2}%:</td><td class="textright">{$producttotals.pricing.tax2}</td></tr>{/if}
</table>
{/if}
<div class="summaryproduct"></div>
<table width="100%">
<tr><td colspan="2" class="textright">{$LANG.ordertotalduetoday}: <b>{$producttotals.pricing.totaltoday}</b></td></tr>
</table>