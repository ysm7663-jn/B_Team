<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="clubList" name="title" />
</jsp:include>
<link rel="stylesheet" href="resources/style/common.css" /> 

	
	<form method="get">
		<div class="body_wrap">
			<span id="title">정기 활동</span>
			<div id="btn_create">
				<c:if test="${loginDto eq null}">
					<span>로그인이 안 됐습니다.</span>
				</c:if>
				<c:if test="${loginDto ne null}">
					<input type="button" value="새 클럽 등록하기" onclick="fn_insertPage(this.form)"/>
				</c:if>
			</div> 
		</div>
		
		<c:if test="${empty list}">
			<div id="none_content">등록된 클럽이 없습니다.</div>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="clubDto" items="${list}">
				<div class="group-list">
					<div class="content">
						<div class="thumnail">
							<img alt="" src="">
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</form>
	
	<script type="text/javascript">

		function fn_insertPage(f) {
			f.action = 'clubInsertPage.club';
			f.submit();
		}	
	
	</script>
	
<%@ include file="../template/footer.jsp" %>
