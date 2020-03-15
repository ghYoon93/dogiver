$('.dognorlist dd').click(function(){
  let newWindow = window.open("", "", "width=600 height=600");
  let img = newWindow.document.createElement("img");
  img.setAttribute("src","../image/dognor.jpg");
  img.setAttribute("width","300");
  img.setAttribute("height","300");
  newWindow.document.body.appendChild(img);
  newWindow.document.write("<h3>똘똘이</h3>나이 : 6살<br>종 : ㅇㅇ<br>몸무게: ㅇㅇ<br>");

});
