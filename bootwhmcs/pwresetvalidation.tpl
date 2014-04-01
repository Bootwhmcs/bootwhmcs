<script type="text/javascript" src="includes/jscript/pwstrength.js"></script>

{if $invalidlink}

  <div class="errorbox">
    {$invalidlink}
  </div>
  <br /><br /><br /><br />

{elseif $success}

  <br />
  <div class="successbox">
    {$LANG.pwresetvalidationsuccess}
  </div>


  <br />
  <p align="center">{$LANG.pwresetsuccessdesc|sprintf2:'<a href="clientarea.php">':'</a>'}</p>

  <br /><br /><br /><br />

{else}

{if $errormessage}

  <div class="errorbox">
    {$errormessage}
  </div>
  
{/if}

<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?action=pwreset">
<input type="hidden" name="key" id="key" value="{$key}" />

<h4 align="center">{$LANG.pwresetenternewpw}</h4>
<table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="10" cellspacing="0">
                <tr>
                    <td width="150" class="fieldarea">{$LANG.newpassword}</td>
                    <td width="175"><input type="password" name="newpw" id="newpw" /></td>
                    <td><script language="javascript">showStrengthBar();</script></td>
                </tr>
                <tr>
                    <td width="150" class="fieldarea">{$LANG.confirmnewpassword}</td>
                    <td width="175"><input type="password" name="confirmpw" id="confirmpw" /></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<p align="center"><input type="submit" value="{$LANG.clientareasavechanges}" class="buttongo" /> <input type="reset" value="{$LANG.cancel}" class="button" /></p>

</form>

{/if}