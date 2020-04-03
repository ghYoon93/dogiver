<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/reset.css" />
  <link rel="stylesheet" href="../css/style.css" />
  <link rel="stylesheet" href="../css/order.css">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
    rel="stylesheet" />
  <title>주문 조회</title>
</head>

<body>
  <div id="headerDiv"></div>
  <div class="page-title">
    <h2 class="h2">주문 조회</h2>
  </div>
    <div id="wrap">
      <div class="order_wrap">
        <div class="mypage_order_info">
          <div class="mypage_zone_tit">
            <h3>진행중인 주문/배송</h3>
          </div>
          <div class="mypage_order_info_cont">
            <ol>
              <li class="active">
                <strong>${status_wait }</strong>
                <b>입금대기</b>
              </li>
              <li class="">
                <strong>${status_paid }</strong>
                <b>결제완료</b>
              </li>
              <li class="">
                <strong>${status_ready }</strong>
                <b>상품준비중</b>
              </li>
              <li class="">
                <strong>${status_deliver }</strong>
                <b>배송중</b>
              </li>
              <li class="">
                <strong>${status_delivered }</strong>
                <b>배송완료</b>
              </li>
            </ol>
            <div class="order_case_list">
              <ul>
                <li class="both">
                  <b>취소</b>
                  <span><strong>${status_cancel }</strong>건</span>
                </li>
                <li class="both">
                  <b>교환</b>
                  <span><strong>${status_exchange }</strong>건</span>
                </li>
                <li class="both">
                  <b>반품</b>
                  <span><strong>${status_return }</strong>건</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <!-- mypage_order_info -->
        <div class="mypage_lately_info">
          <div class="mypage_zone_tit">
            <h3>주문/배송</h3>
          </div>
          <div class="mypage_lately_info_cont">
            <!-- 주문상품 리스트 -->
            <div class="mypage_table_type">
              <table>
                <colgroup>
                  <col style="width:15%"> <!-- 날짜/주문번호 -->
                  <col> <!-- 상품명/옵션 -->
                  <col style="width:15%"> <!-- 수량 -->
                  <col style="width:15%"> <!-- 상품금액 -->
                  <col style="width:15%"> <!-- 주문상태/확인/리뷰 -->
                </colgroup>
                <thead>
                  <tr>
                    <th>날짜/주문번호</th>
                    <th>상품명/옵션</th>
                    <th>수량</th>
                    <th>상품금액</th>
                    <th>주문상태</th>
                  </tr>
                </thead>
                <tbody>
                <!--   <tr class="row_line" data-order-no="2003310218453223" data-order-goodsno="1265101"
                    data-order-status="o1" data-order-userhandlesno="0">
                    <td rowspan="5" class="order_day_num">
                      <em>2020/03/31</em>
                      <a href="../my/order_view.php?orderNo=2003310218453223" target="_blank"
                        class="order_num_link"><span>2003310218453223</span></a>
                      <div class="btn_claim">
                        <span class="btn_gray_list"><a href="#"
                            class="btn_gray_small js_btn_order_cancel"><span>주문취소</span></a></span>
                      </div>
                    </td>
                    <td class="td_left">
                      <div class="pick_add_cont">
                        <span class="pick_add_img">
                          <a href="../goods/goods_view.php?goodsNo=2495866"><img
                              src="/data/goods/18/09/26/2495866/2495866_list_056.jpg" width="50"
                              alt="네츄럴코어 오리말이고구마 110g" title="네츄럴코어 오리말이고구마 110g" class="middle"></a>
                        </span>
                        <div class="pick_add_info">
                          <a href="../goods/goods_view.php?goodsNo=2495866"><em>네츄럴코어 오리말이고구마 110g</em></a>
                        </div>
                      </div>
                      //pick_add_info
                    </td>
                    <td><strong>4</strong>개</td>
                    <td><strong>12,800원</strong></td>
                    <td>
                      <em>
                        입금대기
                      </em>
                    </td>
                  </tr> -->
                  
                </tbody>
              </table>
            </div>
            <!--// 주문상품 리스트 -->
          </div>
          <!-- //mypage_lately_info_cont -->
        </div>
        <!-- mypage_lately_info -->
      </div>
      <!-- //order_wrap -->
    </div>
    <div id="footerDiv"></div>
</body>
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/orderList.js"></script>
</html>