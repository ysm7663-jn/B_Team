<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<jsp:include page="../template/header.jsp">
	<jsp:param value="새 클럽 생성" name="title" />
</jsp:include>
<link rel="stylesheet" href="resources/style/common.css" />    
    

	<form method="post" enctype="multipart/form-data">
		<div class="insert-wrap">
		
			<div id="main_image">
				<input type="file" name="file" />
			</div>
		
			<div class="inputs">
				<span class="title">클럽명</span>
					<input type="text" name="c_title" placeholder="제목을 입력해주세요" /><br/>
					
				<span class="title">한 줄 설명</span>
					<input type="text" name="c_desc" placeholder="한 줄 설명을 입력해주세요" /><br/>
					
				<span class="title">최소인원</span>
					<input type="text" name="c_min" placeholder="최소인원을 입력해주세요" /><br/>
					
				<span class="title">최대인원</span>
					<input type="text" name="c_max" placeholder="최대인원을 입력해주세요" /><br/>
					
				<span class="title">활동시작날짜</span>
					<input type="text" name="c_startDate" placeholder="활동 시작 날짜를 입력해주세요" /><br/>
					
				<span class="title">활동종료날짜</span>
					<input type="text" name="c_endDate" placeholder="활동 종료 날짜를 입력해주세요" /><br/>
					
				<span class="title">클럽내용</span><br/>
					<textarea rows="20" cols="100" placeholder="2000자 이내로 작성해주세요" name="c_content"></textarea>
				<br/><br/>
				
				<input type="file" name="c_img1" /><br/>
				<input type="text" name="c_subContent1" placeholder="한설명을 입력해주세요"/><br/>
				
				<input type="file" name="c_img2" /><br/>
				<input type="text" name="c_subContent2" placeholder="한설명을 입력해주세요"/><br/>
				
				<input type="file" name="c_img3" /><br/>
				<input type="text" name="c_subContent3" placeholder="한설명을 입력해주세요"/><br/>
				
				
			</div>
		</div>
		
		<input type="hidden" name="c_no" value="${clubDto.c_no}" />
		<input type="hidden" name="m_no" value="${clubDto.m_no}" />
		<input type="hidden" name="m_nick" value="${memberDto.m_nick}" />
		
		<input type="button" name="btn" value="완료하기" onclick="fn_finish(this.form)" />
		<input type="button" name="btn" value="돌아가기" onclick="location.href='clubListPage.club'" />
		
	</form>
	
	<script type="text/javascript">
	
		function fn_finish(f) {
			if (confirm('클럽을 등록하겠습니까?')) {
				f.action='clubInsert.club';
				f.submit();
			}
		}
	
	</script>


<%@ include file="../template/footer.jsp"%>