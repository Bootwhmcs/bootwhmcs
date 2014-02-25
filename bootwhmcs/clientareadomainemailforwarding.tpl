{include file="$template/pageheader.tpl" title=$LANG.domainemailforwarding}

<div class="alert alert-info">
  {$LANG.domainname}: <strong>{$domain}</strong>
</div>

<p>{$LANG.domainemailforwardingdesc}</p>

{if $error}
<div class="alert alert-danger">
  {$error}
</div>
{/if}

{if $external}

<div class="text-center">
  {$code}
</div>

{else}

<form method="post" action="{$smarty.server.PHP_SELF}?action=domainemailforwarding">
  <input type="hidden" name="sub" value="save" />
  <input type="hidden" name="domainid" value="{$domainid}" />

  <table class="table table-striped">
    <thead>
      <tr>
        <th>{$LANG.domainemailforwardingprefix}</th>
        <th></th>
        <th>{$LANG.domainemailforwardingforwardto}</th>
      </tr>
    </thead>
    <tbody>
      {foreach key=num item=emailforwarder from=$emailforwarders}
      <tr>
        <td><input type="text" name="emailforwarderprefix[{$num}]" value="{$emailforwarder.prefix}" size="15" /></td>
        <td>@{$domain} => </td>
        <td><input type="text" name="emailforwarderforwardto[{$num}]" value="{$emailforwarder.forwardto}" size="35" /></td>
      </tr>
      {/foreach}
      <tr>
        <td><input type="text" name="emailforwarderprefixnew" size="15" /></td>
        <td>@{$domain} => </td>
        <td><input type="text" name="emailforwarderforwardtonew" size="35" /></td>
      </tr>
    </tbody>
  </table>

  <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
</form>

{/if}