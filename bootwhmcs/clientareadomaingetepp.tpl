{include file="$template/pageheader.tpl" title=$LANG.domaingeteppcode}

<div class="alert alert-info">
  {$LANG.domainname}: <strong>{$domain}</strong>
</div>

<p>{$LANG.domaingeteppcodeexplanation}</p>

<br />

{if $error}
<div class="alert alert-danger">
  {$LANG.domaingeteppcodefailure} {$error}
</div>
{else}
  {if $eppcode}
  <div class="alert alert-warning">
    {$LANG.domaingeteppcodeis} {$eppcode}
  </div>
  {else}
  <div class="alert alert-warning">
    {$LANG.domaingeteppcodeemailconfirmation}
  </div>
  {/if}
{/if}