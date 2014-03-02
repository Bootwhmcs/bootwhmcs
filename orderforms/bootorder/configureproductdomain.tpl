{include file="orderforms/$carttpl/header.tpl" title=$productinfo.name}

<p>{$LANG.cartmakedomainselection}</p>

<form onsubmit="checkdomain();return false">
  
  <div class="domainoptions">
    
    <hr />
      
    {if $incartdomains}
    <div class="well well-sm">
      <div class="radio">
        <label>
          <input type="radio" name="domainoption" value="incart" id="selincart" />
          <strong>{$LANG.cartproductdomainuseincart}</strong>
        </label>
      </div>
      
      <div class="domainreginput row" id="domainincart">
        
        <div class="col-sm-5">
          <select id="incartsld" class="form-control">
            {foreach key=num item=incartdomain from=$incartdomains}
            <option value="{$incartdomain}">{$incartdomain}</option>
            {/foreach}
          </select>
        </div>
        
        <div class="col-sm-4">
          <input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-primary" />
        </div>
      </div>
    </div>
    {/if}
    
    {if $registerdomainenabled}
    <div class="well well-sm">
      <div class="radio">
        <label>
          <input type="radio" name="domainoption" value="register" id="selregister" />
          <strong>{$LANG.cartregisterdomainchoice|sprintf2:$companyname}</strong>
        </label>
      </div>
      
      <div class="domainreginput" id="domainregister">
        
        <div class="input-group">
          <div class="input-group-addon">www.</div>
          <input type="text" id="registersld" size="30" value="{$sld}" class="form-control" />
        </div>
        
        <br />
      
        <div class="row">
        
          <div class="col-sm-4">
            <select id="registertld" class="form-control">
              {foreach key=num item=listtld from=$registertlds}
              <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
              {/foreach}
            </select>
          </div>
          
          <div class="col-sm-3">
            <input type="submit" value="{$LANG.checkavailability}" class="btn btn-primary" />
          </div>
        </div>
      </div>
    </div>
    {/if}
    
    {if $transferdomainenabled}
    <div class="well well-sm">
      <div class="radio">
        <label>
          <input type="radio" name="domainoption" value="transfer" id="seltransfer" />
          <strong>{$LANG.carttransferdomainchoice|sprintf2:$companyname}</strong>
        </label>
      </div>
  
      <div class="domainreginput" id="domaintransfer">
      
        <div class="input-group">
          <div class="input-group-addon">www.</div>
          <input type="text" id="transfersld" value="{$sld}" class="form-control" />
        </div>
        
        <br />
        
        <div class="row">
        
          <div class="col-sm-4">
            <select id="transfertld" class="form-control">
              {foreach key=num item=listtld from=$transfertlds}
              <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
              {/foreach}
            </select>
          </div>
          
          <div class="col-sm-4">
            <input type="submit" value="{$LANG.checkavailability}" class="btn btn-block btn-primary" />
          </div>
        </div>
      </div>
    </div>
    {/if}
    
  </div>



{if $owndomainenabled}
<div class="option">
<label><input type="radio" name="domainoption" value="owndomain" id="selowndomain" />{$LANG.cartexistingdomainchoice|sprintf2:$companyname}</label>
<div class="domainreginput" id="domainowndomain">
www. <input type="text" id="owndomainsld" size="30" value="{$sld}" /> . <input type="text" id="owndomaintld" size="5" value="{$tld|substr:1}" /> <input type="submit" value="{$LANG.ordercontinuebutton}" />
</div>
</div>
{/if}
{if $subdomains}
<div class="option">
<label><input type="radio" name="domainoption" value="subdomain" id="selsubdomain" />{$LANG.cartsubdomainchoice|sprintf2:$companyname}</label>
<div class="domainreginput" id="domainsubdomain">
http:// <input type="text" id="subdomainsld" size="30" value="{$sld}" /> <select id="subdomaintld">{foreach from=$subdomains key=subid item=subdomain}<option value="{$subid}">{$subdomain}</option>{/foreach}</select> <input type="submit" value="{$LANG.ordercontinuebutton}" />
</div>
</div>
{/if}
</div>

{if $freedomaintlds}<p>* <em>{$LANG.orderfreedomainregistration} {$LANG.orderfreedomainappliesto}: {$freedomaintlds}</em></p>{/if}

</form>
    <div id="greyout"></div>
<div id="domainpopupcontainer">
<form id="domainfrm" onsubmit="completedomain();return false">
<div class="domainresults" id="domainresults"><img src="images/loading.gif" border="0" alt="Loading..." /></div>
</form>
</div>

<div id="prodconfigcontainer"></div>
</div>

{literal}
<script language="javascript">
jQuery(".domainreginput").hide();
jQuery(".domainoptions input:first").attr('checked','checked');
jQuery(".domainoptions input:first").parent().parent().addClass('optionselected');
jQuery("#domain"+jQuery(".domainoptions input:first").val()).show();
jQuery(document).ready(function(){
    jQuery(".domainoptions input:radio").click(function(){
        jQuery(".domainoptions .option").removeClass('optionselected');
        jQuery(this).parent().parent().addClass('optionselected');
        jQuery("#domainresults").slideUp();
        jQuery(".domainreginput").hide();
        jQuery("#domain"+jQuery(this).val()).show();
    });
});
function checkdomain() {
    jQuery("#greyout").fadeIn();
    jQuery("#domainpopupcontainer").slideDown();
    var domainoption = jQuery(".domainoptions input:checked").val();
    var sld = jQuery("#"+domainoption+"sld").val();
    var tld = '';
    if (domainoption=='incart') var sld = jQuery("#"+domainoption+"sld option:selected").text();
    if (domainoption=='subdomain') var tld = jQuery("#"+domainoption+"tld option:selected").text();
    else var tld = jQuery("#"+domainoption+"tld").val();
    jQuery.post("cart.php", { ajax: 1, a: "domainoptions", sld: sld, tld: tld, checktype: domainoption },
    function(data){
        jQuery("#domainresults").html(data);
    });
}
function cancelcheck() {
    jQuery("#domainpopupcontainer").slideUp('slow',function() {
        jQuery("#greyout").fadeOut();
        jQuery("#domainresults").html('<img src="images/loading.gif" border="0" alt="Loading..." />');
    });
}
function completedomain() {
    jQuery("#domainresults").append('<img src="images/loading.gif" border="0" alt="Loading..." />');
    jQuery.post("cart.php", 'ajax=1&a=add&pid={/literal}{$pid}{literal}&domainselect=1&'+jQuery("#domainfrm").serialize(),
    function(data){
        if (data=='') {
            window.location='cart.php?a=view';
        } else if (data=='nodomains') {
            jQuery("#domainpopupcontainer").slideUp('slow',function() {
                jQuery("#greyout").fadeOut();
            });
        } else {
            jQuery("#prodconfigcontainer").html(data);
            jQuery("#domainpopupcontainer").slideUp('slow',function() {
                jQuery("#greyout").fadeOut();
            });
            jQuery("#prodconfigcontainer").slideDown();
        }
    });
}
</script>
{/literal}