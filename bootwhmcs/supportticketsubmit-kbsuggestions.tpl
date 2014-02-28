<hr />

<h3>{$LANG.kbsuggestions}</h3>

<p>{$LANG.kbsuggestionsexplanation}</p>

{foreach from=$kbarticles item=kbarticle}
<a href="#" href="knowledgebase.php?action=displayarticle&id={$kbarticle.id}" target="_blank" class="well well-sm" style="display: block;"><i class="fa fa-file-o"></i> {$kbarticle.title} - {$kbarticle.article}...</a>
{/foreach}

<hr />