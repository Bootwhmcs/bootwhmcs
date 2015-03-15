<script type="text/javascript" src="includes/jscript/pwstrength.js"></script>

{if $invalidlink}

  <div class="alert alert-danger">
    {$invalidlink}
  </div>
  <br /><br /><br /><br />

{elseif $success}

  <br />
  <div class="alert alert-success">
    {$LANG.pwresetvalidationsuccess}
  </div>


  <br />
  <p align="center">{$LANG.pwresetsuccessdesc|sprintf2:'<a href="clientarea.php">':'</a>'}</p>

  <br /><br /><br /><br />

{else}

{if $errormessage}

  <div class="alert alert-danger">
    {$errormessage}
  </div>
  
{/if}

<form class="form-stacked" method="post" action="{$smarty.server.PHP_SELF}?action=pwreset">
	<input type="hidden" name="key" id="key" value="{$key}" />
	<h4 align="center">{$LANG.pwresetenternewpw}</h4>
	<div class="form-group">
		<label for="newpw">{$LANG.newpassword}</label>
		<input class="form-control" type="password" name="newpw" id="newpw" />
		
	</div>
	<div class="form-group">
		<label for="confirmpw">{$LANG.confirmnewpassword}</label>
		<input class="form-control" type="password" name="confirmpw" id="confirmpw" />
	</div>
	<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" /> <input type="reset" value="{$LANG.cancel}" class="btn btn-danger" />
	<span class="password-strength"><script language="javascript">showStrengthBar();</script></span>
</form>

{/if}
