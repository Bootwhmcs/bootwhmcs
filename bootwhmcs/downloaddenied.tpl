{include file="$template/pageheader.tpl" title=$LANG.accessdenied}

<p>{$LANG.downloadproductrequired}</p>

<div class="alert alert-info">
  <strong>{if $pid}{$prodname}{else}{$addonname}{/if}</strong>
</div>

{if $pid}<p><a href="cart.php?a=add&pid={$pid}">{$LANG.ordernowbutton} &raquo;</a></p>{/if}
{if $aid}<p><a href="cart.php?gid=addons">{$LANG.ordernowbutton} &raquo;</a></p>{/if}