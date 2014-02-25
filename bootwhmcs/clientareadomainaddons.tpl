<form method="post" action="{$smarty.server.PHP_SELF}?action=domainaddons" class="form-horizontal">
<input type="hidden" name="{$action}" value="{$addon}">
<input type="hidden" name="id" value="{$domainid}">
<input type="hidden" name="confirm" value="1">
<input type="hidden" name="token" value="{$token}">

{if $action eq "buy"}

<input type="hidden" name="buy" value="{$addon}">

{if $addon eq "dnsmanagement"}

{include file="$template/pageheader.tpl" title=$LANG.domainaddonsdnsmanagement}

<div class="alert alert-block alert-info">
    <p>Domain: <strong>{$domain}</strong></p>
</div>

<p>{$LANG.domainaddonsdnsmanagementinfo}</p>

<br />

<p align="center"><input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}{$LANG.domainaddonsperyear}" class="btn btn-success btn-large" /></p>

{elseif $addon eq "emailfwd"}

{include file="$template/pageheader.tpl" title=$LANG.domainemailforwarding}

<div class="alert alert-block alert-info">
    <p>Domain: <strong>{$domain}</strong></p>
</div>

<p>{$LANG.domainaddonsemailforwardinginfo}</p>

<br />

<p align="center"><input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}{$LANG.domainaddonsperyear}" class="btn btn-success btn-large" /></p>

{elseif $addon eq "idprotect"}

{include file="$template/pageheader.tpl" title=$LANG.domainidprotection}

<div class="alert alert-block alert-info">
    <p>Domain: <strong>{$domain}</strong></p>
</div>

<p>{$LANG.domainaddonsidprotectioninfo}</p>

<br />

<p align="center"><input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}{$LANG.domainaddonsperyear}" class="btn btn-success btn-large" /></p>

{/if}

{elseif $action eq "disable"}

<input type="hidden" name="disable" value="{$addon}">

{if $addon eq "dnsmanagement"}

{include file="$template/pageheader.tpl" title=$LANG.domainaddonsdnsmanagement}

{elseif $addon eq "emailfwd"}

{include file="$template/pageheader.tpl" title=$LANG.domainemailforwarding}

{elseif $addon eq "idprotect"}

{include file="$template/pageheader.tpl" title=$LANG.domainidprotection}

{/if}

<div class="alert alert-block alert-info">
    <p>Domain: <strong>{$domain}</strong></p>
</div>

{if $success}
    <div class="alert alert-success">
        <p class="textcenter bold">{$LANG.domainaddonscancelsuccess}</p>
    </div>
{elseif $error}
    <div class="alert alert-error">
        <p class="bold">{$LANG.domainaddonscancelfailed}</p>
    </div>
{else}

<p class="textcenter">{$LANG.domainaddonscancelareyousure}</p>

<br />

<p align="center"><input type="submit" name="enable" value="{$LANG.domainaddonsconfirm}" class="btn btn-danger btn-large" /></p>

{/if}

{/if}

<br />

<p><input type="button" value="{$LANG.clientareabacklink}" onclick="window.location='clientarea.php?action=domaindetails&id={$domainid}'" class="btn" /></p>

<br /><br />

</form>