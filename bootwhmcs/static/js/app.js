jQuery(document).ready(function(){


  /** Determine password strength **/
  /*********************************/

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
    jQuery("#pwstrengthbox").html("Strong");
    jQuery("#pwstrengthbox").addClass("strong");

    if (pwstrength<75) {
      jQuery("#pwstrengthbox").html("Moderate");
      jQuery("#pwstrengthbox").addClass("moderate");
    }

    if (pwstrength<30) {
      jQuery("#pwstrengthbox").html("Weak");
      jQuery("#pwstrengthbox").addClass("weak");
    }
  });


  /** Enable facebook recommend **/
  /*******************************/

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));


  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();

  jQuery('.multiTLD').click(function() {
    jQuery('#tlds').slideToggle();
    return false;
  });

  // Facebook 100% Width
  // ===============================
  var foundFBComs = false;
  $('.fb-comments-unloaded').each(function(){
    var $fbCom = $(this),
    contWidth = $fbCom.parent().width();

    $fbCom.attr('data-width', contWidth).removeClass('fb-comments-unloaded').addClass('fb-comments');
    foundFBComs = true;
  });

  if(foundFBComs) {
    FB.XFBML.parse();
  }

  // Open Centered Popup
  // ===============================
  function popupWindow(addr,popname,w,h,features) {
    var winl = (screen.width-w)/2;
    var wint = (screen.height-h)/2;
    if (winl < 0) winl = 0;
    if (wint < 0) wint = 0;
    var settings = 'height=' + h + ',';
    settings += 'width=' + w + ',';
    settings += 'top=' + wint + ',';
    settings += 'left=' + winl + ',';
    settings += features;
    win = window.open(addr,popname,settings);
    win.window.focus();
  }



  jQuery("#subaccount").click(function () {
    if (jQuery("#subaccount:checked").val()!=null) {
      jQuery("#subaccountfields").slideDown();
    } else {
      jQuery("#subaccountfields").slideUp();
    }
  });

  // Select2
  $("#country").select2();
  $('#stateselect').select2();

  $('.extraTicketAttachment').click(function() {
    jQuery("#fileuploads").append('<input type="file" name="attachments[]" style="width:70%;" /><br />');
    return false;
  });

});

// Support Tickets
// ===============================

function extraTicketAttachment() {
    jQuery("#fileuploads").append('<input type="file" name="attachments[]" style="width:70%;" /><br />');
}

function rating_hover(id) {
    var selrating=id.split('_');
    for(var i=1; i<=5; i++){
        if(i<=selrating[1]) document.getElementById(selrating[0]+'_'+i).style.background="url(images/rating_pos.png)";
        if(i>selrating[1]) document.getElementById(selrating[0]+'_'+i).style.background="url(images/rating_neg.png)";
    }
}
function rating_leave(id){
    for(var i=1; i<=5; i++){
        document.getElementById(id+'_'+i).style.background="url(images/rating_neg.png)";
    }
}
function rating_select(tid,c,id){
    window.location='viewticket.php?tid='+tid+'&c='+c+'&rating='+id;
}
