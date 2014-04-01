<div class="contentbox">
{if $clientareaaction eq "details"}<strong>{$LANG.clientareanavdetails}</strong>{else}<a href="{$smarty.server.PHP_SELF}?action=details">{$LANG.clientareanavdetails}</a>{/if}
 | {if $clientareaaction eq "contacts"}<strong>{$LANG.clientareanavcontacts}</strong>{else}<a href="{$smarty.server.PHP_SELF}?action=contacts">{$LANG.clientareanavcontacts}</a>{/if}
 | {if $clientareaaction eq "addcontact"}<strong>{$LANG.clientareanavaddcontact}</strong>{else}<a href="{$smarty.server.PHP_SELF}?action=addcontact">{$LANG.clientareanavaddcontact}</a>{/if}
{if $condlinks.updatecc} | {if $clientareaaction eq "creditcard"}<strong>{$LANG.clientareanavchangecc}</strong>{else}<a href="{$smarty.server.PHP_SELF}?action=creditcard">{$LANG.clientareanavchangecc}</a>{/if}{/if}
 | {if $clientareaaction eq "changepw"}<strong>{$LANG.clientareanavchangepw}</strong>{else}<a href="{$smarty.server.PHP_SELF}?action=changepw">{$LANG.clientareanavchangepw}</a>{/if}
{if $condlinks.security} | {if $clientareaaction eq "security"}<strong>{$LANG.clientareanavsecurity}</strong>{else}<a href="{$smarty.server.PHP_SELF}?action=security">{$LANG.clientareanavsecurity}</a>{/if}{/if}
</div>