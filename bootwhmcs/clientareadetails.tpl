{include file="$template/pageheader.tpl" title=$LANG.clientareanavdetails navtype="clientdetails"}

<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>

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

<form method="post" action="{$smarty.server.PHP_SELF}?action=details">
  
  <div class="row">
  
    <div class="col-sm-6">
    
      <div class="form-group">
        <label for="firstname">{$LANG.clientareafirstname}</label>
        <input type="text" name="firstname" id="firstname" class="form-control" value="{$clientfirstname}"{if in_array('firstname',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>
      
      <div class="form-group">
        <label for="lastname">{$LANG.clientarealastname}</label>
        <input type="text" name="lastname" id="lastname" class="form-control" value="{$clientlastname}"{if in_array('lastname',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>
    
      <div class="form-group">
        <label for="companyname">{$LANG.clientareacompanyname}</label>
        <input type="text" name="companyname" id="companyname" class="form-control" value="{$clientcompanyname}"{if in_array('companyname',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>
    
      <div class="form-group">
        <label for="email">{$LANG.clientareaemail}</label>
        <input type="text" name="email" id="email" class="form-control" value="{$clientemail}"{if in_array('email',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>
      
      <div class="form-group">
        <label for="paymentmethod">{$LANG.paymentmethod}</label>
        <select name="paymentmethod" id="paymentmethod" class="form-control">
          <option value="none">{$LANG.paymentmethoddefault}</option>
          {foreach from=$paymentmethods item=method}
          <option value="{$method.sysname}"{if $method.sysname eq $defaultpaymentmethod} selected="selected"{/if}>{$method.name}</option>
          {/foreach}
        </select>
      </div>
    
      <div class="form-group">
        <label for="billingcontact">{$LANG.defaultbillingcontact}</label>
        <select name="billingcid" id="billingcontact" class="form-control">
          <option value="0">{$LANG.usedefaultcontact}</option>
          {foreach from=$contacts item=contact}
          <option value="{$contact.id}"{if $contact.id eq $billingcid} selected="selected"{/if}>{$contact.name}</option>
          {/foreach}
        </select>
      </div>
      
    </div>
    
    <div class="col-sm-6">
      
      <div class="form-group">
        <label for="address1">{$LANG.clientareaaddress1}</label>
        <input type="text" name="address1" id="address1" class="form-control" value="{$clientaddress1}"{if in_array('address1',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>

      <div class="form-group">
        <label for="address2">{$LANG.clientareaaddress2}</label>
        <input type="text" name="address2" id="address2" class="form-control" value="{$clientaddress2}"{if in_array('address2',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>

      <div class="form-group">
        <label for="city">{$LANG.clientareacity}</label>
        <input type="text" name="city" id="city" class="form-control" value="{$clientcity}"{if in_array('city',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>

      <div class="form-group">
        <label for="state">{$LANG.clientareastate}</label>
        <input type="text" name="state" id="state" class="form-control" value="{$clientstate}"{if in_array('state',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>

      <div class="form-group">
        <label for="postcode">{$LANG.clientareapostcode}</label>
        <input type="text" name="postcode" id="postcode" class="form-control" value="{$clientpostcode}"{if in_array('postcode',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>

      <div class="form-group">
        <label for="country">{$LANG.clientareacountry}</label>
        {$clientcountriesdropdown|replace:'<select':'<select class="form-control"'}
      </div>

      <div class="form-group">
        <label for="phonenumber">{$LANG.clientareaphonenumber}</label>
        <input type="text" name="phonenumber" id="phonenumber" class="form-control" value="{$clientphonenumber}"{if in_array('phonenumber',$uneditablefields)} disabled="" class="disabled"{/if} />
      </div>
      
      {if $emailoptoutenabled}
      <div class="form-group">
        <label for="emailoptout">{$LANG.emailoptout}</label>
        <input type="checkbox" value="1" name="emailoptout" class="form-control" id="emailoptout" {if $emailoptout} checked{/if} /> {$LANG.emailoptoutdesc}
      </div>
      {/if}
    
    </div>
      
  </div>

  {if $customfields}
  {foreach from=$customfields key=num item=customfield}
  <div class="form-group">
    <label for="customfield{$customfield.id}">{$customfield.name}</label>
    {$customfield.input|replace:'<input':'<input class="form-control"'}
    <p class="help-block">{$customfield.description}</p>
  </div>
  {/foreach}
  {/if}


  <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
  <input class="btn btn-danger" type="reset" value="{$LANG.cancel}" />

</form>
