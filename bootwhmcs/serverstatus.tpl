{include file="$template/pageheader.tpl" title=$LANG.networkstatustitle desc=$LANG.networkstatusintro}

<div class="row">

  <div class="col-md-4">
  
    <a href="{$smarty.server.PHP_SELF}?view=open" class="btn-danger btn-block text-center" style="padding: 10px 0px;">
      <h1>{$opencount}</h1>
      <p class="lead">{$LANG.networkissuesstatusopen}</p>
    </a>
  
  </div>
  
  <div class="col-md-4">
  
    <a href="{$smarty.server.PHP_SELF}?view=scheduled" class="btn-warning btn-block text-center" style="padding: 10px 0px;">
      <h1>{$scheduledcount}</h1>
      <p class="lead">{$LANG.networkissuesstatusscheduled}</p>
    </a>
  
  </div>
  
  <div class="col-md-4">
  
    <a href="{$smarty.server.PHP_SELF}?view=resolved" class="btn-success btn-block text-center" style="padding: 10px 0px;">
      <h1>{$resolvedcount}</h1>
      <p class="lead">{$LANG.networkissuesstatusresolved}</p>
    </a>
  
  </div>

</div>

<br />

<div class="row">

  {foreach from=$issues item=issue}
  <div class="col-sm-6">
    {if $issue.clientaffected}<div class="alert-message alert-warning">{/if}

    <div style="border-left: 5px solid {if $issue.priority == 'Critical'}#d9534f{elseif $issue.priority == 'High'}#ed9c28{elseif $issue.priority == 'Medium'}#428bca{elseif $issue.priority == 'Low'}#d9edf7{/if}; padding-left: 10px;">
  
      <h3>{$issue.title} ({$issue.status})</h3>
      <p class="lead">{$LANG.networkissuesdate} - {$issue.startdate}{if $issue.enddate} - {$issue.enddate}{/if}</p>
      
      <p><strong>{$LANG.networkissuesaffecting} {$issue.type}</strong> - {if $issue.type eq $LANG.networkissuestypeserver}{$issue.server}{else}{$issue.affecting}{/if} | <strong>{$LANG.networkissuespriority}</strong> - {$issue.priority}</span></p>
  
      {$issue.description}
  
      <p></p>
      <p><strong>{$LANG.networkissueslastupdated}</strong> - {$issue.lastupdate}</p>
    </div>
    
    {if $issue.clientaffected}</div>{/if}
  </div>
  {foreachelse}

  <div class="col-sm-12">{$noissuesmsg}</div>

  {/foreach}
</div>

<ul class="pagination">
  <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
  <li class="next{if !$nextpage} disabled{/if}"><a href="{if $nextpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
</ul>

{if $servers}

{include file="$template/pageheader.tpl" title=$LANG.serverstatustitle}

<p>{$LANG.serverstatusheadingtext}</p>

<br />

{literal}
<script>
function getStats(num) {
    jQuery.post('serverstatus.php', 'getstats=1&num='+num, function(data) {
        jQuery("#load"+num).html(data.load);
        jQuery("#uptime"+num).html(data.uptime);
    },'json');
}
function checkPort(num,port) {
    jQuery.post('serverstatus.php', 'ping=1&num='+num+'&port='+port, function(data) {
        jQuery("#port"+port+"_"+num).html(data);
    });
}
</script>
{/literal}

<div class="center80">

<table class="table table-striped">
    <thead>
        <tr>
            <th>{$LANG.servername}</th>
            <th class="textcenter">HTTP</th>
            <th class="textcenter">FTP</th>
            <th class="textcenter">POP3</th>
            <th class="textcenter">{$LANG.serverstatusphpinfo}</th>
            <th class="textcenter">{$LANG.serverstatusserverload}</th>
            <th class="textcenter">{$LANG.serverstatusuptime}</th>
        </tr>
    </thead>
    <tbody>
{foreach from=$servers key=num item=server}
        <tr>
            <td>{$server.name}</td>
            <td class="textcenter" id="port80_{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}" /></td>
            <td class="textcenter" id="port21_{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}" /></td>
            <td class="textcenter" id="port110_{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}" /></td>
            <td class="textcenter"><a href="{$server.phpinfourl}" target="_blank">{$LANG.serverstatusphpinfo}</a></td>
            <td class="textcenter" id="load{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}" /></td>
            <td class="textcenter" id="uptime{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}" /><script> checkPort({$num},80); checkPort({$num},21); checkPort({$num},110); getStats({$num}); </script></td>
        </tr>
{foreachelse}
        <tr>
            <td colspan="7">{$LANG.serverstatusnoservers}</td>
        </tr>
{/foreach}
    </tbody>
</table>

</div>

{/if}

{if $loggedin}<p>{$LANG.networkissuesaffectingyourservers}</p>{/if}

<br />
<p align="right"><img src="images/rssfeed.gif" alt="RSS" align="absmiddle" /> <a href="networkissuesrss.php">{$LANG.announcementsrss}</a></p>
<br />