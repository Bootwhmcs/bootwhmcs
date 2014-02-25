{include file="$template/pageheader.tpl" title=$LANG.invoices desc=$LANG.invoicesintro}

<span class="invoicetotal">{$LANG.invoicesoutstandingbalance}: <span class="text{if $nobalance}green{else}red{/if}">{$totalbalance}</span></span>{if $masspay}&nbsp; <a href="clientarea.php?action=masspay&all=true" class="btn btn-success"><i class="icon-ok-circle icon-white"></i> {$LANG.masspayall}</a>{/if}

<div class="clearfix"></div>

<br />

<form method="post" action="clientarea.php?action=masspay">
  <table class="table table-striped">
    <thead>
      <tr>
        <th{if $orderby eq "id"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=id">{$LANG.invoicestitle}</a></th>
        <th{if $orderby eq "date"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=date">{$LANG.invoicesdatecreated}</a></th>
        <th{if $orderby eq "duedate"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=duedate">{$LANG.invoicesdatedue}</a></th>
        <th{if $orderby eq "total"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=total">{$LANG.invoicestotal}</a></th>
        <th{if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=invoices&orderby=status">{$LANG.invoicesstatus}</a></th>
        <th>&nbsp;</th>
      </tr>
    </thead>
    <tbody>
      {foreach from=$invoices item=invoice}
      <tr>
        <td><a href="viewinvoice.php?id={$invoice.id}" target="_blank"><strong>{$invoice.invoicenum}</strong></a></td>
        <td>{$invoice.datecreated}</td>
        <td>{$invoice.datedue}</td>
        <td>{$invoice.total}</td>
        <td><span class="label label-{if $invoice.rawstatus == 'unpaid'}warning{elseif $invoice.rawstatus == 'overdue'}danger{elseif $invoice.rawstatus == 'paid'}success{/if}">{$invoice.statustext}</span></td>
        <td><a href="viewinvoice.php?id={$invoice.id}" target="_blank" class="btn btn-xs btn-danger">{$LANG.invoicesview}</a></td>
      </tr>
      {foreachelse}
      <tr>
        <td colspan="6" class="textcenter">{$LANG.norecordsfound}</td>
      </tr>
      {/foreach}
    </tbody>
    <tfoot>
      <tr>
        <td colspan="3">{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</td>
        <td colspan="3">{include file="$template/clientarearecordslimit.tpl" clientareaaction=$clientareaaction}</td>
      </tr>
    </tfoot>
  </table>
</form>

<ul class="pagination pull-right  ">
  <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}clientarea.php?action=invoices{if $q}&q={$q}{/if}&amp;page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
  <li class="next{if !$nextpage} disabled{/if}"><a href="{if $nextpage}clientarea.php?action=invoices{if $q}&q={$q}{/if}&amp;page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
</ul>