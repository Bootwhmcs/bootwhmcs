<form method="post" action="{$smarty.server.PHP_SELF}?action={$clientareaaction}" />
  <select name="itemlimit" onchange="submit()" class="pull-right">
    <option value="10"{if $itemlimit==10} selected{/if}>10</option>
    <option value="25"{if $itemlimit==25} selected{/if}>25</option>
    <option value="50"{if $itemlimit==50} selected{/if}>50</option>
    <option value="100"{if $itemlimit==100} selected{/if}>100</option>
    <option value="all"{if $itemlimit==99999999} selected{/if}>{$LANG.clientareaunlimited}</option>
  </select>
</form>
