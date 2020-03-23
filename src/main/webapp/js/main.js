var currentScrollTop = 0;

window.onload = function() {
  scrollController();
<<<<<<< HEAD
  loadTemplate();
=======
  $("#headerDiv").load("../template/header.html");
  $("#footerDiv").load("../template/footer.html");
>>>>>>> master
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
<<<<<<< HEAD
function loadTemplate(){
	//인클루드
	$('#header').load("../template/header.html");
	$('#footer').load("../template/footer.html");
}


=======
>>>>>>> master
