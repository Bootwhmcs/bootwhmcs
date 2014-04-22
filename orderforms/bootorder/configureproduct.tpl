<script type="text/javascript" src="includes/jscript/jqueryui.js"></script>
<script type="text/javascript" src="templates/orderforms/{$carttpl}/static/app.js"></script>

<form id="orderfrm">
  <input type="hidden" name="configure" value="true" />
  <input type="hidden" name="i" value="{$i}" />

  {if !$firstconfig || $firstconfig && !$domain}<h1>{$LANG.orderconfigure}</h1>{/if}

  <div id="configproducterror" class="alert alert-danger"></div>

  {if $pricing.type eq "recurring"}
  <h3>{$LANG.cartchoosecycle}</h3>

  {if $pricing.monthly}
  <div class="radio">
    <label>
      <input type="radio" name="billingcycle" id="cycle1" value="monthly"{if $billingcycle eq "monthly"} checked{/if} onclick="recalctotals()" />
      {$pricing.monthly}
    </label>
  </div>
  {/if}

  {if $pricing.quarterly}
  <div class="radio">
    <label>
      <input type="radio" name="billingcycle" id="cycle2" value="quarterly"{if $billingcycle eq "quarterly"} checked{/if} onclick="recalctotals()" />
      {$pricing.quarterly}
    </label>
  </div>
  {/if}

  {if $pricing.semiannually}
  <div class="radio">
    <label>
      <input type="radio" name="billingcycle" id="cycle3" value="semiannually"{if $billingcycle eq "semiannually"} checked{/if} onclick="recalctotals()" />
      {$pricing.semiannually}
    </label>
  </div>
  {/if}

  {if $pricing.annually}
  <div class="radio">
    <label>
      <input type="radio" name="billingcycle" id="cycle4" value="annually"{if $billingcycle eq "annually"} checked{/if} onclick="recalctotals()" />
      {$pricing.annually}
    </label>
  </div>
  {/if}

  {if $pricing.biennially}
  <div class="radio">
    <label>
      <input type="radio" name="billingcycle" id="cycle5" value="biennially"{if $billingcycle eq "biennially"} checked{/if} onclick="recalctotals()" />
      {$pricing.biennially}
    </label>
  </div>
  {/if}

  {if $pricing.triennially}
  <div class="radio">
    <label>
      <input type="radio" name="billingcycle" id="cycle6" value="triennially"{if $billingcycle eq "triennially"} checked{/if} onclick="recalctotals()" />
      {$pricing.triennially}
    </label>
  </div>
  {/if}
{/if}

<hr />


{if $productinfo.type eq "server"}
<h3>{$LANG.cartconfigserver}</h3>
<div class="serverconfig">
<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
<tr><td class="fieldlabel">{$LANG.serverhostname}:</td><td class="fieldarea"><input type="text" name="hostname" size="15" value="{$server.hostname}" /> eg. server1(.yourdomain.com)</td></tr>
<tr><td class="fieldlabel">{$LANG.serverns1prefix}:</td><td class="fieldarea"><input type="text" name="ns1prefix" size="10" value="{$server.ns1prefix}" /> eg. ns1(.yourdomain.com)</td></tr>
<tr><td class="fieldlabel">{$LANG.serverns2prefix}:</td><td class="fieldarea"><input type="text" name="ns2prefix" size="10" value="{$server.ns2prefix}" /> eg. ns2(.yourdomain.com)</td></tr>
<tr><td class="fieldlabel">{$LANG.serverrootpw}:</td><td class="fieldarea"><input type="password" name="rootpw" size="20" value="{$server.rootpw}" /></td></tr>
</table>
</div>
{/if}

{if $configurableoptions}
<h3>{$LANG.orderconfigpackage}</h3>
<div class="configoptions">
<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
{foreach from=$configurableoptions item=configoption}
<tr><td class="fieldlabel">{$configoption.optionname}</td><td class="fieldarea">
{if $configoption.optiontype eq 1}
<select name="configoption[{$configoption.id}]" onchange="recalctotals()">
{foreach key=num2 item=options from=$configoption.options}
<option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>{$options.name}</option>
{/foreach}
</select>
{elseif $configoption.optiontype eq 2}
{foreach key=num2 item=options from=$configoption.options}
<label><input type="radio" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if} onclick="recalctotals()" /> {$options.name}</label><br />
{/foreach}
{elseif $configoption.optiontype eq 3}
<label><input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked{/if} onclick="recalctotals()" /> {$configoption.options.0.name}</label>
{elseif $configoption.optiontype eq 4}
{if $configoption.qtymaximum}
{literal}
    <script>
    jQuery(function() {
        {/literal}
        var configid = '{$configoption.id}';
        var configmin = {$configoption.qtyminimum};
        var configmax = {$configoption.qtymaximum};
        var configval = {if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if};
        {literal}
        jQuery("#slider"+configid).slider({
            min: configmin,
            max: configmax,
            value: configval,
            range: "min",
            slide: function( event, ui ) {
                jQuery("#confop"+configid).val( ui.value );
                jQuery("#confoplabel"+configid).html( ui.value );
            },
            stop: function( event, ui ) {
                recalctotals();
            }
        });
    });
    </script>
{/literal}
<table width="90%"><tr><td width="30" id="confoplabel{$configoption.id}" class="configoplabel">{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}</td><td><div id="slider{$configoption.id}"></div></td></tr></table>
<input type="hidden" name="configoption[{$configoption.id}]" id="confop{$configoption.id}" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" />
{else}
<input type="text" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" size="5" onkeyup="recalctotals()" /> x {$configoption.options.0.name}
{/if}
{/if}
</td></tr>
{/foreach}
</table>
</div>
{/if}

{if $addons}
<h3>{$LANG.cartavailableaddons}</h3>
<div class="addons">
<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
{foreach from=$addons item=addon}
<tr><td class="radiofield"><input type="checkbox" name="addons[{$addon.id}]" id="a{$addon.id}"{if $addon.status} checked{/if} onclick="recalctotals()" /></td><td class="fieldarea"><label for="a{$addon.id}"><strong>{$addon.name}</strong> - {$addon.pricing}<br />{$addon.description}</label></td></tr>
{/foreach}
</table>
</div>
{/if}

{if $customfields}
<h3>{$LANG.orderadditionalrequiredinfo}</h3>
<div class="customfields">
<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
{foreach key=num item=customfield from=$customfields}
<tr><td class="fieldlabel">{$customfield.name}</td><td class="fieldarea">{$customfield.input} {$customfield.description}</td></tr>
{/foreach}
</table>
</div>
{/if}

<h3>{$LANG.ordersummary}</h3>
<div class="ordersummary" id="producttotal"></div>
<hr />
<input type="button" value="{$LANG.checkout} &raquo;" class="checkout btn btn-success" onclick="addtocart();" />
<input type="button" value="{$LANG.continueshopping}" class="btn btn-primary" onclick="addtocart('{$productinfo.gid}');" />
<input type="button" value="{$LANG.viewcart}" class="btn btn-danger" onclick="window.location='cart.php?a=view'" />

</div>

<script language="javascript">recalctotals();</script>

</form>

</div>
