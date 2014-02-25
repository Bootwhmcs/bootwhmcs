<div class="halfwidthcontainer">

{include file="$template/pageheader.tpl" title=$LANG.addfunds desc=$LANG.addfundsintro}

{if $addfundsdisabled}

<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaaddfundsdisabled}</p>
</div>

<br /><br /><br />

{else}

{if $notallowed || $errormessage}<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        <li>{if $notallowed}{$LANG.clientareaaddfundsnotallowed}{else}{$errormessage}{/if}</li>
    </ul>
</div>{/if}

<p>{$LANG.addfundsdescription}</p>

<br />

<table class="table table-striped table-framed">
    <tbody>
        <tr>
            <td class="textright"><strong>{$LANG.addfundsminimum}</strong></td>
            <td>{$minimumamount}</td>
        </tr>
        <tr>
            <td class="textright"><strong>{$LANG.addfundsmaximum}</strong></td>
            <td>{$maximumamount}</td>
        </tr>
        <tr>
            <td class="textright"><strong>{$LANG.addfundsmaximumbalance}</strong></td>
            <td>{$maximumbalance}</td>
        </tr>
    </tbody>
</table>

<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?action=addfunds">

<div class="logincontainer">

    <fieldset>

        <div class="control-group">
            <label class="control-label" for="amount">{$LANG.addfundsamount}:</label>
            <div class="controls">
                <input type="text" name="amount" id="amount" value="{$amount}" class="input-small" />
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="paymentmethod">{$LANG.orderpaymentmethod}:</label>
            <div class="controls">
                <select name="paymentmethod" id="paymentmethod">
                {foreach from=$gateways item=gateway}
                    <option value="{$gateway.sysname}">{$gateway.name}</option>
                {/foreach}
                </select>
            </div>
        </div>

    </fieldset>

<p align="center"><input type="submit" value="{$LANG.addfunds}" class="btn btn-primary" /></p>

<br />

<p align="center">{$LANG.addfundsnonrefundable}</p>

</div>

</form>

{/if}

</div>