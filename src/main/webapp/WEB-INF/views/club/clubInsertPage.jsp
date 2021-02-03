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
		
			<div id="main_image">
				<input type="file" name="c_mainThumnail" />
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
					
				<span class="title">클럽내용</span><br/>
					<textarea rows="20" cols="100" placeholder="2000자 이내로 작성해주세요" name="c_content"></textarea>
				<br/><br/>
				
				<span class="title">사진첨부(3장)</span><br/>
				<input type="file" name="c_subThumbnail1" /><br/>
				<input type="file" name="c_subThumbnail2" /><br/>
				<input type="file" name="c_subThumbnail3" /><br/>
				
				<span class="title">커리큘럼</span>
				
			</div>
		</div>
		
		<input type="button" name="btn" value="finish" onclick="fn_next(this.form)" />
		
	</form>
	
	<script type="text/javascript">
	
		function fn_next(f) {
			if (confirm('새 클럽을 등록하겠습니까?')) {
				f.action='clubInsert.club';
				f.submit();
			}
		}
	
	</script>

</body>
</html>