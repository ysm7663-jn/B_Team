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

select * from member;

CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- CLUB Table Create SQL
CREATE TABLE CLUB
(
    C_NO           NUMBER           PRIMARY KEY, 
    M_NO           NUMBER            NOT NULL REFERENCES MEMBER (M_NO), 
    C_TITLE        VARCHAR2(100)     NOT NULL, 
    C_CONTENT      VARCHAR2(4000)    NULL, 
    C_POSTDATE     DATE              NOT NULL, 
    C_STARTDATE    DATE    			 NOT NULL, 
    C_ENDDATE      DATE              NOT NULL, 
    C_MIN          NUMBER            NOT NULL, 
    C_MAX          NUMBER            NOT NULL, 
    C_COUNT        NUMBER            NOT NULL,
    C_MAINIMG	   VARCHAR2(1000)	 NOT NULL,
    C_IMG1		   VARCHAR2(1000)    NULL, 
    C_IMG2		   VARCHAR2(1000)    NULL, 
    C_IMG3		   VARCHAR2(1000)    NULL, 
    C_SUBCONTENT1  VARCHAR2(1000)	 NULL,
    C_SUBCONTENT2  VARCHAR2(1000)	 NULL,
    C_SUBCONTENT3  VARCHAR2(1000)	 NULL,
    C_DELETE       NUMBER            NOT NULL,
    C_PART         NUMBER            NOT NULL
);

SELECT * FROM CLUB;

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

CREATE SEQUENCE SELLER_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- PLACE Table Create SQL
CREATE TABLE PLACE
(
    P_NO            NUMBER            PRIMARY KEY, 
    S_NO            NUMBER            NOT NULL REFERENCES SELLER (S_NO), 
    PC_NO           NUMBER            NOT NULL REFERENCES PLACECATEGORY (PC_NO), 
    P_TITLE         VARCHAR2(100)     NOT NULL, 
    P_NAME          VARCHAR2(50)      NOT NULL, 
    P_DESC          VARCHAR2(300)     NOT NULL, 
    P_CONTENT       VARCHAR2(4000)    NOT NULL, 
    P_INFO          VARCHAR2(1000)    NOT NULL, 
    P_ADDR          VARCHAR2(200)     NOT NULL, 
    P_BNAME         VARCHAR2(20)      NOT NULL, 
    P_ADDRDETAIL    VARCHAR2(100)     NULL, 
    P_IMG           VARCHAR2(1000)    NOT NULL, 
    P_CONFIRM       NUMBER          NOT NULL, 
    P_URL           VARCHAR2(100)     NULL, 
    P_REMARK        VARCHAR2(1000)    NOT NULL, 
    P_DELETE        NUMBER            NOT NULL
);

CREATE SEQUENCE PLACE_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- PLACEOPTION Table Create SQL
CREATE TABLE PLACEOPTION
(
    PO_NO          NUMBER           PRIMARY KEY, 
    P_NO           NUMBER           NOT NULL REFERENCES PLACE (P_NO), 
    PO_NAME        VARCHAR2(100)   NOT NULL, 
    PO_MIN         NUMBER           NOT NULL, 
    PO_MAX         NUMBER           NOT NULL, 
    PO_DAYPRICE    NUMBER           NOT NULL, 
    PO_HOLIDAY     NUMBER           NOT NULL, 
    PO_IMG         VARCHAR2(100)    NOT NULL, 
    PO_FXILITY     VARCHAR2(200)    NULL   
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
    C_NO       NUMBER    NOT NULL REFERENCES CLUB (C_NO), 
    M_NO       NUMBER    NOT NULL REFERENCES MEMBER (M_NO), 
    CL_CARD    NUMBER    NULL
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
    C_NO          NUMBER            NOT NULL REFERENCES CLUB (C_NO), 
    M_NO          NUMBER            NOT NULL REFERENCES MEMBER (M_NO), 
    R_CONTENT     VARCHAR2(4000)    NOT NULL, 
    R_DELETE      NUMBER            NOT NULL, 
    R_POSTDATE    DATE              NOT NULL
);

CREATE SEQUENCE REPLY_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- RESERVATION Table Create SQL
CREATE TABLE RESERVATION
(
    RES_NO        NUMBER          PRIMARY KEY, 
    M_NO          NUMBER          NOT NULL  REFERENCES MEMBER (M_NO), 
    PO_NO         NUMBER          NOT NULL  REFERENCES PLACEOPTION (PO_NO), 
    RES_DATE      DATE            NOT NULL, 
    RES_PEOPLE    NUMBER          NOT NULL, 
    RES_STATE     VARCHAR2(20)    NULL
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
    M_NO          NUMBER            NOT NULL REFERENCES MEMBER (M_NO), 
    P_NO          NUMBER            NOT NULL REFERENCES PLACE (P_NO), 
    RV_DELETE     NUMBER           NOT NULL, 
    RV_STAR       NUMBER           NOT NULL,
    RV_IMG        VARCHAR2(500)    NULL,
    RV_POSTDATE	 DATE NOT NULL,
    RV_MODIFYDATE DATE NOT NULL,
    RV_CONTENT    VARCHAR2(2000)   NOT NULL
);

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

CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- FAQTable Create SQL
CREATE TABLE FAQ
(
    F_NO          NUMBER            PRIMARY KEY, 
    F_TITLE       VARCHAR2(100)     NOT NULL, 
    F_CONTENT     VARCHAR2(4000)    NOT NULL, 
    F_REGDATE     DATE              NOT NULL, 
    F_CATEGORY    NUMBER            NOT NULL
);

CREATE SEQUENCE FAQ_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- WISHLIST Table Create SQL
CREATE TABLE WISHLIST
(
    W_NO    NUMBER    PRIMARY KEY, 
    C_NO    NUMBER    NOT NULL REFERENCES CLUB (C_NO), 
    M_NO    NUMBER    NOT NULL REFERENCES MEMBER (M_NO)
);

CREATE SEQUENCE WISHLIST_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;