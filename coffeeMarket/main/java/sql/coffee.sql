CREATE TABLE IF NOT EXISTS ORDERLIST(
   ORDERNUM INT(11) NOT NULL,
   PRODUCTID VARCHAR(10) NOT NULL,
   QUANTITY INT(11) NOT NULL,
   TOTALPRICE INT(11) NOT NULL,
    FOREIGN KEY(PRODUCTID) REFERENCES COFFEE(ID),
    PRIMARY KEY(ORDERNUM,PRODUCTID)
)default CHARSET=utf8;

--조회시 GROUP BY절 이용해서 같은 ORDERNUM끼리 묶기
--시퀀스 기능 구현할 것


CREATE TABLE IF NOT EXISTS PAYMENT(
   PAYNUM INT(11) NOT NULL AUTO_INCREMENT,
   ID VARCHAR(10) NOT NULL,
   CARDNUM VARCHAR(16) NOT NULL,
   CVC VARCHAR(3) NOT NULL,
   VALIDE VARCHAR(4) NOT NULL,
   PASSWORD VARCHAR(6) NOT NULL,
   ADRESS VARCHAR(50) NOT NULL, 
   REQUEST VARCHAR(50) NOT NULL,
   PAYDATE DATE NOT NULL,
   ORDERNUM INT(11) NOT NULL,
   PRODUCTID VARCHAR(10) NOT NULL,
   PRIMARY KEY(PAYNUM),
   FOREIGN KEY(ID) REFERENCES MEMBER(ID),
   FOREIGN KEY(ORDERNUM,PRODUCTID) REFERENCES ORDERLIST(ORDERNUM,PRODUCTID)
)default CHARSET=utf8;
--주소 자동완성   

-----------------------------------------------------------


CREATE TABLE IF NOT EXISTS BOARD (
       NUM int not null auto_increment,   
       ID varchar(10) not null,   
       SUBJECT varchar(100) not null,
       CONTENT text not null,
       REGIST_DAY varchar(30),
       HIT int,   
       LIKEBUTTON int,
       PRIMARY KEY (num),
       FOREIGN KEY(ID) REFERENCES MEMBER(ID)
)default CHARSET=utf8;
--name varchar(10) not null, 이름은 MEMBER 테이블에서 불러오는 걸로

create table IF NOT EXISTS MEMBER (
      ID varchar(10) not null, 
      PASSWORD varchar(10) not null,
      NAME varchar(10) not null,
      GENDER varchar(4) not null, 
      BIRTH varchar(10) not null,
      MAIL varchar(30) not null, 
      PHONE varchar(20) not null, 
      ADDRESS varchar(100) not null, 
      RREGIST_DAY varchar(50) not null, 
      primary key(ID)                 
) default CHARSET=utf8;

CREATE TABLE IF NOT EXISTS COFFEE( 
   ID VARCHAR(10) NOT NULL,     -- 원두 ID (고유 식별자)
   NAME VARCHAR(60),          -- 원두 이름
   UNITPRICE  INTEGER,          -- 가격
   DESCRIPTION TEXT,          -- 설명
   ORIGIN VARCHAR(20),           -- 원산지
   STOCK LONG,              -- 재고 수량
   RELEASEDATE VARCHAR(20),     -- 등록일
   FILENAME  VARCHAR(20),        -- 이미지 파일명
   PRIMARY KEY (ID)          -- 기본 키 지정
) DEFAULT CHARSET=utf8;
	

INSERT INTO COFFEE VALUES('coffee123', '브라질 디카페인 원두 1kg', 35000, '카페인은 부담스러우신 분들을 위한 브라질 스위스 워터 디카페인 원두입니다. 볶은 견과류 계열의 향미와 입안 가득 달콤하고 구수한 맛이 특징입니다.', '브라질', 1000, '2025/01/01', 'coffee123.jpg');
INSERT INTO COFFEE VALUES('coffee124', '에소프레소 로열 원두 1kg', 34500, '견과류의 고소함과 밝은 산미, 깔끔하게 마무리되는 뒷맛 균형있는 바디감으로 밸런스가 좋고 달콤한 여운이 감도는 커피', '에티오피아외', 1000, '2023/01/01', 'coffee124.jpg');
INSERT INTO COFFEE VALUES('coffee125', '에소프레소 모카 원두 1kg', 39000, '진한 바디감과 과육의 산뜻한 산미, 풍부한 향으로 밸런스가 좋은 커피.', '에티오피아 외', 1000, '2025/01/01', 'coffee125.jpg');
INSERT INTO COFFEE VALUES('coffee126', '로스팅 블랜딩 원드 산미 1kg', 25000, '과일같은 산미와 가벼운 견과류의 고소함. 부담스럽지 않은 은은한 산미가 느껴지는 블렌드입니다.', '브라질 외', 1000, '2025/01/01', 'coffee126.jpg');
INSERT INTO COFFEE VALUES('coffee127', '로스팅 블랜딩 원두 고소한맛 1kg', 27000, '묵직한 견과류와 곡물의 고소함. 호불호 없이 마실 수 있는 커피. 우유와 잘 어울리는 블렌드입니다.', '브라질 외', 1000, '2025/01/01', 'coffee127.jpg');
INSERT INTO COFFEE VALUES('coffee128', '로스팅 블랜딩 원두 클래식 1kg', 26000, '후미에서 느껴지는 다양한 과일향이 특징이며, 커피의 진한 맛을 좋아하는 고객들에게 적합한 선택입니다.', '에티오피아 외', 1000, '2025/01/01', 'coffee128.jpg');
INSERT INTO COFFEE VALUES('coffee129', '로스팅 블랜딩 원두 다크 1kg', 24000, '로스팅된 커피의 강한 풍미. 적절한 쓴맛과 단향이 조화로운 블렌드입니다.', '과테말라 외', 1000, '2025/01/01', 'coffee129.jpg');
INSERT INTO COFFEE VALUES('coffee130', '키암부 중강배전 워시드 커피 원두 콩 홀빈 1kg', 39000, '키암부는 중강배전으로 산미가 적은 커피이며, 클린한 바디감의 고소함이 좋습니다.', '케냐', 1000, '2025/01/01', 'coffee130.jpg');
INSERT INTO COFFEE VALUES('coffee131', '콜롬비아 후일라 수프리모 싱글 고소 부드러운 다크로스트 워시드 커피 원두 콩 홀빈 1kg', 39000, '강배전으로 산미가 거의 없는 고소한 커피입니다. 바닐라류의 고소한 단맛이 특징입니다.', '콜롬비아', 1000, '2025/01/01', 'coffee131.jpg');

desc COFFEE

select * from coffee;

DROP TABLE ORDERLIST
DROP TABLE PAYMENT
DROP TABLE BOARD
DROP TABLE MEMBER
DROP TABLE COFFEE