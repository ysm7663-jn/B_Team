-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
-- DROP SEQUENCES
DROP SEQUENCE WISHLIST_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE RESERVATION_SEQ;
DROP SEQUENCE REPLY_SEQ;
DROP SEQUENCE CLUBLIST_SEQ;
DROP SEQUENCE PLACEOPTION_SEQ;
DROP SEQUENCE PLACE_SEQ;
DROP SEQUENCE SELLER_SEQ;
DROP SEQUENCE PLACECATEGORY_SEQ;
DROP SEQUENCE CLUB_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE CATEGORY_SEQ;

-- DROP TABLES

DROP TABLE WISHLIST;
DROP TABLE FAQ;
DROP TABLE NOTICE; 
DROP TABLE REVIEW;
DROP TABLE RESERVATION;
DROP TABLE REPLY;
DROP TABLE CLUBLIST;
DROP TABLE PLACEOPTION;
DROP TABLE PLACE;
DROP TABLE SELLER;
DROP TABLE PLACECATEGORY;
DROP TABLE CLUB;
DROP TABLE CATEGORY;
DROP TABLE MEMBER;


-- DROP SEQUENCES
DROP SEQUENCE WISHLIST_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE RESERVATION_SEQ;
DROP SEQUENCE REPLY_SEQ;
DROP SEQUENCE CLUBLIST_SEQ;
DROP SEQUENCE PLACEOPTION_SEQ;
DROP SEQUENCE PLACE_SEQ;
DROP SEQUENCE SELLER_SEQ;
DROP SEQUENCE PLACECATEGORY_SEQ;
DROP SEQUENCE CLUB_SEQ;
DROP SEQUENCE MEMBER_SEQ;

-- DROP TABLES

DROP TABLE WISHLIST;
DROP TABLE FAQ;
DROP TABLE NOTICE; 
DROP TABLE REVIEW;
DROP TABLE RESERVATION;
DROP TABLE REPLY;
DROP TABLE CLUBLIST;
DROP TABLE PLACEOPTION;
DROP TABLE PLACE;
DROP TABLE SELLER;
DROP TABLE PLACECATEGORY;
DROP TABLE CLUB;
DROP TABLE MEMBER;

select * from member;
select * from place;
select * from placeoption;
select * from review
update review set rv_postdate where 
update place set p_img = '["P_IMG01.jpg", "P_IMG02.jpg", "P_IMG03.jpg"]' where p_no=7;

-- MEMBER Table Create SQL
CREATE TABLE MEMBER
(

    M_NO NUMBER PRIMARY KEY, 
    M_ID VARCHAR2(100) NOT NULL UNIQUE, 
    M_PW VARCHAR2(100) NOT NULL, 
    M_PHONE VARCHAR2(20) NOT NULL UNIQUE , 
    M_NAME VARCHAR2(50) NOT NULL, 
    M_BIRTH VARCHAR2(20) NOT NULL, 
    M_NICK VARCHAR2(100) NOT NULL UNIQUE , 
    M_EMAIL VARCHAR2(100) NOT NULL UNIQUE , 
    M_REGDATE DATE NOT NULL, 
    M_AGREEMENT NUMBER NOT NULL
);

CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'aaaa' , '1111' , '010-1111-2222', '홍길동',  '1992-07-03', '길동1','hong1@naver.com' , SYSDATE , 1 , 2);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'bbbb' , '2222' , '010-1111-2223', '김길동',  '1992-07-04', '길동2','hong2@naver.com' , SYSDATE , 2 , 3);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'cccc' , '3333' , '010-1111-2224', '이길동',  '1992-07-05', '길동3','hong3@naver.com' , SYSDATE , 3 , 4);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'dddd' , '4444' , '010-1111-2225', '박길동',  '1992-07-06', '길동4','hong4@naver.com' , SYSDATE , 4 , 5);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'eeee' , '5555' , '010-1111-2226', '최길동',  '1992-07-07', '길동5','hong5@naver.com' , SYSDATE , 5 , 6);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'ffff' , '6666' , '010-1111-2227', '정길동',  '1992-07-08', '길동6','hong6@naver.com' , SYSDATE , 6 , 7);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'gggg' , '7777' , '010-1111-2228', '한길동',  '1992-07-09', '길동7','hong7@naver.com' , SYSDATE , 7 , 8);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'hhhh' , '8888' , '010-1111-2229', '곽길동',  '1992-07-10', '길동8','hong8@naver.com' , SYSDATE , 8 , 9);
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL , 'iiii' , '9999' , '010-1111-2210', '강길동',  '1992-07-11', '길동9','hong9@naver.com' , SYSDATE , 9 , 10);
SELECT * FROM MEMBER
-- CLUB Table Create SQL
CREATE TABLE CLUB
(
    C_NO           NUMBER           PRIMARY KEY, 
    M_NO           NUMBER            NULL, 
    C_TITLE        VARCHAR2(100)     NOT NULL, 
    C_DESC         VARCHAR2(300)     NOT NULL, 
    C_CONTENT      VARCHAR2(4000)    NULL, 
    C_POSTDATE     DATE             NOT NULL,
    C_STARTDATE    DATE    			 NOT NULL, 
    C_ENDDATE      DATE              NOT NULL, 
    C_MIN          NUMBER            NOT NULL, 
    C_MAX          NUMBER            NOT NULL, 
    C_MAINIMG	   VARCHAR2(1000)	 NOT NULL,
    C_IMG1		   VARCHAR2(1000)    NULL, 
    C_IMG2		   VARCHAR2(1000)    NULL, 
    C_IMG3		   VARCHAR2(1000)    NULL, 
    C_SUBCONTENT1  VARCHAR2(1000)	 NULL,
    C_SUBCONTENT2  VARCHAR2(1000)	 NULL,
    C_SUBCONTENT3  VARCHAR2(1000)	 NULL,
    C_DELETE       NUMBER            NOT NULL,
    C_PART         NUMBER            NOT NULL,
    CONSTRAINT FK_MEMBER_CLUB FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE SET NULL
);

CREATE SEQUENCE CLUB_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- PLACECATEGORY Table Create SQL
CREATE TABLE PLACECATEGORY
(
    PC_NO      NUMBER           PRIMARY KEY, 
    PC_NAME    VARCHAR2(100)    NULL
);

CREATE SEQUENCE PLACECATEGORY_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- SELLER Table Create SQL
CREATE TABLE SELLER
(
    S_NO           NUMBER           PRIMARY KEY, 
    S_ID           VARCHAR2(100)    NOT NULL UNIQUE, 
    S_PW           VARCHAR2(100)    NOT NULL, 
    S_PHONE        VARCHAR2(20)     NOT NULL UNIQUE, 
    S_NAME         VARCHAR2(50)     NOT NULL, 
    S_BIRTH        VARCHAR2(20)     NOT NULL, 
    S_EMAIL        VARCHAR2(100)    NOT NULL UNIQUE , 
    S_REGDATE      DATE             NOT NULL, 
    S_AGREEMENT    NUMBER           NOT NULL, 
    S_COMPANYNO    VARCHAR2(50)     NOT NULL
);
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자1', '1111', '010-1111-1111','김철수','1992-01-01','seller1@naver.com',SYSDATE,1,1,'111-00-11111');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자2', '1111', '010-1111-1112','김철수','1992-01-01','seller2@naver.com',SYSDATE,1,1,'111-00-11112');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자3', '1111', '010-1111-1113','김철수','1992-01-01','seller3@naver.com',SYSDATE,1,1,'111-00-11113');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자4', '1111', '010-1111-1114','김철수','1992-01-01','seller4@naver.com',SYSDATE,1,1,'111-00-11114');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자5', '1111', '010-1111-1115','김철수','1992-01-01','seller5@naver.com',SYSDATE,1,1,'111-00-11115');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자6', '1111', '010-1111-1116','김철수','1992-01-01','seller6@naver.com',SYSDATE,1,1,'111-00-11116');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자7', '1111', '010-1111-1117','김철수','1992-01-01','seller7@naver.com',SYSDATE,1,1,'111-00-11117');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자8', '1111', '010-1111-1118','김철수','1992-01-01','seller8@naver.com',SYSDATE,1,1,'111-00-11118');
INSERT INTO SELLER VALUES (SELLER_SEQ.NEXTVAL , '판매자9', '1111', '010-1111-1119','김철수','1992-01-01','seller9@naver.com',SYSDATE,1,1,'111-00-11119');

CREATE SEQUENCE SELLER_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- PLACE Table Create SQL
CREATE TABLE PLACE
(
    P_NO            NUMBER            PRIMARY KEY, 
    S_NO            NUMBER            , 
    PC_NO           NUMBER            , 
    P_TITLE         VARCHAR2(100)     NOT NULL, 
    P_NAME          VARCHAR2(50)      NOT NULL, 
    P_DESC          VARCHAR2(300)     NOT NULL, 
    P_CONTENT       VARCHAR2(4000)    NOT NULL, 
    P_INFO          VARCHAR2(1000)    NOT NULL, 
    P_ADDR          VARCHAR2(200)     NOT NULL, 
    P_BNAME         VARCHAR2(20)      NOT NULL, 
    P_ADDRDETAIL    VARCHAR2(100)     NULL, 
    P_IMG           VARCHAR2(1000)    NOT NULL, 
    P_CONFIRM       VARCHAR2(40)      NOT NULL, 
    P_URL           VARCHAR2(100)     NULL, 
    P_REMARK        VARCHAR2(1000)    NOT NULL, 
    P_DELETE        NUMBER            NOT NULL,
    CONSTRAINT FK_S_P FOREIGN KEY (S_NO) REFERENCES SELLER(S_NO) ON DELETE SET NULL,
    CONSTRAINT FK_PC_P FOREIGN KEY (PC_NO) REFERENCES PLACECATEGORY(PC_NO) ON DELETE SET NULL
);
INSERT INTO PLACE VALUES(PLACE_SEQ.NEXTVAL,'김밥천국' ,'외식업' , '서울시 마포구', '신촌동 1000-1', '1');
INSERT INTO PLACE VALUES(PLACE_SEQ.NEXTVAL,'김밥나라' ,'외식업' , '서울시 마포구', '신촌동 1000-1', '1');
INSERT INTO PLACE VALUES(PLACE_SEQ.NEXTVAL,'김밥나라1' ,'외식업' , '서울시 마포구', '신촌동 1000-1','1');
SELECT * FROM PLACE
UPDATE PLACE SET P_CONFIRM = '1' WHERE S_NO = 2;

CREATE SEQUENCE PLACE_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- PLACEOPTION Table Create SQL
CREATE TABLE PLACEOPTION
(
    PO_NO          NUMBER           PRIMARY KEY, 
    P_NO           NUMBER           , 
    PO_NAME        VARCHAR2(100)   NOT NULL, 
    PO_MIN         NUMBER           NOT NULL, 
    PO_MAX         NUMBER           NOT NULL, 
    PO_DAYPRICE    NUMBER           NOT NULL, 
    PO_HOLIDAY     NUMBER           NOT NULL, 
    PO_IMG         VARCHAR2(100)    NOT NULL, 
    PO_FXILITY     VARCHAR2(200)    NULL,
    CONSTRAINT FK_P_PO FOREIGN KEY (P_NO) REFERENCES PLACE(P_NO) ON DELETE CASCADE
);
CREATE SEQUENCE PLACEOPTION_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- CLUBLIST Table Create SQL
CREATE TABLE CLUBLIST
(
    CL_NO      NUMBER    PRIMARY KEY, 
    C_NO       NUMBER    , 
    M_NO       NUMBER    , 
    CL_CARD    NUMBER    NULL,
    CONSTRAINT FK_C_CL FOREIGN KEY (C_NO) REFERENCES CLUB(C_NO) ON DELETE SET NULL,
    CONSTRAINT FK_M_CL FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE CASCADE
);

CREATE SEQUENCE CLUBLIST_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- REPLY Table Create SQL
CREATE TABLE REPLY
(
    R_NO          NUMBER            PRIMARY KEY, 
    C_NO          NUMBER            , 
    M_NO          NUMBER            , 
    R_CONTENT     VARCHAR2(4000)    NOT NULL, 
    R_DELETE      NUMBER            NOT NULL, 
    R_POSTDATE    DATE              NOT NULL,
    CONSTRAINT FK_C_R FOREIGN KEY (C_NO) REFERENCES CLUB(C_NO) ON DELETE SET NULL,
    CONSTRAINT FK_M_R FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE SET NULL
);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요1' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요2' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요3' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요4' , SYSDATE);
INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, '좋아요5' , SYSDATE);

CREATE SEQUENCE REPLY_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;


-- RESERVATION Table Create SQL
CREATE TABLE RESERVATION
(
    RES_NO        NUMBER          PRIMARY KEY, 
    M_NO          NUMBER          , 
    PO_NO         NUMBER          , 
    RES_DATE      DATE            NOT NULL, 
    RES_PEOPLE    NUMBER          NOT NULL, 
    RES_STATE     VARCHAR2(20)    NULL,
    RES_EMAIL	  VARCHAR2(50)	  NULL,
    RES_PRICE	  NUMBER		  NULL,
    RES_APPLYNUM  NUMBER		  NULL,
    RES_PURPOSE   VARCHAR2(100)	  NULL,
    RES_REQUIREMENT VARCHAR2(500) NULL,
    CONSTRAINT FK_M_RES FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE SET NULL,
    CONSTRAINT FK_PO_RES FOREIGN KEY (PO_NO) REFERENCES PLACEOPTION(PO_NO) ON DELETE SET NULL
);

CREATE SEQUENCE RESERVATION_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- REVIEW Table Create SQL
CREATE TABLE REVIEW
(
    RV_NO         NUMBER            PRIMARY KEY, 
    M_NO          NUMBER            , 
    P_NO          NUMBER            , 
    RV_DELETE     NUMBER           NOT NULL, 
    RV_STAR       NUMBER           NOT NULL,
    RV_IMG        VARCHAR2(500)    NULL,
    RV_POSTDATE	 DATE NOT NULL,
    RV_MODIFYDATE DATE NOT NULL,
    RV_CONTENT    VARCHAR2(2000)   NOT NULL,
    CONSTRAINT FK_M_RV FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE SET NULL,
    CONSTRAINT FK_P_RV FOREIGN KEY (P_NO) REFERENCES PLACE(P_NO) ON DELETE SET NULL
);

INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요');
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요1');
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요2');
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요3');
INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL, '또 올게요4');

CREATE SEQUENCE REVIEW_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- NOTICE Table Create SQL
CREATE TABLE NOTICE
(
    N_NO          NUMBER            PRIMARY KEY, 
    N_TITLE       VARCHAR2(100)     NOT NULL, 
    N_CONTENT     VARCHAR2(4000)    NOT NULL, 
    N_POSTDATE    DATE              NOT NULL
);
select * from notice;
DELETE FROM NOTICE WHERE N_NO = 32;
CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '두번째 공지' , '나다라마바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '세번째 공지' , '다라마바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '네번째 공지' , '라마바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '다섯번째 공지' , '마바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '여섯번째 공지' , '바사' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '일곱번째 공지' , '사가나다라' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '여덟번째 공지' , '사가나다라마' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '개인정보 처리방침 변경 안내' , '회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 
단, 개인정보보호법 제18조(개인정보의 이용•제공제한) 및 제 27조(영업양도 등에 따른 개인정보의 이전 제한)에 근거하여 
다음의 경우에는 개인정보를 처리할 수 있습니다.

- 이용자들이 사전에 동의한 경우
- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
- 서비스의 제공에 관한 계약의 이행을 위하여 필요한 개인정보로서 경제적/기술적인 사유로 통상의 동의를 받는 것이 현저히 곤란한 경우
- 영업양도 등에 따라 회사의 영업이 양도된 경우
(단, 개인정보보호법 제 27조에 따라 회사는 회원들에게 사전 공지를 해야하며, 동의하지 않는 회원에 대해 그 방법과 절차를 필히 안내함)' , SYSDATE);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL , '[환불규정] 환불규정 안내','학기활동(모임) 환불정책
1) 학기 시작일 
(1학기 : 1월 1일 / 2학기 : 4월 1일 / 3학기 : 7월 1일 / 4학기 : 10월 1일)
이후 15일 이내 환불 신청 시 납부한 회비의 1/3을 제한 2/3 해당액을 반환합니다.

2) 학기 시작일 
(1학기 : 1월 1일 / 2학기 : 4월 1일 / 3학기 : 7월 1일 / 4학기 : 10월 1일) 
이후 한달 이내 환불 신청 시 납부한 회비의 1/2를 제한 1/2 해당액을 반환합니다.

3) 학기 시작일 (1학기 : 1월 1일 / 2학기 : 4월 1일 / 3학기 : 7월 1일 / 4학기 : 10월 1일)
이후 한달 이후부터는 환불이 불가능합니다.

4) 결제 후 다른 이에게 양도 불가능합니다.

예시 (20.3학기기준)

▷ 20년 7월 1일 ~ 7월 15일 환불신청 : 납부한 회비의 1/3을 제한 2/3 해당액을 반환합니다.

▷ 20년 7월 16일 ~ 7월 30일 환불신청 : 납부한 회비의 1/2을 제한 1/2 해당액을 반환합니다.

▷ 20년 7월 31일부터 환불신청 : 환불불가합니다.' , SYSDATE);

SELECT * FROM NOTICE;

-- FAQ Table Create SQL
-- FAQTable Create SQL
CREATE TABLE FAQ
(
    F_NO          NUMBER            PRIMARY KEY, 
    F_TITLE       VARCHAR2(100)     NOT NULL, 
    F_CONTENT     VARCHAR2(4000)    NOT NULL, 
    F_REGDATE     DATE              NOT NULL, 
    F_CATEGORY    NUMBER            NOT NULL
);

INSERT INTO FAQ VALUES (NOTICE_SEQ.NEXTVAL , '[환불규정] 환불규정 안내','학기활동(모임) 환불정책
1) 학기 시작일 
(1학기 : 1월 1일 / 2학기 : 4월 1일 / 3학기 : 7월 1일 / 4학기 : 10월 1일)
이후 15일 이내 환불 신청 시 납부한 회비의 1/3을 제한 2/3 해당액을 반환합니다.

2) 학기 시작일 
(1학기 : 1월 1일 / 2학기 : 4월 1일 / 3학기 : 7월 1일 / 4학기 : 10월 1일) 
이후 한달 이내 환불 신청 시 납부한 회비의 1/2를 제한 1/2 해당액을 반환합니다.

3) 학기 시작일 (1학기 : 1월 1일 / 2학기 : 4월 1일 / 3학기 : 7월 1일 / 4학기 : 10월 1일)
이후 한달 이후부터는 환불이 불가능합니다.

4) 결제 후 다른 이에게 양도 불가능합니다.

예시 (20.3학기기준)

▷ 20년 7월 1일 ~ 7월 15일 환불신청 : 납부한 회비의 1/3을 제한 2/3 해당액을 반환합니다.

▷ 20년 7월 16일 ~ 7월 30일 환불신청 : 납부한 회비의 1/2을 제한 1/2 해당액을 반환합니다.

▷ 20년 7월 31일부터 환불신청 : 환불불가합니다.' , SYSDATE, 2);
INSERT INTO FAQ VALUES (NOTICE_SEQ.NEXTVAL , 
'탈퇴 방법' ,
'안녕하세요.

건전한 직장인 커뮤니티를 꿈꾸는 baraON입니다.
탈퇴는 아래와 같이 직접 진행해주시면 됩니다.

앱 들어가기 => 더보기 => 내 정보 => 탈퇴하기
사람 좋은 사람들의 커뮤니티가 될 수 있도록 노력하겠습니다.

baraON 커뮤니티 많이 사랑해주세요! 

감사합니다.', SYSDATE, 3);
INSERT INTO FAQ VALUES (NOTICE_SEQ.NEXTVAL , 
'정기 VS 번개' ,
'안녕하세요.
baraON이 가장 중요하게 생각하는 것은
사람과 사람의 소통, 관계입니다. 참여하시는 분들께서는
긍정적인 관계를 통해 좋은 네트워크를 해 나가셨으면 합니다.

번개활동은 1회 모임이라고 보시면 됩니다. 강의 형태의 모임이 될수도 있고, 혹은 액티비티를 함께 즐기는 활동이 될 수도 있습니다.

정기활동은 3개월 단위로 진행하는 활동입니다.
정기 활동은 정해진 날짜에 같은 멤버들과 함께 활동을 하는 모임입니다.
관계적인 측면을 중요 시하며 운영을 하고 있고,
활동별로 번개도 자체적으로 진행합니다.', SYSDATE, 4);
INSERT INTO FAQ VALUES (NOTICE_SEQ.NEXTVAL , 
'정기활동 신청은 언제받나요?' ,
'안녕하세요.
건전한 직장인 커뮤니티를 꿈꾸는 baraON입니다.

학기모임 신청 및 활동 기간은 아래와 같습니다.

1학기 : 01월 01일 ~ 03월 31일 (신청기간 : 12월 01일 ~ 다음해 1월 12일)
2학기 : 04월 01일 ~ 06월 30일 (신청기간 : 03월 01일 ~ 04월 12일)
3학기 : 07월 01일 ~ 09월 30일 (신청기간 : 06월 01일 ~ 07월 12일)
4학기 : 10월 01일 ~ 12월 31일 (신청기간 : 09월 01일 ~ 10월 12일)

사람 좋은 사람들이 모일 수 있는 커뮤니티가 되도록 하겠습니다.

감사합니다.', SYSDATE, 4);
INSERT INTO FAQ VALUES (NOTICE_SEQ.NEXTVAL , 
'후기 아직 없는 활동이 있는데 어떤가요??' ,
'안녕하세요.
건전한 직장인 커뮤니티를 꿈꾸는 baraON 입니다.

최근에 홈페이지를 개편하면서, 그리고 앱을 개발하면서 이전의 데이터를 가지고 오지 못했습니다.

앞으로 진행되는 모임들에 대해서는
많은 분들에게 도움이 될 수 있도록 후기를 잘 쌓아나갈 예정이오니,
향후 참고 부탁드립니다.

건전한 직장인 커뮤니티가 될 수 있도록 최선의 노력을 다하겠습니다.

감사합니다.', SYSDATE, 4);
INSERT INTO FAQ VALUES (NOTICE_SEQ.NEXTVAL , 
'리더(모임장) 신청 어떻게 하나요?' ,
'안녕하세요
건전한 직장인 커뮤니티를 꿈꾸는 baraON 입니다.
 
#리더 되는 법 1

리더 신청은 홈페이지에서 진행해주시면 됩니다.
활동에 대한 컨셉과 간단한 설명을 적어주시면, 
저희 운영진이 연락이 갈 예정입니다. 
면담 진행 후 활동 진행 여부 확정될 예정입니다.

 
#리더 되는 법2

학기활동 진행 후 저희 운영진에게 모임 진행 이야기해주시면 됩니다.


#참고

매달 진행되는 리더의 모든 것을 신청해주셔서
활동에 대한 다양한 이야기를 들으시고, 결정해주셔도 됩니다.

앞으로 더 좋은 리더가 많이 모일 수 있도록
활동에 대한 다양한 혜택을 제공할 예정이오니,
많은 신청 부탁드립니다.', SYSDATE, 4);


SELECT * FROM FAQ;
SELECT F_TITLE,F_REGDATE FROM FAQ WHERE F_CATEGORY BETWEEN 1 AND 4;

SELECT * FROM FAQ WHERE F_CATEGORY IN (1,2,3,4);

CREATE SEQUENCE FAQ_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- WISHLIST Table Create SQL
CREATE TABLE WISHLIST
(
    W_NO    NUMBER    PRIMARY KEY, 
    C_NO    NUMBER    , 
    M_NO    NUMBER    ,
    CONSTRAINT FK_C_W FOREIGN KEY (C_NO) REFERENCES CLUB(C_NO) ON DELETE SET NULL,
    CONSTRAINT FK_M_W FOREIGN KEY (M_NO) REFERENCES MEMBER(M_NO) ON DELETE CASCADE
);

CREATE SEQUENCE WISHLIST_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE TABLE EVENT
(
    E_NO    		NUMBER    			PRIMARY KEY, 
    E_TITLE			VARCHAR2(300),
    E_CONTENT    	VARCHAR2(4000),    
    E_FILENAME   	VARCHAR2(300),    
	E_POSTDATE		DATE 		
);

CREATE SEQUENCE EVENT_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
INSERT INTO EVENT VALUES(EVENT_SEQ.NEXTVAL,
'치킨&맥주 파티 모집중!',
'baraON 멤버라면 누구나 가능!
멤버님들의 성원에 힘입어 참여대상을 확대했습니다!',
'event1', SYSDATE);
DELETE FROM EVENT WHERE E_NO = 27; 
SELECT * FROM EVENT;
DROP TABLE EVENT;
DROP SEQUENCE EVENT_SEQ;

