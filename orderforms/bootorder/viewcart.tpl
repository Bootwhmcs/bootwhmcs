<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script language="javascript">var statesTab=10;</script>
<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
<script type="text/javascript" src="includes/jscript/pwstrength.js"></script>

{literal}<script language="javascript">
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
</script>{/literal}

<div class="page-header">
  <h1>{$LANG.cartreviewcheckout}</h1>
</div>

{if $errormessage}<div class="alert alert-danger" style="display:block;">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div>{elseif $promotioncode && $rawdiscount eq "0.00"}<div class="errorbox" style="display:block;">{$LANG.promoappliedbutnodiscount}</div>{/if}

{if $bundlewarnings}
<div class="cartwarningbox">
<strong>{$LANG.bundlereqsnotmet}</strong><br />
{foreach from=$bundlewarnings item=warning}
{$warning}<br />
{/foreach}
</div>
{/if}

{if !$loggedin && $currencies}
<div id="currencychooser">
{foreach from=$currencies item=curr}
<a href="cart.php?a=view&currency={$curr.id}"><img src="images/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png" border="0" alt="" /> {$curr.code}</a>
{/foreach}
</div>
<div class="clear"></div>
{else}
<br />
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?a=view">
  <table class="table table-striped" cellspacing="1">
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
          <strong><em>{$product.productinfo.groupname}</em> - {$product.productinfo.name}</strong>
          {if $product.domain} ({$product.domain}){/if}<br />
          {if $product.configoptions}
          {foreach key=confnum item=configoption from=$product.configoptions}&nbsp;&raquo; {$configoption.name}: {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}<br />{/foreach}
          {/if}
          <a href="{$smarty.server.PHP_SELF}?a=confproduct&i={$num}" class="cartedit">[{$LANG.carteditproductconfig}]</a> <a href="#" onclick="removeItem('p','{$num}');return false" class="cartremove">[{$LANG.cartremove}]</a>
{if $product.allowqty}
<br /><br />
<div align="right">{$LANG.cartqtyenterquantity} <input type="text" name="qty[{$num}]" size="3" value="{$product.qty}" /> <input type="submit" value="{$LANG.cartqtyupdate}" /></div>
{/if}
</td><td class="textcenter"><strong>{$product.pricingtext}{if $product.proratadate}<br />({$LANG.orderprorata} {$product.proratadate}){/if}</strong></td></tr>
{foreach key=addonnum item=addon from=$product.addons}
<tr class="carttableproduct"><td><strong>{$LANG.orderaddon}</strong> - {$addon.name}</td><td class="textcenter"><strong>{$addon.pricingtext}</strong></td></tr>
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
<tr class="total"><td class="textright">{$LANG.ordertotalduetoday}: &nbsp;</td><td class="textcenter">{$total}</td></tr>
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

<div class="cartbuttons"><input type="button" value="{$LANG.emptycart}" onclick="emptyCart();return false" /> <input type="button" value="{$LANG.continueshopping}" onclick="window.location='cart.php'" /></div>

{foreach from=$gatewaysoutput item=gatewayoutput}
<div class="clear"></div>
<div class="cartbuttons">{$gatewayoutput}</div>
{/foreach}

{if $cartitems!=0}

<form method="post" action="{$smarty.server.PHP_SELF}?a=checkout" id="mainfrm">
<input type="hidden" name="submit" value="true" />
<input type="hidden" name="custtype" id="custtype" value="{$custtype}" />

<br /><br />

<h2>{$LANG.yourdetails}</h2>

<div style="float:left;width:20px;">&nbsp;</div><div class="signuptype{if !$loggedin && $custtype neq "existing"} active{/if}"{if !$loggedin} id="newcust"{/if}>{$LANG.newcustomer}</div><div class="signuptype{if $custtype eq "existing" && !$loggedin || $loggedin} active{/if}" id="existingcust">{$LANG.existingcustomer}</div>
<div class="clear"></div>

<div class="signupfields{if $custtype eq "existing" && !$loggedin}{else} hidden{/if}" id="loginfrm">
<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
<tr><td class="fieldlabel">{$LANG.clientareaemail}</td><td class="fieldarea"><input type="text" name="loginemail" size="40" /></td></tr>
<tr><td class="fieldlabel">{$LANG.clientareapassword}</td><td class="fieldarea"><input type="password" name="loginpw" size="25" /></td></tr>
</table>
</div>
<div class="signupfields{if $custtype eq "existing" && !$loggedin} hidden{/if}" id="signupfrm">
<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
<tr><td class="fieldlabel">{$LANG.clientareafirstname}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.firstname}{else}<input type="text" name="firstname" tabindex="1" style="width:80%;" value="{$clientsdetails.firstname}" />{/if}</td><td class="fieldlabel">{$LANG.clientareaaddress1}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.address1}{else}<input type="text" name="address1" tabindex="7" style="width:80%;" value="{$clientsdetails.address1}" />{/if}</td></tr>
<tr><td class="fieldlabel">{$LANG.clientarealastname}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.lastname}{else}<input type="text" name="lastname" tabindex="2" style="width:80%;" value="{$clientsdetails.lastname}" />{/if}</td><td class="fieldlabel">{$LANG.clientareaaddress2}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.address2}{else}<input type="text" name="address2" tabindex="8" style="width:80%;" value="{$clientsdetails.address2}" />{/if}</td></tr>
<tr><td class="fieldlabel">{$LANG.clientareacompanyname}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.companyname}{else}<input type="text" name="companyname" tabindex="3" style="width:80%;" value="{$clientsdetails.companyname}" />{/if}</td><td class="fieldlabel">{$LANG.clientareacity}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.city}{else}<input type="text" name="city" tabindex="9" style="width:80%;" value="{$clientsdetails.city}" />{/if}</td></tr>
<tr><td class="fieldlabel">{$LANG.clientareaemail}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.email}{else}<input type="text" name="email" tabindex="4" style="width:90%;" value="{$clientsdetails.email}" />{/if}</td><td class="fieldlabel">{$LANG.clientareastate}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.state}{else}<input type="text" name="state" tabindex="10" style="width:80%;" value="{$clientsdetails.state}" />{/if}</td></tr>
<tr>{if !$loggedin}<td class="fieldlabel">{$LANG.clientareapassword}</td><td class="fieldarea"><input type="password" name="password" tabindex="5" id="newpw" size="20" value="{$password}" /></td>{else}<td class="fieldlabel"></td><td class="fieldarea"></td>{/if}<td class="fieldlabel">{$LANG.clientareapostcode}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.postcode}{else}<input type="text" name="postcode" tabindex="11" size="15" value="{$clientsdetails.postcode}" />{/if}</td></tr>
<tr>{if !$loggedin}<td class="fieldlabel">{$LANG.clientareaconfirmpassword}</td><td class="fieldarea"><input type="password" name="password2" tabindex="6" size="20" value="{$password2}" /></td>{else}<td class="fieldlabel"></td><td class="fieldarea"></td>{/if}<td class="fieldlabel">{$LANG.clientareacountry}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.country}{else}{$clientcountrydropdown|replace:'<select':'<select tabindex="12"'}{/if}</td></tr>
<tr><td colspan="2" class="fieldarea">{if !$loggedin}<script language="javascript">showStrengthBar();</script>{/if}</td><td class="fieldlabel">{$LANG.clientareaphonenumber}</td><td class="fieldarea">{if $loggedin}{$clientsdetails.phonenumber}{else}<input type="text" name="phonenumber" tabindex="13" size="20" value="{$clientsdetails.phonenumber}" />{/if}</td></tr>
{if $customfields || $securityquestions}
{if $securityquestions && !$loggedin}
<tr><td class="fieldlabel">{$LANG.clientareasecurityquestion}</td><td class="fieldarea" colspan="3"><select name="securityqid" tabindex="14">
{foreach key=num item=question from=$securityquestions}
    <option value={$question.id}>{$question.question}</option>
{/foreach}
</select></td></tr>
<tr><td class="fieldlabel">{$LANG.clientareasecurityanswer}</td><td class="fieldarea" colspan="3"><input type="password" name="securityqans" tabindex="15" size="30"></td></tr>
{/if}
{foreach key=num item=customfield from=$customfields}
<tr><td class="fieldlabel">{$customfield.name}</td><td class="fieldarea" colspan="3">{$customfield.input} {$customfield.description}</td></tr>
{/foreach}
{/if}
</table>
</div>

{if $taxenabled && !$loggedin}
<div class="carttaxwarning">{$LANG.carttaxupdateselections} <input type="submit" value="{$LANG.carttaxupdateselectionsupdate}" name="updateonly" /></div>
{/if}

{if $domainsinorder}
<h2>{$LANG.domainregistrantinfo}</h2>
<select name="contact" id="domaincontact" onchange="domaincontactchange()">
<option value="">{$LANG.usedefaultcontact}</option>
{foreach from=$domaincontacts item=domcontact}
<option value="{$domcontact.id}"{if $contact==$domcontact.id} selected{/if}>{$domcontact.name}</option>
{/foreach}
<option value="addingnew"{if $contact eq "addingnew"} selected{/if}>{$LANG.clientareanavaddcontact}...</option>
</select><br /><br />
<div class="signupfields{if $contact neq "addingnew"} hidden{/if}" id="domaincontactfields">
<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
<tr><td class="fieldlabel">{$LANG.clientareafirstname}</td><td class="fieldarea"><input type="text" name="domaincontactfirstname" style="width:80%;" value="{$domaincontact.firstname}" /></td><td class="fieldlabel">{$LANG.clientareaaddress1}</td><td class="fieldarea"><input type="text" name="domaincontactaddress1" style="width:80%;" value="{$domaincontact.address1}" /></td></tr>
<tr><td class="fieldlabel">{$LANG.clientarealastname}</td><td class="fieldarea"><input type="text" name="domaincontactlastname" style="width:80%;" value="{$domaincontact.lastname}" /></td><td class="fieldlabel">{$LANG.clientareaaddress2}</td><td class="fieldarea"><input type="text" name="domaincontactaddress2" style="width:80%;" value="{$domaincontact.address2}" /></td></tr>
<tr><td class="fieldlabel">{$LANG.clientareacompanyname}</td><td class="fieldarea"><input type="text" name="domaincontactcompanyname" style="width:80%;" value="{$domaincontact.companyname}" /></td><td class="fieldlabel">{$LANG.clientareacity}</td><td class="fieldarea"><input type="text" name="domaincontactcity" style="width:80%;" value="{$domaincontact.city}" /></td></tr>
<tr><td class="fieldlabel">{$LANG.clientareaemail}</td><td class="fieldarea"><input type="text" name="domaincontactemail" style="width:90%;" value="{$domaincontact.email}" /></td><td class="fieldlabel">{$LANG.clientareastate}</td><td class="fieldarea"><input type="text" name="domaincontactstate" style="width:80%;" value="{$domaincontact.state}" /></td></tr>
<tr><td class="fieldlabel">{$LANG.clientareaphonenumber}</td><td class="fieldarea"><input type="text" name="domaincontactphonenumber" size="20" value="{$domaincontact.phonenumber}" /></td><td class="fieldlabel">{$LANG.clientareapostcode}</td><td class="fieldarea"><input type="text" name="domaincontactpostcode" size="15" value="{$domaincontact.postcode}" /></td></tr>
<tr><td class="fieldlabel"></td><td class="fieldarea"></td><td class="fieldlabel">{$LANG.clientareacountry}</td><td class="fieldarea">{$domaincontactcountrydropdown}</td></tr>
</table>
</div>
{/if}

<div class="checkoutcol1">

<div class="signupfields padded">
<h2>{$LANG.orderpromotioncode}</h2>
{if $promotioncode}{$promotioncode} - {$promotiondescription}<br /><a href="{$smarty.server.PHP_SELF}?a=removepromo">{$LANG.orderdontusepromo}</a>{else}<input type="text" name="promocode" size="20" value="" /> <input type="submit" name="validatepromo" value="{$LANG.orderpromovalidatebutton}" />{/if}
</div>

{if $shownotesfield}
<div class="signupfields padded">
<h2>{$LANG.ordernotes}</h2>
<textarea name="notes" rows="2" style="width:100%" onFocus="if(this.value=='{$LANG.ordernotesdescription}'){ldelim}this.value='';{rdelim}" onBlur="if (this.value==''){ldelim}this.value='{$LANG.ordernotesdescription}';{rdelim}">{$notes}</textarea>
</div>
{/if}

</div>
<div class="checkoutcol2">

<div class="signupfields padded">
<h2>{$LANG.orderpaymentmethod}</h2>
{foreach key=num item=gateway from=$gateways}<label><input type="radio" name="paymentmethod" value="{$gateway.sysname}" id="pgbtn{$num}" onclick="{if $gateway.type eq "CC"}showCCForm(){else}hideCCForm(){/if}"{if $selectedgateway eq $gateway.sysname} checked{/if} /> {$gateway.name}</label> {/foreach}

<br /><br />

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

</div>

</div>
<div class="clear"></div>

{if $accepttos}
<div align="center"><label><input type="checkbox" name="accepttos" id="accepttos" /> {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></label></div>
<br />
{/if}

<div align="center"><input type="submit" value="{$LANG.completeorder}"{if $cartitems==0} disabled{/if} onclick="this.value='{$LANG.pleasewait}'" class="ordernow" /></div>

</form>

{else}

<br /><br />

{/if}

<div class="cartwarningbox"><img src="images/padlock.gif" align="absmiddle" border="0" alt="Secure Transaction" /> &nbsp;{$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}</div>

</div>