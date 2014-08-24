$( function() {
  /* Automatically hide togglediv and show on click of togglebtn. */
  $(".togglediv").toggle();
  $("#togglebtn").click(function() {
    $( ".togglediv" ).slideToggle("slow" );
  });
});