{if $invalid}
    <div class="domaininvalid">{if $reason}{$reason}{else}{$LANG.cartdomaininvalid}{/if}</div>
    <p align="center"><a href="#" onclick="cancelcheck();return false">{$LANG.carttryanotherdomain}</a></p>
{elseif $alreadyindb}
    <div class="domaininvalid">{$LANG.cartdomainexists}</div>
    <p align="center"><a href="#" onclick="cancelcheck();return false">{$LANG.carttryanotherdomain}</a></p>
{else}

{if $checktype=="register" && $regenabled}

<input type="hidden" name="domainoption" value="register" />

{if $status eq "available"}

<div class="alert alert-success">{$LANG.cartcongratsdomainavailable|sprintf2:$domain}</div>

<input type="hidden" name="domains[]" value="{$domain}" />

<p>{$LANG.cartregisterhowlong}</p>

<select name="domainsregperiod[{$domain}]" id="regperiod" class="form-control">
  {foreach key=period item=regoption from=$regoptions}{if $regoption.register}
    <option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.register}</option>{/if}
  {/foreach}
</select>

{assign var='continueok' value=true}

{elseif $status eq "unavailable"}

<p>{$LANG.cartdomaintaken|sprintf2:$domain}</p>

<a href="#" onclick="cancelcheck();return false"><i class="fa fa-thumbs-up"></i> {$LANG.carttryanotherdomain}</a>

{/if}

{elseif $checktype=="transfer" && $transferenabled}

<input type="hidden" name="domainoption" value="transfer" />

{if $status eq "available"}

<p>{$LANG.carttransfernotregistered|sprintf2:$domain}</p>

<a href="#" onclick="cancelcheck();return false"><i class="fa fa-thumbs-up"></i> {$LANG.carttryanotherdomain}</a>

{elseif $status eq "unavailable"}

<div class="domainavailable">{$LANG.carttransferpossible|sprintf2:$domain:$transferprice}</div>
<input type="hidden" name="domains[]" value="{$domain}" />
<input type="hidden" name="domainsregperiod[{$domain}]" value="{$transferterm}" />

{assign var='continueok' value=true}

{/if}

{elseif $checktype=="owndomain" || $checktype=="subdomain"}

<input type="hidden" name="domainoption" value="{$checktype}" />
<input type="hidden" name="sld" value="{$sld}" />
<input type="hidden" name="tld" value="{$tld}" />
<script language="javascript">
completedomain();
</script>

{/if}

{if $othersuggestions}

<div class="domainsuggestions">{$LANG.cartotherdomainsuggestions}</div>

<table align="center" cellspacing="1" class="domainsuggestions">
<tr><th width="50"></th><th>{$LANG.domainname}</th><th>{$LANG.clientarearegistrationperiod}</th></tr>
{foreach from=$othersuggestions item=other}
<tr><td><input type="checkbox" name="domains[]" value="{$other.domain}" /></td><td>{$other.domain}</td><td><select name="domainsregperiod[{$other.domain}]">{foreach from=$other.regoptions key=period item=regoption}{if $regoption.register}<option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.register}</option>{/if}{/foreach}</select></td></tr>
{/foreach}
</table>

{assign var='continueok' value=true}

{/if}

{if $continueok}
<br />
<input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-block btn-success" />
{/if}

{/if}