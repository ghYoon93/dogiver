--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------
DROP TABLE IF EXISTS member;
DROP SEQUENCE IF EXISTS seq_member;
CREATE TABLE member 
  ( 
     seq         NUMBER NOT NULL,
     email       VARCHAR2(50) NOT NULL, 
     name        VARCHAR2(30) NOT NULL, 
     nickname    VARCHAR2(30) NOT NULL, 
     pwd         VARCHAR2(300) NOT NULL, 
     phone       VARCHAR2(50), 
     zipcode     NUMBER(10, 0), 
     addr        VARCHAR2(100), 
     addr_detail VARCHAR2(100), 
     regist_date DATE DEFAULT SYSDATE, 
     drop_date   DATE, 
     drop_yn     CHAR(1) DEFAULT 'N', 
     role        VARCHAR2(20) DEFAULT 'member', 
     email_yn    CHAR(1) DEFAULT 'N' 
  );

CREATE SEQUENCE seq_member;
 
-------------------------------------------------------- 
--  Constraints for Table MEMBER 
-------------------------------------------------------- 
ALTER TABLE member
  ADD CONSTRAINT CHECK_ROLE CHECK (ROLE IN('member', 'admin')); 

ALTER TABLE member 
  ADD CONSTRAINT PK_MEMBER PRIMARY KEY (email); 

ALTER TABLE member 
  ADD CONSTRAINT UNIQUE_SEQ UNIQUE (seq); 

ALTER TABLE member 
  ADD CONSTRAINT UNIQUE_NICKNAME UNIQUE (nickname); 

ALTER TABLE member 
  ADD CONSTRAINT CHECK_DROP_Y_N CHECK (drop_yn IN('Y', 'N')); 


--------------------------------------------------------
--  DDL for Table APPLY_DOGIVER
--------------------------------------------------------
DROP TABLE IF EXISTS apply_dogiver;
DROP SEQUENCE IF EXISTS seq_apply_dogiver;

CREATE TABLE apply_dogiver 
  ( 
     dog_id        NUMBER NOT NULL, 
     dog_name      VARCHAR2(20) NOT NULL, 
     dog_age       NUMBER(20, 0) NOT NULL, 
     dog_breed     VARCHAR2(100) NOT NULL, 
     dog_weight    NUMBER(20, 0) NOT NULL, 
     dog_bloodtype VARCHAR2(20) NOT NULL, 
     apply_status  VARCHAR2(20), 
     email         VARCHAR2(50) 
  );

CREATE SEQUENCE seq_apply_dogiver;

-------------------------------------------------------- 
--  Constraints for Table APPLY_DOGIVER 
-------------------------------------------------------- 
ALTER TABLE apply_dogiver 
  ADD CONSTRAINT PK_APPLY_DOGIVER PRIMARY KEY (dog_id); 

ALTER TABLE apply_dogiver 
  ADD CONSTRAINT CHECK_APPLY_STATUS CHECK (apply_status IN ('신청완료', '검사대기중', '헌혈완료', 
  '헌혈불가')); 

ALTER TABLE apply_dogiver 
  ADD CONSTRAINT CHECK_DOG_BLOODTYPE CHECK (dog_bloodtype IN ('1.1', '1.2', '1.3', '3', '4', '5', '7')); 

-------------------------------------------------------- 
--  Ref Constraints for Table APPLY_DOGIVER 
-------------------------------------------------------- 
ALTER TABLE apply_dogiver 
  ADD CONSTRAINT FK_DOGOWNER FOREIGN KEY (email) REFERENCES member ( 
  email); 


--------------------------------------------------------
--  DDL for Table DOGIVER
--------------------------------------------------------
DROP TABLE IF EXISTS dogiver;

CREATE TABLE dogiver 
  ( 
     dog_id        NUMBER NOT NULL, 
     dog_image     VARCHAR2(100) NOT NULL, 
     description   VARCHAR2(100), 
     blood_cc      NUMBER(38, 0), 
     donation_date VARCHAR2(100) 
  ); 

-------------------------------------------------------- 
--  Constraints for Table DOGIVER 
-------------------------------------------------------- 
ALTER TABLE dogiver 
  ADD CONSTRAINT UNIQUE_DOG_ID UNIQUE (dog_id);

-------------------------------------------------------- 
--  Ref Constraints for Table DOGIVER 
-------------------------------------------------------- 
ALTER TABLE dogiver 
  ADD CONSTRAINT FK_DOG_ID FOREIGN KEY (dog_id) REFERENCES apply_dogiver ( 
  dog_id); 


-------------------------------------------------------- 
--  DDL for Table CATEGORY 
-------------------------------------------------------- 
DROP TABLE IF EXISTS category;

CREATE TABLE category 
  ( 
     category_code NUMBER(6, 0) NOT NULL, 
     category_name VARCHAR2(100) NOT NULL 
  ); 

-------------------------------------------------------- 
--  Constraints for Table CATEGORY 
-------------------------------------------------------- 
ALTER TABLE category 
  ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (category_code) ; 

-------------------------------------------------------- 
--  DDL for Table GOODS 
-------------------------------------------------------- 
DROP TABLE IF EXISTS goods;

CREATE TABLE goods 
  ( 
     goods_id        NUMBER NOT NULL, 
     category_code   NUMBER(20, 0) NOT NULL, 
     goods_name      VARCHAR2(100) NOT NULL, 
     goods_price     NUMBER NOT NULL, 
     goods_date      DATE DEFAULT SYSDATE, 
     goods_thumbnail VARCHAR2(200), 
     goods_amt       NUMBER, 
     sales_yn        VARCHAR2(1) DEFAULT 'Y', 
     goods_detail    VARCHAR2(200) NOT NULL, 
     goods_cum_sales NUMBER 
  ); 


-------------------------------------------------------- 
--  Constraints for Table GOODS 
-------------------------------------------------------- 
ALTER TABLE goods 
  ADD CONSTRAINT PK_GOODS PRIMARY KEY (goods_id); 

ALTER TABLE goods 
  ADD CONSTRAINT CHECK_SALES_Y_N CHECK (sales_yn IN('Y', 'N')); 

-------------------------------------------------------- 
--  Ref Constraints for Table GOODS 
-------------------------------------------------------- 
ALTER TABLE goods 
  ADD CONSTRAINT FK_GOODSCATEGORY FOREIGN KEY (category_code) REFERENCES 
  category (category_code); 

  
-------------------------------------------------------- 
--  DDL for Table GOODS_BOARD 
-------------------------------------------------------- 
DROP TABLE IF EXISTS goods_board;
DROP SEQUENCE IF EXISTS seq_goods_board;
DROP SEQUENCE IF EXISTS seq_goods_reply;

CREATE TABLE goods_board 
  ( 
     email         VARCHAR2(50) NOT NULL, 
     goods_id      NUMBER NOT NULL, 
     category_code VARCHAR2(10), 
     title         VARCHAR2(100) NOT NULL, 
     text_content  VARCHAR2(600), 
     reply         VARCHAR2(600), 
     board_date    DATE DEFAULT SYSDATE, 
     image         VARCHAR2(200), 
     bo_seq        NUMBER(4, 0), 
     re_seq        NUMBER(4, 0) 
  ); 

CREATE SEQUENCE seq_goods_board;
CREATE SEQUENCE seq_goods_reply;
-------------------------------------------------------- 
--  Constraints for Table GOODS_BOARD 
-------------------------------------------------------- 
ALTER TABLE goods_board 
  ADD CONSTRAINT CHECK_CATEGORY CHECK (category_code IN('REVIEW', 'QNA', 
  'REPLY'));

-------------------------------------------------------- 
--  Ref Constraints for Table GOODS_BOARD 
-------------------------------------------------------- 
ALTER TABLE goods_board 
  ADD CONSTRAINT FK_EMAIL FOREIGN KEY (email) REFERENCES member (email); 

ALTER TABLE goods_board 
  ADD CONSTRAINT FK_GOODSID FOREIGN KEY (goods_id) REFERENCES goods ( 
  goods_id); 



-------------------------------------------------------- 
--  DDL for Table CART 
-------------------------------------------------------- 
DROP TABLE IF EXISTS cart;
DROP SEQUENCE IF EXISTS seq_cart;

CREATE TABLE cart 
  ( 
     cart_id       NUMBER NOT NULL, 
     email         VARCHAR2(50) NOT NULL, 
     goods_id      NUMBER(20, 0) NOT NULL, 
     cart_cnt      NUMBER(20, 0) NOT NULL, 
     created_date  DATE DEFAULT SYSDATE, 
     modified_date DATE DEFAULT SYSDATE 
  ); 
CREATE SEQUENCE seq_cart;

-------------------------------------------------------- 
--  DDL for Index PK_CART
-------------------------------------------------------- 
CREATE UNIQUE INDEX "PK_CART" 
  ON CART (cart_id); 

-------------------------------------------------------- 
--  Constraints for Table CART 
-------------------------------------------------------- 

ALTER TABLE cart 
  ADD CONSTRAINT PK_CART PRIMARY KEY (cart_id);

-------------------------------------------------------- 
--  Ref Constraints for Table CART 
-------------------------------------------------------- 
ALTER TABLE cart 
  ADD CONSTRAINT FK_CART_GOODS FOREIGN KEY (goods_id) REFERENCES goods ( 
  goods_id); 

ALTER TABLE cart 
  ADD CONSTRAINT FK_CART_MEMBER FOREIGN KEY (email) REFERENCES member ( 
  email); 

-------------------------------------------------------- 
--  DDL for Table GOODS_ORDER 
-------------------------------------------------------- 
DROP TABLE IF EXISTS goods_order;
DROP SEQUENCE IF EXISTS seq_goods_order;

CREATE TABLE goods_order 
  ( 
     order_id          NUMBER NOT NULL, 
     email             VARCHAR2(50), 
     order_date        DATE DEFAULT SYSDATE, 
     order_total_price NUMBER, 
     delivery_price    NUMBER, 
     recipient         VARCHAR2(10), 
     order_phone       VARCHAR2(50), 
     order_zip_code    NUMBER, 
     order_addr        VARCHAR2(100), 
     order_addr_detail VARCHAR2(100) NOT NULL, 
     order_memo        VARCHAR2(100), 
     order_pay         VARCHAR2(30) NOT NULL, 
     order_status      VARCHAR2(30) NOT NULL, 
     delivery_code     NUMBER NOT NULL, 
     order_email       VARCHAR2(50), 
     order_amount      NUMBER 
  ); 

CREATE SEQUENCE seq_goods_order;

-------------------------------------------------------- 
--  Constraints for Table GOODS_ORDER 
-------------------------------------------------------- 
ALTER TABLE goods_order 
  ADD CONSTRAINT PK_GOODS_ORDER PRIMARY KEY (order_id); 


ALTER TABLE goods_order 
  MODIFY (order_status NOT NULL); 

ALTER TABLE goods_order 
  MODIFY (order_pay NOT NULL); 

ALTER TABLE goods_order 
  MODIFY (order_addr_detail NOT NULL); 

ALTER TABLE goods_order 
  MODIFY (order_addr NOT NULL); 

ALTER TABLE goods_order 
  MODIFY (order_zip_code NOT NULL); 

ALTER TABLE goods_order 
  MODIFY (order_phone NOT NULL); 

ALTER TABLE goods_order 
  MODIFY (recipient NOT NULL); 

ALTER TABLE goods_order 
  MODIFY (delivery_price NOT NULL); 

ALTER TABLE goods_order 
  MODIFY (order_total_price NOT NULL); 

ALTER TABLE goods_order 
  ADD CONSTRAINT "CHECK_ORDER_PAY" CHECK (order_pay IN('bank', 'kakao')); 

ALTER TABLE goods_order 
  ADD CONSTRAINT "CHECK_ORDER_STATUS" CHECK (order_status IN ('입금대기', 
  '결제완료', '상품준비중', '배송중', '배송완료', '주문취소' 
  , '교환', '반품')); 

ALTER TABLE goods_order 
  MODIFY (email NOT NULL); 

ALTER TABLE goods_order 
  MODIFY (order_id NOT NULL); 

-------------------------------------------------------- 
--  Ref Constraints for Table GOODS_ORDER 
-------------------------------------------------------- 
ALTER TABLE goods_order 
  ADD CONSTRAINT FK_ORDEREMAIL FOREIGN KEY (email) REFERENCES member ( 
  email); 

-------------------------------------------------------- 
--  DDL for Table PAY_BANK 
-------------------------------------------------------- 
DROP TABLE IF EXISTS pay_bank;

CREATE TABLE pay_bank 
  ( 
     order_id     NUMBER NOT NULL, 
     bank_name    VARCHAR2(20) NOT NULL, 
     bank_account NUMBER NOT NULL, 
     pay_date     DATE DEFAULT SYSDATE 
  ); 
 
-------------------------------------------------------- 
--  Ref Constraints for Table PAY_BANK 
-------------------------------------------------------- 
ALTER TABLE pay_bank 
  ADD CONSTRAINT FK_PAY_BANK FOREIGN KEY (order_id) REFERENCES goods_order 
  (order_id); 



-------------------------------------------------------- 
--  DDL for Table PAY_KAKAO 
-------------------------------------------------------- 
DROP TABLE IF EXISTS pay_kakao;

CREATE TABLE pay_kakao 
  ( 
     order_id NUMBER NOT NULL, 
     pay_id   VARCHAR2(30) NOT NULL, 
     api_id   VARCHAR2(30) NOT NULL, 
     pay_date DATE DEFAULT SYSDATE 
  ); 


-------------------------------------------------------- 
--  Ref Constraints for Table PAY_KAKAO 
-------------------------------------------------------- 
ALTER TABLE pay_kakao 
  ADD CONSTRAINT FK_ORDER_ID FOREIGN KEY (order_id) REFERENCES goods_order 
  (order_id); 


-------------------------------------------------------- 
--  DDL for Table ORDER_DETAIL 
-------------------------------------------------------- 
DROP TABLE IF EXISTS order_detail;

CREATE TABLE order_detail 
  ( 
     order_id    NUMBER, 
     goods_id    NUMBER(20, 0), 
     goods_count NUMBER(20, 0), 
     total_price NUMBER 
  ); 

-------------------------------------------------------- 
--  Constraints for Table ORDER_DETAIL 
-------------------------------------------------------- 
ALTER TABLE order_detail 
  MODIFY (total_price NOT NULL); 

ALTER TABLE order_detail 
  MODIFY (goods_count NOT NULL); 

ALTER TABLE order_detail 
  MODIFY (goods_id NOT NULL); 

ALTER TABLE order_detail 
  MODIFY (order_id NOT NULL); 

-------------------------------------------------------- 
--  Ref Constraints for Table ORDER_DETAIL 
-------------------------------------------------------- 
ALTER TABLE order_detail 
  ADD CONSTRAINT FK_DETAIL_GOODS_ID FOREIGN KEY (goods_id) REFERENCES 
  goods (goods_id); 

ALTER TABLE order_detail 
  ADD CONSTRAINT FK_DETAIL_ORDER_ID FOREIGN KEY (order_id) REFERENCES 
  goods_order (order_id) ON DELETE CASCADE; 


-------------------------------------------------------- 
--  DDL for Table BOARD 
-------------------------------------------------------- 
DROP TABLE IF EXISTS  board;
DROP SEQUENCE IF EXISTS seq_board;
CREATE TABLE board 
  ( 
     brd_seq       NUMBER NOT NULL, 
     brd_email     VARCHAR2(100), 
     brd_nickname  VARCHAR2(100), 
     brd_category  VARCHAR2(40), 
     brd_title     VARCHAR2(200), 
     brd_content   CLOB, 
     brd_logtime   DATE DEFAULT SYSDATE, 
     brd_hit       NUMBER DEFAULT 0, 
     pseq          NUMBER DEFAULT 0, 
     brd_recontent VARCHAR2(400) 
  ); 

-------------------------------------------------------- 
--  Constraints for Table BOARD 
-------------------------------------------------------- 
ALTER TABLE board 
  ADD CONSTRAINT PK_BOARD PRIMARY KEY (brd_seq); 

ALTER TABLE board 
  MODIFY (brd_content NOT NULL); 

ALTER TABLE board 
  MODIFY (brd_title NOT NULL); 

ALTER TABLE board 
  MODIFY (brd_category NOT NULL); 

-------------------------------------------------------- 
--  DDL for Table BRD_REPLY 
-------------------------------------------------------- 
DROP TABLE IF EXISTS brd_reply;
DROP SEQUENCE IF EXISTS seq_brd_reply;

CREATE TABLE brd_reply 
  ( 
     bd_seq     NUMBER, 
     re_seq     NUMBER, 
     re_writer  VARCHAR2(100), 
     re_content VARCHAR2(400), 
     re_logtime DATE DEFAULT SYSDATE 
  ); 

CREATE SEQUENCE seq_brd_reply;

-------------------------------------------------------- 
--  Constraints for Table BRD_REPLY 
-------------------------------------------------------- 
ALTER TABLE brd_reply 
  MODIFY (re_content NOT NULL); 

ALTER TABLE brd_reply 
  MODIFY (re_writer NOT NULL); 

ALTER TABLE brd_reply 
  MODIFY (re_seq NOT NULL); 

ALTER TABLE brd_reply 
  MODIFY (bd_seq NOT NULL); 

-------------------------------------------------------- 
--  Ref Constraints for Table BRD_REPLY 
-------------------------------------------------------- 
ALTER TABLE brd_reply 
  ADD CONSTRAINT "BRD_REPLY_BNO" FOREIGN KEY (bd_seq) REFERENCES board ( 
  brd_seq) ON DELETE CASCADE;

-------------------------------------------------------- 
--  DDL for Table CONTACT 
-------------------------------------------------------- 
DROP TABLE IF EXISTS contact;

CREATE TABLE contact 
  ( 
     seq     NUMBER, 
     name    VARCHAR2(40), 
     email   VARCHAR2(40), 
     phone   VARCHAR2(50), 
     subject VARCHAR2(300), 
     content VARCHAR2(4000), 
     logtime DATE DEFAULT SYSDATE 
  ); 

-------------------------------------------------------- 
--  Constraints for Table CONTACT 
-------------------------------------------------------- 
ALTER TABLE contact 
  MODIFY (content NOT NULL); 

ALTER TABLE contact 
  MODIFY (subject NOT NULL); 

ALTER TABLE contact 
  MODIFY (phone NOT NULL); 

ALTER TABLE contact 
  MODIFY (email NOT NULL); 

ALTER TABLE contact 
  MODIFY (name NOT NULL); 

ALTER TABLE contact 
  MODIFY (seq NOT NULL); 