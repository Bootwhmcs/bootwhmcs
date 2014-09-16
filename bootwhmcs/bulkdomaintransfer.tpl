{if $bulkdomainsearchenabled}
  {include file="$template/pageheader.tpl" title=$LANG.domaintitle desc=$LANG.domaincheckerintro}

  <p align="right">
    <a href="domainchecker.php">{$LANG.domainsimplesearch}</a> |
    <a href="domainchecker.php?search=bulkregister">{$LANG.domainbulksearch}</a> |
    <strong>{$LANG.domainbulktransfersearch}</strong>
  </p>
{/if}

{if $inccode}
  <div class="alert alert-danger">{$LANG.captchaverifyincorrect}</div>
{/if}

<div class="row">
  <div class="col-md-5">

    {if $invalid}
      <div class="alert alert-danger">{$LANG.ordererrordomaininvalid}</div>
    {/if}

    <div class="well">
      <p><small>{$LANG.domainbulktransferdescription}</small></p>

      <hr />

      <form method="post" action="domainchecker.php?search=bulktransfer">

        <div class="form-group">
          <textarea name="bulkdomains" class="form-control" rows="8">{$bulkdomains}</textarea>
        </div>

        {if $capatacha}
          {if $capatacha eq "recaptcha"}
            <p>{$LANG.captchaverify}</p>
            <div align="center">{$recapatchahtml}</div>
            <br />
          {else}
            <img src="includes/verifyimage.php" align="middle" /> <input type="text" name="code" size="10" maxlength="5" /> &nbsp;&nbsp;&nbsp;
          {/if}
        {/if}

        <button type="submit" id="Submit" value="" class="btn btn-success btn-block"><i class="fa fa-globe"></i> {$LANG.domainlookupbutton}</button>
      </form>
    </div>

  </div>

  <div class="col-md-7">

    {if $availabilityresults}

      {include file="$template/pageheader.tpl" title=$LANG.morechoices}
      <form method="post" action="{$systemsslurl}cart.php?a=add&domain=transfer">
        <table width="100%" border="0" cellpadding="10" cellspacing="0" class="table table-striped table-bordered">
          <tr>
            <th width="20"></th>
            <th>{$LANG.domainname}</th>
            <th>{$LANG.domainstatus}</th>
            <th width="250">{$LANG.domainmoreinfo}</th>
          </tr>
          {foreach key=num item=result from=$availabilityresults}
          <tr>
            <td>{if $result.status eq "available"}
              <input type="checkbox" name="domains[]" value="{$result.domain}" />
              <input type="hidden" name="domainsregperiod[{$result.domain}]" value="{$result.period}" />
              {else}X{/if}</td>
            <td>{$result.domain}</td>
            <td class="{if $result.status eq "available"}success{else}danger{/if}">{if $result.status eq "available"}{$LANG.domainavailable}{else}{$LANG.domainunavailable}{/if}</td>
            <td>{if $result.status eq "available"}
              <select name="domainsregperiod[{$result.domain}]" class="form-control input-sm">
                {foreach key=period item=regoption from=$result.regoptions}
                {if $regoption.transfer}<option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.transfer}</option>{/if}
                {/foreach}
              </select>
              {/if}</td>
          </tr>
          {/foreach}
        </table>

        <button type="submit" class="btn btn-danger pull-right">{$LANG.ordernowbutton}</button>
      </form>

    {else}

      {include file="$template/pageheader.tpl" title=$LANG.domainspricing}

      <table width="100%" border="0" cellpadding="10" cellspacing="0" class="table table-striped table-bordered">
        <tr>
          <th>{$LANG.domaintld}</th>
          <th>{$LANG.domainminyears}</th>
          <th>{$LANG.domainsregister}</th>
          <th>{$LANG.domainstransfer}</th>
          <th>{$LANG.domainsrenew}</th>
        </tr>
        {foreach key=num item=tldpricelist from=$tldpricelist}
        <tr>
          <td>{$tldpricelist.tld}</td>
          <td>{$tldpricelist.period}</td>
          <td>{if $tldpricelist.register}{$tldpricelist.register}{else}{$LANG.domainregnotavailable}{/if}</td>
          <td>{if $tldpricelist.transfer}{$tldpricelist.transfer}{else}{$LANG.domainregnotavailable}{/if}</td>
          <td>{if $tldpricelist.renew}{$tldpricelist.renew}{else}{$LANG.domainregnotavailable}{/if}</td>
        </tr>
        {/foreach}
      </table>

    {/if}

  </div>

</div>
