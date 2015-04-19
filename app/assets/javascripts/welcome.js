// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  var modalSetting = {
    onOpen: function (dialog) {
      dialog.data.fadeIn('fast');
      dialog.container.fadeIn('fast');
      dialog.overlay.fadeIn('fast');
    },
    opacity: 85
  };

  $('.login-btn').click(function(e){
  	e.preventDefault();
    $('#login-modal').modal(modalSetting);
  });

  $('.signup-btn').click(function(e){
  	e.preventDefault();
    $('#signup-modal').modal(modalSetting)
  });

  $('body').on('click', '.simplemodal-overlay', function() {
    $(this).fadeOut('fast');
    $('.simplemodal-wrap').fadeOut('fast', function() {
      $.modal.close();
    });
  });


	$('.how-btn').click(function() {
	  $('body').animate({
	    scrollTop: $('#how-it-works').offset().top
	  }, 750);
    return false;
	});


})




    // $("div#FilterContainer").find("div").hide();
    // $("div#FilterContainer").find("div." + filters).show();
