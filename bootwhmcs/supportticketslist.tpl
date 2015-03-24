{include file="$template/pageheader.tpl" title=$LANG.clientareanavsupporttickets desc=$LANG.supportticketsintro}
<div class="row">
	<div class="col-sm-10">
	<form method="post" action="supporttickets.php">
	  <div class="input-group">
		<input type="text" name="searchterm" value="{if $q}{$q}{/if}" class="form-control" placeholder="{$LANG.searchtickets}" />
		<div class="input-group-btn">
		  <button type="submit" class="btn btn-info">{$LANG.searchfilter}</button>
		</div>
	  </div>
	</form>
	</div>
	<div class="col-sm-2">
		<a class="btn btn-danger" href="submitticket.php"><i class="icon icon-comment"></i> {$LANG.opennewticket}</a>
	</div>
</div>

<br />

<div class="table-responsive">
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th{if $orderby eq "date"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?{if $searchterm}searchterm={$searchterm}&token={$token}&{/if}orderby=date">{$LANG.supportticketsdate}</a></th>
	      <th{if $orderby eq "dept"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?{if $searchterm}searchterm={$searchterm}&token={$token}&{/if}orderby=dept">{$LANG.supportticketsdepartment}</a></th>
	      <th{if $orderby eq "subject"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?{if $searchterm}searchterm={$searchterm}&token={$token}&{/if}orderby=subject">{$LANG.supportticketssubject}</a></th>
	      <th{if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?{if $searchterm}searchterm={$searchterm}&token={$token}&{/if}orderby=status">{$LANG.supportticketsstatus}</a></th>
	      <th{if $orderby eq "lastreply"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?{if $searchterm}searchterm={$searchterm}&token={$token}&{/if}orderby=lastreply">{$LANG.supportticketsticketlastupdated}</a></th>
	      <th>&nbsp;</th>
	    </tr>
	  </thead>
	  <tbody>
	    {foreach key=num item=ticket from=$tickets}
	    <tr>
	      <td>{$ticket.date}</td>
	      <td>{$ticket.department}</td>
	      <td><a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}"><i class="fa fa-file-o"></i> {if $ticket.unread}<strong>{/if}#{$ticket.tid} - {$ticket.subject}{if $ticket.unread}</strong>{/if}</a></td>
	      <td>{$ticket.status}</td>
	      <td>{$ticket.lastreply}</td>
	      <td class="textcenter"><a href="viewticket.php?tid={$ticket.tid}&c={$ticket.c}" class="btn btn-danger btn-xs">{$LANG.supportticketsviewticket}</a></td>
	    </tr>
	    {foreachelse}
	    <tr>
	      <td colspan="7" class="textcenter">{$LANG.norecordsfound}</td>
	    </tr>
	    {/foreach}
	  </tbody>
	  <tfoot>
	    <tr>
	      <td colspan="4">{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</td>
	      <td colspan="3">{include file="$template/clientarearecordslimit.tpl" clientareaaction=$clientareaaction}</td>
	    </tr>
	  </tfoot>
	</table>
</div>
<ul class="pagination pull-right">
  <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}supporttickets.php?{if $searchterm}searchterm={$searchterm}&token={$token}&{/if}page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
  <li class="next{if !$nextpage} disabled{/if}"><a href="{if $nextpage}supporttickets.php?{if $searchterm}searchterm={$searchterm}&token={$token}&{/if}page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
</ul>
