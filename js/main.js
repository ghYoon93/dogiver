$(function() {
  var top_header = $(".top_header"),
    header = $(".header");

  var yPosition = top_header.offset().top;

  $(window).scroll(function(e) {
    var top = $(document).scrollTop();
    if (yPosition < top) {
      $(".frame").css({ marginTop: header.outerHeight(true) });
      header.addClass("topFixed");
    } else {
      $(".frame").css({ marginTop: "0" });
      header.removeClass("topFixed");
    }
  });
});
