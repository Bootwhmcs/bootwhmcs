{include file="$template/pageheader.tpl" title=$LANG.newsletterunsubscribe}

{if $successful}
<div class="alert alert-success">
  {$LANG.unsubscribesuccess}
</div>
<p>{$LANG.newsletterremoved}</p>
{/if}

{if $errormessage}
<div class="alert alert-danger">
  {$LANG.erroroccured}
</div>
<p>{$errormessage}</p>
{/if}

<p>{$LANG.newsletterresubscribe|sprintf2:'<a href="clientarea.php?action=details">':'</a>'}</p>