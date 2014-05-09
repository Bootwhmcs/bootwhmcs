{literal}
<script>
jQuery(document).ready(function(){
    jQuery("#password").keyup(function () {
        var pw = jQuery("#password").val();
        var pwlength=(pw.length);
        if(pwlength>5)pwlength=5;
        var numnumeric=pw.replace(/[0-9]/g,"");
        var numeric=(pw.length-numnumeric.length);
        if(numeric>3)numeric=3;
        var symbols=pw.replace(/\W/g,"");
        var numsymbols=(pw.length-symbols.length);
        if(numsymbols>3)numsymbols=3;
        var numupper=pw.replace(/[A-Z]/g,"");
        var upper=(pw.length-numupper.length);
        if(upper>3)upper=3;
        var pwstrength=((pwlength*10)-20)+(numeric*10)+(numsymbols*15)+(upper*10);
        if(pwstrength<0){pwstrength=0}
        if(pwstrength>100){pwstrength=100}
        jQuery("#pwstrengthbox").removeClass("weak moderate strong");
        jQuery("#pwstrengthbox").html("{/literal}{$LANG.pwstrengthstrong}{literal}");
        jQuery("#pwstrengthbox").addClass("strong");
        if (pwstrength<75) {
            jQuery("#pwstrengthbox").html("{/literal}{$LANG.pwstrengthmoderate}{literal}");
            jQuery("#pwstrengthbox").addClass("moderate");
        }
        if (pwstrength<30) {
            jQuery("#pwstrengthbox").html("{/literal}{$LANG.pwstrengthweak}{literal}");
            jQuery("#pwstrengthbox").addClass("weak");
        }
    });
});
</script>
{/literal}
<div id="pwstrengthbox">{$LANG.pwstrengthenter}</div>
