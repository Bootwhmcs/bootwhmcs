{literal}
<script language="javascript">
function usedefaultwhois(id) {
    jQuery("."+id.substr(0,id.length-1)+"customwhois").attr("disabled", true);
    jQuery("."+id.substr(0,id.length-1)+"defaultwhois").attr("disabled", false);
    jQuery('#'+id.substr(0,id.length-1)+'1').attr("checked", "checked");
}
function usecustomwhois(id) {
    jQuery("."+id.substr(0,id.length-1)+"customwhois").attr("disabled", false);
    jQuery("."+id.substr(0,id.length-1)+"defaultwhois").attr("disabled", true);
    jQuery('#'+id.substr(0,id.length-1)+'2').attr("checked", "checked");
}
</script>
{/literal}

{include file="$template/pageheader.tpl" title=$LANG.domaincontactinfo}

<div class="alert alert-info">
  {$LANG.domainname}: <strong>{$domain}</strong>
</div>

{if $successful}
<div class="alert alert-success">
  {$LANG.changessavedsuccessfully}
</div>
{/if}

{if $error}
<div class="alert alert-danger">
  {$error}
</div>
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?action=domaincontacts">

  <input type="hidden" name="sub" value="save" />
  <input type="hidden" name="domainid" value="{$domainid}" />
  
  <div class="row">
    {foreach from=$contactdetails name=contactdetails key=contactdetail item=values}
    <div class="col-sm-6">
      <div class="panel panel-info">
        <div class="panel-heading">
          <h3 class="panel-title">
            <a name="{$contactdetail}"></a>
            {$contactdetail}
          </h3>
        </div>
        
        <div class="panel-body">
          
          <div class="radio">
            <label>
              <input type="radio" class="radio inline" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="usedefaultwhois(id)"{if $defaultns} checked{/if} />
              {$LANG.domaincontactusexisting}
            </label>
          </div>
    
          <div class="form-group">
            <label for="{$contactdetail}3">{$LANG.domaincontactchoose}</label>
            <select class="form-control" name="sel[{$contactdetail}]" id="{$contactdetail}3" onclick="usedefaultwhois(id)">
              <option value="u{$clientsdetails.userid}">{$LANG.domaincontactprimary}</option>
              {foreach key=num item=contact from=$contacts}
              <option value="c{$contact.id}">{$contact.name}</option>
              {/foreach}
            </select>
          </div>
    
          <div class="radio">
            <label>
              <input type="radio" class="radio inline" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="usecustomwhois(id)"{if !$defaultns} checked{/if} />
              {$LANG.domaincontactusecustom}
            </label>
          </div>
    
          {foreach key=name item=value from=$values}
          <div class="form-group">
            <label for="{$contactdetail}3">{$name}</label>
            <input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" size="30" class="form-control" />
          </div>
          {/foreach}
          
        </div>
      </div>
    </div>
    {/foreach}
  </div>
  
  <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary btn-lg" /></p>

</form>