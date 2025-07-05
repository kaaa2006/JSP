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

DROP TABLE ORDERLIST
DROP TABLE PAYMENT
DROP TABLE BOARD
DROP TABLE MEMBER
DROP TABLE COFFEE