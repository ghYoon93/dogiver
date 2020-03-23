<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="../css/style.css" />
	<link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
      rel="stylesheet"
    />
    <style type="text/css">
      * {
        margin: 0;
      }

      #board_info_box {
        width: 1100px;
        height: 50px;
      }
      #board_category {
        width: 110px;
        height: 50px;
        border: 1px solid black;
        float: left;
        display: inline-block;
        text-align: center;
        line-height: 50px;
      }
      #board_category_text {
        width: 150px;
        height: 50px;
        border: 1px solid black;
        display: inline-block;
        float: left;
        line-height: 50px;
        padding-left: 10px;
      }

      #board_time {
        width: 90px;
        height: 50px;
        border: 1px solid black;
        float: left;
        display: inline-block;
        margin-left: 60px;
        text-align: center;
        line-height: 50px;
      }
      #board_time_text {
        width: 110px;
        height: 50px;
        border: 1px solid black;
        display: inline-block;
        float: left;
        line-height: 50px;
        padding-left: 10px;
      }

      #board_writer {
        width: 90px;
        height: 50px;
        border: 1px solid black;
        float: left;
        display: inline-block;
        margin-left: 60px;
        text-align: center;
        line-height: 50px;
      }
      #board_writer_text {
        width: 110px;
        height: 50px;
        border: 1px solid black;
        display: inline-block;
        float: left;
        line-height: 50px;
        padding-left: 10px;
      }

      #board_count {
        width: 90px;
        height: 50px;
        border: 1px solid black;
        float: left;
        display: inline-block;
        margin-left: 60px;
        text-align: center;
        line-height: 50px;
      }
      #board_count_text {
        width: 110px;
        height: 50px;
        border: 1px solid black;
        display: inline-block;
        float: left;
        line-height: 50px;
        padding-left: 10px;
      }

      #board_title_box {
        width: 1100px;
        height: 50px;
        margin-top: 20px;
      }
      #board_title {
        width: 110px;
        height: 50px;
        border: 1px solid black;
        display: inline-block;
        float: left;
        text-align: center;
        line-height: 50px;
      }
      #board_title_text {
        width: 975px;
        height: 50px;
        border: 1px solid black;
        display: inline-block;
        float: left;
        margin-left: 10px;
        line-height: 50px;
      }

      #board_content {
        width: 1100px;
        min-height: 700px;
        border: 1px solid black;
        margin-top: 20px;
      }
      #board_content-reply {
        width: 1100px;
        height: 300px;
        border: 1px solid black;
      }
      #board_button {
        width: 1100px;
        border: 1px solid black;
        margin-top: 2px;
      }
      #board_content_reply {
        min-height: 200px;
        width: 1100px;
        border: 1px solid black;
        margin-top: 2px;
      }
      #board_content_reply_paging {
        width: 1100x;
        border: 1px solid black;
        margin-top: 2px;
      }
    </style>
  </head>
  <body>
    <div class="wrap">
      <div id="board_info_box">
        <div id="board_category">
          Category
        </div>

        <div id="board_category_text">
          	??
        </div>

        <div id="board_writer">
          Writer
        </div>

        <div id="board_writer_text">
          
        </div>

        <div id="board_time">
          Time
        </div>

        <div id="board_time_text">
          2018.07.24
        </div>

        <div id="board_count">
          View
        </div>

        <div id="board_count_text">
          25
        </div>
      </div>

      <div id="board_title_box">
        <div id="board_title">
       	??
        </div>
        <div id="board_title_text">
          <input
            type="text"
            value="프로젝트 화이팅!"
            style="padding-left:10px;  width: 930px; height: 46px; border: none"
          />
        </div>
      </div>

      <div id="board_content">
        	??
      </div>

      <div id="board_content_reply">
      	??
      </div>
      <div id="board_content_reply_paging">
        	??
      </div>
      <div id="board_button">
        <input
          type="button"
          value="����"
          style="width: 95px; margin-left: 500px;"
        />
        <input type="button" value="이전" style="width: 95px;" />
        <input type="button" value="다음" style="width: 95px;" />
        <input type="button" value="목록" style="width: 95px;" />
        <input type="button" value="수정" style="width: 95px;" />
        <input type="button" value="삭제" style="width: 95px;" />
      </div>
    </div>
    <div id="footerDiv"></div>
  </body>
</html>
