{include file="$template/pageheader.tpl" title=$LANG.clientareanavccdetails navtype="clientdetails"}

{if $remoteupdatecode}

  <div class="text-center">
    {$remoteupdatecode}
  </div>

{else}

{if $successful}
<div class="alert alert-success">
  {$LANG.changessavedsuccessfully}
</div>
{/if}

{if $errormessage}
<div class="alert alert-danger">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$errormessage}
    </ul>
</div>
{/if}

<form class="form" method="post" action="{$smarty.server.PHP_SELF}?action=creditcard">

  <div class="form-group">
    <label>{$LANG.creditcardcardtype}</label>
    <input type="text" value="{$cardtype}" disabled="true" class="form-control" />
  </div>

  <div class="form-group">
    <label>{$LANG.creditcardcardnumber}</label>
    <input type="text" value="{$cardnum}" disabled="true" class="form-control" />
  </div>

  <div class="form-group">
    <label>{$LANG.creditcardcardexpires}</label>
    <input type="text" value="{$cardexp}" disabled="true" class="form-control" />
  </div>

  {if $cardissuenum}
  <div class="form-group">
    <label>{$LANG.creditcardcardissuenum}</label>
    <input type="text" value="{$cardissuenum}" disabled="true" class="form-control" />
  </div>
  {/if}
  
  {if $cardstart}
  <div class="form-group">
    <label>{$LANG.creditcardcardstart}</label>
    <input type="text" value="{$cardstart}" disabled="true" class="form-control" />
  </div>
  {/if}
  
  {if $allowcustomerdelete && $cardtype}
  <div class="form-group">
    <label>&nbsp;</label>
    <input class="btn btn-danger" type="button" value="{$LANG.creditcarddelete}" onclick="window.location='clientarea.php?action=creditcard&delete=true'" />
  </div>
  {/if}

  <h3>{$LANG.creditcardenternewcard}</h3>

  <br />

  <fieldset class="onecol">

    <div class="form-group">
      <label for="cctype">{$LANG.creditcardcardtype}</label>
      <select name="cctype" id="cctype" class="form-control">
      {foreach key=num item=cardtype from=$acceptedcctypes}
          <option>{$cardtype}</option>
      {/foreach}
      </select>
    </div>

    <div class="form-group">
      <label class="control-label" for="ccnumber">{$LANG.creditcardcardnumber}</label>
      <input type="text" name="ccnumber" id="ccnumber" autocomplete="off" class="form-control" />
    </div>

    <div class="form-group">
      <label for="ccexpirymonth">{$LANG.creditcardcardexpires}</label> <br />
      <select name="ccexpirymonth" id="ccexpirymonth">
        {foreach from=$months item=month}
        <option>{$month}</option>
        {/foreach}
      </select> / <select name="ccexpiryyear">{foreach from=$expiryyears item=year}<option>{$year}</option>{/foreach}</select>
    </div>
    
    {if $showccissuestart}
    <div class="form-group">
      <label for="ccstartmonth">{$LANG.creditcardcardstart}</label>
      <select name="ccstartmonth" id="ccstartmonth">{foreach from=$months item=month}<option>{$month}</option>{/foreach}</select> / <select name="ccstartyear">{foreach from=$startyears item=year}<option>{$year}</option>{/foreach}</select>
    </div>

    <div class="form-group">
      <label for="ccissuenum">{$LANG.creditcardcardissuenum}</label>
      <input type="text" name="ccissuenum" id="ccissuenum" maxlength="3" class="form-control" />
    </div>
    {/if}

    <div class="form-group">
      <label>{$LANG.creditcardcvvnumber}</label>
      <input type="text" name="cardcvv" id="cardcvv" value="{$cardcvv}" autocomplete="off" class="form-control" />
    </div>

    <div class="form-actions">
      <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
      <input class="btn" type="reset" value="{$LANG.cancel}" />
    </div>

  </form>

{/if}