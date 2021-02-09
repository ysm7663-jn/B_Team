<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>수정 페이지</h3>
	
	<form action="faqUpdate.admin">
		
		${faqDto.n_no}번 FAQ입니다.<br/><br/>
		제목<br/>
		<input type="text" name="title" value="${faqDto.f_title}" /><br/><br/>
		내용<br/>
		<input type="text" name="content" value="${faqDto.f_content}" /><br/><br/>
		
		<input type="hidden" name="no" value="${faqDto.f_no}" />
		<button>수정하기</button>
		
	</form>
</body>
</html>