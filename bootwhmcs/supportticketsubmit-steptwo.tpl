{include file="$template/pageheader.tpl" title=$LANG.navopenticket}

<script language="javascript">
var currentcheckcontent,lastcheckcontent;
{if $kbsuggestions}
{literal}
function getticketsuggestions() {
    currentcheckcontent = jQuery("#message").val();
    if (currentcheckcontent!=lastcheckcontent && currentcheckcontent!="") {
        jQuery.post("submitticket.php", { action: "getkbarticles", text: currentcheckcontent },
        function(data){
            if (data) {
                jQuery("#searchresults").html(data);
                jQuery("#searchresults").slideDown();
            }
        });
        lastcheckcontent = currentcheckcontent;
    }
    setTimeout('getticketsuggestions();', 3000);
}
getticketsuggestions();
{/literal}
{/if}
</script>

{if $errormessage}
<div class="alert alert-danger">
  {$LANG.clientareaerrors}
  
  <ul>
    {$errormessage}
  </ul>
</div>
{/if}

<form name="submitticket" method="post" action="{$smarty.server.PHP_SELF}?step=3" enctype="multipart/form-data">
  
  <div class="row">
  
    <div class="col-sm-6">
      <div class="form-group">
        <label for="name">{$LANG.supportticketsclientname}</label>
        {if $loggedin}
        <input class="form-control disabled" type="text" id="name" value="{$clientname}" disabled="disabled" />
        {else}
        <input class="form-control" type="text" name="name" id="name" value="{$name}" />
        {/if}
      </div>
    </div>
    
    <div class="col-sm-6">
      <div class="form-group">
        <label for="email">{$LANG.supportticketsclientemail}</label>
        {if $loggedin}
        <input class="form-control disabled" type="text" id="email" value="{$email}" disabled="disabled" />
        {else}
        <input class="form-control" type="text" name="email" id="email" value="{$email}" />
        {/if}
      </div>
    </div>
  
  </div>
  
  <div class="row">
  
    <div class="col-sm-6">
      <div class="form-group">
        <label for="subject">{$LANG.supportticketsticketsubject}</label>
        <input class="form-control" type="text" name="subject" id="subject" value="{$subject}" />
      </div>
    </div>
    
    <div class="col-sm-6">
  
      <div class="form-group">
        <label for="name">{$LANG.supportticketsdepartment}</label>
        <select name="deptid" class="form-control">
          {foreach from=$departments item=department}
          <option value="{$department.id}"{if $department.id eq $deptid} selected="selected"{/if}>{$department.name}</option>
          {/foreach}
        </select>
      </div>
      
    </div>
  
  </div>
  
  {if $relatedservices}
  <div class="form-group">
    <label for="relatedservice">{$LANG.relatedservice}</label>
    <select name="relatedservice" id="relatedservice" class="form-control">
      <option value="">{$LANG.none}</option>
      {foreach from=$relatedservices item=relatedservice}
      <option value="{$relatedservice.id}">{$relatedservice.name} ({$relatedservice.status})</option>
      {/foreach}
    </select>
  </div>
  {/if}

  <div class="form-group">
    <label for="priority">{$LANG.supportticketspriority}</label>
    <select name="urgency" id="priority" class="form-control">
      <option value="High"{if $urgency eq "High"} selected="selected"{/if}>{$LANG.supportticketsticketurgencyhigh}</option>
      <option value="Medium"{if $urgency eq "Medium" || !$urgency} selected="selected"{/if}>{$LANG.supportticketsticketurgencymedium}</option>
      <option value="Low"{if $urgency eq "Low"} selected="selected"{/if}>{$LANG.supportticketsticketurgencylow}</option>
    </select>
  </div>

  <div class="form-group">
    <label for="message">{$LANG.contactmessage}</label>
    <textarea name="message" id="message" rows="12" class="form-control">{$message}</textarea>
  </div>
  
  {foreach key=num item=customfield from=$customfields}
  <div class="form-group">
    <label for="customfield{$customfield.id}">{$customfield.name}</label>
    {$customfield.input|replace:'<input':'<input class="form-control"'}
    {if $customfield.description}<p class="help-block">{$customfield.description}</p>{/if}
  </div>
  {/foreach}

  <div class="form-group">
    <label for="attachments">{$LANG.supportticketsticketattachments}:</label>
    <input type="file" name="attachments[]" style="width:70%;" /><br />
    <div id="fileuploads"></div>
    <a href="#" class="extraTicketAttachment"><i class="fa fa-plus"></i> {$LANG.addmore}</a><br />
    ({$LANG.supportticketsallowedextensions}: {$allowedfiletypes})
  </div>
  
  <div id="searchresults" class="contentbox" style="display:none;"></div>
  
  {if $capatacha}
    <h3>{$LANG.captchatitle}</h3>
    <p>{$LANG.captchaverify}</p>
    {if $capatacha eq "recaptcha"}
    {$recapatchahtml}
  {else}
    <img src="includes/verifyimage.php" align="middle" /> <input type="text" name="code" class="input-small" maxlength="5" />
  {/if}
  {/if}

  <hr />
  
  <input class="btn btn-primary" type="submit" name="save" value="{$LANG.supportticketsticketsubmit}" />
  <input class="btn btn-danger" type="reset" value="{$LANG.cancel}" />

</form>