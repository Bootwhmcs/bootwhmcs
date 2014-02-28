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
      <h1>{$LANG.cartproductaddons}</h1>
    </div>
    
    {foreach from=$addons item=addon}
<div class="product">
<form method="post" action="{$smarty.server.PHP_SELF}?a=add">
<input type="hidden" name="aid" value="{$addon.id}" />

<div class="pricing">
{if $addon.free}
{$LANG.orderfree}
{else}
<span class="pricing">{$addon.recurringamount} {$addon.billingcycle}</span>
{if $addon.setupfee}<br />+ {$addon.setupfee} {$LANG.ordersetupfee}{/if}
{/if}
</div>

<div class="name">{$addon.name}</div>

<div class="description">{$addon.description}</div>

<div class="ordernowbox"><select name="productid">{foreach from=$addon.productids item=product}
<option value="{$product.id}">{$product.product}{if $product.domain} - {$product.domain}{/if}</option>
{/foreach}</select> <input type="submit" value="{$LANG.ordernowbutton}" class="ordernow" />
</div>

</form>
</div>
{/foreach}

{if $noaddons}
<div class="errorbox" style="display:block;">{$LANG.cartproductaddonsnone}</div>
{/if}
    
  </div>

</div>