function email_confirm() {
  var popupX = document.body.offsetWidth / 2 - 500 / 2;
  var popupY = document.body.offsetHeight / 2 - 600 / 2;

  window.open(
    "",
    "이메일인증",
    "status=no, height=600, width=500, left=" +
      popupX +
      ", top=" +
      popupY +
      ", location=0, toolbar=no, menubar=no"
  );
}
