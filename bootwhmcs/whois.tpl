<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>{$pagetitle} - {$companyname}</title>

    <link href="templates/{$template}/css/bootstrap.css" rel="stylesheet">
    <link href="templates/{$template}/css/whmcs.css" rel="stylesheet">

  </head>

  <body class="popupwindow">

<h2>{$LANG.whoisresults} {$domain}</h2>

<div class="popupcontainer">
    {$whois}
    <br />
    <br />
</div>

<p class="textcenter"><input type="button" value="{$LANG.closewindow}" class="btn btn-primary" onclick="window.close()" /></p>

  </body>
</html>