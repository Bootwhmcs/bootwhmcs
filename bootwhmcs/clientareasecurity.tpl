{include file="$template/pageheader.tpl" title=$LANG.clientareanavsecurity navtype="clientdetails"}

<br />

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

{if $twofaavailable}

{if $twofaactivation}

<script>{literal}
function dialogSubmit() {
    $('div#twofaactivation form').attr('method', 'post');
    $('div#twofaactivation form').attr('action', 'clientarea.php');
    $('div#twofaactivation form').attr('onsubmit', '');
    $('div#twofaactivation form').submit();
    return true;
}
{/literal}</script>

<div id="twofaactivation">
  {$twofaactivation}
</div>

<script type="text/javascript">
$("#twofaactivation input:text:visible:first,#twofaactivation input:password:visible:first").focus();
</script>

{else}

<h2>{$LANG.twofactorauth}</h2>

<p>{$LANG.twofaactivationintro}</p>

<br />

<form method="post" action="clientarea.php?action=security">
<input type="hidden" name="2fasetup" value="1" />
<p align="center">
{if $twofastatus}
<input type="submit" value="{$LANG.twofadisableclickhere}" class="btn btn-danger" />
{else}
<input type="submit" value="{$LANG.twofaenableclickhere}" class="btn btn-success" />
{/if}
</p>
</form>

<br /><br />

{/if}

{/if}

{if $securityquestionsenabled && !$twofaactivation}

<h4>{$LANG.clientareanavsecurityquestions}</h4>

<form method="post" action="{$smarty.server.PHP_SELF}?action=changesq">

  {if !$nocurrent}
  <div class="form-group">
    <label for="currentans">{$currentquestion}</label>
    <input type="password" name="currentsecurityqans" id="currentans" class="form-control" />
  </div>
  {/if}
  
  <div class="form-group">
    <label for="securityqid">{$LANG.clientareasecurityquestion}</label>
    <select name="securityqid" id="securityqid" class="form-control">
      {foreach key=num item=question from=$securityquestions}
      <option value={$question.id}>{$question.question}</option>
      {/foreach}
    </select>
  </div>

  <div class="form-group">
    <label for="securityqans">{$LANG.clientareasecurityanswer}</label>
    <input type="password" name="securityqans" id="securityqans" class="form-control" />
  </div>

  <div class="form-group">
    <label for="securityqans2">{$LANG.clientareasecurityconfanswer}</label>
    <input type="password" name="securityqans2" id="securityqans2" class="form-control" />  
  </div>

  <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
  <input class="btn btn-danger" type="reset" value="{$LANG.cancel}" />

</form>

{/if}