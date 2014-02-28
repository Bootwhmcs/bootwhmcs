{if $error}

  <p>{$LANG.supportticketinvalid}</p>

{else}

  <div class="page-header">
    <h1>{$LANG.supportticketsviewticket|cat:' #'|cat:$tid} <small class="pull-right">{$subject}</small></h1>
  </div>

  {if $errormessage}
  <div class="alert alert-danger">
    {$LANG.clientareaerrors}
    <ul>
      {$errormessage}
    </ul>
  </div>
  {/if}

  <div class="row">
    <div class="col-md-3">
      <h3>{$date}</h3>
      {$LANG.supportticketsubmitted}
    </div>
    
    <div class="col-md-3">
      <h2>{$department}</h2>
      {$LANG.supportticketsdepartment}
    </div>
  
    <div class="col-md-3">
      <h2>{$urgency}</h2>
      {$LANG.supportticketspriority}
    </div>
    
    <div class="col-md-3">
      <h2>{$status}</h2>
      {$LANG.supportticketsstatus}
    </div>
  </div>
  
  <br />
  {if !$customfields}<hr />{/if}

  {if $customfields}
  <table class="table">
    <tbody>
      {foreach from=$customfields item=customfield}
      <tr>
        <td>{$customfield.name}:</td><td>{$customfield.value}</td>
      </tr>
      {/foreach}
    </tbody>
  </table>
  {/if}

  <p>
    <input type="button" value="{$LANG.clientareabacklink}" class="btn" onclick="window.location='supporttickets.php'" />
    <input type="button" value="{$LANG.supportticketsreply}" class="btn btn-primary" onclick="jQuery('#replycont').slideToggle()" />{if $showclosebutton}
    <input type="button" value="{$LANG.supportticketsclose}" class="btn btn-danger" onclick="window.location='{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;closeticket=true'" />{/if}
  </p>

  <div id="replycont" {if !$smarty.get.postreply} style="display: none;"{/if}>
    <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data">
  
      <div class="form-group">
        <label for="name">{$LANG.supportticketsclientname}</label>
        {if $loggedin}<input class="form-control disabled" type="text" id="name" value="{$clientname}" disabled="disabled" />{else}<input class="form-control" type="text" name="replyname" id="name" value="{$replyname}" />{/if}
      </div>
     
      <div class="form-group">
        <label for="email">{$LANG.supportticketsclientemail}</label>
        {if $loggedin}<input class="form-control disabled" type="text" id="email" value="{$email}" disabled="disabled" />{else}<input class="form-control" type="text" name="replyemail" id="email" value="{$replyemail}" />{/if}
      </div>
      
      <div class="form-group">
        <label for="message">{$LANG.contactmessage}</label>
        <textarea name="replymessage" id="message" rows="12" class="form-control">{$replymessage}</textarea>
      </div>
      
          <div class="control-group">
              <label class="control-label bold" for="attachments">{$LANG.supportticketsticketattachments}:</label>
              <div class="controls">
                  <input type="file" name="attachments[]" style="width:70%;" /><br />
                  <div id="fileuploads"></div>
                  <a href="#" class="extraTicketAttachment"><i class="fa fa-plus"></i> {$LANG.addmore}</a><br />
                  ({$LANG.supportticketsallowedextensions}: {$allowedfiletypes})
              </div>
          </div>
      
      <br />
      
      <p><input type="submit" value="{$LANG.supportticketsticketsubmit}" class="btn btn-primary" /></p>
  
    </form>
  </div>

  {foreach from=$descreplies key=num item=reply}
  <div class="panel panel-{if $reply.admin}success{else}info{/if}">
    <div class="panel-heading">
      <h3 class="panel-title">
        {if $reply.admin}
          {$reply.name} || {$LANG.supportticketsstaff}
        {elseif $reply.contactid}
          {$reply.name} || {$LANG.supportticketscontact}
        {elseif $reply.userid}
          {$reply.name} || {$LANG.supportticketsclient}
        {else}
          {$reply.name} || {$reply.email}
        {/if}
      </h3>
    </div>
    
    <div class="panel-body">
      {$reply.message}
      
      <div class="clearfix"></div>
      <br />
      
      {if $reply.attachments}
      <p class="small">
        <strong>{$LANG.supportticketsticketattachments}:</strong><br />
        {foreach from=$reply.attachments key=num item=attachment}
        <i class="fa fa-file-o"></i> <a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}">{$attachment}</a>
        <br />
        {/foreach}
      </p>
      {/if}
  
      {if $reply.id && $reply.admin && $ratingenabled}
          
      <hr />
          
      {if $reply.rating}
      <table class="ticketrating" align="right">
          <tr>
              <td>{$LANG.ticketreatinggiven}&nbsp;</td>
              {foreach from=$ratings item=rating}
              <td background="images/rating_{if $reply.rating>=$rating}pos{else}neg{/if}.png"></td>
              {/foreach}
          </tr>
      </table>
      {else}
      <table class="ticketrating" align="right">
          <tr onmouseout="rating_leave('rate{$reply.id}')">
              <td>{$LANG.ticketratingquestion}&nbsp;</td>
              <td class="point" onmouseover="rating_hover('rate{$reply.id}_1')" onclick="rating_select('{$tid}','{$c}','rate{$reply.id}_1')"><strong>{$LANG.ticketratingpoor}&nbsp;</strong></td>
              {foreach from=$ratings item=rating}
              <td class="star" id="rate{$reply.id}_{$rating}" onmouseover="rating_hover(this.id)" onclick="rating_select('{$tid}','{$c}',this.id)"></td>
              {/foreach}
              <td class="point" onmouseover="rating_hover('rate{$reply.id}_5')" onclick="rating_select('{$tid}','{$c}','rate{$reply.id}_5')"><strong>&nbsp;{$LANG.ticketratingexcellent}</strong></td>
          </tr>
      </table>
      {/if}
      <div class="clear"></div>
      {/if}
  
    </div>
  </div>
  {/foreach}

  <p>
    <input type="button" value="{$LANG.clientareabacklink}" class="btn" onclick="window.location='supporttickets.php'" />
    <input type="button" value="{$LANG.supportticketsreply}" class="btn btn-primary" onclick="jQuery('#replycont2').slideToggle()" />{if $showclosebutton}
    <input type="button" value="{$LANG.supportticketsclose}" class="btn btn-danger" onclick="window.location='{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;closeticket=true'" />{/if}
  </p>

  <div id="replycont2" class="ticketreplybox" style="display: none;">
    <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data">
  
      <div class="form-group">
        <label for="name">{$LANG.supportticketsclientname}</label>
        {if $loggedin}<input class="form-control disabled" type="text" id="name" value="{$clientname}" disabled="disabled" />{else}<input class="form-control" type="text" name="replyname" id="name" value="{$replyname}" />{/if}
      </div>
     
      <div class="form-group">
        <label for="email">{$LANG.supportticketsclientemail}</label>
        {if $loggedin}<input class="form-control disabled" type="text" id="email" value="{$email}" disabled="disabled" />{else}<input class="form-control" type="text" name="replyemail" id="email" value="{$replyemail}" />{/if}
      </div>
      
      <div class="form-group">
        <label for="message">{$LANG.contactmessage}</label>
        <textarea name="replymessage" id="message" rows="12" class="form-control">{$replymessage}</textarea>
      </div>
      
          <div class="control-group">
              <label class="control-label bold" for="attachments">{$LANG.supportticketsticketattachments}:</label>
              <div class="controls">
                  <input type="file" name="attachments[]" style="width:70%;" /><br />
                  <div id="fileuploads"></div>
                  <a href="#" onclick="extraTicketAttachment();return false"><img src="images/add.gif" align="absmiddle" border="0" /> {$LANG.addmore}</a><br />
                  ({$LANG.supportticketsallowedextensions}: {$allowedfiletypes})
              </div>
          </div>
      
      <br />
      
      <p><input type="submit" value="{$LANG.supportticketsticketsubmit}" class="btn btn-primary" /></p>
  
    </form>
  </div>

{/if}