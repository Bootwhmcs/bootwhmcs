<script type="text/javascript" src="templates/orderforms/{$carttpl}/static/app.js"></script>
<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
<script type="text/javascript" src="includes/jscript/pwstrength.js"></script>
{literal}
<script language="javascript">
function removeItem(type,num) {
    var response = confirm("{/literal}{$LANG.cartremoveitemconfirm}{literal}");
    if (response) {
        window.location = 'cart.php?a=remove&r='+type+'&i='+num;
    }
}
function emptyCart(type,num) {
    var response = confirm("{/literal}{$LANG.cartemptyconfirm}{literal}");
    if (response) {
        window.location = 'cart.php?a=empty';
    }
}
</script>
{/literal}

<div class="page-header">
  <h1>{$LANG.cartreviewcheckout}</h1>
  {if !$loggedin && $currencies}
  {foreach from=$currencies item=curr}
  <a href="cart.php?a=view&currency={$curr.id}"><img src="images/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png" border="0" alt="" /> {$curr.code}</a>
  {/foreach}
  {/if}
</div>

{if $errormessage}
<div class="alert alert-danger">{$errormessage}</div>
{elseif $promotioncode && $rawdiscount eq "0.00"}
<div class="alert alert-danger">{$LANG.promoappliedbutnodiscount}</div>
{/if}

{if $bundlewarnings}
<div class="alert alert-warning">
  <strong>{$LANG.bundlereqsnotmet}</strong><br />
  {foreach from=$bundlewarnings item=warning}
  {$warning}<br />
  {/foreach}
</div>
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?a=view">
  <table class="table table-striped">
    <thead>
      <tr>
        <th width="60%">{$LANG.orderdesc}</th>
        <th width="40%">{$LANG.orderprice}</th>
      </tr>
    </thead>
    <tbody>
      {foreach key=num item=product from=$products}
      <tr>
        <td>
          <strong>{$product.productinfo.groupname} - {$product.productinfo.name}</strong>
          {if $product.domain} ({$product.domain}){/if}<br />
          {if $product.configoptions}
          {foreach key=confnum item=configoption from=$product.configoptions}&nbsp;&raquo; {$configoption.name}: {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}<br />{/foreach}
          {/if}
          <a href="{$smarty.server.PHP_SELF}?a=confproduct&i={$num}" class="cartedit"><i class="fa fa-pencil"></i> {$LANG.carteditproductconfig}</a> <a href="#" onclick="removeItem('p','{$num}');return false" class="cartremove"><i class="fa fa-trash-o"></i> {$LANG.cartremove}</a>

          {if $product.allowqty}
          <input type="text" name="qty[{$num}]" size="3" value="{$product.qty}" />
          <button name="submit" type="submit"><i class="fa fa-refresh"></i></button>
          {/if}
        </td>

        <td class="textcenter"><strong>{$product.pricingtext}{if $product.proratadate}<br />({$LANG.orderprorata} {$product.proratadate}){/if}</strong></td>
      </tr>

      {foreach key=addonnum item=addon from=$product.addons}
      <tr class="carttableproduct">
        <td><strong>{$LANG.orderaddon}</strong> - {$addon.name}</td><td class="textcenter"><strong>{$addon.pricingtext}</strong></td>
      </tr>
      {/foreach}
    {/foreach}

{foreach key=num item=addon from=$addons}
<tr class="carttableproduct"><td>
<strong>{$addon.name}</strong><br />
{$addon.productname}{if $addon.domainname} - {$addon.domainname}<br />{/if}
<a href="#" onclick="removeItem('a','{$num}');return false" class="cartremove">[{$LANG.cartremove}]</a>
</td><td class="textcenter"><strong>{$addon.pricingtext}</strong></td></tr>
{/foreach}

{foreach key=num item=domain from=$domains}
<tr class="carttableproduct"><td>
<strong>{if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}</strong> - {$domain.domain} - {$domain.regperiod} {$LANG.orderyears}<br />
{if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
{if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
{if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
<a href="{$smarty.server.PHP_SELF}?a=confdomains" class="cartedit">[{$LANG.cartconfigdomainextras}]</a> <a href="#" onclick="removeItem('d','{$num}');return false" class="cartremove">[{$LANG.cartremove}]</a>
</td><td class="textcenter"><strong>{$domain.price}</strong></td></tr>
{/foreach}

{foreach key=num item=domain from=$renewals}
<tr class="carttableproduct"><td>
<strong>{$LANG.domainrenewal}</strong> - {$domain.domain} - {$domain.regperiod} {$LANG.orderyears}<br />
{if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
{if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
{if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
<a href="#" onclick="removeItem('r','{$num}');return false" class="cartremove">[{$LANG.cartremove}]</a>
</td><td class="textcenter"><strong>{$domain.price}</strong></td></tr>
{/foreach}

{if $cartitems==0}
<tr class="clientareatableactive"><td colspan="2" class="textcenter">
<br />
{$LANG.cartempty}
<br /><br />
</td></tr>
{/if}

<tr class="subtotal"><td class="textright">{$LANG.ordersubtotal}: &nbsp;</td><td class="textcenter">{$subtotal}</td></tr>
{if $promotioncode}
<tr class="promotion"><td class="textright">{$promotiondescription}: &nbsp;</td><td class="textcenter">{$discount}</td></tr>
{/if}
{if $taxrate}
<tr class="subtotal"><td class="textright">{$taxname} @ {$taxrate}%: &nbsp;</td><td class="textcenter">{$taxtotal}</td></tr>
{/if}
{if $taxrate2}
<tr class="subtotal"><td class="textright">{$taxname2} @ {$taxrate2}%: &nbsp;</td><td class="textcenter">{$taxtotal2}</td></tr>
{/if}
<tr class="success"><td class="textright">{$LANG.ordertotalduetoday}: &nbsp;</td><td class="textcenter">{$total}</td></tr>
{if $totalrecurringmonthly || $totalrecurringquarterly || $totalrecurringsemiannually || $totalrecurringannually || $totalrecurringbiennially || $totalrecurringtriennially}
<tr class="recurring"><td class="textright">{$LANG.ordertotalrecurring}: &nbsp;</td><td class="textcenter">
{if $totalrecurringmonthly}{$totalrecurringmonthly} {$LANG.orderpaymenttermmonthly}<br />{/if}
{if $totalrecurringquarterly}{$totalrecurringquarterly} {$LANG.orderpaymenttermquarterly}<br />{/if}
{if $totalrecurringsemiannually}{$totalrecurringsemiannually} {$LANG.orderpaymenttermsemiannually}<br />{/if}
{if $totalrecurringannually}{$totalrecurringannually} {$LANG.orderpaymenttermannually}<br />{/if}
{if $totalrecurringbiennially}{$totalrecurringbiennially} {$LANG.orderpaymenttermbiennially}<br />{/if}
{if $totalrecurringtriennially}{$totalrecurringtriennially} {$LANG.orderpaymenttermtriennially}<br />{/if}
</td></tr>
{/if}
</table>

</form>

<button type="button" onclick="emptyCart();return false" class="btn btn-danger"><i class="fa fa-trash-o"></i> {$LANG.emptycart}</button>
<button type="button" onclick="window.location='cart.php'" class="btn btn-success"><i class="fa fa-shopping-cart"></i> {$LANG.continueshopping}</button>

{foreach from=$gatewaysoutput item=gatewayoutput}
<div class="clear"></div>
<div class="cartbuttons">{$gatewayoutput}</div>
{/foreach}

{if $cartitems!=0}

<form method="post" action="{$smarty.server.PHP_SELF}?a=checkout" id="mainfrm">
<input type="hidden" name="submit" value="true" />
<input type="hidden" name="custtype" id="custtype" value="{$custtype}" />

<br /><br />

<div class="page-header">

  <h1>{$LANG.yourdetails}</h1>

  <ul class="pull-right nav nav-tabs" style="margin-top: -32px;">
    <li class="{if !$loggedin && $custtype neq "existing"}active{/if}" id="newcustomer"><a href="#newcustomer" data-toggle="tab">{$LANG.newcustomer}</a></li>
    <li class="{if $custtype eq "existing" && !$loggedin || $loggedin}active{/if}" id="existingcustomer"><a href="#existingcustomer" data-toggle="tab">{$LANG.existingcustomer}</a></li>
  </ul>

</div>

<div class="tab-content">

  <div class="tab-pane{if !$loggedin && $custtype neq "existing"} active{/if}" id="newcustomer">

    <div class="row">

      <div class="col-sm-6">

        <div class="form-group">
          <label for="firstname">{$LANG.clientareafirstname}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.firstname}</p>
          {else}
          <input type="text" name="firstname" tabindex="1" class="form-control" placeholder="{$clientsdetails.firstname}" />
          {/if}
        </div>

        <div class="form-group">
          <label for="lastname">{$LANG.clientarealastname}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.lastname}</p>
          {else}
          <input type="text" name="lastname" tabindex="2" class="form-control" placeholder="{$clientsdetails.lastname}" />
          {/if}
        </div>

        <div class="form-group">
          <label for="">{$LANG.clientareacompanyname}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.companyname}</p>
          {else}
          <input type="text" name="companyname" tabindex="3" class="form-control" placeholder="{$clientsdetails.companyname}" />
          {/if}
        </div>

        <div class="form-group">
          <label for="">{$LANG.clientareaemail}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.email}</p>
          {else}
          <input type="text" name="email" tabindex="4" class="form-control" placeholder="{$clientsdetails.email}" />
          {/if}
        </div>

        {if !$loggedin}
        <div class="row">

          <div class="col-sm-6">
            <div class="form-group">

              <label for="">{$LANG.clientareapassword}</label>
              <input type="password" name="password" tabindex="5" id="password" class="form-control" placeholder="{$password}" />
            </div>
          </div>

          <div class="col-sm-6">
            <div class="form-group">
              <label for="">{$LANG.clientareaconfirmpassword}</label>
              <input type="password" name="password2" tabindex="6" class="form-control" placeholder="{$password2}" />
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="passstrength">{$LANG.pwstrength}</label>
          <div id="pwstrengthbox">{$LANG.pwstrengthenter}</div>
        </div>
        {/if}

      </div>

      <div class="col-sm-6">

        <div class="form-group">
          <label for="address1">{$LANG.clientareaaddress1}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.address1}
          {else}
          <input type="text" name="address1" tabindex="7" class="form-control" placeholder="{$clientsdetails.address1}" />
          {/if}
        </div>

        <div class="form-group">
          <label for="">{$LANG.clientareaaddress2}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.address2}</p>
          {else}
          <input type="text" name="address2" tabindex="8" class="form-control" placeholder="{$clientsdetails.address2}" />
          {/if}
        </div>

        <div class="form-group">
          <label for="">{$LANG.clientareacity}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.city}</p>
          {else}
          <input type="text" name="city" tabindex="9" class="form-control" placeholder="{$clientsdetails.city}" />
          {/if}
        </div>

        <div class="form-group">
          <label for="">{$LANG.clientareastate}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.state}</p>
          {else}
          <input type="text" name="state" tabindex="10" class="form-control" placeholder="{$clientsdetails.state}" />
          {/if}
        </div>

        <div class="form-group">
          <label for="">{$LANG.clientareapostcode}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.postcode}</p>
          {else}
          <input type="text" name="postcode" tabindex="11" class="form-control" placeholder="{$clientsdetails.postcode}" />
          {/if}
        </div>

        <div class="form-group">
          <label for="">{$LANG.clientareacountry}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.country}</p>
          {else}
          {$clientcountrydropdown|replace:'<select':'<select tabindex="12" class="form-control"'}
          {/if}
        </div>

        <div class="form-group">
          <label for="">{$LANG.clientareaphonenumber}</label>
          {if $loggedin}
          <p class="form-control-static">{$clientsdetails.phonenumber}</p>
          {else}
          <input type="text" name="phonenumber" tabindex="13" class="form-control" placeholder="{$clientsdetails.phonenumber}" />
          {/if}
        </div>

      </div>

    </div>

    {if $customfields || $securityquestions}
    {if $securityquestions && !$loggedin}
    <div class="form-group">
      <label for="securityquid">{$LANG.clientareasecurityquestion}</label>
      <select name="securityqid" tabindex="14" class="form-control">
        {foreach key=num item=question from=$securityquestions}
        <option value={$question.id}>{$question.question}</option>
        {/foreach}
      </select>
    </div>

    <div class="form-group">
      <label for="securityqans">{$LANG.clientareasecurityanswer}</label>
      <input type="password" name="securityqans" tabindex="15" class="form-control">
    </div>
    {/if}

    {foreach key=num item=customfield from=$customfields}
    <div class="form-group">
      <label for="">{$customfield.name}</label>
      {$customfield.input|replace:'<input':'<input class="form-control"'}
      <p class="help-block">{$customfield.description}</p>
    </div>
    {/foreach}
    {/if}

  </div>

  <div class="tab-pane{if $custtype eq "existing" && !$loggedin || $loggedin} active{/if}" id="existingcustomer">

    <div class="form-group">
      <label for="loginemail">{$LANG.clientareaemail}</label>
      <input type="text" name="loginemail" class="form-control" />
    </div>

    <div class="form-group">
      <label for="loginpw">{$LANG.clientareapassword}</label>
      <input type="password" name="loginpw" class="form-control" />
    </div>

  </div>

</div>

{if $taxenabled && !$loggedin}
<div class="alert alert-warning">{$LANG.carttaxupdateselections} <input type="submit" value="{$LANG.carttaxupdateselectionsupdate}" name="updateonly" /></div>
{/if}

{if $domainsinorder}
<div class="page-header">
  <h1>{$LANG.domainregistrantinfo}</h1>
</div>

<select name="contact" id="domaincontact" onchange="domaincontactchange()" class="form-control">
  <option value="">{$LANG.usedefaultcontact}</option>
  {foreach from=$domaincontacts item=domcontact}
  <option value="{$domcontact.id}"{if $contact==$domcontact.id} selected{/if}>{$domcontact.name}</option>
  {/foreach}
  <option value="addingnew"{if $contact eq "addingnew"} selected{/if}>{$LANG.clientareanavaddcontact}...</option>
</select>

<br /><br />

<div class="row" {if $contact neq "addingnew"} style="display: none;"{/if} id="domaincontactfields">
  <div class="col-sm-6">
    <div class="form-group">
      <label>{$LANG.clientareafirstname}</label>
      <input type="text" name="domaincontactfirstname" class="form-control" placeholder="{$domaincontact.firstname}" />
    </div>

    <div class="form-group">
      <label>{$LANG.clientarealastname}</label>
      <input type="text" name="domaincontactlastname" class="form-control" placeholder="{$domaincontact.lastname}" />
    </div>

    <div class="form-group">
      <label>{$LANG.clientareacompanyname}</label>
      <input type="text" name="domaincontactcompanyname" class="form-control" placeholder="{$domaincontact.companyname}" />
    </div>

    <div class="form-group">
      <label>{$LANG.clientareaemail}</label>
      <input type="text" name="domaincontactemail" class="form-control" placeholder="{$domaincontact.email}" />
    </div>

    <div class="form-group">
      <label>{$LANG.clientareaphonenumber}</label>
      <input type="text" name="domaincontactphonenumber" class="form-control" placeholder="{$domaincontact.phonenumber}" />
    </div>
  </div>


  <div class="col-sm-6">
    <div class="form-group">
      <label>{$LANG.clientareaaddress1}</label>
      <input type="text" name="domaincontactaddress1" class="form-control" placeholder="{$domaincontact.address1}" />
    </div>

    <div class="form-group">
      <label>{$LANG.clientareaaddress2}</label>
      <input type="text" name="domaincontactaddress2" class="form-control" placeholder="{$domaincontact.address2}" />
    </div>

    <div class="form-group">
      <label>{$LANG.clientareacity}</label>
      <input type="text" name="domaincontactcity" class="form-control" placeholder="{$domaincontact.city}" />
    </div>

    <div class="form-group">
      <label>{$LANG.clientareastate}</label>
      <input type="text" name="domaincontactstate" class="form-control" placeholder="{$domaincontact.state}" />
    </div>

    <div class="form-group">
      <label>{$LANG.clientareapostcode}</label>
      <input type="text" name="domaincontactpostcode" class="form-control" placeholder="{$domaincontact.postcode}" />
    </div>

    <div class="form-group">
      <label>{$LANG.clientareacountry}</label>
      {$domaincontactcountrydropdown|replace:'<select':'<select class="form-control"'}
    </div>
  </div>
</div>
{/if}

<div class="row">

  <div class="col-sm-6">
    <div class="page-header">
      <h1>{$LANG.orderpromotioncode}</h1>
    </div>

    {if $promotioncode}
    {$promotioncode} - {$promotiondescription}<br /><a href="{$smarty.server.PHP_SELF}?a=removepromo">{$LANG.orderdontusepromo}</a>
    {else}
    <div class="input-group">
      <input type="text" name="promocode" size="20" class="form-control" />
      <div class="input-group-btn">
        <button name="submit" type="submit" name="validatepromo" class="btn btn-danger">{$LANG.orderpromovalidatebutton}</button>
      </div>
    </div>
    {/if}
  </div>

  {if $shownotesfield}
  <div class="col-sm-6">
    <div class="page-header">
      <h1>{$LANG.ordernotes}</h1>
    </div>

    <textarea name="notes" rows="5" class="form-control" placeholder="{$LANG.ordernotesdescription}">{$notes}</textarea>
  </div>
  {/if}

</div>

<div class="page-header">
  <h1>{$LANG.orderpaymentmethod}</h1>
</div>
{foreach key=num item=gateway from=$gateways}
<div class="radio">
  <label>
    <input type="radio" name="paymentmethod" value="{$gateway.sysname}" id="pgbtn{$num}" onclick="{if $gateway.type eq "CC"}showCCForm(){else}hideCCForm(){/if}"{if $selectedgateway eq $gateway.sysname} checked{/if} />
    {$gateway.name}
  </label>
</div>
{/foreach}

<div id="ccinputform" class="signupfields{if $selectedgatewaytype neq "CC"} hidden{/if}">
<table width="100%" cellspacing="0" cellpadding="0" class="configtable textleft">
{if $clientsdetails.cclastfour}<tr><td class="fieldlabel"></td><td class="fieldarea"><label><input type="radio" name="ccinfo" value="useexisting" id="useexisting" onclick="useExistingCC()"{if $clientsdetails.cclastfour} checked{else} disabled{/if} /> {$LANG.creditcarduseexisting}{if $clientsdetails.cclastfour} ({$clientsdetails.cclastfour}){/if}</label><br />
<label><input type="radio" name="ccinfo" value="new" id="new" onclick="enterNewCC()"{if !$clientsdetails.cclastfour || $ccinfo eq "new"} checked{/if} /> {$LANG.creditcardenternewcard}</label></td></tr>{else}<input type="hidden" name="ccinfo" value="new" />{/if}
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td class="fieldlabel">{$LANG.creditcardcardtype}</td><td class="fieldarea"><select name="cctype">
{foreach key=num item=cardtype from=$acceptedcctypes}
<option{if $cctype eq $cardtype} selected{/if}>{$cardtype}</option>
{/foreach}
</select></td></tr>
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td class="fieldlabel">{$LANG.creditcardcardnumber}</td><td class="fieldarea"><input type="text" name="ccnumber" size="30" value="{$ccnumber}" autocomplete="off" /></td></tr>
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td class="fieldlabel">{$LANG.creditcardcardexpires}</td><td class="fieldarea"><select name="ccexpirymonth" id="ccexpirymonth" class="newccinfo">
{foreach from=$months item=month}
<option{if $ccexpirymonth eq $month} selected{/if}>{$month}</option>
{/foreach}</select> / <select name="ccexpiryyear" class="newccinfo">
{foreach from=$expiryyears item=year}
<option{if $ccexpiryyear eq $year} selected{/if}>{$year}</option>
{/foreach}
</select></td></tr>
{if $showccissuestart}
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td class="fieldlabel">{$LANG.creditcardcardstart}</td><td class="fieldarea"><select name="ccstartmonth" id="ccstartmonth" class="newccinfo">
{foreach from=$months item=month}
<option{if $ccstartmonth eq $month} selected{/if}>{$month}</option>
{/foreach}</select> / <select name="ccstartyear" class="newccinfo">
{foreach from=$startyears item=year}
<option{if $ccstartyear eq $year} selected{/if}>{$year}</option>
{/foreach}
</select></td></tr>
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td class="fieldlabel">{$LANG.creditcardcardissuenum}</td><td class="fieldarea"><input type="text" name="ccissuenum" value="{$ccissuenum}" size="5" maxlength="3" /></td></tr>
{/if}
<tr><td class="fieldlabel">{$LANG.creditcardcvvnumber}</td><td class="fieldarea"><input type="text" name="cccvv" value="{$cccvv}" size="5" autocomplete="off" /> <a href="#" onclick="window.open('images/ccv.gif','','width=280,height=200,scrollbars=no,top=100,left=100');return false">{$LANG.creditcardcvvwhere}</a></td></tr>
{if $shownostore}<tr><td class="fieldlabel"><input type="checkbox" name="nostore" id="nostore" /></td><td><label for="nostore">{$LANG.creditcardnostore}</label></td></tr>{/if}
</table>
</div>
<div class="clear"></div>

<hr />

{if $accepttos}
<div class="radio" style="padding-left: 0px;">
  <label>
    <input type="checkbox" name="accepttos" id="accepttos" />
    {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
  </label>
</div>
{/if}

<br />

<input type="submit" value="{$LANG.completeorder}"{if $cartitems==0} disabled{/if} onclick="this.value='{$LANG.pleasewait}'" class="ordernow btn btn-success" />

</form>

{else}

<br /><br />

{/if}

<br />
<i class="fa fa-lock"></i> &nbsp;{$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}
