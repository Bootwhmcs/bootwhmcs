{include file="$template/pageheader.tpl" title=$LANG.clientregistertitle desc=$LANG.registerintro}

{if $noregistration}

  <div class="alert alert-danger">
    {$LANG.registerdisablednotice}
  </div>

{else}

  {if $errormessage}
  <div class="alert alert-danger">
    <strong>{$LANG.clientareaerrors}</strong>
    
    <ul>
        {$errormessage}
    </ul>
  </div>
  {/if}
  
  <form method="post" action="{$smarty.server.PHP_SELF}">
    <input type="hidden" name="register" value="true" />
    
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
          <label for="password">{$LANG.clientareapassword}</label>
          <input type="password" name="password" id="password" class="form-control" value="{$clientpassword}" />
        </div>
      
        <div class="form-group">
          <label for="password2">{$LANG.clientareaconfirmpassword}</label>
          <input type="password" name="password2" id="password2" class="form-control" value="{$clientpassword2}" />
        </div>
      
        <div class="form-group">
          <label for="passstrength">{$LANG.pwstrength}</label>
          <div id="pwstrengthbox">{$LANG.pwstrengthenter}</div>
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
      
        {if $currencies}
        <div class="form-group">
          <label for="currency">{$LANG.choosecurrency}</label>
          <select name="currency" class="form-control">
          {foreach from=$currencies item=curr}
          <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
          {/foreach}
          </select>
        </div>
        {/if}
        
      </div>
    </div>
  
    {foreach key=num item=customfield from=$customfields}
    <div class="form-group">
      <label for="customfield{$customfield.id}">{$customfield.name}</label>
      {$customfield.input} {$customfield.description}
    </div>
    {/foreach}
  
    {if $securityquestions}
    <div class="form-group">
      <label for="securityqans">{$LANG.clientareasecurityquestion}</label>
      <select name="securityqid" id="securityqid" class="form-control">
        {foreach key=num item=question from=$securityquestions}
        <option value={$question.id}>{$question.question}</option>
        {/foreach}
      </select>
    </div>
    
    <div class="form-group">
      <label for="securityqans">{$LANG.clientareasecurityanswer}</label>
      <input type="password" name="securityqans" class="form-control" id="securityqans" />
    </div>
    {/if}

    {if $capatacha}
    <hr />
    <h3>{$LANG.captchatitle}</h3>
    <p>{$LANG.captchaverify}</p>
    
    {if $capatacha eq "recaptcha"}
    {$recapatchahtml}
    {else}
    <p><img src="includes/verifyimage.php" align="middle" /> <input type="text" name="code" size="10" maxlength="5" class="input-small" /></p>
    {/if}
    {/if}

    {if $accepttos}
    <div class="checkbox">
      <label>
        <input type="checkbox" name="accepttos" id="accepttos" value="on" >
        {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
      </label>
    </div>
    {/if}

    <hr />
    
    <button class="btn btn-lg btn-primary" type="submit" name="submit">{$LANG.clientregistertitle}</button>
  </form>

{/if}