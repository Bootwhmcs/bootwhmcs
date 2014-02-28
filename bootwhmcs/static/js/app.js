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
  
  $("#country").select2();
  
  $('.extraTicketAttachment').click(function() { 
    jQuery("#fileuploads").append('<input type="file" name="attachments[]" style="width:70%;" /><br />');
    return false;
  });
  
});
