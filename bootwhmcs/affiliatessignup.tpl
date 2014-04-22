{if $affiliatesystemenabled}

  {include file="$template/pageheader.tpl" title=$LANG.affiliatesactivate}
  
  
  <h4>{$LANG.affiliatesignuptitle}</h4>
  <p>{$LANG.affiliatesignupintro}</p>
  
  <ul>
    <li>{$LANG.affiliatesignupinfo1}</li>
    <li>{$LANG.affiliatesignupinfo2}</li>
    <li>{$LANG.affiliatesignupinfo3}</li>
  </ul>
  
  <br />
  
  <form method="post" action="affiliates.php">
    <input type="hidden" name="activate" value="true" />
    <input type="submit" value="{$LANG.affiliatesactivate}" class="btn btn-success" />
  </form>

{else}

  {include file="$template/pageheader.tpl" title=$LANG.affiliatestitle}
  
  <div class="alert alert-warning">
    {$LANG.affiliatesdisabled}
  </div>

{/if}