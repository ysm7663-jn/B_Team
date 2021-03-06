DROP TABLE MEMBER;
DROP TABLE PLACECATEGORY;
DROP TABLE SELLER;
DROP TABLE PLACE;
DROP TABLE PLACEOPTION;
DROP TABLE RESERVATION;
DROP TABLE REVIEW;


DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE PLACECATEGORY_SEQ;
DROP SEQUENCE SELLER_SEQ;
DROP SEQUENCE PLACE_SEQ;
DROP SEQUENCE PLACEOPTION_SEQ;
DROP SEQUENCE RESERVATION_SEQ;
DROP SEQUENCE REVIEW_SEQ;

-- MEMBER Table Create SQL
CREATE TABLE MEMBER
(
    M_NO           NUMBER              PRIMARY KEY,
    M_ID           VARCHAR2(100)    NOT NULL UNIQUE, 
    M_PW           VARCHAR2(100)    NOT NULL, 
    M_PHONE        VARCHAR2(20)     NOT NULL UNIQUE, 
    M_NAME         VARCHAR2(50)     NOT NULL, 
    M_BIRTH        VARCHAR2(20)     NOT NULL, 
    M_NICK         VARCHAR2(100)    NOT NULL UNIQUE, 
    M_EMAIL        VARCHAR2(100)    NOT NULL UNIQUE, 
    M_REGDATE      DATE             NOT NULL, 
    M_AUTH         NUMBER              NOT NULL, 
    M_AGREEMENT    NUMBER              NOT NULL
);


CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;


-- PLACECATEGORY Table Create SQL
CREATE TABLE PLACECATEGORY
(
    PC_NO      NUMBER              PRIMARY KEY, 
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
    S_NO           NUMBER             PRIMARY KEY, 
    S_ID           VARCHAR2(100)    NOT NULL UNIQUE, 
    S_PW           VARCHAR2(100)    NOT NULL ,
    S_PHONE        VARCHAR2(20)     NOT NULL UNIQUE,
    S_NAME         VARCHAR2(50)     NOT NULL,
    S_BIRTH        VARCHAR2(20)     NOT NULL,
    S_EMAIL        VARCHAR2(100)    NOT NULL UNIQUE,
    S_REGDATE      DATE             NOT NULL, 
    S_AUTH         NUMBER              NOT NULL, 
    S_AGREEMENT    NUMBER              NOT NULL, 
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
    P_NO         NUMBER               PRIMARY KEY, 
    S_NO         NUMBER               NOT NULL REFERENCES SELLER (S_NO), 
    PC_NO        NUMBER               NOT NULL REFERENCES PLACECATEGORY (PC_NO), 
    P_TITLE      VARCHAR2(200)     NOT NULL, 
    P_DESC       VARCHAR2(200)     NOT NULL, 
    P_CONTENT    VARCHAR2(4000)    NOT NULL, 
    P_INFO       VARCHAR2(1000)    NOT NULL, 
    P_NAME       VARCHAR2(200)     NOT NULL, 
    P_ADDR       VARCHAR2(200)     NOT NULL, 
    P_STAR       NUMBER               NULL, 
    P_IMG        VARCHAR2(50)      NULL, 
    P_CONFIRM    NUMBER               , 
    P_URL        VARCHAR2(100)     NULL, 
    P_REMARK     VARCHAR2(2000)    NULL, 
    P_DELETE     NUMBER
);


CREATE SEQUENCE PLACE_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;



-- PLACEOPTION Table Create SQL
CREATE TABLE PLACEOPTION
(
    PO_NO          NUMBER             PRIMARY KEY, 
    P_NO           NUMBER             NOT NULL REFERENCES PLACE (P_NO), 
    PO_MIN         NUMBER             NOT NULL, 
    PO_MAX         NUMBER             NOT NULL, 
    PO_DAYPRICE    NUMBER             NOT NULL, 
    PO_HOLIDAY     NUMBER             NULL, 
    PO_ADDPRICE    NUMBER             NULL, 
    PO_IMG1        VARCHAR2(50)    NULL, 
    PO_IMG2        VARCHAR2(50)    NULL, 
    PO_IMG3        VARCHAR2(50)    NULL, 
    PO_FXILITY     VARCHAR2(100)   NULL
);

CREATE SEQUENCE PLACEOPTION_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;


-- RESERVATION Table Create SQL
CREATE TABLE RESERVATION
(
    RES_NO        NUMBER             PRIMARY KEY, 
    M_NO          NUMBER             NOT NULL REFERENCES MEMBER (M_NO), 
    PO_NO         NUMBER             NOT NULL REFERENCES PLACEOPTION (PO_NO), 
    RES_DATE      DATE            NOT NULL, 
    RES_PEOPLE    NUMBER             NOT NULL, 
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
    RV_NO        NUMBER               PRIMARY KEY, 
    M_NO         NUMBER               NOT NULL REFERENCES MEMBER (M_NO), 
    P_NO         NUMBER               NOT NULL REFERENCES PLACE (P_NO), 
    RV_DELETE    NUMBER               NULL, 
    RV_STAR      NUMBER               NULL, 
    RV_IMG       VARCHAR2(4000)    NULL
);


CREATE SEQUENCE REVIEW_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

SELECT P.P_NO, PC.PC_NAME, COUNT(R.) AS RVCOUNT, MIN(PO.PO_DAYPRICE) AS MINPRICE, MAX(PO.PO_MAX) AS MAXPEOPLE
  FROM PLACE P LEFT JOIN REVIEW R ON P.P_NO = R.P_NO 
  			   LEFT JOIN PLACECATEGORY PC ON P.PC_NO = PC.PC_NO
			   LEFT JOIN PLACEOPTION PO ON P.P_NO = PO.P_NO
WHERE R.RV_DELETE = 0
GROUP BY P.P_NO, PC.PC_NAME
ORDER BY P.P_NO

SELECT A.*, PC.PC_NAME, MIN(PO.PO_DAYPRICE) AS MINPRICE, MAX(PO.PO_MAX) AS MAXPEOPLE, P2.P_TITLE, P2.P_IMG, P2.P_ADDR
FROM (SELECT P.P_NO, P.PC_NO, COUNT(RV.P_NO) AS RVCOUNT
FROM PLACE P LEFT JOIN REVIEW RV ON P.P_NO = RV.P_NO
WHERE P.P_CONFIRM = 1 
AND P.P_DELETE = 0
AND RV.RV_DELETE = 0
GROUP BY P.P_NO, P.PC_NO) A LEFT JOIN PLACECATEGORY PC ON A.PC_NO = PC.PC_NO
LEFT JOIN PLACEOPTION PO ON A.P_NO = PO.P_NO
LEFT JOIN PLACE P2 ON A.P_NO = P2.P_NO
GROUP BY A.P_NO, A.PC_NO, A.RVCOUNT, PC.PC_NAME, P2.P_TITLE, P2.P_IMG, P2.P_ADDR
ORDER BY A.P_NO

SELECT A.*, COUNT(*) AS RVCOUNT
FROM (SELECT P.P_NO, PC.PC_NAME, MIN(PO.PO_DAYPRICE) AS MINPRICE, MAX(PO.PO_MAX) AS MAXPEOPLE
FROM PLACE P LEFT JOIN PLACECATEGORY PC ON P.PC_NO = PC.PC_NO
LEFT JOIN PLACEOPTION PO ON P.P_NO = PO.P_NO
GROUP BY P.P_NO, PC.PC_NAME) A LEFT JOIN REVIEW R ON A.P_NO = R.P_NO
GROUP BY A.P_NO, A.PC_NAME, A.MINPRICE, A.MAXPEOPLE, R.P_NO
ORDER BY A.P_NO


	SELECT B.*
		FROM (SELECT ROWNUM RN, A.*
		FROM (SELECT RV.*, M.M_NICK, M.M_ID
			 FROM REVIEW RV LEFT JOIN MEMBER M ON RV.M_NO = M.M_NO AND RV.RV_DELETE = 0
			 WHERE P_NO = 1
			 ORDER BY RV.RV_POSTDATE DESC ) A ) B
		 WHERE RN BETWEEN 1 AND 3
SELECT B.*
		FROM (SELECT ROWNUM RN, A.*
		FROM (SELECT RV.*, M.M_NICK, M.M_ID
			 FROM REVIEW RV LEFT JOIN MEMBER M ON RV.M_NO = M.M_NO
			 WHERE P_NO = 1
			 AND RV.RV_DELETE=0
			 ORDER BY RV.RV_POSTDATE DESC ) A ) B
DELETE FROM REVIEW WHERE RV_NO = 21
DELETE FROM REVIEW WHERE 
SELECT * FROM REVIEW;
SELECT * FROM PLACEOPTION;