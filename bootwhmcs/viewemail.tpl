<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>{$LANG.clientareaemails} - {$companyname}</title>

    <link href="templates/{$template}/css/bootstrap.css" rel="stylesheet">
    <link href="templates/{$template}/css/whmcs.css" rel="stylesheet">

  </head>

  <body class="popupwindow">

<h2>{$subject}</h2>

<div class="popupcontainer">{$message}</div>

<p class="textcenter"><input type="button" value="{$LANG.closewindow}" class="btn btn-primary" onclick="window.close()" /></p>

  </body>
</html>