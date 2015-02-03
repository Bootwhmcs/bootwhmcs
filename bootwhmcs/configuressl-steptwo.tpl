{if $errormessage}
<div class="errorbox">{$errormessage}</div>
<br />
{/if}
<h2>{$LANG.sslcertinfo}</h2>
<table width="100%" cellspacing="0" cellpadding="0" class="frame">
  <tr>
    <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
        <tr>
          <td width="120" class="fieldarea">{$LANG.sslorderdate}</td>
          <td>{$date}</td>
        </tr>
        <tr>
          <td class="fieldarea">{$LANG.sslcerttype}</td>
          <td>{$certtype}</td>
        </tr>
        <tr>
          <td class="fieldarea">{$LANG.sslstatus}</td>
          <td>{$status}</td>
        </tr>
        {foreach from=$displaydata key=displaydataname item=displaydatavalue}
        <tr>
          <td class="fieldarea">{$displaydataname}</td>
          <td>{$displaydatavalue}</td>
        </tr>
        {/foreach}
    </table></td>
  </tr>
</table>
<form name="submitticket" method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=3">
  <h2>{$LANG.sslcertapproveremail}</h2>
  <p>{$LANG.sslcertapproveremaildetails}</p>
  <p>{foreach from=$approveremails item=approveremail key=num}
    <input type="radio" name="approveremail" value="{$approveremail}"{if $num eq 0} checked{/if} />
    {$approveremail}<br />
    {/foreach}</p>
  <p align="center">
    <input type="submit" value="{$LANG.ordercontinuebutton}" />
  </p>
</form><br />