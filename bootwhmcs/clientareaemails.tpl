{include file="$template/pageheader.tpl" title=$LANG.clientareaemails desc=$LANG.emailstagline}

<table class="table table-striped table-framed">
  <thead>
    <tr>
      <th{if $orderby eq "date"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=emails&orderby=date">{$LANG.clientareaemailsdate}</a></th>
      <th{if $orderby eq "subject"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=emails&orderby=subject">{$LANG.clientareaemailssubject}</a></th>
      <th>&nbsp;</th>
    </tr>
  </thead>
  <tbody>
    {foreach from=$emails item=email}
    <tr>
      <td>{$email.date}</td>
      <td>{$email.subject}</td>
      <td class="text-right"><a href="viewemail.php?id={$email.id}" class="btn btn-danger btn-xs" onclick="window.open('viewemail.php?id={$email.id}','','width=650,height=400,scrollbars=yes'); return false">{$LANG.emailviewmessage}</a></td>
    </tr>
    {foreachelse}
    <tr>
      <td colspan="3" class="textcenter">{$LANG.norecordsfound}</td>
    </tr>
    {/foreach}
  </tbody>
  <tfoot>
    <tr>
      <td colspan="3">{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</td>
    </tr>
  </tfoot>
</table>

<ul class="pagination pull-right">
  <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}clientarea.php?action=emails&amp;page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
  <li class="next{if !$nextpage} disabled{/if}"><a href="{if $nextpage}clientarea.php?action=emails&amp;page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
</ul>