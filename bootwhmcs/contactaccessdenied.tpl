{include file="$template/pageheader.tpl" title=$LANG.accessdenied}

<div class="alert alert-danger">
  <strong>{$LANG.subaccountpermissiondenied}</strong>
</div>

<p>{$LANG.subaccountallowedperms}</p>

<br />

<ul>
  {foreach from=$allowedpermissions item=permission}
  <li>{$permission}</li>
  {/foreach}
</ul>

<p>{$LANG.subaccountcontactmaster}</p>

<hr />
<input type="button" value="{$LANG.clientareabacklink}" onclick="history.go(-1)" class="btn btn-danger" />