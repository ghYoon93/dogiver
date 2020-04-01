<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>dogiver</title>
<!-- <link rel="stylesheet" href="../css/reset.css">
  <link rel="stylesheet" href="../css/common.css"> -->
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/order.css">
<link
  href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
  rel="stylesheet" />

</head>

<body>
  <div id="headerDiv"></div>
  <!-- 페이지타이틀 -->
    <div class="page-title">
      <h2 class="h2">주문서 작성/결제</h2>
    </div>
    <!-- //페이지타이틀 -->
  <div id="wrap">
    <div class="order_wrap">
      <div class="order_process">
        <ol>
          <li><span class="dot">01</span> 장바구니 <span>&gt;</span></li>
          <li class="page_on"><span class="dot">02</span> 주문서작성/결제<span>&gt;</span></li>
          <li><span class="dot">03</span> 주문완료</li>
        </ol>
      </div>
      <!-- //order_process -->
      <form id="form-order" name="form-order" method="post" action="">
      <c:forEach var="checkGoods" items="${checkGoods}">
        <input type="hidden" name="checkGoods" value="${checkGoods }">
      </c:forEach>
        <input type="hidden" id="goods_id" value="${goods_id }">
        <input type="hidden" id="quantity" value="${quantity }">
      <div class="order_cont">
        <div class="cart_cont_list">
          <div class="order_cart_tit">
            <h3>주문상세내역</h3>
          </div>
          <!-- // order_cart_tit -->
          <div class="order_table_type">
            <table>
              <colgroup>
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
            <div class="order_view_info">
              <div class="order_info">
                <div class="order_zone_tit">
                  <h4>주문자 정보</h4>
                </div>
                <div class="order_table_type">
                  <table class="table_left">
                    <colgroup>
                      <col style="width: 15%;">
                      <col style="width: 85%;">
                    </colgroup>
                    <tbody>
                      <tr>
                        <th scope="row">주문하시는 분<span class="important">(필수)</span></th>
                        <td><input type="text" name="orderName"
                          value="${memberDTO.name }" maxlength="20"></td>
                      </tr>
                      <tr>
                        <th scope="row">받으실 곳<span class="important">(필수)</span></th>
                        <td class="member_address">
                          <div class="address_postcode">
                              <input type="text" name="orderZipcode"value="${memberDTO.zipcode }"
                              readonly="readonly">
                            <button type="button"
                              class="btn_post_search">우편번호 검색</button>
                          </div>
                          <div class="address_input">
                            <input type="text" name="orderAddress" value="${memberDTO.addr }"
                              readonly="readonly"> <input
                              type="text" name="orderAddressSub" value="${memberDTO.addr_Detail }">
                            <button type="button"
                              class="btn_post_setting">기본 배송지로
                              설정</button>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">전화번호<span class="important">(필수)</span></th>
                        <td><input type="text" id="mobileNum"
                          name="orderCellPhone" value="${memberDTO.phone }"
                          maxlength="20"></td>
                      </tr>
                      <tr>
                        <th scope="row">이메일<span class="important">(필수)</span></th>
                        <td class="member_email"><input type="text"
                          name="email" value="${memberDTO.email }" maxlength="20">
                          <input type="hidden" name="partner_user_id" value="${memberDTO.email }">
                          <select
                          id="inputState">
                            <option value="self">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gmail.com</option>
                        </select></td>
                      </tr>
                      <tr>
                        <th scope="row">배송메세지</th>
                        <td class="order_memo"><input
                          type="text" name="order_memo"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="payment_info">
                <div class="order_zone_tit">
                  <h4>결제 정보</h4>
                </div>
                <div class="order_table_type">
                  <table class="table_left">
                    <colgroup>
                      <col style="width: 15%;">
                      <col style="width: 85%;">
                    <tbody>
                      <tr>
                        <th scope="row">상품 합계금액</th>
                        <td><strong
                          class="order_payment_sum"></strong>
                          <input type="hidden" name="partner_order_id" value="">
                          <input type="hidden" name="aid" value="">
                          <input type="hidden" name="tid" value="">
                          <input type="hidden" name="item_name" value="">
                          <input type="hidden" name="total_amount" value="">
                          <input type="hidden" name="quantity" value="">
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">배송비</th>
                        <td><span class="totalDeliveryCharge"></span>원</td>
                      </tr>
                      <tr>
                        <th scope="row">최종 결제 금액</th>
                        <td><input type="hidden" name="settlePrice"
                          value=""> <strong
                          class="totalSettlePrice"
                          class="order_payment_sum"></strong>원</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!--//payment_info-->
                <div class="payment_progress">
                  <div class="order_zone_tit">
                    <h4>결제수단 선택 / 결제</h4>
                  </div>
                  <div class="order_table_type">
                    <table class="table_left">
                      <colgroup>
                        <col style="width: 15%;">
                        <col style="width: 85%;">
                      <tbody>
                        <tr>
                          <th>결제수단 선택</th>
                          <td>
                            <div class="select_payment">
                              <input type="radio"
                                class="form-check-input" name="payment"
                                id="payment_noBook"> <label
                                for="payment_noBook">무통장 입금</label> <input
                                type="radio" name="payment"
                                id="payment_kakao"> <label
                                for="payment_kakao">카카오 페이</label>
                                <input type="hidden" name="order_pay">
                            </div>
                            <div class="pay_noBook_box">
                              <ul>
                                <li><strong>입금자명</strong> <input
                                  type="text" class="form-control"
                                  name="bankSender"></li>
                                <li><strong>입금은행</strong> <select
                                  id="inputState" class="form-control">
                                    <option value="">은행 선택</option>
                                    <option value="1">국민은행
                                      536801-04-008887 윤건희</option>
                                </select></li>
                              </ul>
                            </div>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="final_payment">
                    <div class="final_total_payment">
                      <dl>
                        <dt>최종 결제 금액</dt>
                        <dd>
                          <span><strong id="totalSettlePriceView"></strong>원</span>
                        </dd>
                      </dl>
                    </div>
                    <div class="final_payment_check">
                      <div class="form_element">
                        <input type="checkbox" id="termAgree_orderCheck"
                          class="require"> <label
                          for="termAgree_orderCheck" class="check_s"><em><b>(필수)</b>
                            구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</em></label>
                      </div>
                    </div>
                    <div class="btn_center_box">
                      <button class="btn_order_buy order-buy">
                        <em>결제하기</em>
                      </button>
                    </div>
                  </div>
                </div>
                <!--결제수단 선택 / 결제 끝-->
              </div>
              <!-- //payment_info -->
            </div>
            <!-- //order_view_info -->
          </div>
          <!-- //cart_cont_list -->
        </div>
      </div>
      </form>
      <!--//order_cont -->
    </div>
    <!-- //order_wrap -->
  </div>
  <!-- //wrap -->
  <div id="footerDiv"></div>
  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="../js/main.js"></script>
  <script type="text/javascript" src="../js/order.js"></script>
</body>

</html>