<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="../css/dogJoin.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
<form name="dogJoinForm" method="post">
  <div class="dogjoinframe">
    <h3>ííê²¬ ì ë³´ ìë ¥</h3>
    <ul>
      <li>
        <label>ë°ë ¤ê²¬ ì´ë¦</label>
        <input type="text" placeholder="ë°ë ¤ê²¬ ì´ë¦" id="dogName">
        <div id="dogNameDiv"></div>
      </li>
      <li>
        <label>ë°ë ¤ê²¬ ëì´</label>
        <input type="text" placeholder="ì«ìë§ ìë ¥" id="dogAge">
        <div id="dogAgeDiv"></div>
      </li>
      <li>
        <label>ë°ë ¤ê²¬ ì¢</label>
        <input type="text" placeholder="íê¸ë¡ ìë ¥" id="dogBreed">
        <div id="dogBreedDiv"></div>
      </li>
      <li>
        <label>ë°ë ¤ê²¬ ëª¸ë¬´ê²(kg)</label>
        <input type="text" placeholder="ì«ìë§ ìë ¥" id="dogWeight">
        <div id="dogWeightDiv"></div>
      </li>
      <li>
        <label>ë°ë ¤ê²¬ íì¡í</label><br />
        <select placeholder="ì«ìë§ ìë ¥" id="dogbloodType">
          <option value="1.1" id="dogbloodType">1.1</option>
          <option value="1.2" id="dogbloodType">1.2</option>
          <option value="1.3" id="dogbloodType">1.3</option>
          <option value="3" id="dogbloodType">3</option>
          <option value="4" id="dogbloodType">4</option>
          <option value="5" id="dogbloodType">5</option>
          <option value="7" id="dogbloodType">7</option>
        </select>
      </li>
    </ul>
    <div class="btn_center"><button type="button" class="dogJoinBtn" return="false">ë±ë¡ì ì²­</button></div>
  </div>
</form>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="../js/dogJoin.js"></script>
</html>
