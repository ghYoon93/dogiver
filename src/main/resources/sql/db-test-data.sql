Insert into MEMBER (EMAIL,NAME,NICKNAME,PWD,PHONE,ZIPCODE,ADDR,ADDR_DETAIL,SEQ,REGIST_DATE,DROP_DATE,DROP_YN,ROLE,EMAIL_YN) values ('gh.yoon93@gmail.com','윤건희','디디맨2','$2a$10$bwvAzBCnrpmiMbeyVHRb7OtEopYayX45736F/.FSDpov0KP2ImLyG','01012345675',6303,'서울 강남구 개포로 207','백암빌딩 503호',7,to_date('20/03/26','RR/MM/DD'),null,'N','member','N');

Insert into CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values (101,'장난감');

Insert into GOODS (ID,CATEGORY_CODE,NAME,PRICE,THUMBNAIL,quantity,on_sale,detail,cumulative_sales) 
     values (1010001,101,'핸드메이드 강아지 로프 장난감',3000,'1010001/thumbnail.jpg',1,'Y','1010001/detail.jpg',71);

Insert into GOODS (ID,CATEGORY_CODE,NAME,PRICE,THUMBNAIL,quantity,on_sale,detail,cumulative_sales) 
     values (1010002,101,'핸드메이드',2000,'1010002/thumbnail.jpg',10,'Y','1010002/detail.jpg',11);

Insert into cart (id, member_email) VALUES(3, 'gh.yoon93@gmail.com');
--INSERT INTO cart(cart_id, email, goods_id, cart_cnt) 
--                VALUES(seq_cart.nextval, 'gh.yoon93@gmail.com', 1010001, 3);

Insert into cart_item(id, goods_id, cart_id, quantity) VALUES(seq_cart_item.nextval, 1010001, 3, 4);
Insert into cart_item(id, goods_id, cart_id, quantity) VALUES(seq_cart_item.nextval, 1010002, 3, 10);