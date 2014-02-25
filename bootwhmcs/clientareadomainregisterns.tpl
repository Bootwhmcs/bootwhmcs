{include file="$template/pageheader.tpl" title=$LANG.domainregisterns}

<div class="alert alert-info">
  {$LANG.domainname}: <strong>{$domain}</strong>
</div>

<p>{$LANG.domainregisternsexplanation}</p>

{if $result}
<div class="alert alert-danger">
  {$result}
</div>
{/if}

<div class="row">

  <div class="col-sm-6">
    <form method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
      <input type="hidden" name="sub" value="register" />
      <input type="hidden" name="domainid" value="{$domainid}" />
    
      {include file="$template/pageheader.tpl" title=$LANG.domainregisternsreg}
    
      <div class="form-group">
        <label for="ns1">{$LANG.domainregisternsns}</label>
        <div class="input-group">
          <input type="text" name="ns" id="ns1" class="form-control" />
          
          <div class="input-group-addon">. {$domain}</div>
        </div>
      </div>
    
      <div class="form-group">
        <label for="ip1">{$LANG.domainregisternsip}</label>
        <input type="text" name="ipaddress" id="ip1" class="form-control" />
      </div>
      
      <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-success" />
    
    </fieldset>
    
    </form>
  </div>
  
  <div class="col-sm-6">
    <form method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
      <input type="hidden" name="sub" value="modify" />
      <input type="hidden" name="domainid" value="{$domainid}" />
    
      {include file="$template/pageheader.tpl" title=$LANG.domainregisternsmod}
    
      <div class="form-group">
        <label for="ns2">{$LANG.domainregisternsns}</label>
        
        <div class="input-group">
          <input type="text" name="ns" id="ns2" class="form-control" />
          
          <div class="input-group-addon">. {$domain}</div>
        </div>
      </div>
    
      <div class="form-group">
        <label for="ip2">{$LANG.domainregisternscurrentip}</label>
        <input type="text" name="currentipaddress" id="ip2" class="form-control" />
      </div>
    
      <div class="form-group">
        <label for="ip3">{$LANG.domainregisternsnewip}</label>
        <input type="text" name="newipaddress" id="ip3" class="form-control" />
      </div>
      
      <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-warning" />
    </form>
  </div>

</div>

<form method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
  <input type="hidden" name="sub" value="delete" />
  <input type="hidden" name="domainid" value="{$domainid}" />

  {include file="$template/pageheader.tpl" title=$LANG.domainregisternsdel}

  <div class="form-group">
    <label for="ns3">{$LANG.domainregisternsns}</label>
    
    <div class="input-group">
      <input type="text" name="ns" id="ns3" class="form-control" />
      
      <div class="input-group-addon">. {$domain}</div>
    </div>
  </div>

  <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-danger" />
</form>