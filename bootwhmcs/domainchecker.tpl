{include file="$template/pageheader.tpl" title=$LANG.domaintitle desc=$LANG.domaincheckerintro}

{if $inccode}
  <div class="alert alert-danger">
    {$LANG.captchaverifyincorrect}
  </div>
{/if}

{if $bulkdomainsearchenabled}
  <p align="right">
    <strong>{$LANG.domainsimplesearch}</strong> | 
    <a href="domainchecker.php?search=bulkregister">{$LANG.domainbulksearch}</a> | 
    <a href="domainchecker.php?search=bulktransfer">{$LANG.domainbulktransfersearch}</a></p>
{/if}

<form method="post" action="domainchecker.php" class="form-horizontal">
  <div class="well">
    <p>{$LANG.domaincheckerenterdomain}</p>
    
    <div class="row">
    
      <div class="col-sm-9">
        <p><input class="form-control input-lg" name="domain" type="text" value="{if $domain}{$domain}{/if}" placeholder="{$LANG.domaincheckerdomainexample}" /></p>
      </div>
      
      <div class="col-sm-3">
        <input type="button" value="{$LANG.searchmultipletlds} &raquo;" class="btn btn-info btn-lg btn-block multiTLD" />
      </div>
      
    </div>
    
    <div style="display: none;" id="tlds">
      {foreach from=$tldslist key=num item=listtld}
      <label class="pull-left" style="margin-right: 10px; margin-bottom: 10px;">
        <input type="checkbox" name="tlds[]" value="{$listtld}"{if in_array($listtld,$tlds) || !$tlds && $num==1} checked{/if}> {$listtld}
      </label>
      {/foreach}
      <div class="clearfix"></div>
    </div>

    {if $capatacha}
    <div class="captchainput">
      <p>{$LANG.captchaverify}</p>
      {if $capatacha eq "recaptcha"}
      <p>{$recapatchahtml}</p>
      {else}
      <p><img src="includes/verifyimage.php" align="middle" /> <input type="text" name="code" class="input-small" maxlength="5" /></p>
      {/if}
    </div>
    {/if}
    
    <input type="submit" value="{$LANG.checkavailability}" class="btn btn-primary" />
    <input type="submit" name="transfer" value="{$LANG.domainstransfer}" class="btn btn-success" />
    <input type="submit" name="hosting" value="{$LANG.domaincheckerhostingonly}" class="btn btn-danger" />
  </div>
</form>

{if $lookup}

  {if $invalidtld}
    <div class="alert alert-warning">{$invalidtld|strtoupper} {$LANG.domaincheckerinvalidtld}</div>
  {elseif $available}
    <div class="alert alert-success">{$LANG.domainavailable1} <strong>{$sld}{$ext}</strong> {$LANG.domainavailable2}</div>
  {elseif $invalid}
    <div class="alert alert-warning">{$LANG.ordererrordomaininvalid}</warning>
  {elseif $error}
    <div class="alert alert-danger">{$LANG.domainerror}</div>
  {else}
    <div class="alert alert-danger">{$LANG.domainunavailable1} <strong>{$sld}{$ext}</strong> {$LANG.domainunavailable2}</div>
  {/if}

{if !$invalid}

<br />

<div class="center80">

<form method="post" action="{$systemsslurl}cart.php?a=add&domain=register">

<table class="table table-striped table-framed">
    <thead>
        <tr>
            <th></th>
            <th>{$LANG.domainname}</th>
            <th class="textcenter">{$LANG.domainstatus}</th>
            <th class="textcenter">{$LANG.domainmoreinfo}</th>
        </tr>
    </thead>
    <tbody>
{foreach from=$availabilityresults key=num item=result}
        <tr>
            <td class="textcenter">{if $result.status eq "available"}<input type="checkbox" name="domains[]" value="{$result.domain}" {if $num eq "0" && $available}checked {/if}/><input type="hidden" name="domainsregperiod[{$result.domain}]" value="{$result.period}" />{else}X{/if}</td>
            <td>{$result.domain}</td>
            <td class="textcenter {if $result.status eq "available"}domcheckersuccess{else}domcheckererror{/if}">{if $result.status eq "available"}{$LANG.domainavailable}{else}{$LANG.domainunavailable}{/if}</td>
            <td class="textcenter">{if $result.status eq "unavailable"}<a href="http://{$result.domain}" target="_blank">WWW</a> <a href="#" onclick="window.open('whois.php?domain={$result.domain}','whois','width=650,height=400,scrollbars=yes'); return false">WHOIS</a>{else}<select name="domainsregperiod[{$result.domain}]">{foreach key=period item=regoption from=$result.regoptions}<option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.register}</option>{/foreach}</select>{/if}</td>
        </tr>
{/foreach}
</table>

<p align="center"><input type="submit" value="{$LANG.ordernowbutton} &raquo;" class="btn btn-danger" /></p>

</form>

</div>

{/if}

{else}

{include file="$template/pageheader.tpl" title=$LANG.domainspricing}

<table class="table table-striped table-framed">
    <thead>
        <tr>
            <th class="textcenter">{$LANG.domaintld}</th>
            <th class="textcenter">{$LANG.domainminyears}</th>
            <th class="textcenter">{$LANG.domainsregister}</th>
            <th class="textcenter">{$LANG.domainstransfer}</th>
            <th class="textcenter">{$LANG.domainsrenew}</th>
        </tr>
    </thead>
    <tbody>
{foreach from=$tldpricelist item=tldpricelist}
        <tr>
            <td>{$tldpricelist.tld}</td>
            <td class="textcenter">{$tldpricelist.period}</td>
            <td class="textcenter">{if $tldpricelist.register}{$tldpricelist.register}{else}{$LANG.domainregnotavailable}{/if}</td>
            <td class="textcenter">{if $tldpricelist.transfer}{$tldpricelist.transfer}{else}{$LANG.domainregnotavailable}{/if}</td>
            <td class="textcenter">{if $tldpricelist.renew}{$tldpricelist.renew}{else}{$LANG.domainregnotavailable}{/if}</td>
        </tr>
{/foreach}
    </tbody>
</table>

{if !$loggedin && $currencies}
<form method="post" action="domainchecker.php">
<p align="right">{$LANG.choosecurrency}: <select name="currency" onchange="submit()">{foreach from=$currencies item=curr}
<option value="{$curr.id}"{if $curr.id eq $currency.id} selected{/if}>{$curr.code}</option>
{/foreach}</select> <input type="submit" value="{$LANG.go}" /></p>
</form>
{/if}

{/if}

<br /><br />