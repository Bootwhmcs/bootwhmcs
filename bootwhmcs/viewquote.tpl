<html>
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="includes/jscript/css/ui.all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="includes/jscript/jquery.js"></script>
<script type="text/javascript" src="includes/jscript/jqueryui.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="./templates/{$template}/static/css/select2.css">
<link rel="stylesheet" href="./templates/{$template}/static/css/bootwhmcs.css">
<link rel="stylesheet" type="text/css" href="templates/{$template}/css/quote.css">
<title>Quote #{$id} for {$clientsdetails.companyname} from {$companyname}</title>

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
<div class="container">
	<div class="row">
		<div class="col-sm-6">{if $logo}<p><img src="{$logo}"></p>{else}<h1>{$companyname}</h1>{/if}</div>
		<div class="col-sm-6">
			{if $stage eq "Delivered"}
			<font class="unpaid">{$LANG.quotestagedelivered}</font><br />
			<form style="display:inline;"><input type="button" class="btn btn-default" value="{$LANG.quoteacceptbtn}" {if $accepttos}onclick="$('#quoteaccept').dialog('open')"{else}onclick="location.href='viewquote.php?id={$quoteid}&action=accept'" {/if} /></form>
			<form style="display:inline;" method="post" action="dl.php?type=q&amp;id={$quoteid}"><input type="submit" class="btn btn-default" value="{$LANG.quotedlpdfbtn}" /></form>
			{elseif $stage eq "Accepted"}
			<font class="paid">{$LANG.quotestageaccepted}</font><br />
			{elseif $stage eq "On Hold"}
			<font class="refunded">{$LANG.quotestageonhold}</font>
			<form style="display:inline;"><input type="button" class="btn btn-default" value="{$LANG.quoteacceptbtn}" {if $accepttos}onclick="$('#quoteaccept').dialog('open')"{else}onclick="location.href='viewquote.php?id={$quoteid}&action=accept'" {/if} /></form>
			<form style="display:inline;" method="post" action="dl.php?type=q&amp;id={$quoteid}"><input type="submit" class="btn btn-default" value="{$LANG.quotedlpdfbtn}" /></form>
			{elseif $stage eq "Lost"}
			<font class="cancelled">{$LANG.quotestagelost}</font>
			{elseif $stage eq "Dead"}
			<font class="collections">{$LANG.quotestagedead}</font>
			{/if}
		</div>
	</div>
{if $agreetosrequired}<p align="center" class="unpaid">{$LANG.ordererroraccepttos}</p>{/if}

	<div class="row">
		<div class="col-sm-6">
			<strong>{$LANG.quoterecipient}</strong><br />
			{if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
			{$clientsdetails.firstname} {$clientsdetails.lastname}<br />
			{$clientsdetails.address1}, {$clientsdetails.address2}<br />
			{$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
			{$clientsdetails.country}</br></br>
		</div>
		<div class="col-sm-6">
			<strong>{$LANG.invoicespayto}</strong><br />
			{$payto}</br></br>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-xs-6">
			<strong>{$LANG.quotenumber}:</strong>
		</div>
		<div class="col-xs-6">
			{$id}
		</div>
	</div>
		<div class="row">
		<div class="col-sm-2 col-xs-6">
			<strong>{$LANG.quotedatecreated}:</strong>
		</div>
		<div class="col-xs-6">
			{$datecreated}
		</div>
	</div>
		<div class="row">
		<div class="col-sm-2 col-xs-6">
			<strong>{$LANG.quotevaliduntil}:</strong>
		</div>
		<div class="col-xs-6">
			{$validuntil}
		</div>
	</div></br></br>
	<div class="row">
		<div class="col-sm-12">
			<p>{$proposal}</p>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-6">
			<strong>{$LANG.invoicesdescription}</strong>
		</div>
		<div class="col-xs-3">
			<strong>{$LANG.quotediscountheading}</strong>
		</div>
		<div class="col-xs-3">
			<strong>{$LANG.invoicesamount}</strong>
		</div>
	</div>
{foreach key=num item=quoteitem from=$quoteitems}
	<div class="row">
		<div class="col-xs-6">
			{$quoteitem.description}{if $quoteitem.taxed eq "true"} *{/if}
		</div>
		<div class="col-xs-3">
			{if $quoteitem.discount>0}{$quoteitem.discount} ({$quoteitem.discountpc}%){else} - {/if}
		</div>
		<div class="col-xs-3">
			{$quoteitem.amount}
		</div>
	</div>
{/foreach}
	<div class="row">
		<div class="col-xs-6">
			<strong><div align="right">{$LANG.invoicessubtotal}:&nbsp;</div></strong>
		</div>
		<div class="col-xs-3">
			<strong>&nbsp;</strong>
		</div>
		<div class="col-xs-3">
			<strong>{$subtotal}</strong>
		</div>
	</div>
{if $taxrate}
	<div class="row">
		<div class="col-xs-6">
			<strong><div align="right">{$taxrate}% {$taxname}:&nbsp;</div></strong>
		</div>
		<div class="col-xs-3">
			<strong>&nbsp;</strong>
		</div>
		<div class="col-xs-3">
			<strong>{$tax}</strong>
		</div>
	</div>
{/if}
{if $taxrate2}
	<div class="row">
		<div class="col-xs-6">
			<strong><div align="right">{$taxrate2}% {$taxname2}:&nbsp;</div></strong>
		</div>
		<div class="col-xs-3">
			<strong>&nbsp;</strong>
		</div>
		<div class="col-xs-3">
			<strong>{$tax2}</strong>
		</div>
	</div>
{/if}
	<div class="row">
		<div class="col-xs-6">
			<strong><div align="right">{$LANG.quotelinetotal}:&nbsp;</div></strong>
		</div>
		<div class="col-xs-3">
			<strong>&nbsp;</strong>
		</div>
		<div class="col-xs-3">
			<strong>{$total}</strong>
		</div>
	</div>


{if $taxrate}<p>* {$LANG.invoicestaxindicator}</p>{/if}

{if $notes}
<p>{$LANG.invoicesnotes}: {$notes}</p>
{/if}

<br /><br /><br /><br /><br />


{/if}
</div>
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
