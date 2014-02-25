<div class="row">

  <div class="col-sm-6">
    <div class="page-header">
      <h2>{$LANG.accountinfo} &nbsp;&nbsp;&nbsp;<small><a href="clientarea.php?action=details">{$LANG.clientareaupdateyourdetails}</a></small></h2>
    </div>
            
    <p><strong>{$clientsdetails.firstname} {$clientsdetails.lastname} {if $clientsdetails.companyname}({$clientsdetails.companyname}){/if}</strong></p>
    <p>{$clientsdetails.address1}{if $clientsdetails.address2}, {$clientsdetails.address2}{/if}</p>
    <p>{if $clientsdetails.city}{$clientsdetails.city}, {/if}{if $clientsdetails.state}{$clientsdetails.state}, {/if}{$clientsdetails.postcode}</p>
    <p>{$clientsdetails.countryname}</p>
    <p><a href="mailto:{$clientsdetails.email}">{$clientsdetails.email}</a></p>

  </div>

  <div class="col-sm-6">
    <div class="page-header">
      <h2>{$LANG.accountoverview}</h2>
    </div>

    <p>{$LANG.statsnumproducts}: <a href="clientarea.php?action=products"><strong>{$clientsstats.productsnumactive}</strong> ({$clientsstats.productsnumtotal}) - {$LANG.view} &raquo;</a></p>
    <p>{$LANG.statsnumdomains}: <a href="clientarea.php?action=domains"><strong>{$clientsstats.numactivedomains}</strong> ({$clientsstats.numdomains}) - {$LANG.view} &raquo;</a></p>
    <p>{$LANG.statsnumtickets}: <a href="supporttickets.php"><strong>{$clientsstats.numtickets}</strong> - {$LANG.view} &raquo;</a></p>
    <p>{$LANG.statsnumreferredsignups}: <a href="affiliates.php"><strong>{$clientsstats.numaffiliatesignups}</strong> - {$LANG.view} &raquo;</a></p>
    <p>{$LANG.creditcardyourinfo}: <strong>{if $defaultpaymentmethod}{$defaultpaymentmethod}{else}{$LANG.paymentmethoddefault}{/if}</strong> {if $clientsdetails.cctype}({$clientsdetails.cctype}-{$clientsdetails.cclastfour}) - <a href="clientarea.php?action=creditcard">Update &raquo;</a></p>{/if}

  </div>
</div>

{if $announcements}
<br />
<div class="alert alert-warning">
  <strong>{$LANG.ourlatestnews}:</strong> {$announcements.0.text|strip_tags|truncate:100:'...'} - <a href="announcements.php?id={$announcements.0.id}">{$LANG.more}...</a>
</div>
{/if}

{if $ccexpiringsoon}
<br />
<div class="alert alert-danger">
  <strong>{$LANG.ccexpiringsoon}:</strong> {$LANG.ccexpiringsoondesc|sprintf2:'<a href="clientarea.php?action=creditcard">':'</a>'}
</div>
{/if}

{if $clientsstats.incredit}
<br />
<div class="alert alert-success">
  <strong>{$LANG.availcreditbal}:</strong> {$LANG.availcreditbaldesc|sprintf2:$clientsstats.creditbalance}
</div>
{/if}

{if $clientsstats.numoverdueinvoices>0}
<br />
<div class="alert alert-danger">
  <strong>{$LANG.youhaveoverdueinvoices|sprintf2:$clientsstats.numoverdueinvoices}:</strong> {$LANG.overdueinvoicesdesc|sprintf2:'<a href="clientarea.php?action=masspay&all=true">':'</a>'}
</div>
{/if}

{foreach from=$addons_html item=addon_html}
  <div style="margin:15px 0;">{$addon_html}</div>
{/foreach}

{if $condlinks.domainreg || $condlinks.domaintrans || $condlinks.domainown}
<hr />
<form method="post" action="domainchecker.php">

  <input class="form-control input-lg" name="domain" type="text" placeholder="{$LANG.domaincheckerdomainexample}" />
  
  <br />
  
  <div class="row">
    
    <div class="col-md-6">
    {if $condlinks.domainreg}<input type="submit" value="{$LANG.checkavailability}" class="btn btn-primary btn-lg" />{/if}
    {if $condlinks.domaintrans}<input type="submit" name="transfer" value="{$LANG.domainstransfer}" class="btn btn-success btn-lg" />{/if}
    {if $condlinks.domainown}<input type="submit" name="hosting" value="{$LANG.domaincheckerhostingonly}" class="btn btn-danger btn-lg" />{/if}
    </div>
  
    {if $captcha}
    <div class="col-md-6">
      <p>{$LANG.captchaverify}</p>
    
    
      {if $captcha eq "recaptcha"}
      <p>{$recaptchahtml}</p>
      {else}
      <p><img src="includes/verifyimage.php" align="middle" /> <input type="text" name="code" class="input-small" maxlength="5" /></p>
      {/if}
    </div>
    {/if}
    
  </div>
</form>
{/if}

{if in_array('tickets',$contactpermissions)}

<br />

<a class="btn btn-danger pull-right" href="submitticket.php"><i class="icon-comment"></i> {$LANG.opennewticket}</a>
<h3>{$LANG.supportticketsopentickets} <span class="badge badge-info">{$clientsstats.numactivetickets}</span></h3>

<br />

<table class="table table-striped">
  <thead>
    <tr>
      <th><a href="supporttickets.php?orderby=date">{$LANG.supportticketsdate}</a></th>
      <th><a href="supporttickets.php?orderby=dept">{$LANG.supportticketsdepartment}</a></th>
      <th><a href="supporttickets.php?orderby=subject">{$LANG.supportticketssubject}</a></th>
      <th><a href="supporttickets.php?orderby=status">{$LANG.supportticketsstatus}</a></th>
      <th class="headerSortdesc"><a href="supporttickets.php?orderby=lastreply">{$LANG.supportticketsticketlastupdated}</a></th>
      <th>&nbsp;</th>
    </tr>
  </thead>
  <tbody>
    {foreach from=$tickets item=ticket}
    <tr>
      <td>{$ticket.date}</td>
      <td>{$ticket.department}</td>
      <td><div align="left"><img src="images/article.gif" alt="Ticket" border="0" />&nbsp;<a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">{if $ticket.unread}<strong>{/if}#{$ticket.tid} - {$ticket.subject}{if $ticket.unread}</strong>{/if}</a></div></td>
      <td>{$ticket.status}</td>
      <td>{$ticket.lastreply}</td>
      <td class="textcenter"><a href="viewticket.php?tid={$ticket.tid}&c={$ticket.c}" class="btn btn-danger btn-xs">{$LANG.supportticketsviewticket}</a></td>
    </tr>
    {foreachelse}
    <tr>
      <td colspan="6" class="textcenter">{$LANG.supportticketsnoneopen}</td>
    </tr>
    {/foreach}
  </tbody>
</table>

{/if}

{if in_array('invoices',$contactpermissions)}

<br />

<h3>{$LANG.invoicesdue} <span class="badge badge-important">{$clientsstats.numdueinvoices}</span></h3>

<br />

<form method="post" action="clientarea.php?action=masspay">
  <table class="table table-striped">
    <thead>
      <tr>
        {if $masspay}<th class="textcenter"><input type="checkbox" onclick="toggleCheckboxes('invids')" /></th>{/if}
        <th class="headerSortdesc"><a href="clientarea.php?action=invoices&orderby=id">{$LANG.invoicestitle}</a></th>
        <th{if $orderby eq "date"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=date">{$LANG.invoicesdatecreated}</a></th>
        <th{if $orderby eq "duedate"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=duedate">{$LANG.invoicesdatedue}</a></th>
        <th{if $orderby eq "total"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=total">{$LANG.invoicestotal}</a></th>
        <th{if $orderby eq "balance"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=balance">{$LANG.invoicesbalance}</a></th>
        <th{if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=status">{$LANG.invoicesstatus}</a></th>
        <th>&nbsp;</th>
      </tr>
    </thead>
    <tbody>
      {foreach from=$invoices item=invoice}
      <tr>
        {if $masspay}<td class="text-center"><input type="checkbox" name="invoiceids[]" value="{$invoice.id}" class="invids" /></td>{/if}
        <td><a href="viewinvoice.php?id={$invoice.id}" target="_blank">{$invoice.invoicenum}</a></td>
        <td>{$invoice.datecreated}</td>
        <td>{$invoice.datedue}</td>
        <td>{$invoice.total}</td>
        <td>{$invoice.balance}</td>
        <td><span class="label label-primary {$invoice.rawstatus}">{$invoice.statustext}</span></td>
        <td class="textcenter"><a href="viewinvoice.php?id={$invoice.id}" target="_blank" class="btn btn-danger btn-xs">{$LANG.invoicesview}</a></td>
      </tr>
      {foreachelse}
      <tr>
        <td colspan="{if $masspay}8{else}7{/if}" class="textcenter">{$LANG.invoicesnoneunpaid}</td>
      </tr>
      {/foreach}
      {if $invoices}
      <tr>
        <td colspan="{if $masspay}4{else}3{/if}">{if $masspay}<div align="left"><input type="submit" value="{$LANG.masspayselected}" class="btn btn-xs btn-danger" /> <a href="clientarea.php?action=masspay&all=true" class="btn btn-xs btn-success"><i class="icon-ok-circle icon-white"></i> {$LANG.masspayall}</a></div>{/if}</td>
        <td class="text-right"><strong>{$LANG.invoicestotaldue}</strong></td>
        <td><strong>{$totalbalance}</strong></td>
        <td colspan="2">&nbsp;</td>
      </tr>
      {/if}
    </tbody>
  </table>
</form>

{/if}

{if $files}


<h3>{$LANG.clientareafiles}</h3>

<div class="row">
{foreach from=$files item=file}
  <div class="col-md-4">
    <img src="images/file.png" /> <a href="dl.php?type=f&id={$file.id}" class="fontsize2"><strong>{$file.title}</strong></a><br />
    {$LANG.clientareafilesdate}: {$file.date}
  </div>
{/foreach}
</div>

{/if}