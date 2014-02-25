<div class="halfwidthcontainer">

{include file="$template/pageheader.tpl" title=$LANG.accessdenied}

<div class="alert alert-error textcenter">
    <p><strong>{$LANG.subaccountpermissiondenied}</strong></p>
</div>

<p>{$LANG.subaccountallowedperms}</p>

<br />

<ul>
{foreach from=$allowedpermissions item=permission}
<li>{$permission}</li>
{/foreach}
</ul>

<p>{$LANG.subaccountcontactmaster}</p>

<br />

<p class="textcenter"><input type="button" value="{$LANG.clientareabacklink}" onclick="history.go(-1)" class="btn" /></p>
</div>