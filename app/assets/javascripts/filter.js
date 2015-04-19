// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('page:change', function() {
  debugger

  var updateMatches = function() {
    var user_filters = $.map($("select.filterby").toArray(), function(e){return $(e).val();});
    var filterData = {
      gender: user_filters[0],
      religion: user_filters[1],
      smoke: user_filters[2],
      childGender: $("h1").attr("data-gender")
    }
    $.ajax({
      url: '/filter',
      type: 'GET',
      dataType: 'JSON',
      data: {filterData: filterData},
    })
    .done(function(response) {
      var source = $("#child_preview_template").html();
      var templatingFunction = Handlebars.compile(source);
      var context = {};
      context.match = response.matches;
      $(".matches").text("");
      $(".matches").append(templatingFunction(context));
    });
  };

  updateMatches();

  $('.filterby').change(updateMatches);


    // $("div.matches").find("tr").hide();
    // $("div.matches").find("div." + filters).show();

});



