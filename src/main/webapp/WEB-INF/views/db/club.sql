DROP SEQUENCE CLUB_SEQ;
CREATE SEQUENCE CLUB_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

DROP TABLE CLUB;
CREATE TABLE CLUB
(
    C_NO           NUMBER               PRIMARY KEY, 
    CT_NO          NUMBER               NOT NULL REFERENCES CATEGORY (CT_NO), 
    M_NO           NUMBER               NOT NULL REFERENCES MEMBER (M_NO), 
    C_TITLE        VARCHAR2(100)     NOT NULL, 
    C_CONTENT      VARCHAR2(4000)    NULL, 
    C_POSTDATE     DATE              NOT NULL, 
    C_ENJOYDATE    VARCHAR2(1000)    NULL, 
    C_ENDDATE      DATE              NOT NULL, 
    C_MIN          NUMBER            NOT NULL, 
    C_MAX          NUMBER            NOT NULL, 
    C_COUNT        NUMBER            NOT NULL, 
    C_THUMB        VARCHAR2(50)      NULL, 
    C_DELETE       NUMBER            NOT NULL, 
    C_PART         NUMBER            NOT NULL
);

SELECT * FROM CLUB;