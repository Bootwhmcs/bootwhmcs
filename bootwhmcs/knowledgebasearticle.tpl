<div class="page-header">
  <h1>{$kbarticle.title}</h1>
  <p class="noprint">
    <i class="fa fa-star"></i> <a href="#" onClick="addBookmark();return false">{$LANG.knowledgebasefavorites}</a> &nbsp; &nbsp;
    <i class="fa fa-print"></i> <a href="#" onclick="window.print();return false">{$LANG.knowledgebaseprint}</a>
  </p>
</div>

{$kbarticle.text}

<hr />

<form method="post" action="knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}&amp;useful=vote">
  {if $kbarticle.voted}
  <strong>{$LANG.knowledgebaserating}</strong> {$kbarticle.useful} {$LANG.knowledgebaseratingtext} ({$kbarticle.votes} {$LANG.knowledgebasevotes})
  {else}
  <strong>{$LANG.knowledgebasehelpful}</strong> <select name="vote"><option value="yes">{$LANG.knowledgebaseyes}</option><option value="no">{$LANG.knowledgebaseno}</option></select> <input type="submit" value="{$LANG.knowledgebasevote}" class="btn btn-success btn-xs" />
  {/if}
</form>

{if $kbarticles}

<div class="kbalsoread">{$LANG.knowledgebasealsoread}</div>

{foreach key=num item=kbarticle from=$kbarticles}
<div class="kbarticle">
<img src="images/article.gif" align="middle" alt="" /> <strong><a href="{if $seofriendlyurls}knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}">{$kbarticle.title}</a></strong> <span class="kbviews">({$LANG.knowledgebaseviews}: {$kbarticle.views})</span>
</div>
{/foreach}

{/if}

<br />