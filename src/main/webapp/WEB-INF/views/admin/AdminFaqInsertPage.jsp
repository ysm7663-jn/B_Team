<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function fn_insert(){
		alert('FAQ가 추가되었습니다.');
	}
	$("#category options:selected").val();
	
</script>
</head>
<body>
	<form action="faqInsert.admin">
		카테고리
		<select id="box">
			<option>선택</option>
			<option value="2">결제 및 환불</option>
			<option value="3">계정</option>
			<option value="4">이용안내</option>
		</select><br/><br/>
		제목<br/>
		<input type="text" name="title" /><br/><br/>
		내용<br/>
		<input type="text" name="content" /><br/><br/>
		<input type="hidden" name="category" value="${faqDto.f_category}">
		<button onclick="fn_insert()">작성완료</button>
	</form>
</body>
</html>