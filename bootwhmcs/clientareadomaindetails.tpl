{include file="$template/pageheader.tpl" title=$LANG.managing|cat:' '|cat:$domain}

{if $updatesuccess}
<div class="alert alert-success">
  {$LANG.changessavedsuccessfully}
</div>
{elseif $registrarcustombuttonresult=="success"}
<div class="alert alert-success">
  {$LANG.moduleactionsuccess}
</div>
{elseif $error}
<div class="alert alert-danger">
  {$error}
</div>
{elseif $registrarcustombuttonresult}
<div class="alert alert-danger">
  <strong>{$LANG.moduleactionfailed}:</strong> {$registrarcustombuttonresult}
</div>
{elseif $lockstatus=="unlocked"}
<div class="alert alert-danger">
  <strong>{$LANG.domaincurrentlyunlocked}</strong> {$LANG.domaincurrentlyunlockedexp}
</div>
{/if}

<ul class="nav nav-tabs">

  <li class="active"><a href="#tab-info" data-toggle="tab">{$LANG.information}</a></li>
  <li><a href="#tab-renew" data-toggle="tab">{$LANG.domainsautorenew}</a></li>
  
  {if $rawstatus == "active"}<li><a href="#tab-nameservers" data-toggle="tab">{$LANG.domainnameservers}</a></li>{/if}
 
  {if $lockstatus}{if $tld neq "co.uk" && $tld neq "org.uk" && $tld neq "ltd.uk" && $tld neq "plc.uk" && $tld neq "me.uk"}
  <li><a href="#tab-reglock" data-toggle="tab">{$LANG.domainregistrarlock}</a></li>
  {/if}{/if}
  
  {if $releasedomain}<li><a href="#tab-release" data-toggle="tab">{$LANG.domainrelease}</a></li>{/if}
  {if $addonscount}<li><a href="#tab-addons" data-toggle="tab">{$LANG.clientareahostingaddons}</a></li>{/if}
  
  {if $managecontacts || $registerns || $dnsmanagement || $emailforwarding || $getepp}
  <li class="dropdown">
    <a data-toggle="dropdown" href="#" class="dropdown-toggle">{$LANG.domainmanagementtools}&nbsp;<b class="caret"></b></a>
    <ul class="dropdown-menu">
      {if $managecontacts}<li><a href="clientarea.php?action=domaincontacts&domainid={$domainid}">{$LANG.domaincontactinfo}</a></li>{/if}
      {if $registerns}<li><a href="clientarea.php?action=domainregisterns&domainid={$domainid}">{$LANG.domainregisterns}</a></li>{/if}
      {if $dnsmanagement}<li><a href="clientarea.php?action=domaindns&domainid={$domainid}">{$LANG.clientareadomainmanagedns}</a></li>{/if}
      {if $emailforwarding}<li><a href="clientarea.php?action=domainemailforwarding&domainid={$domainid}">{$LANG.clientareadomainmanageemailfwds}</a></li>{/if}
      {if $getepp}<li class="divider"></li>
      <li><a href="clientarea.php?action=domaingetepp&domainid={$domainid}">{$LANG.domaingeteppcode}</a></li>{/if}
      {if $registrarcustombuttons}<li class="divider"></li>
      {foreach from=$registrarcustombuttons key=label item=command}
      <li><a href="clientarea.php?action=domaindetails&amp;id={$domainid}&amp;modop=custom&amp;a={$command}">{$label}</a></li>
      {/foreach}{/if}
    </ul>
  </li>
  {/if}
  
</ul>

<br />

<div class="tab-content">

  <!-- Information -->
  <div class="tab-pane active" id="tab-info">
    
    <p>{$LANG.domaininfoexp}</p>
    
    <div class="row">
    
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$domain} <span class="label {$rawstatus}">{$status}</span></h4>
        <p class="lead">{$LANG.clientareahostingdomain}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$firstpaymentamount}</h4>
        <p class="lead">{$LANG.firstpaymentamount}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$registrationdate}</h4>
        <p class="lead">{$LANG.clientareahostingregdate}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$recurringamount} {$LANG.every} {$registrationperiod} {$LANG.orderyears}</h4>
        <p class="lead">{$LANG.recurringamount} {if $renew} &nbsp; <a href="cart.php?gid=renewals" class="btn btn-xs">{$LANG.domainsrenewnow}</a>{/if}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$nextduedate}</h4>
        <p class="lead">{$LANG.clientareahostingnextduedate}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$paymentmethod}</h4>
        <p class="lead">{$LANG.orderpaymentmethod}</p>
      </div>
    
    </div>
    
    {if $registrarclientarea}<div class="moduleoutput">{$registrarclientarea|replace:'modulebutton':'btn'}</div>{/if}
    
  </div>
  
  
  <!-- Auto Renew -->
  <div class="tab-pane" id="tab-renew">
    <p>{$LANG.domainrenewexp}</p>
    
    <p class="lead {if $autorenew}text-success{else}text-danger{/if}">{if $autorenew}{$LANG.domainsautorenewenabled}{else}{$LANG.domainsautorenewdisabled}{/if}</p>
    
    <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails">
      <input type="hidden" name="id" value="{$domainid}">
      {if $autorenew}
      <input type="hidden" name="autorenew" value="disable">
      <p><input type="submit" class="btn btn-lg btn-danger" value="{$LANG.domainsautorenewdisable}" /></p>
      {else}
      <input type="hidden" name="autorenew" value="enable">
      <p><input type="submit" class="btn btn-lg btn-success" value="{$LANG.domainsautorenewenable}" /></p>
      {/if}
    </form>
  </div>
  
  
  <!-- Nameservers -->
  <div class="tab-pane" id="tab-nameservers">
    <p>{$LANG.domainnsexp}</p>
    
    <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails">
      <input type="hidden" name="id" value="{$domainid}" />
      <input type="hidden" name="sub" value="savens" />
      
      <div class="radio">
        <label>
          <input type="radio" class="radio inline" name="nschoice" value="default" onclick="disableFields('domnsinputs',true)"{if $defaultns} checked{/if} />
          {$LANG.nschoicedefault}
        </label>
      </div>
      
      <div class="radio">
        <label>
          <input type="radio" class="radio inline" name="nschoice" value="custom" onclick="disableFields('domnsinputs','')"{if !$defaultns} checked{/if} />
          {$LANG.nschoicecustom}
        </label>
      </div>
      
      <hr />
      
      <div class="form-group">
        <label for="ns1">{$LANG.domainnameserver1}</label>
        <input class="form-control" id="ns1" name="ns1" type="text" value="{$ns1}" />
      </div>
      
      <div class="form-group">
        <label for="ns2">{$LANG.domainnameserver2}</label>
        <input class="form-control" id="ns2" name="ns2" type="text" value="{$ns2}" />
      </div>
      
      <div class="form-group">
        <label for="ns3">{$LANG.domainnameserver3}</label>
        <input class="form-control" id="ns3" name="ns3" type="text" value="{$ns3}" />
      </div>
      
      <div class="form-group">
        <label for="ns4">{$LANG.domainnameserver4}</label>
        <input class="form-control" id="ns4" name="ns4" type="text" value="{$ns4}" />
      </div>
      
      <div class="form-group">
        <label for="ns5">{$LANG.domainnameserver5}</label>
        <input class="form-control" id="ns5" name="ns5" type="text" value="{$ns5}" />
      </div>
      
      <br />
      
      <p><input type="submit" class="btn btn-lg btn-primary" value="{$LANG.changenameservers}" /></p>
    
    </form>
  </div>
  
  
  <!-- Domain Lock -->
  <div class="tab-pane" id="tab-reglock">
  
    <p>{$LANG.domainlockingexp}</p>
    
    <p><strong>{if $lockstatus=="locked"}{$LANG.domainsautorenewenabled}{else}{$LANG.domainsautorenewdisabled}{/if}</strong></p>
    
    <hr />
    
    <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails">
      <input type="hidden" name="id" value="{$domainid}" />
      <input type="hidden" name="sub" value="savereglock" />
      
      {if $lockstatus=="locked"}
      <p><input type="submit" class="btn btn-danger" value="{$LANG.domainreglockdisable}" /></p>
      {else}
      <p><input type="submit" class="btn btn-success" name="reglock" value="{$LANG.domainreglockenable}" /></p>
      {/if}
    </form>
                
  </div>
  
  
  <!-- Release Domain -->
  <div class="tab-pane" id="tab-release">
  
    <p>{$LANG.domainreleasedescription}</p>
    
    {if $releasedomain}
    <p><strong>&nbsp;&raquo;&nbsp;&nbsp;{$LANG.domainrelease}</strong></p>
    <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails">
      <input type="hidden" name="sub" value="releasedomain">
      <input type="hidden" name="id" value="{$domainid}">
      {$LANG.domainreleasetag}: <input type="text" name="transtag" size="20" />
      <p><input type="submit" value="{$LANG.domainrelease}" class="buttonwarn" /></p>
    </form>
    {/if}
    
  </div>
  
  
  <!-- Addons -->
  <div class="tab-pane" id="tab-addons">
  
    <p>{$LANG.domainaddonsinfo}</p>
  
    {if $addons.idprotection}
                <div class="row">
                    <div class="domaddonimg">
                        <img src="images/idprotect.png" />
                    </div>
                    <div class="col70">
                        <strong>{$LANG.domainidprotection}</strong><br />
                        {$LANG.domainaddonsidprotectioninfo}<br />
                        {if $addonstatus.idprotection}
                        <a href="clientarea.php?action=domainaddons&id={$domainid}&disable=idprotect&token={$token}">{$LANG.disable}</a>
                        {else}
                        <a href="clientarea.php?action=domainaddons&id={$domainid}&buy=idprotect&token={$token}">{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}</a>
                        {/if}
                    </div>
                </div>
                <br />
                {/if}
                {if $addons.dnsmanagement}
                <div class="row">
                    <div class="domaddonimg">
                        <img src="images/dnsmanagement.png" />
                    </div>
                    <div class="col70">
                        <strong>{$LANG.domainaddonsdnsmanagement}</strong><br />
                        {$LANG.domainaddonsdnsmanagementinfo}<br />
                        {if $addonstatus.dnsmanagement}
                        <a href="clientarea.php?action=domaindns&domainid={$domainid}">{$LANG.manage}</a> | <a href="clientarea.php?action=domainaddons&id={$domainid}&disable=dnsmanagement&token={$token}">{$LANG.disable}</a>
                        {else}
                        <a href="clientarea.php?action=domainaddons&id={$domainid}&buy=dnsmanagement&token={$token}">{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}</a>
                        {/if}
                    </div>
                </div>
                <br />
                {/if}
                {if $addons.emailforwarding}
                <div class="row">
                    <div class="domaddonimg">
                        <img src="images/emailfwd.png" />
                    </div>
                    <div class="col70">
                        <strong>{$LANG.domainemailforwarding}</strong><br />
                        {$LANG.domainaddonsemailforwardinginfo}<br />
                        {if $addonstatus.emailforwarding}
                        <a href="clientarea.php?action=domainemailforwarding&domainid={$domainid}">{$LANG.manage}</a> | <a href="clientarea.php?action=domainaddons&id={$domainid}&disable=emailfwd&token={$token}">{$LANG.disable}</a>
                        {else}
                        <a href="clientarea.php?action=domainaddons&id={$domainid}&buy=emailfwd&token={$token}">{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}</a>
                        {/if}
                    </div>
                </div>
                {/if}
  
  </div>
  
</div>