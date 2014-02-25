{include file="$template/pageheader.tpl" title=$product}

{if $modulechangepwresult eq "success"}
<div class="alert alert-success">
  {$LANG.serverchangepasswordsuccessful}
</div>
{elseif $modulechangepwresult eq "error"}
<div class="alert alert-danger">
  {$modulechangepasswordmessage}
</div>
{elseif $modulecustombuttonresult=="success"}
<div class="alert alert-success">
  {$LANG.moduleactionsuccess}
</div>
{elseif $modulecustombuttonresult}
<div class="alert alert-danger">
  <strong>{$LANG.moduleactionfailed}:</strong> {$modulecustombuttonresult}
</div>
{/if}

<ul class="nav nav-tabs">
  <li class="active"><a href="#tab-info" data-toggle="tab">{$LANG.information}</a></li>
  {if $modulechangepassword}<li><a href="#tab-password" data-toggle="tab">{$LANG.serverchangepassword}</a></li>{/if}
  {if $downloads}<li><a href="#tab-downloads" data-toggle="tab">{$LANG.downloadstitle}</a></li>{/if}
  <li><a href="#tab-addons" data-toggle="tab">{$LANG.clientareahostingaddons}</a></li>
  
  {if $packagesupgrade || $configoptionsupgrade || $showcancelbutton || $modulecustombuttons}
  <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">{$LANG.productmanagementactions}</a>
    <ul class="dropdown-menu">
      {foreach from=$modulecustombuttons key=label item=command}
      <li><a href="clientarea.php?action=productdetails&amp;id={$id}&amp;modop=custom&amp;a={$command}">{$label}</a></li>
      {/foreach}
      {if $packagesupgrade}<li><a href="upgrade.php?type=package&amp;id={$id}">{$LANG.upgradedowngradepackage}</a></li>{/if}
      {if $configoptionsupgrade}<li><a href="upgrade.php?type=configoptions&amp;id={$id}">{$LANG.upgradedowngradeconfigoptions}</a></li>{/if}
      {if $showcancelbutton}<li><a href="clientarea.php?action=cancel&amp;id={$id}">{$LANG.clientareacancelrequestbutton}</a></li>{/if}
    </ul>
  </li>
  {/if}
</ul>

<br />

<div class="tab-content">
  
  
  <!-- Information -->
  <div class="tab-pane active" id="tab-info">
    
    {if $suspendreason}
      <div class="alert alert-warning"><strong>{$LANG.suspendreason}:</strong> {$suspendreason}</div>
    {/if}
    
    <p>{$LANG.clientareaproductdetailsintro}</p>
    
    <div class="row">
    
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$regdate}</h4>
        <p class="lead">{$LANG.clientareahostingregdate}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$product} <span class="label {$rawstatus}">{$status}</span>{if $domain}<div><a href="http://{$domain}" target="_blank">{$domain}</a></div>{/if}</h4>
        <p class="lead">{$LANG.orderproduct}</p>
      </div>
      
      {if $dedicatedip}
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$dedicatedip}</h4>
        <p class="lead">{$LANG.domainregisternsip}</p>
      </div>
      {/if}
      
      {foreach from=$configurableoptions item=configoption}
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{if $configoption.optiontype eq 3}{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}</h4>
        <p class="lead">{$configoption.optionname}</p>
      </div>
      {/foreach}
      
      {if $firstpaymentamount neq $recurringamount}
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$firstpaymentamount}</h4>
        <p class="lead">{$LANG.firstpaymentamount}</p>
      </div>
      {/if}
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$recurringamount}</h4>
        <p class="lead">{$LANG.recurringamount}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$billingcycle}</h4>
        <p class="lead">{$LANG.orderbillingcycle}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$nextduedate}</h4>
        <p class="lead">{$LANG.clientareahostingnextduedate}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$paymentmethod}</h4>
        <p class="lead">{$LANG.orderpaymentmethod}</p>
      </div>
      
      {if $lastupdate}
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$diskusage}MB / {$disklimit}MB ({$diskpercent})</h4>
        <p class="lead">{$LANG.clientareadiskusage}</p>
      </div>
      
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$bwusage}MB / {$bwlimit}MB ({$bwpercent})</h4>
        <p class="lead">{$LANG.clientareabwusage}</p>
      </div>
      {/if}
      
      {foreach from=$productcustomfields item=customfield}
      <div class="col-md-3 col-sm-4 col-xs-6">
        <h4>{$customfield.value}</h4>
        <p class="lead">{$customfield.name}</p>
      </div>
      {/foreach}
    
    </div>
    
    {if $moduleclientarea}<div class="moduleoutput">{$moduleclientarea|replace:'modulebutton':'btn'}</div>{/if}
    
  </div>
  

  <!-- Change Password -->
  <div class="tab-pane" id="tab-password">
    <p>{$LANG.serverchangepasswordintro}</p>
    
    <form method="post" action="{$smarty.server.PHP_SELF}?action=productdetails#tab2">
      <input type="hidden" name="id" value="{$id}" />
      <input type="hidden" name="modulechangepassword" value="true" />

      {if $username}
      <div class="form-group">
        <label for="password">{$LANG.serverusername}/{$LANG.serverpassword}</label>
        {$username} {if $password} / {$password}{/if}
      </div>
      {/if}

      <div class="form-group">
        <label for="password">{$LANG.newpassword}</label>
        <input type="password" name="newpw" id="password" class="form-control" />
      </div>

      <div class="form-group">
        <label for="confirmpw">{$LANG.confirmnewpassword}</label>
        <input type="password" name="confirmpw" id="confirmpw" class="form-control" />
      </div>
      
      <div class="form-group">
        <label for="passstrength">{$LANG.pwstrength}</label>
        {include file="$template/pwstrength.tpl"}
      </div>
      
      <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
      <input class="btn" type="reset" value="{$LANG.cancel}" />
    </form>
  </div>
  
  
  <!-- Downloads -->
  <div class="tab-pane" id="tab-downloads">
    <p>{$LANG.clientareahostingaddonsintro}</p>
    
    {foreach from=$downloads item=download}
    <p><h4>{$download.title} - <a href="{$download.link}">{$LANG.downloadname}</a></h4> {$download.description}</p>
    {/foreach}
  </div>
  
  
  <!-- Addons -->
  <div class="tab-pane" id="tab-addons">
    <p>{$LANG.yourclientareahostingaddons}</p>
    
    {if $addonsavailable}<p><a href="cart.php?gid=addons&pid={$id}">{$LANG.orderavailableaddons}</a></p>{/if}
    
    <table class="table table-striped">
    
      <thead>
        <tr>
          <th>{$LANG.clientareaaddon}</th>
          <th>{$LANG.clientareaaddonpricing}</th>
          <th>{$LANG.clientareahostingnextduedate}</th>
          <th>{$LANG.clientareastatus}</th>
        </tr>
      </thead>
      
      <tbody>
      
        {foreach key=num item=addon from=$addons}
        
        <tr>
          <td>{$addon.name}</td>
          <td>{$addon.pricing}</td>
          <td>{$addon.nextduedate}</td>
          <td><span class="label label-primary {$addon.rawstatus}">{$addon.status}</span></td>
        </tr>
        
        {foreachelse}
        
        <tr>
          <td colspan="4">{$LANG.clientareanoaddons}</td>
        </tr>
        
        {/foreach}
        
      </tbody>
      
    </table>
  </div>
  
</div>