<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div id="order-modern">

<h1>{$LANG.cartdomainsconfig}</h1>

<p>{$LANG.cartdomainsconfiginfo}</p>

{if $errormessage}<div class="errorbox" style="display:block;">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div><br />{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?a=confdomains">
<input type="hidden" name="update" value="true" />

{foreach key=num item=domain from=$domains}

<h3>{$domain.domain} - {$domain.regperiod} {$LANG.orderyears} {if $domain.hosting}<span style="color:#009900;">[{$LANG.cartdomainshashosting}]</span>{else}<a href="cart.php" style="color:#cc0000;">[{$LANG.cartdomainsnohosting}]</a>{/if}</h3>

<div id="domainconfig">

<table>
<tr><td width="120">Hosting:</td><td>{if $domain.hosting}<span style="color:#009900;">[{$LANG.cartdomainshashosting}]</span>{else}<a href="cart.php" style="color:#cc0000;">[{$LANG.cartdomainsnohosting}]</a><br />{/if}</td></tr>
<tr><td>{$LANG.orderregperiod}:</td><td>{$domain.regperiod} {$LANG.orderyears}</td></tr>
{if $domain.eppenabled}<tr><td>{$LANG.domaineppcode}:</td><td><input type="text" name="epp[{$num}]" size="20" value="{$domain.eppvalue}" /> {$LANG.domaineppcodedesc}</td></tr>{/if}
{if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}<tr><td class="fieldlabel">{$LANG.cartaddons}:</td><td>
{if $domain.dnsmanagement}<label><input type="checkbox" name="dnsmanagement[{$num}]"{if $domain.dnsmanagementselected} checked{/if} /> {$LANG.domaindnsmanagement} ({$domain.dnsmanagementprice})</label><br />{/if}
{if $domain.emailforwarding}<label><input type="checkbox" name="emailforwarding[{$num}]"{if $domain.emailforwardingselected} checked{/if} /> {$LANG.domainemailforwarding} ({$domain.emailforwardingprice})</label><br />{/if}
{if $domain.idprotection}<label><input type="checkbox" name="idprotection[{$num}]"{if $domain.idprotectionselected} checked{/if} /> {$LANG.domainidprotection} ({$domain.idprotectionprice})</label><br />{/if}
</td></tr>{/if}
{foreach key=domainfieldname item=domainfield from=$domain.fields}
<tr><td>{$domainfieldname}:</td><td>{$domainfield}</td></tr>
{/foreach}
</table>

</div>

{/foreach}

{if $atleastonenohosting}
<h2>{$LANG.domainnameservers}</h2>
<div id="domainconfig">
{$LANG.cartnameserversdesc}
<table align="center">
<tr><td width="120">{$LANG.domainnameserver1}:</td><td><input type="text" name="domainns1" size="40" value="{$domainns1}" /></td></tr>
<tr><td>{$LANG.domainnameserver2}:</td><td><input type="text" name="domainns2" size="40" value="{$domainns2}" /></td></tr>
<tr><td>{$LANG.domainnameserver3}:</td><td><input type="text" name="domainns3" size="40" value="{$domainns3}" /></td></tr>
<tr><td>{$LANG.domainnameserver4}:</td><td><input type="text" name="domainns4" size="40" value="{$domainns4}" /></td></tr>
<tr><td>{$LANG.domainnameserver5}:</td><td><input type="text" name="domainns5" size="40" value="{$domainns5}" /></td></tr>
</table>
</div>
{/if}

<p align="center"><input type="submit" value="{$LANG.updatecart}" /></p>

</form>

</div>