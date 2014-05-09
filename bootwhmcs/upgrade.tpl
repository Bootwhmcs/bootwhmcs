{include file="$template/pageheader.tpl" title=$LANG.upgradedowngradepackage}

<div class="alert alert-block alert-info">
    <p>{$LANG.orderproduct}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}</p>
</div>

{if $overdueinvoice}

<p>{$LANG.upgradeerroroverdueinvoice}</p>

<br />

<p><input type="button" value="{$LANG.clientareabacklink}" onclick="window.location='clientarea.php?action=productdetails&id={$id}'" class="btn btn-large" /></p>

{else}

{if $type eq "package"}

<p>{$LANG.upgradechoosepackage}</p>

<br />

<div class="center80">
<table class="table table-striped table-framed">
{foreach key=num item=upgradepackage from=$upgradepackages}
<tr>
<td>
<form method="post" action="{$smarty.server.PHP_SELF}">
<input type="hidden" name="step" value="2">
<input type="hidden" name="type" value="{$type}">
<input type="hidden" name="id" value="{$id}">
<input type="hidden" name="pid" value="{$upgradepackage.pid}">
<strong>{$upgradepackage.groupname} - {$upgradepackage.name}</strong>
</td>
<td class="textcenter">
{if $upgradepackage.pricing.type eq "free"}
{$LANG.orderfree}<br />
<input type="hidden" name="billingcycle" value="free">
{elseif $upgradepackage.pricing.type eq "onetime"}
{$upgradepackage.pricing.onetime} {$LANG.orderpaymenttermonetime}
<input type="hidden" name="billingcycle" value="onetime">
{elseif $upgradepackage.pricing.type eq "recurring"}
<select name="billingcycle">
{if $upgradepackage.pricing.monthly}<option value="monthly">{$upgradepackage.pricing.monthly}</option>{/if}
{if $upgradepackage.pricing.quarterly}<option value="quarterly">{$upgradepackage.pricing.quarterly}</option>{/if}
{if $upgradepackage.pricing.semiannually}<option value="semiannually">{$upgradepackage.pricing.semiannually}</option>{/if}
{if $upgradepackage.pricing.annually}<option value="annually">{$upgradepackage.pricing.annually}</option>{/if}
{if $upgradepackage.pricing.biennially}<option value="biennially">{$upgradepackage.pricing.biennially}</option>{/if}
{if $upgradepackage.pricing.triennially}<option value="triennially">{$upgradepackage.pricing.triennially}</option>{/if}
</select>
{/if}
</td>
<td class="textcenter"><input type="submit" value="{$LANG.upgradedowngradechooseproduct}" class="btn" /></form></td>
</tr>
{/foreach}
</table>
</div>

{elseif $type eq "configoptions"}

<p>{$LANG.upgradechooseconfigoptions}</p>

<br />

{if $errormessage}
<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$errormessage}
    </ul>
</div>
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}">
<input type="hidden" name="step" value="2" />
<input type="hidden" name="type" value="{$type}" />
<input type="hidden" name="id" value="{$id}" />

<div class="center80">
<table class="table table-striped table-framed">
    <thead>
        <tr>
            <th></th>
            <th class="textcenter">{$LANG.upgradecurrentconfig}</th>
            <th></th>
            <th class="textcenter">{$LANG.upgradenewconfig}</th>
        </tr>
    </thead>
    <tbody>
{foreach key=num item=configoption from=$configoptions}
        <tr>
            <td>{$configoption.optionname}</td>
            <td class="textcenter">
{if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
{$configoption.selectedname}
{elseif $configoption.optiontype eq 3}
{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}
{elseif $configoption.optiontype eq 4}
{$configoption.selectedqty} x {$configoption.options.0.name}
{/if}
            </td>
            <td class="textcenter">=></td>
            <td class="textcenter">
{if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
<select name="configoption[{$configoption.id}]">
{foreach key=num item=option from=$configoption.options}
{if $option.selected}<option value="{$option.id}" selected>{$LANG.upgradenochange}</option>{else}<option value="{$option.id}">{$option.nameonly} {$option.price}{/if}</option>
{/foreach}
</select>
{elseif $configoption.optiontype eq 3}
<input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked{/if}> {$configoption.options.0.name}
{elseif $configoption.optiontype eq 4}
<input type="text" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" size="5"> x {$configoption.options.0.name}
{/if}
            </td>
        </tr>
{/foreach}
    </tbody>
</table>
</div>

<p class="textcenter"><input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-primary" /></p>

</form>

{/if}

{/if}

<br />
<br />
<br />
