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

  <div class="col-sm-8">
    <h3>{$LANG.knowledgebasecategories}</h3>
    
    <br />
    <div class="row">
      {foreach name=kbasecats from=$kbcats item=kbcat}
      <div class="col-sm-4">
        <i class="fa fa-folder-o"></i>
        <a href="{if $seofriendlyurls}knowledgebase/{$kbcat.id}/{$kbcat.urlfriendlyname}{else}knowledgebase.php?action=displaycat&amp;catid={$kbcat.id}{/if}" class="fontsize2"><strong>{$kbcat.name}</strong></a>
        ({$kbcat.numarticles})
        <p>{$kbcat.description}</p>
      </div>
      {if ($smarty.foreach.kbasecats.index+1) is div by 3}</div><br /><div class="row">{/if}
      {/foreach}
    </div>
  </div>
  
  <div class="col-sm-4">
    <h3>{$LANG.knowledgebasepopular}</h3>
    
    <br />
    {foreach from=$kbmostviews item=kbarticle}
    <i class="fa fa-file-o"></i>
    <a href="{if $seofriendlyurls}knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}" class="fontsize2"><strong>{$kbarticle.title}</strong></a>
    <p>{$kbarticle.article|truncate:100:"..."}</p>
    <hr />
    {/foreach}
  </div>

</div>