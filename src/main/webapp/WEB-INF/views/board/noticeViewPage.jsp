<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="../template/header.jsp" %>
<style type="text/css">
	
</style>
</head>
<body>
	<div style="width :1200px; height:auto; margin: 0 auto;">
		<h1 style="margin-left: 10px">공지사항(NOTICE)</h1><br/>
		<div style="background:cadetblue; border-top: 1px solid black; border-bottom: 1px solid black">
			<div style="width:600px; margin: 0 0 0 10px; font-weight: bold; font-size: 25px;">
				${noticeDto.n_title}
			</div>
			<div style="width:600px; margin:10px 0 10px 10px; ffont-size: 16px;">
				${noticeDto.n_postDate}
			</div>
		</div>
			<div style="height:auto; padding:10px 0 0 10px; font-size: 18px; border-bottom:1px solid black">
				<pre>${noticeDto.n_content}</pre>
			</div><br/>
		<div>
			<form method="post">
				<input type="button" name="list" value="목록보기" onclick="location.href='noticeListPage.notice'" /><br/>
				<input type="hidden" name="no" value="${noticeDto.n_no}" />
				<input type="hidden" name="title" value="${noticeDto.n_title}" />
				<input type="hidden" name="content" value="${noticeDto.n_content}" />
			</form><br/>
		</div>
	</div>
<%@ include file="../template/footer.jsp" %>	
</body>
</html>