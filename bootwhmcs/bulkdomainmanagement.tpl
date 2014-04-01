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
        <div class="errorbox">
        {foreach from=$errors item=error}
            {$error}<br />
        {/foreach}
        </div>
    {else}
        <div class="successbox">{$LANG.changessavedsuccessfully}</div>
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

<p><input type="radio" name="nschoice" value="default" id="nschoicedefault" onclick="usedefaultns()" checked /> <label for="nschoicedefault">{$LANG.nschoicedefault}</label><br />
<input type="radio" name="nschoice" value="custom" id="nschoicecustom" onclick="usecustomns()" checked /> <label for="nschoicecustom">{$LANG.nschoicecustom}</label></p>

<table cellspacing="1" cellpadding="0" class="frame"><tr><td>
<table width="100%" cellpadding="2">
<tr><td class="fieldarea" width="150">{$LANG.domainnameserver1}:</td><td><input type="text" name="ns1" value="{$ns1}" size="40" class="domnsinputs" /></td></tr>
<tr><td class="fieldarea">{$LANG.domainnameserver2}:</td><td><input type="text" name="ns2" value="{$ns2}" size="40" class="domnsinputs" /></td></tr>
<tr><td class="fieldarea">{$LANG.domainnameserver3}:</td><td><input type="text" name="ns3" value="{$ns3}" size="40" class="domnsinputs" /></td></tr>
<tr><td class="fieldarea">{$LANG.domainnameserver4}:</td><td><input type="text" name="ns4" value="{$ns4}" size="40" class="domnsinputs" /></td></tr>
<tr><td class="fieldarea">{$LANG.domainnameserver5}:</td><td><input type="text" name="ns5" value="{$ns5}" size="40" class="domnsinputs" /></td></tr>
</table>
</td></tr></table>

<p align="center"><input type="submit" value="{$LANG.clientareasavechanges}" class="buttongo" /></p>

{elseif $update eq "autorenew"}

<h2>{$LANG.domainautorenewstatus}</h2>

{if $save}
    <div class="successbox">{$LANG.changessavedsuccessfully}</div>
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

<p align="center"><input type="submit" name="enable" value="{$LANG.domainsautorenewenable}" class="buttongo" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="disable" value="{$LANG.domainsautorenewdisable}" class="buttonwarn" /></p>

{elseif $update eq "reglock"}

<h2>{$LANG.domainreglockstatus}</h2>

{if $save}
    {if $errors}
        <div class="errorbox">
        {foreach from=$errors item=error}
            {$error}<br />
        {/foreach}
        </div>
    {else}
        <div class="successbox">{$LANG.changessavedsuccessfully}</div>
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

<p align="center"><input type="submit" name="enable" value="{$LANG.domainreglockenable}" class="buttongo" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="disable" value="{$LANG.domainreglockdisable}" class="buttonwarn" /></p>

{elseif $update eq "contactinfo"}

<h2>{$LANG.domaincontactinfoedit}</h2>

{if $save}
    {if $errors}
        <div class="errorbox">
        {foreach from=$errors item=error}
            {$error}<br />
        {/foreach}
        </div>
    {else}
        <div class="successbox">{$LANG.changessavedsuccessfully}</div>
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

{foreach from=$contactdetails name=contactdetails key=contactdetail item=values}

<p><strong><a name="{$contactdetail}"></a>{$contactdetail}</strong>{if $smarty.foreach.contactdetails.first}{foreach from=$contactdetails name=contactsx key=contactdetailx item=valuesx}{if !$smarty.foreach.contactsx.first} - <a href="clientarea.php?action=bulkdomain#{$contactdetailx}">{$LANG.jumpto} {$contactdetailx}</a>{/if}{/foreach}{else} - <a href="clientarea.php?action=bulkdomain#">{$LANG.top}</a>{/if}</p>

<p><input type="radio" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="usedefaultwhois(id)" /> <label for="{$contactdetail}1">{$LANG.domaincontactusexisting}</label></p>
    <table id="{$contactdetail}defaultwhois">
      <tr>
        <td width="150" align="right">{$LANG.domaincontactchoose}</td>
        <td><select class="{$contactdetail}defaultwhois" name="sel[{$contactdetail}]" id="{$contactdetail}3" onclick="usedefaultwhois(id)">
            <option value="u{$clientsdetails.userid}">{$LANG.domaincontactprimary}</option>
            {foreach key=num item=contact from=$contacts}
            <option value="c{$contact.id}">{$contact.name}</option>
            {/foreach}
          </select></td>
      </tr>
  </table>
<p><input type="radio" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="usecustomwhois(id)" checked /> <label for="{$contactdetail}2">{$LANG.domaincontactusecustom}</label></p>

<table width="100%">
{foreach key=name item=value from=$values}
<tr><td width="150" align="right">{$name}</td><td><input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" size="30" class="{$contactdetail}customwhois" /></td></tr>
{/foreach}
</table>

{foreachelse}

<div class="errorbox">
    {$LANG.domainbulkmanagementnotpossible}
</div>

{/foreach}

<p align="center"><input type="submit" value="{$LANG.clientareasavechanges}" class="buttongo" /></p>

{/if}

<br /><br />

</form>