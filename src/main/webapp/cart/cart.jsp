<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">  
  <link rel="favicon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
  <link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css"/>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
    rel="stylesheet" />
  <title>장바구니</title>
</head>

<body>
  <div id="headerDiv"></div>
  <!-- 페이지타이틀 -->
    <div class="page-title">
      <h2 class="h2">장바구니</h2>
    </div>
    <!-- //페이지타이틀 -->
  <div id="wrap">
    <div class="order_wrap">
      <div class="order_process">
        <ol>
          <li class="page_on"><span class="dot">01</span> 장바구니 <span>&gt;</span></li>
          <li><span class="dot">02</span> 주문서작성/결제<span>&gt;</span></li>
          <li><span class="dot">03</span> 주문완료</li>
        </ol>
      </div>
      <!-- //order_process -->
      <div class="cart_cont">
        <form id="form-cart" name="formCart" method="get">
          <div class="cart_cont_list">
            <div class="order_table_type">
                <table id=cart-table>
                  <colgroup>
                    <col style="width: 3%">
                    <!-- 체크박스 -->
                    <col>
                    <!-- 상품명/옵션 -->
                    <col style="width: 10%">
                    <!-- 수량 -->
                    <col style="width: 10%">
                    <!-- 상품금액 -->
                    <col style="width: 14%">
                    <!-- 합계금액 -->
                    <col style="width: 10%">
                    <!-- 배송비 -->
                  </colgroup>
                  <thead>
                    <tr>
                      <th>
                        <input type="checkbox" id="check-all" /> <label for="check-all"></label></th>
                      <th>상품/옵션 정보</th>
                      <th>수량</th>
                      <th>상품금액</th>
                      <th>합계금액</th>
                      <th>배송비</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
            </div>
        <div class="price_sum">
          <div class="price_sum_cont">
            <div class="price_sum_list">
              <dl>
                <dt>
                  총 <strong id="totalGoodsCnt">0</strong> 개의 상품금액
                </dt>
                <dd>
                  <strong id="totalGoodsPrice">0</strong>원
                </dd>
              </dl>
              <dl>
                <dt>&emsp;</dt>
                <dd>
                  <strong>+</strong>
                </dd>
              </dl>
              <dl>
                <dt>배송비</dt>
                <dd>
                  <strong id="totalDeliveryCharge">0</strong>원
                </dd>
              </dl>
              <dl>
                <dt>&emsp;</dt>
                <dd>
                  <strong>=</strong>
                </dd>
              </dl>
              <dl class="price_total">
                <dt>합계</dt>
                <dd>
                  <strong id="totalSettlePrice">0</strong>원
                </dd>
              </dl>
            </div>
            <!-- //price_sum_list -->
          </div>
          <!-- //price_sum_count -->
          
        </div>
        <!-- //price_sum -->
        <div class="btn_order_box">
          <span class="btn_left_box">
            <button type="button" class="btn_order_choice_del" onclick="gd_cart_process('cartDelete');">선택 상품
              삭제</button>
            <button type="button" class="btn_order_shop_go_link" onclick="location.href='../goods/goodsList'">쇼핑 계속하기</button>
          </span> <span class="btn_right_box">
            <button type="button" class="btn_order_choice_buy" onclick="gd_cart_process('orderSelect');">선택 상품
              주문</button>
            <button type="button" class="btn_order_whole_buy" onclick="gd_order_all();">전체 상품 주문</button>
          </span>
        </div>
        <!-- //btn_order_box -->
      </div>
      <!-- //cart_cont_list -->
        </form>
      <div id="option-view" class="layer_option" style="display: none">
        <div class="layer_option_cont">
          <h4>장바구니 옵션</h4>
          <span onclick="" class="close" title="닫기">&times;</span>
          <div class="option_layer_scroll">
            <div class="option_tit_box">
              <dl>
                <dd class="imgbox">
                  <input type="hidden" name="cart_id" value="">
                  <img src="" alt="" title="" class="middle">
                </dd>
                <dd><strong class="goods_name">goodsName</strong></dd>
                <dd>
                  <div class="count">
                    <button type="button" id="minus">-</button>
                    <input type="text" id="quantity" name="cnt" value="" size="4">
                    <button type="button" id="plus">+</button>
                  </div>
                  <strong id="tot_price" title="총합계금액"></strong>
                </dd>
                <dd class="btnbox">
                  <button type="button" class="cancel">취소</button>
                  <button type="button" class="changeCnt">확인</button>
                </dd>
              </dl>
            </div>
            <!-- //option_tit_box -->
          </div>
          <!-- //option_layer_scroll -->
        </div>
        <!-- //layer_option_cont -->
      </div>
      <!-- //option-view -->
    </div>
    <!-- //order_wrap -->
  </div>
  <!-- //wrap -->
  </div>
  <div id="footerDiv"></div>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cartService.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/quantityOption.js"></script>
</body>

</html>