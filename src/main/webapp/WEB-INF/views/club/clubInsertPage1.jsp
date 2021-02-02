<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="get">
		<div class="insert-wrap">
		
			<div id="image">
				<input type="file" name="mainThumbnail" />
			</div>
		
			<div class="inputs">
				<span class="title">클럽명</span>
					<input type="text" name="c_title" placeholder="제목을 입력해주세요" /><br/>
					
				<span class="title">최소인원</span>
					<input type="text" name="c_min" placeholder="최소인원을 입력해주세요" /><br/>
					
				<span class="title">최대인원</span>
					<input type="text" name="c_max" placeholder="최대인원을 입력해주세요" /><br/>
					
				<span class="title">활동비용</span>
					<input type="text" name="c_money" placeholder="총 활동비용을 입력해주세요" /><br/>
					
				<span class="title">활동시작날짜</span>
					<input type="text" name="c_startDate" placeholder="활동 시작 날짜를 입력해주세요" /><br/>
					
				<span class="title">활동종료날짜</span>
					<input type="text" name="c_endDate" placeholder="활동 종료 날짜를 입력해주세요" /><br/>
			</div>
		</div>
		
		<input type="button" name="btn" value="next >" onclick="fn_next(this.form)" />
		
	</form>
	
	<script type="text/javascript">
	
		function fn_next(f) {
			f.action='clubInsertPage2.club';
			f.submit();
		}
	
	</script>

</body>
</html>