<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="../css/style.css" />
  <link rel="stylesheet" href="../css/order.css">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
    rel="stylesheet" />
  <title>DOGIVER</title>
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
          <li class="page_on"><span class="dot">01</span> 장바구니 <span>&gt;</span></li>
          <li><span class="dot">02</span> 주문서작성/결제<span>&gt;</span></li>
          <li><span class="dot">03</span> 주문완료</li>
        </ol>
      </div>
      <!-- //order_process -->
      <div class="cart_cont">
        <form id="form-cart" name="formCart" method="post" target="">
          <!-- <input type="hidden" name="mode" value="">
              <input type="hidden" name="cart[cartSno]" value="">
              <input type="hidden" name="cart[goodsNo]" value="">
              <input type="hidden" name="cart[goodsCnt]" value="">
              <input type="hidden" name="cart[addGoodsNo]" value="">
              <input type="hidden" name="cart[addGoodsCnt]" value="">
              <input type="hidden" name="cart[couponApplyNo]" value="">
              <input type="hidden" name="useBundleGoods" value="1"> -->
          <div class="cart_cont_list">
            <div class="order_table_type">
              <table>
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
                    <th><input type="checkbox" id="check-all" value="" /></th>
                    <th>상품/옵션 정보</th>
                    <th>수량</th>
                    <th>상품금액</th>
                    <th>합계금액</th>
                    <th>배송비</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="td_check"><input type="checkbox" id="" name="checkGoods" value="8000" /></td>
                    <td class="td_left">
                      <div class="cart_goods_cont">
                        <span class="cart_goods_image"> <a href="#"> <img src="../image/no-image-icon.jpg" class="middle"
                              width="40" alt="" title="">
                          </a>
                        </span>
                        <div class="cart_goods_info">
                          <em><a href="#">같이 구하기 되는 있는 뿐이다.
                              되려니와, 인생의 고동을 이것이다. 있으며, 되려니와, 피고 철환하였는가?</a></em>
                        </div>
                      </div>
                    </td>
                    <td class=td_order_amount>
                      <div class="cart_goods_num">
                        <strong>1</strong>
                        <font>개</font>
                        <div class="btn_option">
                          <button type="button" class="btn_option_view">수량
                            변경</button>
                        </div>
                      </div>
                    </td>
                    <td><strong>8,000원</strong></td>
                    <td><strong>8,000원</strong></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td class="td_check"><input type="checkbox" id="" name="checkGoods" value="8000" /></td>
                    <td class="td_left">
                      <div class="cart_goods_cont">
                        <span class="cart_goods_image"> <a href="#"> <img src="../image/no-image-icon.jpg" class="middle"
                              width="40" alt="" title="">
                          </a>
                        </span>
                        <div class="cart_goods_info">
                          <em><a href="#">같이 구하기 되는 있는 뿐이다.
                              되려니와, 인생의 고동을 이것이다. 있으며, 되려니와, 피고 철환하였는가?</a></em>
                        </div>
                      </div>
                    </td>
                    <td class=td_order_amount>
                      <div class="cart_goods_num">
                        <strong>1</strong>
                        <font>개</font>
                      </div>
                    </td>
                    <td><strong>8,000원</strong></td>
                    <td><strong>8,000원</strong></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td class="td_check"><input type="checkbox" id="" name="checkGoods" value="" /></td>
                    <td class="td_left">
                      <div class="cart_goods_cont">
                        <span class="cart_goods_image"> <a href="#"> <img src="../image/no-image-icon.jpg" class="middle"
                              width="40" alt="" title="">
                          </a>
                        </span>
                        <div class="cart_goods_info">
                          <em><a href="#">같이 구하기 되는 있는 뿐이다.
                              되려니와, 인생의 고동을 이것이다. 있으며, 되려니와, 피고 철환하였는가?</a></em>
                        </div>
                      </div>
                    </td>
                    <td class=td_order_amount>
                      <div class="cart_goods_num">
                        <strong>1</strong>
                        <font>개</font>
                      </div>
                    </td>
                    <td><strong>8,000원</strong></td>
                    <td><strong>8,000원</strong></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td class="td_check"><input type="checkbox" id="" name="checkGoods" value="" /></td>
                    <td class="td_left">
                      <div class="cart_goods_cont">
                        <span class="cart_goods_image"> <a href="#"> <img src="../image/no-image-icon.jpg" class="middle"
                              width="40" alt="" title="">
                          </a>
                        </span>
                        <div class="cart_goods_info">
                          <em><a href="#">같이 구하기 되는 있는 뿐이다.
                              되려니와, 인생의 고동을 이것이다. 있으며, 되려니와, 피고 철환하였는가?</a></em>
                        </div>
                      </div>
                    </td>
                    <td class=td_order_amount>
                      <div class="cart_goods_num">
                        <strong>1</strong>
                        <font>개</font>
                      </div>
                    </td>
                    <td><strong>8,000원</strong></td>
                    <td><strong>8,000원</strong></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td class="td_check"><input type="checkbox" id="" name="checkGoods" value="" /></td>
                    <td class="td_left">
                      <div class="cart_goods_cont">
                        <span class="cart_goods_image"> <a href="#"> <img src="../image/no-image-icon.jpg" class="middle"
                              width="40" alt="" title="">
                          </a>
                        </span>
                        <div class="cart_goods_info">
                          <em><a href="#">같이 구하기 되는 있는 뿐이다.
                              되려니와, 인생의 고동을 이것이다. 있으며, 되려니와, 피고 철환하였는가?</a></em>
                        </div>
                      </div>
                    </td>
                    <td class=td_order_amount>
                      <div class="cart_goods_num">
                        <strong>1</strong>
                        <font>개</font>
                        <div class="btn_option">
                          <button>수량 변경</button>
                        </div>
                      </div>
                    </td>
                    <td><strong>8,000원</strong></td>
                    <td><strong>8,000원</strong></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
            </div>
        <div class="price_sum">
          <div class="price_sum_cont">
            <div class="price_sum_list">
              <dl>
                <dt>
                  총 <strong id="totalGoodsCnt">2</strong> 개의 상품금액
                </dt>
                <dd>
                  <strong id="totalGoodsPrice">31,900</strong>원
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
                  <strong id="totalDeliveryCharge">2,500</strong>원
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
                  <strong id="totalSettlePrice">34,400</strong>원
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
            <button type="button" class="btn_order_shop_go_link" onclick="location.href='#'">쇼핑 계속하기</button>
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
          <h4>옵션선택</h4>
          <span onclick="" class="close" title="닫기">&times;</span>
          <div class="option_layer_scroll">
            <div class="option_tit_box">
              <dl>
                <dt>
                  <img src="../image/no-image-icon.jpg" width="68" alt="상품명" title="상품명" class="middle">
                </dt>
                <dd>
                  <strong>같이 구하기 되는 있는 뿐이다. 되려니와, 인생의 고동을 이것이다.
                    있으며, 되려니와, 피고 철환하였는가?</strong>
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
  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="../js/main.js"></script>
  <script type="text/javascript" src="../js/cart.js"></script>
</body>

</html>