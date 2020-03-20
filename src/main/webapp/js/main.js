alert('tlqk');
var currentScrollTop = 0;

window.onload = function() {
  scrollController();
  loadTemplate();
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
function loadTemplate(){
	//인클루드
	alert('tlqk2');
	$('#header').load("../template/header.html");
	$('#footer').load("../template/footer.html");
}


