<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	alert('baraON 관리자페이지 입니다.');
</script>
<link rel="stylesheet" href="resources/style/common.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style type="text/css">


	a{
		font-size: 16px;
		text-decoration: none;
	}
	.head{
		font-family: 'Do Hyeon', sans-serif;
		font-size: 40px;
		font-weight: bold;
		margin: 0 0 0 20px;
		line-height: 100px;
	}
	.board, .member, .review{
		margin-left: 10px;
		font-size: 22px;
		font-weight: bold;
	}
	.exit{
		float: right;
		line-height: 100px;
		margin-right: 50px;
		font-size: 20px;
		color : blue;
	}

</style>
<title></title>
</head>
<body>
	<div style="height: 100px">
		<a href="admin" class="head">baraON-관리자페이지</a>
		<a href="index" onclick="alert('관리자 페이지를 종료합니다.')" class="exit">⇒ 관리자페이지 나가기</a>
	</div>
	<hr>
	<div style="background:#F8EBEE; height: 580px;">
			<div style="width: 150px; height:200px; border-bottom: 1px solid black; padding:20px 0 0 10px" >
				<span class="board">게시판 관리</span>
					<div style="margin: 20px 0 0 30px;"><a href="adminNoticeListPage.admin">공지사항</a></div>
					<div style="margin: 20px 0 10px 30px;"><a href="adminFaqListPage.admin">FAQ</a></div>
					<div style="margin: 20px 0 10px 30px;"><a href="adminEventListPage.admin">이벤트</a></div>
					<div style="width: 150px;"></div>	
			</div>
			<div style="width: 150px; height:200px; border-bottom: 1px solid black; padding:20px 0 0 10px">
				<span class="member">이용자 관리</span>
					<div style="margin: 20px 0 0 30px;"><a href="adminMemberPage.admin">회원 관리</a></div>
					<div style="margin: 20px 0 10px 30px;"><a href="adminSellerPage.admin">판매자 관리</a></div>
					<div style="margin: 20px 0 10px 30px;"><a href="adminConfirmPage.admin">공간 승인관리</a></div>
					<div style="width: 150px;"></div>	
			</div>
			<div style="width: 150px; height:200px; padding:20px 0 0 10px">
				<span class="review">댓글 관리</span>
				<div style="margin: 20px 0 0 30px;"><a href="adminReplyPage.admin">답글 관리</a></div>
				<div style="margin: 20px 0 10px 30px;"><a href="adminReviewPage.admin">리뷰 관리</a></div>
			</div>
	</div>
<%@ include file="../template/footer.jsp" %>	
</body>
</html>