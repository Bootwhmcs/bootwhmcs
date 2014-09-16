<html>
<head>
<title>{$companyname} - {$id}</title>
<link rel="stylesheet" type="text/css" href="templates/{$template}/quotestyle.css">
<link href="includes/jscript/css/ui.all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="includes/jscript/jquery.js"></script>
<script type="text/javascript" src="includes/jscript/jqueryui.js"></script>
{literal}<script>
$(document).ready(function(){

$("#quoteaccept").dialog({
    autoOpen: false,
    resizable: false,
    width: 500,
    modal: true,
    buttons: {'Agree & Accept': function() {
            $("#quoteacceptfrm").submit();
        }}
});

});
</script>{/literal}
</head>
<body bgcolor="#efefef">

{if $error}
<p style="color:#cc0000;">{$LANG.invoiceserror}</p>
{else}

<table id="wrapper" cellspacing="1" cellpadding="10" bgcolor="#cccccc" align="center"><tr><td bgcolor="#ffffff">

<table width="100%"><tr><td width="50%">

{if $logo}<p><img src="{$logo}"></p>{else}<h1>{$companyname}</h1>{/if}

</td><td width="50%" align="center">

{if $stage eq "Delivered"}
<font class="unpaid">{$LANG.quotestagedelivered}</font><br />
<form style="display:inline"><input type="button" value="{$LANG.quoteacceptbtn}" {if $accepttos}onclick="$('#quoteaccept').dialog('open')"{else}onclick="location.href='viewquote.php?id={$quoteid}&action=accept'" {/if} /></form>
<form style="display:inline" method="post" action="dl.php?type=q&amp;id={$quoteid}"><input type="submit" value="{$LANG.quotedlpdfbtn}" /></form>
{elseif $stage eq "Accepted"}
<font class="paid">{$LANG.quotestageaccepted}</font><br />
{elseif $stage eq "On Hold"}
<font class="refunded">{$LANG.quotestageonhold}</font>
<form style="display:inline"><input type="button" value="{$LANG.quoteacceptbtn}" {if $accepttos}onclick="$('#quoteaccept').dialog('open')"{else}onclick="location.href='viewquote.php?id={$quoteid}&action=accept'" {/if} /></form>
<form style="display:inline" method="post" action="dl.php?type=q&amp;id={$quoteid}"><input type="submit" value="{$LANG.quotedlpdfbtn}" /></form>
{elseif $stage eq "Lost"}
<font class="cancelled">{$LANG.quotestagelost}</font>
{elseif $stage eq "Dead"}
<font class="collections">{$LANG.quotestagedead}</font>
{/if}

</td></tr></table>

{if $agreetosrequired}<p align="center" class="unpaid">{$LANG.ordererroraccepttos}</p>{/if}

<table width="100%" id="invoicetoptables" cellspacing="0"><tr><td width="50%" id="invoicecontent" style="border:1px solid #cccccc">

<table width="100%" height="120" cellspacing="0" cellpadding="10" id="invoicetoptables"><tr><td id="invoicecontent" valign="top" style="border:1px solid #cccccc">

<strong>{$LANG.quoterecipient}</strong><br />
{if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
{$clientsdetails.firstname} {$clientsdetails.lastname}<br />
{$clientsdetails.address1}, {$clientsdetails.address2}<br />
{$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
{$clientsdetails.country}

</td></tr></table>

</td><td width="50%" id="invoicecontent" style="border:1px solid #cccccc;border-left:0px;">

<table width="100%" height="120" cellspacing="0" cellpadding="10" id="invoicetoptables"><tr><td id="invoicecontent" valign="top" style="border:1px solid #cccccc">

<strong>{$LANG.invoicespayto}</strong><br />
{$payto}

</td></tr></table>

</td></tr></table>

<p><strong>{$LANG.quotenumber}: {$id}</strong><br />
{$LANG.quotedatecreated}: {$datecreated}<br />
{$LANG.quotevaliduntil}: {$validuntil}<br /></p>

<p>{$proposal}</p>

<table cellspacing="0" id="invoiceitemstable" align="center">
<tr>
    <td id="invoiceitemsheading" align="center" width="50%" style="border:1px solid #cccccc;border-bottom:0px;"><strong>{$LANG.invoicesdescription}</strong></td>
    <td id="invoiceitemsheading" align="center" width="25%" style="border:1px solid #cccccc;border-left:0px;border-bottom:0px;"><strong>{$LANG.quotediscountheading}</strong></td>
    <td id="invoiceitemsheading" align="center" width="25%" style="border:1px solid #cccccc;border-left:0px;border-bottom:0px;"><strong>{$LANG.invoicesamount}</strong></td>
</tr>
{foreach key=num item=quoteitem from=$quoteitems}
<tr bgcolor=#ffffff>
    <td id="invoiceitemsrow" style="border:1px solid #cccccc;border-bottom:0px;">{$quoteitem.description}{if $quoteitem.taxed eq "true"} *{/if}</td>
    <td align="center" id="invoiceitemsrow" style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;">{if $quoteitem.discount>0}{$quoteitem.discount} ({$quoteitem.discountpc}%){else} - {/if}</td>
    <td align="center" id="invoiceitemsrow" style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;">{$quoteitem.amount}</td>
</tr>
{/foreach}
<tr>
    <td id="invoiceitemsheading" style="border:1px solid #cccccc;border-bottom:0px;"><div align="right">{$LANG.invoicessubtotal}:&nbsp;</div></td>
    <td id="invoiceitemsheading" align="center" style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;">&nbsp;</td>
    <td id="invoiceitemsheading" align="center" style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;"><strong>{$subtotal}</strong></td>
</tr>
{if $taxrate}
<tr>
    <td id="invoiceitemsheading" style="border:1px solid #cccccc;border-bottom:0px;"><div align="right">{$taxrate}% {$taxname}:&nbsp;</div></td>
    <td id="invoiceitemsheading" align="center" style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;">&nbsp;</td>
    <td id="invoiceitemsheading" align="center" style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;"><strong>{$tax}</strong></td>
</tr>
{/if}
{if $taxrate2}
<tr>
    <td id="invoiceitemsheading" style="border:1px solid #cccccc;border-bottom:0px;"><div align="right">{$taxrate2}% {$taxname2}:&nbsp;</div></td>
    <td id="invoiceitemsheading" align="center" style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;">&nbsp;</td>
    <td id="invoiceitemsheading" align="center" style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;"><strong>{$tax2}</strong></td>
</tr>
{/if}
<tr>
    <td id="invoiceitemsheading" style="border:1px solid #cccccc;"><div align="right">{$LANG.quotelinetotal}:&nbsp;</div></td>
    <td id="invoiceitemsheading" align="center" style="border:1px solid #cccccc;border-left:0px;border-left:0px;">&nbsp;</td>
    <td id="invoiceitemsheading" align="center" style="border:1px solid #cccccc;border-left:0px;"><strong>{$total}</strong></td>
</tr>
</table>

{if $taxrate}<p>* {$LANG.invoicestaxindicator}</p>{/if}

{if $notes}
<p>{$LANG.invoicesnotes}: {$notes}</p>
{/if}

<br /><br /><br /><br /><br />

</td></tr></table>

{/if}

<p align="center"><a href="clientarea.php">{$LANG.invoicesbacktoclientarea}</a> | <a href="dl.php?type=q&amp;id={$quoteid}">{$LANG.quotedlpdfbtn}</a> | <a href="javascript:window.close()">{$LANG.closewindow}</a></p>

<div id="quoteaccept" title="{$LANG.quoteacceptancetitle}" style="display:none;">

<form method="post" action="{$smarty.server.PHP_SELF}?id={$quoteid}&action=accept" id="quoteacceptfrm">

<p>{$LANG.quoteacceptancehowto} <a href="{$tosurl}" target="_blank">{$tosurl}</a></p>

<p align="center"><label><input type="checkbox" name="agreetos" /> {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></label></p>

<p>{$LANG.quoteacceptancewarning}</p>

</form>

</div>

</body>
</html>
