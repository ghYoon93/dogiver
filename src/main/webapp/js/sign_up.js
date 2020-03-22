// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
// window.onclick = function(event) {
// if (event.target == modal) {
// modal.style.display = "none";
// }
// };
// 이메일 버튼 클릭 이벤트
$("#auth-btn").click(function() {
  let $email = $("#email");
  let exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

  if ($email.val() == "") {
    $("#result-div")
      .text("이메일을 입력해주세요.")
      .css("display", "block");
    email.focus();
  } else if (exptext.test($email.val()) == false) {
    //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
    $("#result-div")
      .text("이메일 형식이 올바르지 않습니다.")
      .css("display", "block");
    email.focus();
    return false;
  } else {
    $.ajax({
      type: "post",
      url: "../member/authEmail",
      data: "id=" + $email.val(),
      dataType: "text",
      success: function(data) {
        if (data == "exist") {
          $("#idDiv")
            .text("사용 불가능")
            .css("color", "red");
        } else if (data == "non_exist") {
          $("#check").val($("#id").val());
          $("#idDiv")
            .text("사용 가능")
            .css("color", "blue");
        }
      }
    });
  }
});
