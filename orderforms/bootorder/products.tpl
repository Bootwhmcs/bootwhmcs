{if !$loggedin && $currencies}
<div id="currencychooser">
{foreach from=$currencies item=curr}
<a href="cart.php?gid={$gid}&currency={$curr.id}"><img src="images/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png" border="0" alt="" /> {$curr.code}</a>
{/foreach}
</div>
<div class="clear"></div>
{else}
<br />
{/if}

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
      <h1>{$groupname}</h1>
    </div>

    {foreach from=$products key=num item=product}
    <div class="panel panel-default panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">
          {$product.name}{if $product.qty!=""} <span class="qty">({$product.qty} {$LANG.orderavailable})</span>{/if}
          <span class="pull-right">
            {if $product.bid}
            {$LANG.bundledeal}<br />
            {if $product.displayprice}<span class="pricing">{$product.displayprice}</span>{/if}
            {else}
            {if $product.pricing.hasconfigoptions}{$LANG.startingfrom}{/if}
            <span class="pricing">{$product.pricing.minprice.price}</span>
            {if $product.pricing.minprice.cycle eq "monthly"}
            {$LANG.orderpaymenttermmonthly}
            {elseif $product.pricing.minprice.cycle eq "quarterly"}
            {$LANG.orderpaymenttermquarterly}
            {elseif $product.pricing.minprice.cycle eq "semiannually"}
            {$LANG.orderpaymenttermsemiannually}
            {elseif $product.pricing.minprice.cycle eq "annually"}
            {$LANG.orderpaymenttermannually}
            {elseif $product.pricing.minprice.cycle eq "biennially"}
            {$LANG.orderpaymenttermbiennially}
            {elseif $product.pricing.minprice.cycle eq "triennially"}
            {$LANG.orderpaymenttermtriennially}
            {/if}
            {/if}
          </span>
        </h3>
      </div>
      
      <div class="panel-body">
        <p>{$product.featuresdesc}</p>
        
        {foreach from=$product.features key=feature item=value}
        <span class="prodfeature"><span class="feature">{$feature}</span><br />{$value}</span>
        {/foreach}
        
        <form method="post" action="cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}">
          <input type="submit" value="{$LANG.ordernowbutton} &raquo;" class="btn btn-danger" />
        </form>
    
      </div>
    </div>
    {/foreach}
  
  </div>

</div>

{if !$loggedin && $currencies}
<div id="currencychooser">
{foreach from=$currencies item=curr}
<a href="cart.php?gid={$gid}&currency={$curr.id}"><img src="images/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png" border="0" alt="" /> {$curr.code}</a>
{/foreach}
</div>
<div class="clear"></div>
{/if}

<br />
<br />

</div>