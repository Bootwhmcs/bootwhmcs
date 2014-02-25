{include file="$template/pageheader.tpl" title=$LANG.accessdenied}

<p>{$LANG.bannedyourip} {$ip} {$LANG.bannedhasbeenbanned}</p>

<br />

<div class="alert alert-danger">
  <p>{$LANG.bannedbanreason}: <strong>{$reason}</strong></p>
  <p>{$LANG.bannedbanexpires}: {$expires}</p>
</div>