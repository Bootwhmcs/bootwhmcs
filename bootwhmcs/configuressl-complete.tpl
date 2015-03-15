{if $errormessage}
<div class="errorbox">{$errormessage}</div>
{else}
<p><strong>{$LANG.sslconfigcomplete}</strong></p>
<p>{$LANG.sslconfigcompletedetails}</p>
<form method="post" action="clientarea.php?action=productdetails">
<input type="hidden" name="id" value="{$serviceid}" />
<p align="center"><input type="submit" value="{$LANG.invoicesbacktoclientarea}" /></p>
 </form>
{/if}