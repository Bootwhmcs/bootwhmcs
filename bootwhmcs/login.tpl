{include file="$template/pageheader.tpl" title=$LANG.login}

{if $incorrect}
<div class="alert alert-danger">
  {$LANG.loginincorrect}
</div>
{/if}

<form method="post" action="{$systemsslurl}dologin.php" class="form-stacked">
  
  <div class="form-group">
    <label for="username">{$LANG.loginemail}:</label>
    <input class="form-control" name="username" id="username" type="text" />
  </div>

  <div class="form-group">
    <label for="password">{$LANG.loginpassword}:</label>
    <input class="form-control" name="password" id="password" type="password"/>
  </div>
  
  <div class="checkbox">
    <label>
      <input type="checkbox" name="rememberme"{if $rememberme} checked="checked"{/if} /> {$LANG.loginrememberme}
    </label>
  </div>
  
  <hr />
  
  <p class="pull-right"><a href="pwreset.php">{$LANG.loginforgotteninstructions}</a></p>
  
  <button type="submit" class="btn btn-primary btn-lg">{$LANG.loginbutton}</button>
</form>