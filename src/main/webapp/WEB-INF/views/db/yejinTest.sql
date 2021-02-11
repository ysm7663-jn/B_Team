DELETE FROM CLUB;
SELECT * FROM MEMBER;
DELETE FROM WISHLIST;
SELECT * FROM CLUB;
SELECT C.C_NO, C.C_TITLE, C.C_CONTENT, C.C_MAINIMG, W.M_NO
			FROM CLUB C JOIN WISHLIST W
		  ON C.C_NO = W.C_NO
		 WHERE W.M_NO = 01
		 
SELECT COUNT(*)
			FROM RESERVATION R JOIN PLACEOPTION PO
		  ON R.PO_NO = (SELECT PO.PO_NO
		  					FROM PLACEOPTION PO JOIN PLACE P
		  				  ON PO.P_NO = (SELECT P.P_NO
		  				  					FROM PLACE P JOIN SELLER S
		  				  				  ON P.S_NO = S.S_NO
		  				  				 WHERE S.S_NO = 1))
		 WHERE TO_CHAR(R.RES_DATE, 'YYYY-MM-DD') >= TO_CHAR(SYSDATE, 'YYYY-MM-DD'); 	
		 
SELECT C.C_MAINIMG, C.C_TITLE, C.C_CONTENT, C.C_STARTDATE, CL.CL_CARD, M.M_NICK
	FROM CLUBLIST CL JOIN CLUB C ON CL.C_NO = C.C_NO
		JOIN MEMBER M ON M.M_NO = C.M_NO
	WHERE CL.M_NO = 1
	 AND C.C_PART = 0
	 AND TO_CHAR(C.C_ENDDATE, 'YYYY-MM-DD') >= TO_CHAR(SYSDATE, 'YYYY-MM-DD')
	 AND C.C_DELETE = 0
		 
-- 예진 사용
INSERT INTO MEMBER (M_NO, M_ID, M_PW, M_PHONE, M_NAME, M_BIRTH, M_NICK, M_EMAIL, M_REGDATE, M_AGREEMENT) VALUES (01, 'member01', '1111', 'M_PHONE 01', 'M_NAME 01', 'M_BIRTH 01', 'M_NICK 01', 'dpwls6787@naver.com', sysdate, 1);
INSERT INTO MEMBER (M_NO, M_ID, M_PW, M_PHONE, M_NAME, M_BIRTH, M_NICK, M_EMAIL, M_REGDATE, M_AGREEMENT) VALUES (02, 'member02', '1111', 'M_PHONE 02', 'M_NAME 02', 'M_BIRTH 02', 'M_NICK 02', 'dpwls6787@nate.com', sysdate, 1);
INSERT INTO MEMBER (M_NO, M_ID, M_PW, M_PHONE, M_NAME, M_BIRTH, M_NICK, M_EMAIL, M_REGDATE, M_AGREEMENT) VALUES (03, 'member03', '1111', 'M_PHONE 03', 'M_NAME 03', 'M_BIRTH 03', 'M_NICK 03', 'M_EMAIL03@naver.com', sysdate, 1);
INSERT INTO MEMBER (M_NO, M_ID, M_PW, M_PHONE, M_NAME, M_BIRTH, M_NICK, M_EMAIL, M_REGDATE, M_AGREEMENT) VALUES (04, 'member04', '1111', 'M_PHONE 04', 'M_NAME 04', 'M_BIRTH 04', 'M_NICK 04', 'M_EMAIL04@naver.com', sysdate, 1);
INSERT INTO MEMBER (M_NO, M_ID, M_PW, M_PHONE, M_NAME, M_BIRTH, M_NICK, M_EMAIL, M_REGDATE, M_AGREEMENT) VALUES (05, 'member05', '1111', 'M_PHONE 05', 'M_NAME 05', 'M_BIRTH 05', 'M_NICK 05', 'M_EMAIL05@naver.com', sysdate, 1);
INSERT INTO MEMBER (M_NO, M_ID, M_PW, M_PHONE, M_NAME, M_BIRTH, M_NICK, M_EMAIL, M_REGDATE, M_AGREEMENT) VALUES (06, 'member06', '1111', 'M_PHONE 06', 'M_NAME 06', 'M_BIRTH 06', 'M_NICK 06', 'M_EMAIL06@naver.com', sysdate, 1);
INSERT INTO MEMBER (M_NO, M_ID, M_PW, M_PHONE, M_NAME, M_BIRTH, M_NICK, M_EMAIL, M_REGDATE, M_AGREEMENT) VALUES (07, 'member07', '1111', 'M_PHONE 07', 'M_NAME 07', 'M_BIRTH 07', 'M_NICK 07', 'M_EMAIL07@naver.com', sysdate, 1);
INSERT INTO MEMBER (M_NO, M_ID, M_PW, M_PHONE, M_NAME, M_BIRTH, M_NICK, M_EMAIL, M_REGDATE, M_AGREEMENT) VALUES (08, 'member08', '1111', 'M_PHONE 08', 'M_NAME 08', 'M_BIRTH 08', 'M_NICK 08', 'M_EMAIL08@naver.com', sysdate, 1);


INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (01, 'seller01', '1111', 'S_PHONE 01', 'S_NAME 01', 'S_BIRTH 01', 'dpwls6787@naver.com', sysdate, 1, 'S_COMPANYNO 01');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (02, 'seller02', '1111', 'S_PHONE 02', 'S_NAME 02', 'S_BIRTH 02', 'dpwls6787@nate.com', sysdate, 1, 'S_COMPANYNO 02');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (03, 'seller03', '1111', 'S_PHONE 03', 'S_NAME 03', 'S_BIRTH 03', 'S_EMAIL03@naver.com', sysdate, 1, 'S_COMPANYNO 03');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (04, 'seller04', '1111', 'S_PHONE 04', 'S_NAME 04', 'S_BIRTH 04', 'S_EMAIL04@naver.com', sysdate, 1, 'S_COMPANYNO 04');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (05, 'seller05', '1111', 'S_PHONE 05', 'S_NAME 05', 'S_BIRTH 05', 'S_EMAIL05@naver.com', sysdate, 1, 'S_COMPANYNO 05');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (06, 'seller06', '1111', 'S_PHONE 06', 'S_NAME 06', 'S_BIRTH 06', 'S_EMAIL06@naver.com', sysdate, 1, 'S_COMPANYNO 06');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (07, 'seller07', '1111', 'S_PHONE 07', 'S_NAME 07', 'S_BIRTH 07', 'S_EMAIL07@naver.com', sysdate, 1, 'S_COMPANYNO 07');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (08, 'seller08', '1111', 'S_PHONE 08', 'S_NAME 08', 'S_BIRTH 08', 'S_EMAIL08@naver.com', sysdate, 1, 'S_COMPANYNO 08');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (09, 'seller09', '1111', 'S_PHONE 09', 'S_NAME 09', 'S_BIRTH 09', 'S_EMAIL09@naver.com', sysdate, 1, 'S_COMPANYNO 09');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (10, 'seller10', '1111', 'S_PHONE 10', 'S_NAME 10', 'S_BIRTH 10', 'S_EMAIL10@naver.com', sysdate, 1, 'S_COMPANYNO 10');
INSERT INTO SELLER (S_NO, S_ID, S_PW, S_PHONE, S_NAME, S_BIRTH, S_EMAIL, S_REGDATE, S_AGREEMENT, S_COMPANYNO) VALUES (11, 'seller11', '1111', 'S_PHONE 11', 'S_NAME 11', 'S_BIRTH 11', 'S_EMAIL11@naver.com', sysdate, 1, 'S_COMPANYNO 11');


INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (01, 01, 'C_TITLE 01', 'C_DESC 01C_DESC 01C_DESC 01C_DESC 01', 'C_CONTENT 01C_CONTENT 01C_CONTENT 01C_CONTENT 01', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-07', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 101', 'C_IMG 201', 'C_IMG 301', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (02, 01, 'C_TITLE 02', 'C_DESC 02C_DESC 02C_DESC 02C_DESC 02', 'C_CONTENT 02C_CONTENT 02C_CONTENT 02C_CONTENT 02', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-07', 'YYYY-MM-DD'), 01, 01, 01, 'books.jpg', 'C_IMG 102', 'C_IMG 202', 'C_IMG 302', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3',  0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (03, 02, 'C_TITLE 03', 'C_DESC 03C_DESC 03C_DESC 03C_DESC 03', 'C_CONTENT 03C_CONTENT 03C_CONTENT 03C_CONTENT 03', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-07', 'YYYY-MM-DD'), 01, 01, 01, 'bottles.jpg', 'C_IMG 103', 'C_IMG 203', 'C_IMG 303', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3',  0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (04, 02, 'C_TITLE 04', 'C_DESC 04C_DESC 04C_DESC 04C_DESC 04', 'C_CONTENT 04C_CONTENT 04C_CONTENT 04C_CONTENT 04', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-07', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 104', 'C_IMG 204', 'C_IMG 304', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (05, 03, 'C_TITLE 05', 'C_DESC 05C_DESC 05C_DESC 05C_DESC 05', 'C_CONTENT 05C_CONTENT 05C_CONTENT 05C_CONTENT 05', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-07', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 105', 'C_IMG 205', 'C_IMG 305', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (06, 04, 'C_TITLE 06', 'C_DESC 06C_DESC 06C_DESC 06C_DESC 06', 'C_CONTENT 06C_CONTENT 06C_CONTENT 06C_CONTENT 06', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-07', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 106', 'C_IMG 206', 'C_IMG 306', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (07, 05, 'C_TITLE 07', 'C_DESC 07C_DESC 07C_DESC 07C_DESC 07', 'C_CONTENT 07C_CONTENT 07C_CONTENT 07C_CONTENT 07', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-07', 'YYYY-MM-DD'), 01, 01, 01, 'books.jpg', 'C_IMG 107', 'C_IMG 207', 'C_IMG 307', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (08, 06, 'C_TITLE 08', 'C_DESC 08C_DESC 08C_DESC 08C_DESC 08', 'C_CONTENT 08C_CONTENT 08C_CONTENT 08C_CONTENT 08', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-07', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 108', 'C_IMG 208', 'C_IMG 308', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (09, 06, 'C_TITLE 09', 'C_DESC 09C_DESC 09C_DESC 09C_DESC 09', 'C_CONTENT 09C_CONTENT 09C_CONTENT 09C_CONTENT 09', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'books.jpg', 'C_IMG 109', 'C_IMG 209', 'C_IMG 309', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (10, 07, 'C_TITLE 10', 'C_DESC 10C_DESC 10C_DESC 10C_DESC 10', 'C_CONTENT 10C_CONTENT 10C_CONTENT 10C_CONTENT 10', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 110', 'C_IMG 210', 'C_IMG 310', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (11, 01, 'C_TITLE 11', 'C_DESC 11C_DESC 11C_DESC 11C_DESC 11', 'C_CONTENT 11C_CONTENT 11C_CONTENT 11C_CONTENT 11', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'books.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (12, 01, 'C_TITLE 12', 'C_DESC 12C_DESC 12C_DESC 12C_DESC 12', 'C_CONTENT 12C_CONTENT 12C_CONTENT 12C_CONTENT 12', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'books.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (13, 01, 'C_TITLE 13', 'C_DESC 13C_DESC 13C_DESC 13C_DESC 13', 'C_CONTENT 13C_CONTENT 13C_CONTENT 13C_CONTENT 13', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (14, 01, 'C_TITLE 14', 'C_DESC 14C_DESC 14C_DESC 14C_DESC 14', 'C_CONTENT 14C_CONTENT 14C_CONTENT 14C_CONTENT 14', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 1);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (15, 01, 'C_TITLE 15', 'C_DESC 15C_DESC 15C_DESC 15C_DESC 15', 'C_CONTENT 15C_CONTENT 15C_CONTENT 15C_CONTENT 15', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 0);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (16, 02, 'C_TITLE 16', 'C_DESC 16C_DESC 16C_DESC 16C_DESC 16', 'C_CONTENT 16C_CONTENT 16C_CONTENT 16C_CONTENT 16', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'bottles.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 0);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (17, 02, 'C_TITLE 17', 'C_DESC 17C_DESC 17C_DESC 17C_DESC 17', 'C_CONTENT 17C_CONTENT 17C_CONTENT 17C_CONTENT 17', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 0);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (18, 02, 'C_TITLE 18', 'C_DESC 18C_DESC 18C_DESC 18C_DESC 18', 'C_CONTENT 18C_CONTENT 18C_CONTENT 18C_CONTENT 18', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 0);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (19, 02, 'C_TITLE 19', 'C_DESC 19C_DESC 19C_DESC 19C_DESC 19', 'C_CONTENT 19C_CONTENT 19C_CONTENT 19C_CONTENT 19', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'bottles.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 0);
INSERT INTO CLUB (C_NO, M_NO, C_TITLE, C_DESC, C_CONTENT, C_POSTDATE, C_STARTDATE, C_ENDDATE, C_MIN, C_MAX, C_COUNT, C_MAINIMG, C_IMG1, C_IMG2, C_IMG3, C_SUBCONTENT1, C_SUBCONTENT2, C_SUBCONTENT3, C_DELETE, C_PART) VALUES (20, 02, 'C_TITLE 20', 'C_DESC 20C_DESC 20C_DESC 20C_DESC 20', 'C_CONTENT 20C_CONTENT 20C_CONTENT 20C_CONTENT 20', sysdate, TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-17', 'YYYY-MM-DD'), 01, 01, 01, 'car.jpg', 'C_IMG 111', 'C_IMG 211', 'C_IMG 311', 'C_SUBCONTENT1', 'C_SUBCONTENT2', 'C_SUBCONTENT3', 0, 0);


INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (01, 01, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (02, 02, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (03, 03, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (04, 04, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (05, 05, 02);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (06, 06, 02);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (07, 07, 02);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (08, 08, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (09, 09, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (10, 10, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (11, 11, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (12, 12, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (13, 13, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (14, 14, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (15, 15, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (16, 16, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (17, 17, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (18, 18, 01);
INSERT INTO WISHLIST (W_NO, C_NO, M_NO) VALUES (19, 19, 01);

INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (01, 01, 01, 3);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (02, 02, 01, 2);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (03, 03, 01, 0);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (04, 04, 01, 3);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (05, 05, 01, 2);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (06, 06, 01, 1);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (07, 07, 01, 0);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (08, 08, 01, 2);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (09, 09, 01, 0);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (10, 10, 01, 1);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (11, 11, 01, 0);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (12, 12, 01, 2);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (13, 13, 01, 2);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (14, 14, 01, 0);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (15, 15, 01, 2);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (16, 16, 01, 1);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (17, 17, 01, 3);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (18, 18, 01, 1);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (19, 19, 01, 1);
INSERT INTO CLUBLIST (CL_NO, C_NO, M_NO, CL_CARD) VALUES (20, 20, 01, 0);