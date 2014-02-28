<!DOCTYPE html>
<html lang="en">
  <head>
    
    {if $systemurl}<base href="{$systemurl}" />{/if}
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

    <!-- CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="templates/{$template}/static/css/select2.css">
    
    <link rel="stylesheet" href="templates/{$template}/static/css/bootwhmcs.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    {$headoutput}
  </head>
  <body>
  
    {$headeroutput}
    <div id="fb-root"></div>
    
    <div class="container">
      
      <div class="navbar navbar-default" role="navigation">
        
        <!-- Branding -->
        <div class="navbar-header">  
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          
          <a class="navbar-brand" href="index.php">{$companyname}</a>
        </div>
        
        <!-- Navigation -->
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav" style="width: auto;">
            <li><a href="{if $loggedin}clientarea{else}index{/if}.php">{$LANG.hometitle}</a></li>
            
            {if $loggedin}
            <li><a href="announcements.php">{$LANG.announcementstitle}</a></li>
            
            <!-- Services Dropdown -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$LANG.navservices} <b class="caret"></b></a>
              
              <ul class="dropdown-menu">
                <li><a href="clientarea.php?action=products">{$LANG.clientareanavservices}</a></li>
                {if $condlinks.pmaddon}
                <li><a href="index.php?m=project_management">{$LANG.clientareaprojects}</a></li>
                {/if}
                <li class="divider"></li>
                <li><a href="cart.php">{$LANG.navservicesorder}</a></li>
                <li><a href="cart.php?gid=addons">{$LANG.clientareaviewaddons}</a></li>
              </ul>
            </li>
            
            <!-- Domain Dropdown -->
            {if $condlinks.domainreg || $condlinks.domaintrans}
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$LANG.navdomains} <b class="caret"></b></a>
              
              <ul class="dropdown-menu">
                <li><a href="clientarea.php?action=domains">{$LANG.clientareanavdomains}</a></li>
                <li class="divider"></li>
                <li><a href="cart.php?gid=renewals">{$LANG.navrenewdomains}</a></li>
                
                {if $condlinks.domainreg}<li><a href="cart.php?a=add&domain=register">{$LANG.navregisterdomain}</a></li>{/if}
                {if $condlinks.domaintrans}<li><a href="cart.php?a=add&domain=transfer">{$LANG.navtransferdomain}</a></li>{/if}
                {if $enomnewtldsenabled}<li><a href="{$enomnewtldslink}">Preregister New TLDs</a></li>{/if}
                
                <li class="divider"></li>
                <li><a href="domainchecker.php">{$LANG.navwhoislookup}</a></li>
              </ul>
            </li>
            {/if}
            
            <!-- Billing Dropdown -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$LANG.navbilling} <b class="caret"></b></a>
              
              <ul class="dropdown-menu">
                <li><a href="clientarea.php?action=invoices">{$LANG.invoices}</a></li>
                <li><a href="clientarea.php?action=quotes">{$LANG.quotestitle}</a></li>
                <li class="divider"></li>
                {if $condlinks.addfunds}<li><a href="clientarea.php?action=addfunds">{$LANG.addfunds}</a></li>{/if}
                {if $condlinks.masspay}<li><a href="clientarea.php?action=masspay&all=true">{$LANG.masspaytitle}</a></li>{/if}
                {if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.navmanagecc}</a></li>{/if}
              </ul>
            </li>
            
            <!-- Support Dropdown -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$LANG.navsupport} <b class="caret"></b></a>
              
              <ul class="dropdown-menu">
                <li><a href="supporttickets.php">{$LANG.navtickets}</a></li>
                <li><a href="knowledgebase.php">{$LANG.knowledgebasetitle}</a></li>
                <li><a href="downloads.php">{$LANG.downloadstitle}</a></li>
                <li><a href="serverstatus.php">{$LANG.networkstatustitle}</a></li>
              </ul>
            </li>
            
            <!-- Affiliates -->
            {if $condlinks.affiliates}<li{if $pagetitle == 'Affiliates'} class="active"{/if}><a href="affiliates.php">{$LANG.affiliatestitle}</a></li>{/if}
            
            {else}
            
            <li><a href="announcements.php">{$LANG.announcementstitle}</a></li>
            <li><a href="knowledgebase.php">{$LANG.knowledgebasetitle}</a></li>
            <li><a href="serverstatus.php">{$LANG.networkstatustitle}</a></li>
            {if $condlinks.affiliates}<li><a href="affiliates.php">{$LANG.affiliatestitle}</a></li>{/if}
            <li><a href="contact.php">{$LANG.contactus}</a></li>
            
            {/if}
          </ul>
          
          <!-- Account / Right Dropdown -->
          <ul class="nav navbar-nav navbar-right">
            
            {if $loggedin}
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$LANG.hello}, {$loggedinuser.firstname}! <b class="caret"></b></a>

              <ul class="dropdown-menu">
                <li><a href="clientarea.php?action=details">{$LANG.editaccountdetails}</a></li>
                {if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.navmanagecc}</a></li>{/if}
                <li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
                {if $condlinks.addfunds}<li><a href="clientarea.php?action=addfunds">{$LANG.addfunds}</a></li>{/if}
                <li><a href="clientarea.php?action=emails">{$LANG.navemailssent}</a></li>
                <li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
                <li class="divider"></li>
                <li><a href="logout.php">{$LANG.logouttitle}</a></li>
              </ul>
            </li>
            
            {else}
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$LANG.account} <b class="caret"></b></a>
              
              <ul class="dropdown-menu">
                <li><a href="clientarea.php">{$LANG.login}</a></li>
                <li><a href="register.php">{$LANG.register}</a></li>
                <li class="divider"></li>
                <li><a href="pwreset.php">{$LANG.forgotpw}</a></li>
              </ul>
            </li>
            
            {/if}
            
          </ul>
          
        </div>
        
      </div>