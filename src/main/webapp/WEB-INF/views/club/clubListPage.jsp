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
					<input type="button" value="로그인이 안 됐습니다." onclick="location.href='clubInsertPage.club?m_no=1'"/>
				</c:if>
				<c:if test="${loginDto ne null}">
					<input type="button" value="새 클럽 등록하기" onclick="location.href='clubInsertPage.club?m_no=1'"/>
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
	
<%@ include file="../template/footer.jsp" %>
