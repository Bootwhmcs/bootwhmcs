<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
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
      <h1>{if $domain eq "register"}{$LANG.registerdomain}{elseif $domain eq "transfer"}{$LANG.transferdomain}{/if}</h1>
    </div>
    
    {if $errormessage}<div class="alert alert-danger">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div>{/if}
    
    <p>{if $domain eq "register"}{$LANG.registerdomaindesc}{else}{$LANG.transferdomaindesc}{/if}</p>
    
    <form onsubmit="checkavailability();return false">
      <div class="input-group input-group-lg">
        <div class="input-group-addon">www.</div>
        <input type="text" name="sld" class="form-control" id="sld" size="25" value="{$sld}" />
      
        <div class="input-group-addon">
          <select name="tld" id="tld">
            {foreach key=num item=listtld from=$tlds}
            <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
            {/foreach}
          </select>
        </div>
        
        <div class="input-group-btn">
          <input type="submit" class="btn btn-danger" value="{$LANG.checkavailability}" />
        </div>
      </div>
    </form>
    
    <div class="clearfix"></div>
    
    <hr />
    
    <div id="loading" class="loading text-center" style="display: none;"><i class="fa fa-spin fa-spinner fa-2x"></i></div>
    <div id="domainresults"></div>
  </div>

</div>


{literal}
<script language="javascript">
function checkavailability() {
    jQuery("#loading").slideDown();
    jQuery.post("cart.php", { ajax: 1, a: "domainoptions", sld: jQuery("#sld").val(), tld: jQuery("#tld").val(), checktype: '{/literal}{$domain}{literal}' },
    function(data){
        jQuery("#domainresults").html(data);
        jQuery("#domainresults").slideDown();
        jQuery("#loading").slideUp();
    });
}
function cancelcheck() {
    jQuery("#domainresults").slideUp();
}{/literal}
{if $sld}{literal}
jQuery(document).ready(function(){
    checkavailability();
});
{/literal}{/if}
</script>