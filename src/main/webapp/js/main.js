var currentScrollTop = 0;

window.onload = function() {
  scrollController();
  $("#headerDiv").load("../template/header.html");
  $("#footerDiv").load("../template/footer.html");
  $(window).on("scroll", function() {
    scrollController();
  });
};

// 영역의 위치를 설정한 위치에서 부드럽게 고정시킴 - 시작
function scrollController() {
  currentScrollTop = $(window).scrollTop();

  if ($(this).scrollTop() > 50) {
    $("header").addClass("sticky");
  } else {
    $("header").removeClass("sticky");
  }
}