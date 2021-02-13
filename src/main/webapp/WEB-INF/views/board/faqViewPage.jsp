<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="resources/style/common.css">
<%@ include file="../template/header.jsp" %>
<style type="text/css">
	 
</style>
</head>
<body>
	<div style="width :1020px; height:300px; margin: 0 auto;">
		<h3 style="margin-left: 10px">자주묻는질문(FAQ)</h3><br/>
		<div style="background:#3ED0C8; border-top: 1px solid black; border-bottom: 1px solid black">
			<div style="width:600px; margin: 0 0 0 10px; font-weight: bold; font-size: 18px;">
				${faqDto.f_title}
			</div>
			<div style="width:600px; margin:10px 0 10px 10px; font-weight: 800px; font-size: 14px;">
				${faqDto.f_regDate}
			</div>
		</div>
		<div>
			<div style="height:150px; padding:30px 0 0 10px; font-size: 14px; border-bottom:1px solid black">
				${faqDto.f_content}<br/><br/>
			</div>
		</div><br/>
		<div>
			<form method="post">
				<input type="button" id="list" name="list" value="목록보기" onclick="location.href='faqListPage.faq'" />
				<input type="hidden" name="no" value="${faqDto.f_no}" />
				<input type="hidden" name="title" value="${faqDto.f_title}" />
				<input type="hidden" name="content" value="${faqDto.f_content}" />
			</form>
		</div>
	</div>
<%@ include file="../template/footer.jsp" %>
</body>
</html>