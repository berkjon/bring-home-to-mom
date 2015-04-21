// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.addEventListener('resize', function(event){
  $('#movie-wrap').bind('click', '.movie-poster', function(e){
    var target = $(e.target).closest('.movie-flip');
    target.toggleClass('flipped');
  })
})

$(document).on('page:change', function() {
  //     $(".pf-set-date-wrapper").on("click",".pf-set-date-link",function(e){
  //   debugger
  // })


      $('#movie-wrap').slick({
        dots: true,
        infinite: true,
        centerMode: true,
        slidesToShow: 4,
        speed: 700,
        autoplay: true,
        autoplaySpeed: 1000,
        responsive: [
            {
              breakpoint: 1800,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 3,
                infinite: true,
                dots: true
              }
            },
            {
              breakpoint: 1200,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 2
              }
            },
            {
              breakpoint: 660,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1
              }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
          ]
        // fade: true,
        // cssEase: 'linear',

      });
      $('.movie-flip').on('click', '.movie-poster', function(e){

        var target = $(event.target).closest('.movie-flip');
        target.toggleClass('flipped');
      })



    });
