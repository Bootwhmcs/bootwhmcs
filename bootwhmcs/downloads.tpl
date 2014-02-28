{include file="$template/pageheader.tpl" title=$LANG.downloadstitle}

<form method="post" action="downloads.php?action=search">
  <div class="input-group">
  
    <input type="text" name="q" value="{if $q}{$q}{else}{$LANG.downloadssearch}{/if}" class="form-control" placeholder="{$LANG.downloadssearch}" />
    
    <div class="input-group-btn">
      <button type="submit" class="btn btn-warning">{$LANG.search}</button>
    </div>
    
  </div>
</form>

<br />

<p>{$LANG.downloadsintrotext}</p>

{include file="$template/pageheader.tpl" title=$LANG.downloadscategories}

<div class="row">

  {foreach from=$dlcats item=dlcat}
  <div class="col-sm-4">
  
    <i class="fa fa-folder"></i> <a href="{if $seofriendlyurls}downloads/{$dlcat.id}/{$dlcat.urlfriendlyname}{else}downloads.php?action=displaycat&amp;catid={$dlcat.id}{/if}" class="fontsize2"><strong>{$dlcat.name}</strong></a> ({$dlcat.numarticles})
    <p>{$dlcat.description}</p>
    
  </div>
  {/foreach}
  
</div>

{include file="$template/pageheader.tpl" title=$LANG.downloadspopular}

<div class="row">
  {foreach from=$mostdownloads item=download}
  <div class="col-sm-4">
    {$download.type}
    {if $download.clientsonly} <i class="fa fa-lock"></i>{/if}
    <a href="{$download.link}"><strong>{$download.title}</strong></a>
    
    <p>{$download.description}</p>
    
    <span class="small">{$LANG.downloadsfilesize}: {$download.filesize}</span>
  </div>
  {/foreach}
</div>