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
	
	<form method="get" enctype="multipart/form-data">
		<div class="insert-wrap">
		
			<div class="inputs">
				<span class="title">클럽내용</span>
					<textarea rows="20" cols="100" placeholder="2000자 이내로 작성해주세요" name="c_content"></textarea>
				<br/><br/>
				
				<span class="title">사진첨부(3장)</span>
				<input type="file" name="subThumbnail1" />
				<input type="file" name="subThumbnail2" />
				<input type="file" name="subThumbnail3" />
				
				<br/>
			
			
				<span class="title">커리큘럼</span>
				
			</div>
		</div>
		
		<input type="hidden" name="c_mainThumbnail" />
		<input type="hidden" name="c_title" />
		<input type="hidden" name="c_min" />
		<input type="hidden" name="c_max" />
		<input type="hidden" name="c_money" />
		<input type="hidden" name="c_startDate" />
		<input type="hidden" name="c_endDate" />
		<input type="hidden" name="c_no" />
		<input type="hidden" name="c_postDate" />
	
		<span>${clubDto.c_title}</span>
	
		<input type="button" value="finish" onclick="fn_finish(this.form)" />
		
	</form>
	
	<script type="text/javascript">
	
		function fn_finish(f) {
			if (confirm('클럽 생성을 완료하시겠습니까?')) {
					f.action = 'clubInsert.club';
					f.submit();
				} 
		}
	
	</script>

</body>
</html>