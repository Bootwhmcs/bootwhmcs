{include file="$template/pageheader.tpl" title=$LANG.pwreset}

{if $success}

  <div class="alert alert-success">
    {$LANG.pwresetvalidationsent}
  </div>
  
  {$LANG.pwresetvalidationcheckemail}

{else}

  {if $errormessage}
  <div class="alert alert-danger">
    {$errormessage}
  </div>
  {/if}

  <form method="post" action="pwreset.php">
    <input type="hidden" name="action" value="reset" />

    {if $securityquestion}
    
      <input class="form-control" type="hidden" name="email" value="{$email}" />

      <p>{$LANG.pwresetsecurityquestionrequired}</p>

      <div class="form-group">
        <label for="answer">{$securityquestion}:</label>
        <input class="form-control" name="answer" id="answer" type="text" value="{$answer}" />
      </div>
    
      <hr />
    
      <input type="submit" class="btn btn-primary" value="{$LANG.pwresetsubmit}" />

    {else}

    <p>{$LANG.pwresetdesc}</p>

    <div class="form-group">
      <label for="email">{$LANG.loginemail}:</label>
      <input class="form-control" name="email" id="email" type="text" />
    </div>

    <hr />
    
    <button type="submit" class="btn btn-primary">{$LANG.pwresetsubmit}</button></p>
    
    {/if}

  </form>

{/if}
