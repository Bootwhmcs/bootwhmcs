{if $domain eq "register"}
  
  {include file="orderforms/$carttpl/header.tpl" title=$LANG.registerdomain active=register}

{elseif $domain eq "transfer"}
  
  {include file="orderforms/$carttpl/header.tpl" title=$LANG.transferdomain active=transfer}

{/if}

<p>{if $domain eq "register"}{$LANG.registerdomaindesc}{else}{$LANG.transferdomaindesc}{/if}</p>

{if $errormessage}
  <div class="alert alert-error">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp;</div>
{/if}

<form onsubmit="checkavailability();return false">
  
  <div class="input-group">
    <div class="input-group-addon">www.</div>
    <input type="text" name="sld" id="sld" size="25" value="{$sld}" class="form-control" />
  </div>
  
  <br />
  
  <div class="row">
  
    <div class="col-sm-2">
      <select name="tld" id="tld" class="form-control">
        {foreach key=num item=listtld from=$tlds}
        <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
        {/foreach}
      </select>
    </div>
    
    <div class="col-sm-4">
      <input type="submit" value="{$LANG.checkavailability}" class="btn btn-danger btn-block" />
    </div>
    
  </div>

</form>

<hr />

<form method="post" action="cart.php?a=add&domain={$domain}">
  <div id="loading" class="text-center" style="display: none;">
    <i class="fa fa-spinner fa-spin fa-2x"></i> <br /><br />
  </div>
  
  <div id="domainresults"></div>
</form>

{include file="orderforms/$carttpl/footer.tpl"}



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

</div>