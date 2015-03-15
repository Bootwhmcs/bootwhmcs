{include file="$template/pageheader.tpl" title=$LANG.clientareanavdomains desc=$LANG.clientareadomainsintro}

<form method="post" action="clientarea.php?action=domains">
  <div class="input-group">
    <input type="text" name="q" value="{if $q}{$q}{/if}" class="form-control" placeholder="{$LANG.searchenterdomain}" />
    
    <div class="input-group-btn">
      <button type="submit" class="btn btn-info">{$LANG.searchfilter}</button>
    </div>
  </div>
</form>

<div class="clear"></div>
{literal}
<script>
$(document).ready(function() {
    $(".setbulkaction").click(function(event) {
      event.preventDefault();
      $("#bulkaction").val($(this).attr('id'));
      $("#bulkactionform").submit();
    });
});
</script>
{/literal}

<br />

<form method="post" id="bulkactionform" action="clientarea.php?action=bulkdomain">

<div class="btn-group">
  <a class="btn btn-danger" href="#" data-toggle="dropdown"><i class="icon-folder-open icon-white"></i> {$LANG.withselected}</a>
  <a class="btn btn-danger dropdown-toggle" href="#" data-toggle="dropdown"><span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li><a href="#" id="nameservers" class="setbulkaction"><i class="icon-globe"></i> {$LANG.domainmanagens}</a></li>
    <li><a href="#" id="autorenew" class="setbulkaction"><i class="icon-refresh"></i> {$LANG.domainautorenewstatus}</a></li>
    <li><a href="#" id="reglock" class="setbulkaction"><i class="icon-lock"></i> {$LANG.domainreglockstatus}</a></li>
    <li><a href="#" id="contactinfo" class="setbulkaction"><i class="icon-user"></i> {$LANG.domaincontactinfoedit}</a></li>
    {if $allowrenew}<li><a href="#" id="renew" class="setbulkaction"><i class="icon-repeat"></i> {$LANG.domainmassrenew}</a></li>{/if}
  </ul>
</div>

<br /><br />
<input id="bulkaction" name="update" type="hidden" />

<div class="table-responsive">
	<table class="table table-striped table-framed">
	    <thead>
	        <tr>
	            <th><input type="checkbox" onclick="toggleCheckboxes('domids')" /></th>
	            <th{if $orderby eq "domain"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&q={$q}{/if}&orderby=domain">{$LANG.clientareahostingdomain}</a></th>
	            <th{if $orderby eq "regdate"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&q={$q}{/if}&orderby=regdate">{$LANG.clientareahostingregdate}</a></th>
	            <th{if $orderby eq "nextduedate"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&q={$q}{/if}&orderby=nextduedate">{$LANG.clientareahostingnextduedate}</a></th>
	            <th{if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&q={$q}{/if}&orderby=status">{$LANG.clientareastatus}</a></th>
	            <th{if $orderby eq "autorenew"} class="headerSort{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&q={$q}{/if}&orderby=autorenew">{$LANG.domainsautorenew}</a></th>
	            <th>&nbsp;</th>
	        </tr>
	    </thead>
	    <tbody>
	{foreach key=num item=domain from=$domains}
	        <tr>
	          <td><input type="checkbox" name="domids[]" class="domids" value="{$domain.id}" /></td>
	          <td><a href="http://{$domain.domain}/" target="_blank">{$domain.domain}</a></td>
	          <td>{$domain.registrationdate}</td>
	          <td>{$domain.nextduedate}</td>
	          <td><span class="label label-{if $domain.rawstatus == 'pending'}warning{elseif $domain.rawstatus == 'suspended'}danger{elseif $domain.rawstatus == 'active'}success{/if}">{$domain.statustext}</span></td>
	          <td>{if $domain.autorenew}{$LANG.domainsautorenewenabled}{else}{$LANG.domainsautorenewdisabled}{/if}</td>
	          <td>
	            <div class="btn-group">
	              <a class="btn btn-xs btn-danger" href="clientarea.php?action=domaindetails&id={$domain.id}"> <i class="icon-wrench"></i> {$LANG.managedomain}</a>
	              {if $domain.rawstatus == "active"}
	              <a class="btn btn-xs btn-danger dropdown-toggle" href="#" data-toggle="dropdown"><span class="caret"></span></a>
	              <ul class="dropdown-menu">
	                <li><a href="clientarea.php?action=domaindetails&id={$domain.id}#tab3"><i class="icon-globe"></i> {$LANG.domainmanagens}</a></li>
	                <li><a href="clientarea.php?action=domaincontacts&domainid={$domain.id}"><i class="icon-user"></i> {$LANG.domaincontactinfoedit}</a></li>
	                <li><a href="clientarea.php?action=domaindetails&id={$domain.id}#tab2"><i class="icon-globe"></i> {$LANG.domainautorenewstatus}</a></li>
	                <li class="divider"></li>
	                <li><a href="clientarea.php?action=domaindetails&id={$domain.id}"><i class="icon-pencil"></i> {$LANG.managedomain}</a></li>
	              </ul>
	              {/if}
	            </div>
	          </td>
	        </tr>
	{foreachelse}
	        <tr>
	            <td colspan="7">{$LANG.norecordsfound}</td>
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
</form>


<ul class="pagination pull-right">
  <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}clientarea.php?action=domains{if $q}&q={$q}{/if}&amp;page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
  <li class="next{if !$nextpage} disabled{/if}"><a href="{if $nextpage}clientarea.php?action=domains{if $q}&q={$q}{/if}&amp;page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
</ul>

</form>

<br />
<br />