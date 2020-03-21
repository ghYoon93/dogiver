<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/reset.css">
  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/order.css">
  <title>DogNOR</title>
</head>

<body>
  <div id="wrap">
    <div id="header">
      <div class="container">
        <div class="header">
          <div class="header_menu">
            <a href="#">login</a>
            <a href="#">sign up</a>
            <a href="#"><img src="../image/shopping_bucket.png" class="cart-ico" width="20px" height="20px" /></a>
          </div>
          <!-- //header menu -->
          <div class="header_tit"></div>
          <div class="header_icon"></div>
        </div>
      </div>
    </div>
    <!-- //header -->
    <div id="contents">
      <!-- //cont_nav -->
      <div id="cont-tit">
        <div class="container">con_tit</div>
      </div>
      <!-- //con_tit -->
      <!-- //con_ban -->

      <div class="order_wrap">
        <div class="order_process">
          <ol>
            <li><span class="dot">01</span> 장바구니 <span>&gt;</span></li>
            <li class="page_on"><span class="dot">02</span> 주문서작성/결제<span>&gt;</span></li>
            <li><span class="dot">03</span> 주문완료</li>
          </ol>
        </div>
        <!-- //order_process -->
        <div class="order_cont">
          <div class="cart_cont_list">
            <div class="order_cart_tit">
              <h3>주문상세내역</h3>
            </div>
            <!-- // order_cart_tit -->
            <div class="order_table_type">
              <table>
                <colgroup>
                  <col> <!-- 상품명/옵션 -->
                  <col style="width: 10%"> <!-- 수량 -->
                  <col style="width: 10%"> <!-- 상품금액 -->
                  <col style="width: 14%"> <!-- 합계금액 --> 
                  <col style="width:10%"> <!-- 배송비 -->
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
                  <tr>
                    <td class="td_left">
                      <div class="cart_goods_cont">
                        <span class="cart_goods_image">
                          <a href="#">
                            <img src="/image/no-image-icon.jpg" class="middle" width="40" alt="" title="">
                          </a>
                        </span>
                        <div class="cart_goods_info">
                          <em><a href="#">같이 구하기 되는 있는 뿐이다. 되려니와, 인생의 고동을 이것이다. 있으며, 되려니와, 피고 철환하였는가?</a></em>
                        </div>
                      </div>
                    </td>
                    <td class=td_order_amount>
                      <div class="cart_goods_num">
                        <strong>1</strong>
                        <font>개</font>
                      </div>
                    </td>
                    <td>
                      <strong>8,000원</strong></td>
                    <td><strong>8,000원</strong></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
              <div class="price_sum">
                <div class="price_sum_cont">
                  <div class="price_sum_list">
                    <dl>
                      <dt>총 <strong id="totalGoodsCnt">2</strong> 개의 상품금액 </dt>
                      <dd><strong id="totalGoodsPrice">31,900</strong>원</dd>
                    </dl>
                    <dl>
                      <dt>&emsp;</dt>
                      <dd><strong>+</strong></dd>
                    </dl>
                    <dl>
                      <dt>배송비</dt>
                      <dd><strong id="totalDeliveryCharge">2,500</strong>원</dd>
                    </dl>
                    <dl>
                      <dt>&emsp;</dt>
                      <dd><strong>=</strong></dd>
                    </dl>
                    <dl class="price_total">
                      <dt>합계</dt>
                      <dd><strong id="totalSettlePrice">34,400</strong>원
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
                        <col style="width:15%;">
                        <col style="width:85%;">
                    </colgroup>
                    <tbody>
                      <tr>
                          <th scope="row">주문하시는 분</span></th>
                          <td><input type="text" name="orderName" value="윤건희" maxlength="20"></td>
                      </tr>
                      <tr>
                          <th scope="row">받으실 곳</th>
                          <td class="member_address">
                            <div class="address_postcode">
                              <input type="text" name="orderPostcode" readonly="readonly">
                              <input type="hidden" name="orderZipcode">
                              <button type="button" class="btn_post_search">우편번호 검색</button>
                            </div>
                            <div class="address_input">
                              <input type="text" name="orderAddress" readonly="readonly">
                              <input type="text" name="orderAddressSub">
                              <button type="button" class="btn_post_setting">기본 배송지로 설정</button>
                            </div>
                          </td>
                      </tr>
                      <tr>
                          <th scope="row"><span class="important">휴대폰 번호</span></th>
                          <td>
                              <input type="text" id="mobileNum" name="orderCellPhone" value="010-8705-4028" maxlength="20">
                          </td>
                      </tr>
                      <tr>
                          <th scope="row"><span class="important">이메일</span></th>
                          <td class="member_email">
                            <input type="text" name="orderEmail1" value="" maxlength="20">
                            @
                            <input type="text" name="orderEmail2" value="" maxlength="20">
                            <select id="inputState">
                              <option value="self">직접입력</option>
                              <option value="naver.com">naver.com</option>
                              <option value="hanmail.net">hanmail.net</option>
                              <option value="daum.net">daum.net</option>
                              <option value="gmail.com">gmail.com</option>
                            </select>
                          </td>
                      </tr>
                      <tr>
                        <th scope="row">배송메세지</th>
                        <td class="order_message">
                          <input type="text" name="orderMessage">
                        </td>
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
                        <col style="width:15%;">
                        <col style="width:85%;">
                      <tbody>
                        <tr>
                          <th scope="row">상품 합계금액</th>
                          <td>
                            <strong id="totalGoodsPrice" class="order_payment_sum">31,900원</strong>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">배송비</th>
                          <td>
                            <span id="totalDeliveryCharge">2,500</span>원
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">최종 결제 금액</th>
                          <td>
                            <input type="hidden" name="settlePrice" value="34400">
                            <strong id="totalSettlePrice" class="order_payment_sum">34,400</strong>원
                          </td>
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
                          <col style="width:15%;">
                          <col style="width:85%;">
                        <tbody>
                          <tr>
                            <th>결제수단 선택</th>
                            <td>
                              <div class="select_payment">
                                <input  type="radio" class="form-check-input" name="payment" id="payment_noBook">
                                <label for="payment_noBook">무통장 입금</label>
                                <input type="radio" name="payment" id="payment_kakao">
                                <label for="payment_kakao">카카오 페이</label>
                              </div>
                              <div class="pay_noBook_box">
                                <ul>
                                  <li>
                                    <strong>입금자명</strong>
                                    <input type="text" class="form-control" name="bankSender">
                                  </li>
                                  <li>
                                    <strong>입금은행</strong>
                                    <select id="inputState" class="form-control">
                                      <option value="">은행 선택</option>
                                      <option value="1">국민은행 536801-04-008887 윤건희</option>
                                    </select>
                                  </li>
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
                          <dd><span><strong id="totalSettlePriceView">34,400</strong>원</span></dd>
                        </dl>
                      </div>
                      <div class="final_payment_check">
                        <div class="form_element">
                          <input type="checkbox" id="termAgree_orderCheck" class="require">
                          <label for="termAgree_orderCheck" class="check_s"><em><b>(필수)</b> 구매하실 상품의 결제정보를 확인하였으며, 구매진행에
                              동의합니다.</em></label>
                        </div>
                      </div>
                      <div class="btn_center_box">
                        <button class="btn_order_buy order-buy"><em>결제하기</em></button>
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
        <!--//order_cont -->
      </div>
      <!-- //order_wrap -->
    </div>
    <!-- //contents -->
  </div>
</body>

</html>