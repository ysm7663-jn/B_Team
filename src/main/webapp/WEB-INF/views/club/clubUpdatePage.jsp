<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="클럽 내용 수정" name="title" />
</jsp:include>

<link rel="stylesheet" href="resources/style/common.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>


<script type="text/javascript">
	function fn_update(f) {
		if (confirm('클럽 내용을 수정하시겠습니까?')) {
			f.action = 'clubUpdate.club';
			f.submit();
		}
	}
</script>

<form method="post">

	<div class="wrap">

		<div class="side">

			<div class="side_content">
			    <span class="title">클럽명</span>
				<input type="text" name="c_title" value="${clubDto.c_title}" /><br/>
			</div>
			
			<span class="title">최소인원</span> 
			<input type="text" name="c_min" value="${clubDto.c_min}" /><br/>
			
			<span class="title">최대인원</span> 
			<input type="text" name="c_max" value="${clubDto.c_max}" /><br/>
			 
			<span class="title">활동시작날짜</span> 
			<input type="text" name="c_startDate" value="${clubDto.c_startDate}" /><br/>
			
			<span class="title">활동종료날짜</span> 
			<input type="text" name="c_endDate" value="${clubDto.c_endDate}" /><br/>
			
			<span class="title">클럽내용</span><br />
			<textarea rows="20" cols="100" placeholder="${clubDto.c_content}" name="c_content"></textarea>
			<br /><br /> 
			
			<input type="hidden" name="c_no" value="${clubDto.c_no}" />
			<input type="hidden" name="m_no" value="${clubDto.m_no}" />
			
			<input type="button" value="수정하기" onclick="fn_update(this.form)" />
			<input type="button" value="목록으로 돌아가기" onclick="location.href='clubListPage.club'" />
		</div>
	</div>
</form>

<%@ include file="../template/footer.jsp"%>
