{include file="$template/pageheader.tpl" title=$LANG.navopenticket}

<p>{$LANG.supportticketsheader}</p>

<br />

<div class="row">
  
  {foreach from=$departments item=department}
  
  <div class="col-sm-4">
    <h3><i class="fa fa-envelope"></i> <a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}">{$department.name}</a></h3>

    {if $department.description}<p>{$department.description}</p>{/if}
  </div>
  
  {foreachelse}
  
  <div class="alert alert-info">
    {$LANG.nosupportdepartments}
  </div>
  
  {/foreach}
  
</div>
