<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/style/common.css">
<style type="text/css">
	
	a{
		font-size: 16px;
		text-decoration: none;
	}
</style>
<title></title>
</head>
<body>
	<h1>baraON-관리자페이지</h1>
	<hr>
	<div style="background:#F8EBEE; height: 580px;">
			<div style="width: 150px; height:150px; border-bottom: 1px solid black" >
				<h3 style="margin-left: 10px; padding-top: 10px" >게시판 관리</h3>
					<div style="margin: 10px 0 0 30px;"><a href="adminNoticeListPage.admin">공지사항</a></div>
					<div style="margin: 10px 0 10px 30px;"><a href="adminFaqListPage.admin">FAQ</a></div>
					<div style="margin: 10px 0 10px 30px;"><a href="adminEventListPage.admin">이벤트</a></div>
					<div style="width: 150px;"></div>	
			</div>
			<div style="width: 150px; height:150px; border-bottom: 1px solid black">
				<h3 style="margin-left: 10px; padding-top: 10px">이용자 관리</h3>
					<div style="margin: 10px 0 0 30px;"><a href="adminMemberPage.admin">회원 관리</a></div>
					<div style="margin: 10px 0 10px 30px;"><a href="adminSellerPage.admin">판매자 관리</a></div>
					<div style="margin: 10px 0 10px 30px;"><a href="adminConfirmPage.admin">공간 승인관리</a></div>
					<div style="width: 150px;"></div>	
			</div>
			<div style="width: 150px; height:150px">
				<h3 style="margin-left: 10px; padding-top: 10px">댓글 관리</h3>
				<div style="margin: 10px 0 0 30px;"><a href="adminReplyPage.admin">답글 관리</a></div>
				<div style="margin: 10px 0 10px 30px;"><a href="adminReviewPage.admin">리뷰 관리</a></div>
			</div>
	</div>
<%@ include file="../template/footer.jsp" %>	
</body>
</html>