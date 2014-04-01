<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>

{include file="$template/pageheader.tpl" title=$LANG.creditcard}

<div class="alert alert-block alert-warn">
    <p class="textcenter"><strong>Paying Invoice #{$invoiceid}</strong> - Balance Due: <strong>{$balance}</strong></p>
</div>

{if $remotecode}

<div id="submitfrm" class="textcenter">

{$remotecode}

<iframe name="3dauth" width="90%" height="600" scrolling="auto" src="about:blank" style="border:1px solid #fff;"></iframe>

</div>

<br />

{literal}
<script language="javascript">
setTimeout ( "autoForward()" , 1000 );
function autoForward() {
    var submitForm = $("#submitfrm").find("form");
    submitForm.submit();
}
</script>
{/literal}

{else}

<form method="post" action="creditcard.php" class="form-horizontal">
<input type="hidden" name="action" value="submit">
<input type="hidden" name="invoiceid" value="{$invoiceid}">

{if $errormessage}
    <div class="alert alert-error">
        <p class="bold">{$LANG.clientareaerrors}</p>
        <ul>
            {$errormessage}
        </ul>
    </div>
{/if}

<fieldset class="control-group">

<div class="control-group">
    <div class="col2half">
        <div class="internalpadding">

            {include file="$template/pageheader.tpl" title=$LANG.creditcardyourinfo}

            <div class="control-group">
                <label class="control-label" for="firstname">{$LANG.clientareafirstname}</label>
                <div class="controls">
                    <input type="text" name="firstname" id="firstname" value="{$firstname}"{if in_array('firstname',$uneditablefields)} disabled="" class="disabled"{/if} />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="lastname">{$LANG.clientarealastname}</label>
                <div class="controls">
                    <input type="text" name="lastname" id="lastname" value="{$lastname}"{if in_array('lastname',$uneditablefields)} disabled="" class="disabled"{/if} />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="address1">{$LANG.clientareaaddress1}</label>
                <div class="controls">
                    <input type="text" name="address1" id="address1" value="{$address1}"{if in_array('address1',$uneditablefields)} disabled="" class="disabled"{/if} />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="address2">{$LANG.clientareaaddress2}</label>
                <div class="controls">
                    <input type="text" name="address2" id="address2" value="{$address2}"{if in_array('address2',$uneditablefields)} disabled="" class="disabled"{/if} />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="city">{$LANG.clientareacity}</label>
                <div class="controls">
                    <input type="text" name="city" id="city" value="{$city}"{if in_array('city',$uneditablefields)} disabled="" class="disabled"{/if} />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="state">{$LANG.clientareastate}</label>
                <div class="controls">
                    <input type="text" name="state" id="state" value="{$state}"{if in_array('state',$uneditablefields)} disabled="" class="disabled"{/if} />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="postcode">{$LANG.clientareapostcode}</label>
                <div class="controls">
                    <input type="text" name="postcode" id="postcode" value="{$postcode}"{if in_array('postcode',$uneditablefields)} disabled="" class="disabled"{/if} />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="country">{$LANG.clientareacountry}</label>
                <div class="controls">
                    {$countriesdropdown}
                </div>
            </div>


            <div class="control-group">
                <label class="control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
                <div class="controls">
                    <input type="text" name="phonenumber" id="phonenumber" value="{$phonenumber}"{if in_array('phonenumber',$uneditablefields)} disabled="" class="disabled"{/if} />
                </div>
            </div>

        </div>
    </div>
    <div class="col2half">
        <div class="internalpadding">

            {include file="$template/pageheader.tpl" title=$LANG.creditcarddetails}

            <p><label class="full control-label"><input type="radio" class="radio inline" name="ccinfo" value="useexisting" onclick="disableFields('newccinfo',true)"{if $cardnum} checked{else} disabled{/if} /> {$LANG.creditcarduseexisting}{if $cardnum} ({$cardnum}){/if}</label></p>
{if $cardnum}
            <br />

            <div class="control-group">
                <label class="control-label" for="cccvv2">{$LANG.creditcardcvvnumber}</label>
                <div class="controls"><input type="text" name="cccvv2" id="cccvv2" size="5" value="{$cccvv}" autocomplete="off" class="input-mini" />&nbsp;<a href="#" onclick="window.open('images/ccv.gif','','width=280,height=200,scrollbars=no,top=100,left=100');return false">{$LANG.creditcardcvvwhere}</a></div>
            </div>
{/if}
            <p><label class="full control-label"><input type="radio" class="radio inline" name="ccinfo" value="new" onclick="disableFields('newccinfo',false)"{if !$cardnum || $ccinfo eq "new"} checked{/if} /> {$LANG.creditcardenternewcard}</label></p>

            <br />
            <br />

            <div class="control-group">
                <label class="control-label" for="cctype">{$LANG.creditcardcardtype}</label>
                <div class="controls">
                    <select name="cctype" id="cctype" class="newccinfo">
                    {foreach from=$acceptedcctypes item=cardtype}
                        <option{if $cctype eq $cardtype} selected{/if}>{$cardtype}</option>
                    {/foreach}
                    </select>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="ccnumber">{$LANG.creditcardcardnumber}</label>
                <div class="controls"><input type="text" name="ccnumber" id="ccnumber" size="30" value="{$ccnumber}" autocomplete="off" class="newccinfo" /></div>
            </div>

           {if $showccissuestart}
            <div class="control-group">
                <label class="control-label" for="ccstartmonth">{$LANG.creditcardcardstart}</label>
                <div class="controls"><select name="ccstartmonth" id="ccstartmonth" class="newccinfo">{foreach from=$months item=month}
<option{if $ccstartmonth eq $month} selected{/if}>{$month}</option>
{/foreach}</select> / <select name="ccstartyear" class="newccinfo">
{foreach from=$startyears item=year}
<option{if $ccstartyear eq $year} selected{/if}>{$year}</option>
{/foreach}
</select></div>
            </div>
            {/if}

            <div class="control-group">
                <label class="control-label" for="ccexpirymonth">{$LANG.creditcardcardexpires}</label>
                <div class="controls"><select name="ccexpirymonth" id="ccexpirymonth" class="newccinfo">{foreach from=$months item=month}
<option{if $ccexpirymonth eq $month} selected{/if}>{$month}</option>
{/foreach}</select> / <select name="ccexpiryyear" class="newccinfo">
{foreach from=$expiryyears item=year}
<option{if $ccexpiryyear eq $year} selected{/if}>{$year}</option>
{/foreach}
</select></div>
            </div>

           {if $showccissuestart}
            
            <div class="control-group">
                <label class="control-label" for="ccissuenum">{$LANG.creditcardcardissuenum}</label>
                <div class="controls"><input type="text" name="ccissuenum" id="ccissuenum" size="5" maxlength="3" value="{$ccissuenum}" class="input-small newccinfo" /></div>
            </div>
            {/if}

            <div class="control-group">
                <label class="control-label" for="cccvv">{$LANG.creditcardcvvnumber}</label>
                <div class="controls"><input type="text" name="cccvv" id="cccvv" size="5" value="{$cccvv}" autocomplete="off" class="input-mini newccinfo" />&nbsp;<a href="#" onclick="window.open('images/ccv.gif','','width=280,height=200,scrollbars=no,top=100,left=100');return false">{$LANG.creditcardcvvwhere}</a></div>
            </div>

            {if $shownostore}
            <p><label class="full control-label"><input type="checkbox" name="nostore" id="nostore" class="newccinfo" /> {$LANG.creditcardnostore}</label></p>
            {/if}

            <br />
            <br />

            <p class="textcenter"><input class="btn btn-large btn-primary" type="submit" value="{$LANG.ordercontinuebutton}" onclick="this.value='{$LANG.pleasewait}'" /></p>

        </div>
    </div>
</div>

<p align="center"><img src="images/padlock.gif" alt="Secure" /> {$LANG.creditcardsecuritynotice}</p>

</fieldset>

{if !$cardnum || $ccinfo eq "new"}{else}
<script> disableFields('newccinfo',true); </script>
{/if}

</form>

{/if}