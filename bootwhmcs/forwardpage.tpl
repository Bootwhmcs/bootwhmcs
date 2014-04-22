<div class="alert alert-warning">
  {$message}
</div>

<div style="font-size: 40px; text-align: center;"><i class="fa fa-spin fa-spinner"></i></div>

<div id="submitfrm">{$code}</div>

<form method="post" action="{if $invoiceid}viewinvoice.php?id={$invoiceid}{else}clientarea.php{/if}"></form>

{literal}
<script language="javascript">
setTimeout ( "autoForward()" , 5000 );
function autoForward() {
    var submitForm = $("#submitfrm").find("form");
    submitForm.submit();
}
</script>
{/literal}