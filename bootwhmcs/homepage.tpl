{if $condlinks.domainreg || $condlinks.domaintrans || $condlinks.domainown}
<div class="jumbotron">
  <h1>{$LANG.domaincheckerchoosedomain}</h1>
  <p>{$LANG.domaincheckerenterdomain}</p>
  
  <form method="post" action="domainchecker.php">

    <input class="form-control input-lg" name="domain" type="text" placeholder="{$LANG.domaincheckerdomainexample}" />
    
    <br />
    
    <div class="row">
      
      <div class="col-md-8">
      {if $condlinks.domainreg}<input type="submit" value="{$LANG.checkavailability}" class="btn btn-primary btn-lg" />{/if}
      {if $condlinks.domaintrans}<input type="submit" name="transfer" value="{$LANG.domainstransfer}" class="btn btn-success btn-lg" />{/if}
      {if $condlinks.domainown}<input type="submit" name="hosting" value="{$LANG.domaincheckerhostingonly}" class="btn btn-danger btn-lg" />{/if}
      </div>
    
      {if $captcha}
      <div class="col-md-4">
        {if $captcha eq "recaptcha"}
        <p>{$recaptchahtml}</p>
        {else}
        <div class="row">
          <div class="col-md-4 text-right">
            <img src="includes/verifyimage.php" align="middle" style="margin-top: 6px;" />
          </div>
          <div class="col-md-8">
            <input type="text" name="code" class="form-control" maxlength="5" />
          </div>
        </div>
        {/if}
      </div>
      {/if}
      
    </div>
  </form>
</div>
{/if}


<div class="row">
  <div class="col-sm-{if $announcements}4{else}6{/if}">
    <h2>{$LANG.navservicesorder}</h2>
      
    <p>{$LANG.clientareahomeorder}<br /><br /></p>
    <form method="post" action="cart.php">
      <input type="submit" value="{$LANG.clientareahomeorderbtn} &raquo;" class="btn btn-primary" />
    </form>
  </div>
  
  <div class="col-sm-{if $announcements}4{else}6{/if}">
    <h2>{$LANG.manageyouraccount}</h2>
    
    <p>{$LANG.clientareahomelogin}<br /><br /></p>
    <form method="post" action="clientarea.php">
      <input type="submit" value="{$LANG.clientareahomeloginbtn} &raquo;" class="btn btn-primary" />
    </form>
  </div>
  
  {if $announcements}
  <div class="col-sm-4">
    <h2>{$LANG.latestannouncements}</h2>

    {foreach from=$announcements item=announcement}
    <p>{$announcement.date} - <a href="{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}"><b>{$announcement.title}</b></a><br />{$announcement.text|strip_tags|truncate:100:"..."}</p>
    {/foreach}
  </div>
  {/if}
  
</div>
