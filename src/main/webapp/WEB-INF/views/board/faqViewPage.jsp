<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="c_head1">
		${faqDto.f_title}
	</div>
	<div class="c_head2">
		${faqDto.f_regDate}
	</div>
	<div class="c_body">
		${faqDto.f_content}<br/><br/>
	</div>
	
	<div class="c_foot">
	<form method="post">
		<input type="button" name="list" value="목록보기" onclick="location.href='faqListPage.faq'" />
		<input type="hidden" name="no" value="${faqDto.f_no}" />
		<input type="hidden" name="title" value="${faqDto.f_title}" />
		<input type="hidden" name="content" value="${faqDto.f_content}" />
	</form>
	</div>
</body>
</html>