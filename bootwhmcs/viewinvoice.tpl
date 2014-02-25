<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset={$charset}" />
    <title>{$companyname} - {* This code should be uncommented for EU companies using the sequential invoice numbering so that when unpaid it is shown as a proforma invoice {if $status eq "Paid"}*}{$LANG.invoicenumber}{*{else}{$LANG.proformainvoicenumber}{/if}*}{$invoicenum}</title>

    <link href="templates/{$template}/static/css/invoice.css" rel="stylesheet">

  </head>

  <body>

<div class="wrapper">

{if $error}

<div class="creditbox">{$LANG.invoiceserror}</div>

{else}

<table class="header"><tr><td width="50%" nowrap>

{if $logo}<p><img src="{$logo}" title="{$companyname}" /></p>{else}<h1>{$companyname}</h1>{/if}

</td><td width="50%" align="center">

{if $status eq "Unpaid"}
<font class="unpaid">{$LANG.invoicesunpaid}</font><br />
{if $allowchangegateway}
<form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">{$gatewaydropdown}</form>
{else}
{$paymentmethod}<br />
{/if}
{$paymentbutton}
{elseif $status eq "Paid"}
<font class="paid">{$LANG.invoicespaid}</font><br />
{$paymentmethod}<br />
({$datepaid})
{elseif $status eq "Refunded"}
<font class="refunded">{$LANG.invoicesrefunded}</font>
{elseif $status eq "Cancelled"}
<font class="cancelled">{$LANG.invoicescancelled}</font>
{elseif $status eq "Collections"}
<font class="collections">{$LANG.invoicescollections}</font>
{/if}

</td></tr></table>

{if $smarty.get.paymentsuccess}
<p align="center" class="paid">{$LANG.invoicepaymentsuccessconfirmation}</p>
{elseif $smarty.get.pendingreview}
<p align="center" class="paid">{$LANG.invoicepaymentpendingreview}</p>
{elseif $smarty.get.paymentfailed}
<p align="center" class="unpaid">{$LANG.invoicepaymentfailedconfirmation}</p>
{elseif $offlinepaid}
<p align="center" class="refunded">{$LANG.invoiceofflinepaid}</p>
{/if}

{if $manualapplycredit}
<form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
<input type="hidden" name="applycredit" value="true" />
<div class="creditbox">
{$LANG.invoiceaddcreditdesc1} {$totalcredit}. {$LANG.invoiceaddcreditdesc2}<br />
{$LANG.invoiceaddcreditamount}: <input type="text" name="creditamount" size="10" value="{$creditamount}" /> <input type="submit" value="{$LANG.invoiceaddcreditapply}" />
</div>
</form>
{/if}

<table class="items"><tr><td width="50%">

<div class="addressbox">

<strong>{$LANG.invoicesinvoicedto}</strong><br />
{if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
{$clientsdetails.firstname} {$clientsdetails.lastname}<br />
{$clientsdetails.address1}, {$clientsdetails.address2}<br />
{$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
{$clientsdetails.country}
{if $customfields}
<br /><br />
{foreach from=$customfields item=customfield}
{$customfield.fieldname}: {$customfield.value}<br />
{/foreach}
{/if}

</div>

</td><td width="50%">

<div class="addressbox">

<strong>{$LANG.invoicespayto}</strong><br />
{$payto}

</div>

</td></tr></table>

<div class="row">
<span class="title">{* This code should be uncommented for EU companies using the sequential invoice numbering so that when unpaid it is shown as a proforma invoice {if $status eq "Paid"}*}{$LANG.invoicenumber}{*{else}{$LANG.proformainvoicenumber}{/if}*}{$invoicenum}</span><br />
{$LANG.invoicesdatecreated}: {$datecreated}<br />
{$LANG.invoicesdatedue}: {$datedue}
</div>

<table class="items">
    <tr class="title textcenter">
        <td width="70%">{$LANG.invoicesdescription}</td>
        <td width="30%">{$LANG.invoicesamount}</td>
    </tr>
{foreach from=$invoiceitems item=item}
    <tr>
        <td>{$item.description}{if $item.taxed eq "true"} *{/if}</td>
        <td class="textcenter">{$item.amount}</td>
    </tr>
{/foreach}
    <tr class="title">
        <td class="textright">{$LANG.invoicessubtotal}:</td>
        <td class="textcenter">{$subtotal}</td>
    </tr>
    {if $taxrate}
    <tr class="title">
        <td class="textright">{$taxrate}% {$taxname}:</td>
        <td class="textcenter">{$tax}</td>
    </tr>
    {/if}
    {if $taxrate2}
    <tr class="title">
        <td class="textright">{$taxrate2}% {$taxname2}:</td>
        <td class="textcenter">{$tax2}</td>
    </tr>
    {/if}
    <tr class="title">
        <td class="textright">{$LANG.invoicescredit}:</td>
        <td class="textcenter">{$credit}</td>
    </tr>
    <tr class="title">
        <td class="textright">{$LANG.invoicestotal}:</td>
        <td class="textcenter">{$total}</td>
    </tr>
</table>

{if $taxrate}<p>* {$LANG.invoicestaxindicator}</p>{/if}

<div class="row">
<span class="subtitle">{$LANG.invoicestransactions}</span>
</div>

<table class="items">
    <tr class="title textcenter">
        <td width="30%">{$LANG.invoicestransdate}</td>
        <td width="25%">{$LANG.invoicestransgateway}</td>
        <td width="25%">{$LANG.invoicestransid}</td>
        <td width="20%">{$LANG.invoicestransamount}</td>
    </tr>
{foreach from=$transactions item=transaction}
    <tr>
        <td class="textcenter">{$transaction.date}</td>
        <td class="textcenter">{$transaction.gateway}</td>
        <td class="textcenter">{$transaction.transid}</td>
        <td class="textcenter">{$transaction.amount}</td>
    </tr>
{foreachelse}
    <tr>
        <td class="textcenter" colspan="4">{$LANG.invoicestransnonefound}</td>
    </tr>
{/foreach}
    <tr class="title">
        <td class="textright" colspan="3">{$LANG.invoicesbalance}:</td>
        <td class="textcenter">{$balance}</td>
    </tr>
</table>

{if $notes}
<p>{$LANG.invoicesnotes}: {$notes}</p>
{/if}

{/if}

</div>

<p align="center"><a href="clientarea.php">{$LANG.invoicesbacktoclientarea}</a> | <a href="dl.php?type=i&amp;id={$invoiceid}">{$LANG.invoicesdownload}</a> | <a href="javascript:window.close()">{$LANG.closewindow}</a></p>

</body>
</html>