{include file="orderforms/$carttpl/header.tpl" title=$groupname active=$groupname}


{foreach from=$products key=num item=product}
<div class="panel panel-default panel-info">
  <div class="panel-heading">
    <h3 class="panel-title">
      {$product.name}{if $product.qty!=""} <span class="qty">({$product.qty} {$LANG.orderavailable})</span>{/if}
      <span class="pull-right">
        {if $product.bid}
        {$LANG.bundledeal}
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


{include file="orderforms/$carttpl/footer.tpl"}
