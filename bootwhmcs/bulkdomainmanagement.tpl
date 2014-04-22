<form method="post" action="{$smarty.server.PHP_SELF}?action=bulkdomain">
  <input type="hidden" name="update" value="{$update}">
  <input type="hidden" name="save" value="1">

  {foreach from=$domainids item=domainid}
  <input type="hidden" name="domids[]" value="{$domainid}" />
  {/foreach}

  {if $update eq "nameservers"}

  <h2>{$LANG.domainmanagens}</h2>

  {if $save}
    {if $errors}
      <div class="alert alert-danger">
        {foreach from=$errors item=error}
          {$error}<br />
        {/foreach}
      </div>
    {else}
      <div class="alert alert-success">{$LANG.changessavedsuccessfully}</div>
    {/if}
  {/if}

  <p>{$LANG.domainbulkmanagementchangesaffect}</p>

  <blockquote>
    {foreach from=$domains item=domain}
    &raquo; {$domain}<br />
    {/foreach}
  </blockquote>

  {literal}<script language="javascript">
  function usedefaultns() {
      jQuery(".domnsinputs").attr("disabled", true);
  }
  function usecustomns() {
      jQuery(".domnsinputs").removeAttr("disabled");
  }
  </script>{/literal}

  <div class="radio">
    <label>
      <input type="radio" name="nschoice" value="default" id="nschoicedefault" onclick="usedefaultns()" checked />
      {$LANG.nschoicedefault}
    </label>
  </div>
  
  <div class="radio">
    <label>
      <input type="radio" name="nschoice" value="custom" id="nschoicecustom" onclick="usecustomns()" checked />
      {$LANG.nschoicecustom}
    </label>
  </div>
  
  <div class="form-group">
    <label>{$LANG.domainnameserver1}:</label>
    <input type="text" name="ns1" value="{$ns1}" size="40" class="form-control" />
  </div>
  
  <div class="form-group">
    <label>{$LANG.domainnameserver3}:</label>
    <input type="text" name="ns3" value="{$ns3}" size="40" class="form-control" />
  </div>
  
  <div class="form-group">
    <label>{$LANG.domainnameserver3}:</label>
    <input type="text" name="ns3" value="{$ns3}" size="40" class="form-control" />
  </div>
  
  <div class="form-group">
    <label>{$LANG.domainnameserver4}:</label>
    <input type="text" name="ns4" value="{$ns4}" size="40" class="form-control" />
  </div>

  <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-success" />

  {elseif $update eq "autorenew"}

  <h2>{$LANG.domainautorenewstatus}</h2>

  {if $save}
  <div class="alert alert-success">{$LANG.changessavedsuccessfully}</div>
  {/if}

  <p>{$LANG.domainautorenewinfo}</p>
  <p>{$LANG.domainautorenewrecommend}</p>

  <p>{$LANG.domainbulkmanagementaffect}</p>

  <blockquote>
  {foreach from=$domains item=domain}
  &raquo; {$domain}<br />
  {/foreach}
  </blockquote>

  <br />

  <p>
    <input type="submit" name="enable" value="{$LANG.domainsautorenewenable}" class="btn btn-success" />
    <input type="submit" name="disable" value="{$LANG.domainsautorenewdisable}" class="btn btn-danger" />
  </p>

  {elseif $update eq "reglock"}

  <h2>{$LANG.domainreglockstatus}</h2>

  {if $save}
    {if $errors}
    <div class="alert alert-danger">
      {foreach from=$errors item=error}
      {$error}<br />
      {/foreach}
    </div>
    {else}
      <div class="alert alert-success">{$LANG.changessavedsuccessfully}</div>
    {/if}
  {/if}

  <p>{$LANG.domainreglockinfo}</p>
  <p>{$LANG.domainreglockrecommend}</p>
  
  <p>{$LANG.domainbulkmanagementaffect}</p>
  
  <blockquote>
  {foreach from=$domains item=domain}
  &raquo; {$domain}<br />
  {/foreach}
  </blockquote>

  <br />

  <p>
    <input type="submit" name="enable" value="{$LANG.domainreglockenable}" class="btn btn-success" />
    <input type="submit" name="disable" value="{$LANG.domainreglockdisable}" class="btn btn-danger" />
  </p>

  {elseif $update eq "contactinfo"}

  <h2>{$LANG.domaincontactinfoedit}</h2>
  
  {if $save}
    {if $errors}
      <div class="alert alert-danger">
      {foreach from=$errors item=error}
        {$error}<br />
      {/foreach}
      </div>
    {else}
      <div class="alert alert-success">{$LANG.changessavedsuccessfully}</div>
    {/if}
  {/if}
  
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

  <p>{$LANG.domainbulkmanagementchangesaffect}</p>

  <blockquote>
  {foreach from=$domains item=domain}
  &raquo; {$domain}<br />
  {/foreach}
  </blockquote>
  
  <div class="row">
    {foreach from=$contactdetails name=contactdetails key=contactdetail item=values}
    <div class="col-lg-3 col-sm-6">
      <h3>{$contactdetail}</h3>
      
      <div class="well well-sm">
        <div class="radio" style="margin: 0px;">
          <label>
            <input type="radio" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="usedefaultwhois(id)" />
            {$LANG.domaincontactusexisting}
          </label>
        </div>
        
        <hr />
      
        <div class="form-group" id="{$contactdetail}defaultwhois" style="margin-bottom: 0px;">
          <select class="{$contactdetail}defaultwhois form-control" name="sel[{$contactdetail}]" id="{$contactdetail}3" onclick="usedefaultwhois(id)">
            <option value="u{$clientsdetails.userid}">{$LANG.domaincontactprimary}</option>
            {foreach key=num item=contact from=$contacts}
            <option value="c{$contact.id}">{$contact.name}</option>
            {/foreach}
          </select>
        </div>
      </div>
      
      <div class="well well-sm">
        <div class="radio" style="margin: 0px;">
          <label>
            <input type="radio" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="usecustomwhois(id)" checked />
            {$LANG.domaincontactusecustom}
          </label>
        </div>
      </div>

      {foreach key=name item=value from=$values}
      <div class="form-group">
        <label>{$name}</label>
        <input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" size="30" class="{$contactdetail}customwhois form-control" />
      </div>
      {/foreach}
      
    </div>
    {foreachelse}
  
    <div class="alert alert-danger">
        {$LANG.domainbulkmanagementnotpossible}
    </div>
    
    {/foreach}
  </div>
  
  <hr />

  <p><input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-success btn-lg btn-block" /></p>

  {/if}

</form>
