{if $inactive}
  
  {include file="$template/pageheader.tpl" title=$LANG.affiliatestitle}
  
  <div class="alert alert-warning">
    {$LANG.affiliatesdisabled}
  </div>

{else}

  {include file="$template/pageheader.tpl" title=$LANG.affiliatestitle desc=$LANG.affiliatesrealtime}

  <div class="row">
  
    <div class="col-sm-8">
    
      <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class="fa fa-link"></i></span>
        <input type="text" value="{$referrallink}" class="form-control" />
      </div>
      <br />
    </div>
    
    <div class="col-sm-4">
    {if $withdrawrequestsent}
      <div class="alert alert-success">
        {$LANG.affiliateswithdrawalrequestsuccessful}
      </div>
    {else}
      {if $withdrawlevel}
      <input type="button" class="btn btn-lg btn-block btn-danger" value="{$LANG.affiliatesrequestwithdrawal}" onclick="window.location='{$smarty.server.PHP_SELF}?action=withdrawrequest'" />
      {/if}
    {/if}
    </div>
    
  </div>
  
  <br />
  
  <div class="row">
  
    <div class="col-sm-4">
      <div class="jumbotron text-center">
        <h1>{$visitors}</h1>
        <p>Visitors Referred</p>
      </div>
    </div>
    
    <div class="col-sm-4">
      <div class="jumbotron text-center">
        <h1>{$signups}</h1>
        <p>{$LANG.affiliatessignups}</p>
      </div>
    </div>
    
    <div class="col-sm-4">
      <div class="jumbotron text-center">
        <h1>{$conversionrate}%</h1>
        <p>{$LANG.affiliatesconversionrate}</p>
      </div>
    </div>
  
  </div>


  <table class="table table-striped">
    <tr>
      <td>{$LANG.affiliatescommissionspending}:</td>
      <td><strong>{$pendingcommissions}</strong></td>
    </tr>
    <tr>
      <td>{$LANG.affiliatescommissionsavailable}:</td>
      <td><strong>{$balance}</strong></td>
    </tr>
    <tr>
      <td>{$LANG.affiliateswithdrawn}:</td>
      <td><strong>{$withdrawn}</strong></td>
    </tr>
  </table>
  
  
  {include file="$template/pageheader.tpl" title=$LANG.affiliatesreferals}
  
  <table class="table table-striped">
  
    <thead>
      <tr>
        <th{if $orderby eq "date"} class="headerSort{$sort}"{/if}><a href="affiliates.php?orderby=date">{$LANG.affiliatessignupdate}</a></th>
        <th{if $orderby eq "product"} class="headerSort{$sort}"{/if}><a href="affiliates.php?orderby=product">{$LANG.orderproduct}</a></th>
        <th{if $orderby eq "amount"} class="headerSort{$sort}"{/if}><a href="affiliates.php?orderby=amount">{$LANG.affiliatesamount}</a></th>
        <th>{$LANG.affiliatescommission}</th>
        <th{if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="affiliates.php?orderby=status">{$LANG.affiliatesstatus}</a></th>
      </tr>
    </thead>
    
    <tbody>
      {foreach key=num item=referral from=$referrals}
      <tr>
        <td>{$referral.date}</td>
        <td>{$referral.service}</td>
        <td>{$referral.amountdesc}</td>
        <td>{$referral.commission}</td>
        <td>{$referral.status}</td>
      </tr>
      {foreachelse}
      <tr>
        <td colspan="5">{$LANG.norecordsfound}</td>
      </tr>
      {/foreach}
    </tbody>
    
    <tfoot>
      <tr>
        <td colspan="5">{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</td>
      </tr>
    </tfoot>
    
  </table>
  
  
  <ul class="pagination pull-right">
    <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}affiliates.php?page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
    <li class="next{if !$nextpage} disabled{/if}"><a href="{if $nextpage}affiliates.php?page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
  </ul>
  
  {if $affiliatelinkscode}
  {include file="$template/pageheader.tpl" title=$LANG.affiliateslinktous}
  {$affiliatelinkscode}
  {/if}

{/if}