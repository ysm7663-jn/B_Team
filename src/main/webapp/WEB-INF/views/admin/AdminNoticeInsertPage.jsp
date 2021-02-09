<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_insert(){
		alert('공지사항이 추가되었습니다.');
	}
</script>
</head>
<body>
	<form action="noticeInsert.admin">
		제목<br/>
		<input type="text" name="title" /><br/><br/>
		내용<br/>
		<input type="text" name="content" /><br/><br/>
		<button onclick="fn_insert()">작성완료</button>
	</form>
</body>
</html>