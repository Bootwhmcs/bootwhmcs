jQuery(document).ready(function(){

  jQuery("#configproducterror").hide();

  jQuery("#existingcustomer").click(function(){
    jQuery("#custtype").val("existing");
  });
  jQuery("#newcustomer").click(function(){
    jQuery("#custtype").val("new");
  });
});

function showcats() {
    jQuery("#categories").slideToggle();
}

function selproduct(num) {
    jQuery('#productslider').slider("value", num);
    jQuery(".product").hide();
    jQuery("#product"+num).show();
    jQuery(".sliderlabel").removeClass("selected");
    jQuery("#prodlabel"+num).addClass("selected");
}

function recalctotals() {
    jQuery.post("cart.php", 'ajax=1&a=confproduct&calctotal=true&'+jQuery("#orderfrm").serialize(),
    function(data){
        jQuery("#producttotal").html(data);
    });
}

function addtocart(gid) {
    jQuery("#loading1").slideDown();
    jQuery.post("cart.php", 'ajax=1&a=confproduct&'+jQuery("#orderfrm").serialize(),
    function(data){
        if (data) {
            jQuery("#configproducterror").html(data);
            jQuery("#configproducterror").slideDown();
            jQuery("#loading1").slideUp();
        } else {
            if (gid) window.location='cart.php?gid='+gid;
            else window.location='cart.php?a=confdomains';
        }
    });
}

function domaincontactchange() {
    if (jQuery("#domaincontact").val()=="addingnew") {
        jQuery("#domaincontactfields").slideDown();
    } else {
        jQuery("#domaincontactfields").slideUp();
    }
}

function showCCForm() {
    jQuery("#ccinputform").slideDown();
}
function hideCCForm() {
    jQuery("#ccinputform").slideUp();
}
function useExistingCC() {
    jQuery(".newccinfo").hide();
}
function enterNewCC() {
    jQuery(".newccinfo").show();
}
