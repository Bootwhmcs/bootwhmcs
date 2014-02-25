{include file="$template/pageheader.tpl" title=$LANG.knowledgebasetitle}

<form method="post" action="knowledgebase.php?action=search">
  <div class="input-group input-group-lg">
    <input class="form-control" name="search" type="text" value="{$LANG.kbquestionsearchere}" placeholder="{$LANG.kbquestionsearchere}"/>
   
    <div class="input-group-btn">
      <input type="submit" class="btn btn-large btn-primary" value="{$LANG.knowledgebasesearch}" />
    </div>
  </div>
</form>

<br /><br />

<div class="row">

  {if $kbarticles}
  <div class="col-sm-{if $kbcats}8{else}12{/if}">
    <h3>{$LANG.knowledgebasearticles}</h3>
    
    <br />
    {foreach from=$kbarticles item=kbarticle}
    <i class="fa fa-file-o"></i>
    <a href="{if $seofriendlyurls}knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}" class="fontsize2"><strong>{$kbarticle.title}</strong></a>
    <p>{$kbarticle.article|truncate:100:"..."}</p>
    <hr />
    {foreachelse}
    <p>{$LANG.knowledgebasenoarticles}</p>
    {/foreach}
  </div>
  {/if}
  
  {if $kbcats}
  <div class="col-sm-4">
    <h3>{$LANG.knowledgebasecategories}</h3>
    
    <br />
    {foreach name=kbasecats from=$kbcats item=kbcat}
    <i class="fa fa-folder-o"></i> 
    <a href="{if $seofriendlyurls}knowledgebase/{$kbcat.id}/{$kbcat.urlfriendlyname}{else}knowledgebase.php?action=displaycat&amp;catid={$kbcat.id}{/if}"><strong>{$kbcat.name}</strong></a> ({$kbcat.numarticles})
    <p>{$kbcat.description}</p>
    <hr />
    {/foreach}
  </div>
  {/if}
</div>