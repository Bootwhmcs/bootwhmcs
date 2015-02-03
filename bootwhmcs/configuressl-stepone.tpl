{if !$status}

<p>{$LANG.sslinvalidlink}</p>

{else}

{if $errormessage}<div class="errorbox">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div><br />{/if}

<p><b>{$LANG.sslcertinfo}</b></p>

<table width="100%" cellspacing="0" cellpadding="0" class="frame"><tr><td>
<table width="100%" border="0" cellpadding="10" cellspacing="0">
<tr><td width="120" class="fieldarea">{$LANG.sslorderdate}</td><td>{$date}</td></tr>
<tr><td class="fieldarea">{$LANG.sslcerttype}</td><td>{$certtype}</td></tr>
{if $domain}<tr><td class="fieldarea">{$LANG.domainname}</td><td>{$domain}</td></tr>{/if}
<tr><td class="fieldarea">{$LANG.orderprice}</td><td>{$price}</td></tr>
<tr><td class="fieldarea">{$LANG.sslstatus}</td><td>{$status}</td></tr>
{foreach from=$displaydata key=displaydataname item=displaydatavalue}
<tr><td class="fieldarea">{$displaydataname}</td><td>{$displaydatavalue}</td></tr>
{/foreach}
</table>
</td></tr></table>

{if $status eq "Awaiting Configuration"}

<form name="submitticket" method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=2">

<p><b>{$LANG.sslserverinfo}</b></p>

<p>{$LANG.sslserverinfodetails}</p>

<table width="100%" cellspacing="0" cellpadding="0" class="frame"><tr><td>
<table width="100%" cellpadding="2">
<tr><td width="120" class="fieldarea">{$LANG.sslservertype}</td><td><select name="servertype"><option value="" selected>{$LANG.pleasechooseone}</option>{foreach from=$webservertypes key=webservertypeid item=webservertype}<option value="{$webservertypeid}"{if $servertype eq $webservertypeid} selected{/if}>{$webservertype}</option>{/foreach}</select></td></tr>
<tr><td class="fieldarea">{$LANG.sslcsr}</td><td><textarea name="csr" rows="7" style="width:90%">{$csr}</textarea></td></tr>
</table>
</td></tr></table>

{foreach from=$additionalfields key=heading item=fields}
<p><b>{$heading}</b></p>
<table width="100%" cellspacing="0" cellpadding="0" class="frame"><tr><td>
<table width="100%" cellpadding="2">
{foreach from=$fields item=vals}
<tr><td width="120" class="fieldarea">{$vals.name}</td><td>{$vals.input} {$vals.description}</td></tr>
{/foreach}
</table>
</td></tr></table>
{/foreach}

<p><b>{$LANG.ssladmininfo}</b></p>

<p>{$LANG.ssladmininfodetails}</p>

<table width="100%" cellspacing="0" cellpadding="0" class="frame"><tr><td>
<table width="100%" cellpadding="2">
<tr><td width="120" class="fieldarea">{$LANG.clientareafirstname}</td><td><input type="text" name="firstname" size="30" value="{$firstname}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientarealastname}</td><td><input type="text" name="lastname" size="30" value="{$lastname}" /></td></tr>
<tr><td class="fieldarea">{$LANG.organizationname}</td><td><input type="text" name="orgname" size="30" value="{$orgname}" /></td></tr>
<tr><td class="fieldarea">{$LANG.jobtitle}</td><td><input type="text" name="jobtitle" size="30" value="{$jobtitle}" /> (Required if Organization Name is set)</td></tr>
<tr><td class="fieldarea">{$LANG.clientareaemail}</td><td><input type="text" name="email" size="30" value="{$email}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareaaddress1}</td><td><input type="text" name="address1" size="30" value="{$address1}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareaaddress2}</td><td><input type="text" name="address2" size="30" value="{$address2}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareacity}</td><td><input type="text" name="city" size="30" value="{$city}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareastate}</td><td><input type="text" name="state" size="30" value="{$state}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareapostcode}</td><td><input type="text" name="postcode" value="{$postcode}" size="30" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareacountry}</td><td>{$countriesdropdown}</td></tr>
<tr><td class="fieldarea">{$LANG.clientareaphonenumber}</td><td><input type="text" name="phonenumber" size="30" value="{$phonenumber}" /></td></tr>
</table>
</td></tr></table>

<p align="center"><input type="submit" value="{$LANG.ordercontinuebutton}" /></p>

</form>

{else}

<form method="post" action="clientarea.php?action=productdetails">
<input type="hidden" name="id" value="{$serviceid}" />
<p align="center"><input type="submit" value="{$LANG.invoicesbacktoclientarea}" /></p>
 </form>

{/if}{/if}