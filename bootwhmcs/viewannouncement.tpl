<div class="page-header">
  <h1>{$title}</h1>
  <p class="lead">{$timestamp|date_format:"%A, %B %e, %Y"}</p>
</div>

  
{if $twittertweet}
<a href="https://twitter.com/share" class="twitter-share-button" data-via="{$twitterusername}" class="pull-left">Tweet</a>
<script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
{/if}

{if $facebookrecommend}
<div class="pull-left" style="width: 400px;">
  <div class="fb-like" data-href="{$systemurl}{if $seofriendlyurls}announcements/{$id}/{$urlfriendlytitle}.html{else}announcements.php?id={$id}{/if}" data-send="true" data-show-faces="true" data-action="recommend"></div>
</div>
{/if}

{if $googleplus1}
<g:plusone annotation="inline" data-size="small" class="pull-left"></g:plusone>
{/if}

<div class="clearfix"></div>

<br />

{$text}

<div class="clearfix"></div>

<br />

<p><a href="announcements.php">{$LANG.clientareabacklink}</a></p>

<hr />

{if $facebookcomments}
<fb:comments href="{$systemurl}{if $seofriendlyurls}announcements/{$id}/{$urlfriendlytitle}.html{else}announcements.php?id={$id}{/if}" num_posts="5" class="fb-comments-unloaded"></fb:comments>
{/if}
