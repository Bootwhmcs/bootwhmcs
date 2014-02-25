{include file="$template/pageheader.tpl" title=$LANG.contacttitle desc=$LANG.contactheader}

{if $sent}

<div class="alert alert-success">
  <strong>{$LANG.contactsent}</strong>
</div>

{else}

{if $errormessage}
<div class="alert alert-danger">
  {$LANG.clientareaerrors}
  <ul>
    {$errormessage}
  </ul>
</div>
{/if}

<form method="post" action="contact.php?action=send">
  
  <div class="form-group">
    <label for="name">{$LANG.supportticketsclientname}</label>
    <input class="form-control" type="text" name="name" id="name" value="{$name}" />
  </div>
  
  <div class="form-group">
    <label for="email">{$LANG.supportticketsclientemail}</label>
    <input class="form-control" type="text" name="email" id="email" value="{$email}" />
  </div>

  <div class="form-group">
    <label for="subject">{$LANG.supportticketsticketsubject}</label>
    <input class="form-control" type="text" name="subject" id="subject" value="{$subject}" />
  </div>

  <div class="form-group">
    <label for="message">{$LANG.contactmessage}</label>
    <textarea name="message" id="message" rows="12" class="form-control">{$message}</textarea>
  </div>

  {if $capatacha}
  <p><strong>&nbsp;&raquo;&nbsp;{$LANG.captchatitle}</strong></p>
  <p>{$LANG.captchaverify}</p>
  {if $capatacha eq "recaptcha"}
  <div>{$recapatchahtml}</div>
  {else}
  <p><img src="includes/verifyimage.php" align="middle" /> <input type="text" class="input-small" name="code" size="10" maxlength="5" /></p>
  {/if}
  {/if}
  
  <hr />

  <input type="submit" value="{$LANG.contactsend}" class="btn btn-primary" />

</form>

{/if}

<br />
<br />
<br />