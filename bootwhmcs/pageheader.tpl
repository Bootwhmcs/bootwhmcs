<div class="page-header {if $navtype == 'clientdetails'}nav-header{/if}">

  <h1>{$title}</h1>
  {if $desc}<p class="lead">{$desc}</p>{/if}
  
  
  <!-- Client details sub links -->
  {if $navtype == 'clientdetails'}
  <ul class="nav nav-tabs">

    <li {if $clientareaaction eq "details"}class="active"{/if}><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
    
    {if $condlinks.updatecc}<li {if $clientareaaction eq "creditcard"}class="active"{/if}><a href="{$smarty.server.PHP_SELF}?action=creditcard">{$LANG.clientareanavccdetails}</a></li>{/if}
    
    <li {if $clientareaaction eq "contacts" ||  $clientareaaction eq "addcontact"}class="active"{/if}><a href="{$smarty.server.PHP_SELF}?action=contacts">{$LANG.clientareanavcontacts}</a></li>
    
    <li {if $clientareaaction eq "changepw"}class="active"{/if}><a href="{$smarty.server.PHP_SELF}?action=changepw">{$LANG.clientareanavchangepw}</a></li>
    
    {if $condlinks.security}<li {if $clientareaaction eq "security"}class="active"{/if}><a href="{$smarty.server.PHP_SELF}?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}

  </ul>
  {/if}
  
</div>