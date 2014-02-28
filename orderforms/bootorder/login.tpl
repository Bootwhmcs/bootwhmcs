<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div id="order-modern">

<h1>{$LANG.cartexistingclientlogin}</h1>

<form action="dologin.php" method="post">

<div class="errorbox" style="display:block;">{$LANG.loginincorrect}</div>
<br />

<div class="signupfields" style="width:400px;margin:0 auto;">
<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
<tr><td class="fieldlabel">{$LANG.clientareaemail}</td><td class="fieldarea"><input type="text" name="username" size="40" value="{$username}" /></td></tr>
<tr><td class="fieldlabel">{$LANG.loginpassword}:</td><td class="fieldarea"><input type="password" name="password" size="25" /></td></tr>
</table>
</div>

<p align="center"><input type="submit" value="{$LANG.loginbutton}" /></p>

</form>

<p><strong>{$LANG.loginforgotten}</strong> <a href="pwreset.php" target="_blank">{$LANG.loginforgotteninstructions}</a></p>

</div>