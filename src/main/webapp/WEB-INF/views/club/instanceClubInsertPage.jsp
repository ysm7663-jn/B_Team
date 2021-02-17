<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<jsp:include page="../template/header.jsp">
	<jsp:param value="새 클럽 생성" name="title" />
</jsp:include>
<link rel="stylesheet" href="resources/style/common.css" />    
<link rel="stylesheet" href="resources/style/club/clubInsert.css" />    
    

	<form method="post" enctype="multipart/form-data">
		<div class="insert-wrap">
			<hr class="line">
			<div id="main_image">
				<div class="title">메인 화면 썸네일</div>
				<input type="file" name="c_mainImg" />
			</div>
		
			<br/><br/>
		
			<div class="inputs">
				<div class="title">클럽명</div>
					<input type="text" name="c_title" id="input" placeholder="  제목을 입력해주세요" /><br/><br/>
					
				<div class="title">한 줄 설명</div>
					<input type="text" name="c_desc" id="input" placeholder="  한 줄 설명을 입력해주세요" /><br/><br/>
					
				<div class="title">최소인원</div>
					<input type="text" name="c_min" id="input" placeholder="  최소인원을 입력해주세요" /><br/><br/>
					
				<div class="title">최대인원</div>
					<input type="text" name="c_max" id="input" placeholder="  최대인원을 입력해주세요" /><br/><br/>
					
				<div class="title">활동날짜</div>
					<input type="text" name="c_startDate" id="input" placeholder="  ex) 20xx.xx.xx" /><br/><br/>
				
				<input type="hidden" name="c_endDate" value="1111.11.11" />
					
				<div class="title">클럽내용</div>
					<textarea rows="20" cols="100" id="c_content" name="c_content" placeholder=" 2000자 이내로 작성해주세요" ></textarea>
				<br/><br/>
			</div>
		</div>
		<%-- hidden --%>
		<input type="hidden" name="m_no" value="${loginDto.m_no}" />
		
		<div class="btn_wrap">
			<input type="button" name="btn" id="btn" value="완료하기" onclick="fn_finish(this.form)" />
			<input type="button" name="btn" id="btn" value="돌아가기" onclick="location.href='instanceClubListPage.club'" />
		</div>
	</form>
	
	<script type="text/javascript">
	
		function fn_finish(f) {
			if (confirm('클럽을 등록하겠습니까?')) {
				f.action='instanceClubInsert.club';
				f.submit();
			}
		}
	</script>

<%@ include file="../template/footer.jsp"%>