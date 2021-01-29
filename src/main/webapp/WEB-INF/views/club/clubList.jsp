<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="clubList" name="title" />
</jsp:include>
<link rel="stylesheet" href="resources/style/common.css" /> 

	
		<div class="body_wrap">
			<span id="title">정기 활동</span>
			<div id="btn_create">
				<button>새 클럽 만들기</button>
			</div> 
		</div>
	
<%@ include file="../template/footer.jsp" %>
