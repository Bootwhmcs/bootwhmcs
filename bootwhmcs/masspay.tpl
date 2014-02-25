{include file="$template/pageheader.tpl" title=$LANG.masspaytitle desc=$LANG.masspayintro}

<form method="post" action="clientarea.php?action=masspay" class="form-horizontal">
<input type="hidden" name="geninvoice" value="true" />

<br />

<div class="center80">
<table class="table table-striped table-framed">
    <thead>
        <tr>
            <th>{$LANG.invoicesdescription}</th>
            <th>{$LANG.invoicesamount}</th>
        </tr>
    </thead>
    <tbody>
{foreach from=$invoiceitems key=invid item=invoiceitem}
        <tr>
            <td colspan="2">
                <strong>{$LANG.invoicenumber} {$invid}</strong>
                <input type="hidden" name="invoiceids[]" value="{$invid}" />
            </td>
        </tr>
{foreach from=$invoiceitem item=item}
        <tr>
            <td>{$item.description}</td>
            <td>{$item.amount}</td>
        </tr>
{/foreach}
{foreachelse}
        <tr>
            <td colspan="6" align="center">{$LANG.norecordsfound}</td>
        </tr>
{/foreach}
        <tr class="subtotal">
            <td style="text-align:right;">{$LANG.invoicessubtotal}:</td>
            <td>{$subtotal}</td>
        </tr>
        {if $tax}<tr class="tax">
            <td style="text-align:right;">{$LANG.invoicestax}:</td>
            <td>{$tax}</td>
        </tr>{/if}
        {if $tax2}<tr class="tax">
            <td style="text-align:right;">{$LANG.invoicestax} 2:</td>
            <td>{$tax2}</td>
        </tr>{/if}
        {if $credit}<tr class="credit">
            <td style="text-align:right;">{$LANG.invoicescredit}:</td>
            <td>{$credit}</td>
        </tr>{/if}
        {if $partialpayments}<tr class="credit">
            <td style="text-align:right;">{$LANG.invoicespartialpayments}:</td>
            <td>{$partialpayments}</td>
        </tr>{/if}
        <tr class="total">
            <td style="text-align:right;">{$LANG.invoicestotaldue}:</td>
            <td>{$total}</td>
        </tr>
    </tbody>
</table>
</div>

<div class="center80">

<h3>{$LANG.orderpaymentmethod}</h3>

{foreach from=$gateways key=num item=gateway}
<label class="radio inline">
<input type="radio" class="radio inline" name="paymentmethod" value="{$gateway.sysname}"{if $gateway.sysname eq $defaultgateway} checked{/if} /> {$gateway.name}
</label>
{/foreach}

<br />
<br />

<p align="center"><input type="submit" value="{$LANG.masspaymakepayment}" class="btn btn-success btn-large" /></p>

</div>

<br />
<br />
<br />

</form>