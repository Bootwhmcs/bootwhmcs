{include file="$template/pageheader.tpl" title=$LANG.clientareanavchangepw navtype="clientdetails"}

{if $successful}
<div class="alert alert-success">
  {$LANG.changessavedsuccessfully}
</div>
{/if}

{if $errormessage}
<div class="alert alert-danger">
  {$LANG.clientareaerrors}
  <ul>
    {$errormessage}
  </ul>
</div>
{/if}

<br />

<form method="post" action="{$smarty.server.PHP_SELF}?action=changepw">

  <div class="form-group">
    <label for="existingpw">{$LANG.existingpassword}</label>
    <input type="password" name="existingpw" id="existingpw" class="form-control" />
  </div>

  <div class="form-group">
    <label class="control-label" for="password">{$LANG.newpassword}</label>
    <input type="password" name="newpw" id="password" class="form-control" />
  </div>

  <div class="form-group">
    <label for="confirmpw">{$LANG.confirmnewpassword}</label>
    <input type="password" name="confirmpw" id="confirmpw" class="form-control" />
  </div>

  <div class="form-group">
    <label for="passstrength">{$LANG.pwstrength}</label>
    <div id="pwstrengthbox">{$LANG.pwstrengthenter}</div>
  </div>


  <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
  <input class="btn btn-danger" type="reset" value="{$LANG.cancel}" />

</form>