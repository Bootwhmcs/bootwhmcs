<div class="row">

  <div class="col-md-3">
  
    <div class="list-group">
      
      {foreach key=num item=productgroup from=$productgroups}
      {if $productgroup.gid neq $gid}<a href="cart.php?gid={$productgroup.gid}" class="list-group-item">{$productgroup.name}</a>{/if}
      {/foreach}

      <hr />
      
      {if $loggedin}
      {if $gid neq "addons"}<a href="cart.php?gid=addons" class="list-group-item">{$LANG.cartproductaddons}</a></li>{/if}
      {if $renewalsenabled && $gid neq "renewals"}<a href="cart.php?gid=renewals" class="list-group-item">{$LANG.domainrenewals}</a>{/if}
      {/if}
      
      {if $registerdomainenabled && $domain neq "register"}<a href="cart.php?a=add&domain=register" class="list-group-item">{$LANG.registerdomain}</a>{/if}
      {if $transferdomainenabled && $domain neq "transfer"}<a href="cart.php?a=add&domain=transfer" class="list-group-item">{$LANG.transferdomain}</a>{/if}
      <a href="cart.php?a=view" class="list-group-item">{$LANG.viewcart}</a>
      
    </div>
  
  </div>
  
  <div class="col-md-9">
  
    <div class="page-header">
      <h1>{$LANG.domainrenewals}</h1>
    </div>
    
    <p>{$LANG.domainrenewdesc}</p>
    
    <form method="post" action="cart.php?a=add&renewals=true">

      <table class="table table-striped">
        <thead>
          <tr>
            <th width="20"></th>
            <th>{$LANG.orderdomain}</th>
            <th>{$LANG.domainstatus}</th>
            <th>{$LANG.domaindaysuntilexpiry}</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        
          {foreach from=$renewals item=renewal}
          <tr>
            <td>{if !$renewal.pastgraceperiod}<input type="checkbox" name="renewalids[]" value="{$renewal.id}" />{/if}</td>
            <td>{$renewal.domain}</td><td>{$renewal.status}</td>
            <td>
              {if $renewal.daysuntilexpiry > 30}
              <span class="textgreen">{$renewal.daysuntilexpiry} {$LANG.domainrenewalsdays}</span>
              {elseif $renewal.daysuntilexpiry > 0}
              <span class="textred">{$renewal.daysuntilexpiry} {$LANG.domainrenewalsdays}</span>
              {else}
              <span class="textblack">{$renewal.daysuntilexpiry*-1} {$LANG.domainrenewalsdaysago}</span>
              {/if}
              {if $renewal.ingraceperiod}
              <br />
              <span class="textred">{$LANG.domainrenewalsingraceperiod}<span>
              {/if}
            </td>
            <td>
              {if $renewal.beforerenewlimit}
              <span class="textred">{$LANG.domainrenewalsbeforerenewlimit|sprintf2:$renewal.beforerenewlimitdays}<span>
              {elseif $renewal.pastgraceperiod}
              <span class="textred">{$LANG.domainrenewalspastgraceperiod}<span>
              {else}
              <select name="renewalperiod[{$renewal.id}]">
                {foreach from=$renewal.renewaloptions item=renewaloption}
                <option value="{$renewaloption.period}">{$renewaloption.period} {$LANG.orderyears} @ {$renewaloption.price}</option>
                {/foreach}
              </select>
            {/if}
            </td>
          </tr>
        {foreachelse}
        <tr class="carttablerow">
          <td colspan="5">{$LANG.domainrenewalsnoneavailable}</td>
        </tr>
        {/foreach}
      </tbody>
    </table>

    <input type="submit" value="{$LANG.ordernowbutton} &raquo;" class="btn btn-danger" />
  </form>
  
</div>