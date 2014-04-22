{include file="$template/pageheader.tpl" title=$LANG.announcementstitle}

<p align="right"><img src="images/rssfeed.gif" alt="RSS" align="absmiddle" /> <a href="announcementsrss.php">{$LANG.announcementsrss}</a></p>

<div class="row">

  {foreach key=num item=announcement from=$announcements}
  <div class="col-sm-6">
  
    <h3><a href="{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}{$smarty.server.PHP_SELF}?id={$announcement.id}{/if}">{$announcement.title}</a></h3>
    <p><strong>{$announcement.timestamp|date_format:"%A, %B %e, %Y"}</strong></p>
  
    <p>{$announcement.text|strip_tags|truncate:400:"..."}</p>
  
    {if strlen($announcement.text)>400}<p><a href="{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}{$smarty.server.PHP_SELF}?id={$announcement.id}{/if}">{$LANG.more} &raquo;</a></p>{/if}
  
  {if $facebookrecommend}
  <div class="fb-like" data-href="{$systemurl}{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
  {/if}
  <br /><br />
  </div>
  {foreachelse}
  
  <div class="col-sm-12">
    <strong>{$LANG.announcementsnone}</strong>
  </div>
  
  {/foreach}

</div>

<br />

{if $prevpage || $nextpage}

  <div style="float: left; width: 200px;">
  {if $prevpage}<a href="announcements.php?page={$prevpage}">{/if}&laquo; {$LANG.previouspage}{if $prevpage}</a>{/if}
  </div>
  
  <div style="float: right; width: 200px; text-align: right;">
  {if $nextpage}<a href="announcements.php?page={$nextpage}">{/if}{$LANG.nextpage} &raquo;{if $nextpage}</a>{/if}
  </div>

{/if}