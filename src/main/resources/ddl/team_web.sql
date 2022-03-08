
COMMIT;

-----------------------1. 고객(테이블명: customer) -----------------------

--DROP TABLE customer;

SELECT * FROM customer;

CREATE TABLE customer (
    customer_id VARCHAR2(30) CONSTRAINT customer_id_pk PRIMARY KEY,
    customer_pw VARCHAR2(50) NOT NULL,
    customer_name VARCHAR2(10) NOT NULL,
    customer_gender VARCHAR2(10) NOT NULL,
    customer_phone VARCHAR2(20) NOT NULL,
    customer_post_code NUMBER(5) NOT NULL, --우편번호
    customer_road_addr VARCHAR2(100) NOT NULL, --도로명주소
    customer_lot_num_addr VARCHAR2(100) NOT NULL, --지번주소
    customer_extra_addr VARCHAR2(100), --상세주소
    customer_birth DATE
);

--ALTER TABLE customer MODIFY customer_extra_addr null;

-----------------------1-1 고객 DUMMY DATA INPUT  -----------------------
INSERT INTO customer VALUES
('water@naver.com','0000','유명한','남자','010-8899-1111','32311',
'대전광역시 서구 둔산로 100','대전광역시 서구 둔산동 1420','대전광역시청','1980-11-11');

INSERT INTO customer VALUES
('tablo@gmail.com','2424','이선웅','남자','010-2525-2222','05540',
'서울특별시 송파구 올림픽로 424','서울특별시 송파구 방이동 88','올림픽공원','1990-07-22');

INSERT INTO customer VALUES
('Tukutz@hanmail.net','3535','김태연','여자','010-6677-3333','03062',
'서울 종로구 삼청로 30','서울 종로구 소격동 165-10','국립현대미술관','1981-12-19');




-----------------------2. 관리자(테이블명: admin) -----------------------
--DROP TABLE admin;

SELECT * FROM admin;

CREATE TABLE admin (
    admin_id VARCHAR2(30) CONSTRAINT admin_id_pk PRIMARY KEY,
    admin_pw VARCHAR2(50) NOT NULL,
    admin_name VARCHAR2(10) NOT NULL
);

-----------------------2-1 관리자 DUMMY DATA INPUT  -----------------------

INSERT INTO customer VALUES
('mithra@naver.com','1155','최진','여자');

INSERT INTO customer VALUES
('justhis@gmail.com','1885','허승 ','남자');

INSERT INTO customer VALUES
('giriboy@naver.com','7875','홍시영','여자');


-----------------------3. 카테고리(테이블명: category) -----------------------

--DROP TABLE category;

SELECT * FROM category;

CREATE TABLE category (
    cate_code VARCHAR2(20) CONSTRAINT cate_code_pk PRIMARY KEY,
    cate_name VARCHAR2(20) NOT NULL,
    cate_code_ref VARCHAR2(20) --상위 카테고리
);


-----------------------3-1 카테고리 DUMMY DATA INPUT  -----------------------

INSERT INTO category (cate_code ,cate_name)
VALUES('tableware','식기');

INSERT INTO category VALUES('bowl','그릇', 'tableware');
INSERT INTO category VALUES('mug','컵', 'tableware');
INSERT INTO category VALUES('plate','접시', 'tableware');

-----------------------4. 상품(테이블명: product) -----------------------

DROP TABLE product;

SELECT * FROM product;

CREATE TABLE product (
    product_code VARCHAR2(10) CONSTRAINT product_code_pk PRIMARY KEY,
    product_name VARCHAR2(30) NOT NULL,
    product_price NUMBER(10) NOT NULL,
    product_yn VARCHAR2(10) NOT NULL, --판매여부
    product_amount VARCHAR2(10), --판매수량
    product_thumb VARCHAR2(500), --상품썸네일
    product_img VARCHAR2(500) --상품 상세 이미지
);

-- 컬럼 추가
ALTER TABLE product ADD cate_code VARCHAR2(10);

-- FK 설정
ALTER TABLE product ADD CONSTRAINT FK_1_product_cate_code
FOREIGN KEY (cate_code) REFERENCES category(cate_code);


-----------------------4-1 상품 DUMMY DATA INPUT  -----------------------

INSERT INTO product (product_code, product_name, product_price, product_yn, product_amount)
VALUES('b_simple','심플 주방용품 예쁜 그릇',13000, 1, 100);

INSERT INTO product (product_code, product_name, product_price, product_yn, product_amount)
VALUES('m_simple','심플 라인 유리잔',8000, 1, 30);




-----------------------5. 주문(테이블명: product_order) -----------------------

--DROP TABLE product_order;

CREATE SEQUENCE seq_product_order;

SELECT * FROM product_order;

CREATE TABLE product_order (
    order_code NUMBER(10) CONSTRAINT order_code_pk PRIMARY KEY,
    order_name VARCHAR2(10) NOT NULL, --수취인 이름
    order_post_code NUMBER(5) NOT NULL, --수취인 우편번호
    order_road_addr VARCHAR2(100) NOT NULL, --수취인 도로명주소
    order_lot_num_addr VARCHAR2(100) NOT NULL, --수취인 지번주소
    order_extra_addr VARCHAR2(100) NOT NULL, --수취인 상세주소
    order_phone VARCHAR2(10) NOT NULL,
    order_request VARCHAR2(100), --배송요청사항
    order_date DATE,--주문날짜
    order_total_price NUMBER(10)NOT NULL, --주문총금액
    order_status NUMBER(1) NOT NULL, --주문 상태
    order_deli_price NUMBER(10), --배송비
    order_deli_code NUMBER(10) --송장번호
);

-- 컬럼 추가
ALTER TABLE product_order ADD customer_id VARCHAR(30);

-- FK 설정
ALTER TABLE product_order ADD CONSTRAINT FK_1_productOrder_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

-- 컬럼 추가
ALTER TABLE product_order ADD product_code VARCHAR2(10);

-- FK 설정
ALTER TABLE product_order ADD CONSTRAINT FK_2_productOrder_product_code
FOREIGN KEY (product_code) REFERENCES product(product_code);

-- 컬럼 추가
ALTER TABLE product_order ADD cate_code VARCHAR2(10);

-- FK 설정
ALTER TABLE product_order ADD CONSTRAINT FK_3_productOrder_cate_code
FOREIGN KEY (cate_code) REFERENCES category(cate_code);


-----------------------5-1 주문 DUMMY DATA INPUT  -----------------------




-----------------------6. 장바구니(테이블명: cart) -----------------------

--DROP TABLE cart;

CREATE SEQUENCE seq_cart;

SELECT * FROM cart;

CREATE TABLE cart (
    cart_code NUMBER(2) CONSTRAINT cart_code_pk PRIMARY KEY,
    cart_amount NUMBER(10), --장바구니 수량
    cart_checked NUMBER(1),
    cart_total_price NUMBER(10)
);

-- 컬럼 추가
ALTER TABLE cart ADD customer_id VARCHAR(30);

-- FK 설정
ALTER TABLE cart ADD CONSTRAINT FK_1_cart_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

-- 컬럼 추가
ALTER TABLE cart ADD product_code VARCHAR2(10);

-- FK 설정
ALTER TABLE cart ADD CONSTRAINT FK_2_cart_product_code
FOREIGN KEY (product_code) REFERENCES product(product_code);


-----------------------6-1 장바구니 DUMMY DATA INPUT  -----------------------


-----------------------7. 결제(테이블명: pay) -----------------------
DROP TABLE pay;

CREATE SEQUENCE seq_pay;

SELECT * FROM pay;

CREATE TABLE pay (
    pay_code NUMBER(2) CONSTRAINT pay_code_pk PRIMARY KEY,
    pay_price NUMBER(10) NOT NULL, --결제 금액
    payment NUMBER(1) NOT NULL,
    paid NUMBER(1) NOT NULL, --결제여부
    refund NUMBER(1) --환불여부
);

-- 컬럼 추가
ALTER TABLE pay ADD order_code NUMBER(10);

-- FK 설정
ALTER TABLE pay ADD CONSTRAINT FK_1_pay_order_code
FOREIGN KEY (order_code) REFERENCES product_order(order_code);

-----------------------7-1 결제 DUMMY DATA INPUT  -----------------------



-----------------------8. 리뷰(테이블명: review) -----------------------
--DROP TABLE review;

CREATE SEQUENCE seq_review_reply;

SELECT * FROM review;

CREATE TABLE review (
    review_code NUMBER(10) CONSTRAINT review_code_pk PRIMARY KEY,
    review_title VARCHAR2(20) NOT NULL,
    review_cont VARCHAR2(200) NOT NULL,
    review_img VARCHAR2(500),
    review_date DATE NOT NULL
);

--ALTER TABLE review MODIFY review_code NUMBER(10);

-- 컬럼 추가
ALTER TABLE review ADD product_code VARCHAR2(10);

-- FK 설정
ALTER TABLE review ADD CONSTRAINT FK_1_review_product_code
FOREIGN KEY (product_code) REFERENCES product(product_code);

-- 컬럼 추가
ALTER TABLE review ADD cate_code VARCHAR2(10);

-- FK 설정
ALTER TABLE review ADD CONSTRAINT FK_2_review_cate_code
FOREIGN KEY (cate_code) REFERENCES category(cate_code);


-----------------------8-1 리뷰 DUMMY DATA INPUT  -----------------------





-----------------------9. 리뷰 댓글(테이블명: review_reply) -----------------------
--DROP TABLE review_reply;

CREATE SEQUENCE seq_review_reply;

SELECT * FROM review_reply;

CREATE TABLE review_reply (
    review_reply_code NUMBER(10) CONSTRAINT review_reply_code_pk PRIMARY KEY,
    review_reply_title VARCHAR2(20) NOT NULL,
    review_reply_cont VARCHAR2(200) NOT NULL,
    review_reply_img VARCHAR2(500),
    review_reply_date DATE NOT NULL
);

-- 컬럼 추가
ALTER TABLE review_reply ADD review_code NUMBER(10);

-- FK 설정
ALTER TABLE review_reply ADD CONSTRAINT FK_1_reviewReply_review_code
FOREIGN KEY (review_code) REFERENCES review(review_code);

-----------------------9-1 리뷰 댓글 DUMMY DATA INPUT  -----------------------


-----------------------10. 고객문의(테이블명: question) -----------------------
--DROP TABLE question;

CREATE SEQUENCE seq_question;

SELECT * FROM question;

CREATE TABLE question (
    question_code NUMBER(10) CONSTRAINT question_code_pk PRIMARY KEY,
    question_title VARCHAR2(20) NOT NULL,
    question_cont VARCHAR2(200) NOT NULL,
    question_img VARCHAR2(500),
    question_date DATE NOT NULL
);

-- 컬럼 추가
ALTER TABLE question ADD customer_id VARCHAR2(30);

-- FK 설정
ALTER TABLE question ADD CONSTRAINT FK_1_question_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

-- 컬럼 추가
ALTER TABLE question ADD admin_id VARCHAR2(30);

-- FK 설정
ALTER TABLE question ADD CONSTRAINT FK_2_question_customer_id
FOREIGN KEY (admin_id) REFERENCES admin(admin_id);


-----------------------10-1 고객문의 DUMMY DATA INPUT  -----------------------


-----------------------11. 답변(테이블명: answer) -----------------------
--DROP TABLE answer;

CREATE SEQUENCE seq_answer;

SELECT * FROM answer;

CREATE TABLE answer (
    answer_code NUMBER(10) CONSTRAINT answer_code_pk PRIMARY KEY,
    answer_title VARCHAR2(20) NOT NULL,
    answer_cont VARCHAR2(200) NOT NULL,
    answer_img VARCHAR2(500),
    answer_date DATE NOT NULL
);

-- 컬럼 추가
ALTER TABLE answer ADD question_code NUMBER(10);

-- FK 설정
ALTER TABLE answer ADD CONSTRAINT FK_1_answer_question_code
FOREIGN KEY (question_code) REFERENCES question(question_code);

-----------------------11-1 답변 DUMMY DATA INPUT  -----------------------




-----------------------12. 공지사항(테이블명: notice) -----------------------
DROP TABLE notice;

SELECT * FROM notice;

CREATE SEQUENCE seq_notice;

CREATE TABLE notice (
    notice_code NUMBER(10) CONSTRAINT notice_code_pk PRIMARY KEY,
    notice_title VARCHAR2(50) NOT NULL,
    notice_cont VARCHAR2(200) NOT NULL,
    notice_date DATE NOT NULL
);

-- 컬럼 추가
ALTER TABLE notice ADD admin_id VARCHAR2(30);

-- FK 설정
ALTER TABLE notice ADD CONSTRAINT FK_1_notice_admin_id
FOREIGN KEY (admin_id) REFERENCES admin(admin_id);

--ALTER TABLE notice MODIFY notice_title VARCHAR2(50);

-----------------------12-1 공지사항 DUMMY DATA INPUT  -----------------------


INSERT  INTO notice (notice_code, notice_title, notice_cont, notice_date)
    VALUES
    (seq_notice.nextval,'휴대폰 결제안내',
    '휴대폰 결제의 경우, 이동통신사의 정책에 따라 결제 당월이 지나면 결제취소가 불가능합니다', SYSDATE);

INSERT  INTO notice (notice_code, notice_title, notice_cont, notice_date)
    VALUES
    (seq_notice.nextval,'교환반품 안내',
    '상품을 의도적으로 훼손한경우, 처리가 불가능하며, 상품가격과 배송비를 보상해주셔야하고_ 영업방해로 처리됩니다.', SYSDATE);

INSERT  INTO notice (notice_code, notice_title, notice_cont, notice_date)
    VALUES
    (seq_notice.nextval,'단체주문 각인 및 커스텀 안내',
    '단체 주문시에 원하시는 글씨 혹은 로고 등 인쇄 진행 가능합니다.', SYSDATE);