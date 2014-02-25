<br /><br />

<p>{$LANG.creditcard3dsecure}</p>

<br />

<div id="submitfrm">

{$code}

<br /><br />

<iframe name="3dauth" height="500" scrolling="auto" src="about:blank" style="width:80%;border:1px solid #fff;"></iframe>

</div>

<br /><br /><br />

{literal}
<script language="javascript">
setTimeout ( "autoForward()" , 1000 );
function autoForward() {
    var submitForm = $("#submitfrm").find("form");
    submitForm.submit();
}
</script>
{/literal}