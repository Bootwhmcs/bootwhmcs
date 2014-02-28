<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>

{include file="$template/pageheader.tpl" title=$LANG.clientareanavcontacts navtype="clientdetails"}

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

<script type="text/javascript">
function deleteContact() {ldelim}
if (confirm("{$LANG.clientareadeletecontactareyousure}")) {ldelim}
window.location='clientarea.php?action=contacts&delete=true&id={$contactid}';
{rdelim}{rdelim}
</script>

<form method="post" class="form-inline" action="{$smarty.server.PHP_SELF}?action=contacts">
  
  <div class="alert alert-info">
    <p>
      {$LANG.clientareachoosecontact}:
      <select name="contactid" onchange="submit()">
        {foreach item=contact from=$contacts}
        <option value="{$contact.id}"{if $contact.id eq $contactid} selected="selected"{/if}>{$contact.name} - {$contact.email}</option>
        {/foreach}
        <option value="new">{$LANG.clientareanavaddcontact}</option>
      </select>
      <input class="btn btn-primary btn-xs" type="submit" value="{$LANG.go}" />
    </p>
  </div>

</form>

<form method="post" action="{$smarty.server.PHP_SELF}?action=addcontact">
  <input type="hidden" name="submit" value="true" />
  
  <div class="row">
  
    <div class="col-sm-6">
  
      <div class="form-group">
        <label for="firstname">{$LANG.clientareafirstname}</label>
        <input type="text" name="firstname" id="firstname" value="{$contactfirstname}" class="form-control" />
      </div>
    
      <div class="form-group">
        <label for="lastname">{$LANG.clientarealastname}</label>
        <input type="text" name="lastname" id="lastname" value="{$contactlastname}" class="form-control" />
      </div>
    
      <div class="form-group">
        <label for="companyname">{$LANG.clientareacompanyname}</label>
        <input type="text" name="companyname" id="companyname" value="{$contactcompanyname}" class="form-control" />
      </div>
    
      <div class="form-group">
        <label for="email">{$LANG.clientareaemail}</label>
        <input type="text" name="email" id="email" value="{$contactemail}" class="form-control" />
      </div>
      
      <div class="checkbox">
        <label>
          <input type="checkbox" name="subaccount" id="subaccount"{if $subaccount} checked{/if} />
          {$LANG.subaccountactivatedesc}
        </label>
      </div>
      
    </div>
    
    <div class="col-sm-6">
    
      <div class="form-group">
        <label for="address1">{$LANG.clientareaaddress1}</label>
        <input type="text" name="address1" id="address1" value="{$contactaddress1}" class="form-control" />
      </div>

      <div class="form-group">
        <label for="address2">{$LANG.clientareaaddress2}</label>
        <input type="text" name="address2" id="address2" value="{$contactaddress2}" class="form-control" />
      </div>

      <div class="form-group">
        <label for="city">{$LANG.clientareacity}</label>
        <input type="text" name="city" id="city" value="{$contactcity}" class="form-control" />
      </div>

      <div class="form-group">
        <label for="state">{$LANG.clientareastate}</label>
        <input type="text" name="state" id="state" value="{$contactstate}" class="form-control" />
      </div>
      

      <div class="form-group">
        <label for="postcode">{$LANG.clientareapostcode}</label>
        <input type="text" name="postcode" id="postcode" value="{$contactpostcode}" class="form-control" />
      </div>

      <div class="form-group">
        <label for="country">{$LANG.clientareacountry}</label>
        {$countriesdropdown|replace:'<select':'<select class="form-control"'}
      </div>

      <div class="form-group">
        <label for="phonenumber">{$LANG.clientareaphonenumber}</label>
        <input type="text" name="phonenumber" id="phonenumber" value="{$contactphonenumber}" class="form-control" />
      </div>
      
    </div>
  </div>


  <div id="subaccountfields" {if !$subaccount} style="display: none;"{/if}>
  
    <hr />
    
    <div class="row">
      <div class="col-sm-4">
        <div class="form-group">
          <label for="password">{$LANG.clientareapassword}</label>
          <input type="password" name="password" id="password" class="form-control" />
        </div>
    
        <div class="form-group">
          <label for="password2">{$LANG.clientareaconfirmpassword}</label>
          <input type="password" name="password2" id="password2" class="form-control" />
        </div>
    
        <div class="form-group">
          <label for="passstrength">{$LANG.pwstrength}</label>
          <div id="pwstrengthbox">{$LANG.pwstrengthenter}</div>
        </div>
      </div>
      
      <div class="col-sm-7 col-sm-offset-1">
      
        <div class="row">
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" value="profile"{if in_array('profile',$permissions)} checked{/if} />
              {$LANG.subaccountpermsprofile}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" id="permcontacts" value="contacts"{if in_array('contacts',$permissions)} checked{/if} />
              {$LANG.subaccountpermscontacts}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" id="permproducts" value="products"{if in_array('products',$permissions)} checked{/if} />
              {$LANG.subaccountpermsmanageproducts}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" value="profile"{if in_array('profile',$permissions)} checked{/if} />
              {$LANG.subaccountpermsprofile}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" id="permdomains" value="domains"{if in_array('domains',$permissions)} checked{/if} />
              {$LANG.subaccountpermsdomains}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" id="permmanagedomains" value="managedomains"{if in_array('managedomains',$permissions)} checked{/if} />
              {$LANG.subaccountpermsmanagedomains}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" id="perminvoices" value="invoices"{if in_array('invoices',$permissions)} checked{/if} />
              {$LANG.subaccountpermsinvoices}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" id="permtickets" value="tickets"{if in_array('tickets',$permissions)} checked{/if} />
              {$LANG.subaccountpermstickets}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" id="permaffiliates" value="affiliates"{if in_array('affiliates',$permissions)} checked{/if} />
              {$LANG.subaccountpermsaffiliates}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" id="permemails" value="emails"{if in_array('emails',$permissions)} checked{/if} />
              {$LANG.subaccountpermsemails}
            </label>
          </div>
          
          <div class="form-group col-md-6">
            <label>
              <input type="checkbox" name="permissions[]" id="permorders" value="orders"{if in_array('orders',$permissions)} checked{/if} />
              {$LANG.subaccountpermsorders}
            </label>
          </div>
        
        </div>
      
      </div>
    
    </div>
  
  </div>
  
  <hr />
  
  <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
  <input class="btn btn-danger" type="reset" value="{$LANG.cancel}" />

</form>