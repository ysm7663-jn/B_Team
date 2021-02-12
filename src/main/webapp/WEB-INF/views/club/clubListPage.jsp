<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="클럽 활동 목록" name="title" />
</jsp:include>
<link rel="stylesheet" href="resources/style/common.css" />
<link rel="stylesheet" href="resources/style/club/clubList.css" />

<form method="get">
	<div class="body_wrap">
		<span id="title">정기 활동</span>
		<div id="btn_create">
			<c:if test="${loginDto ne null}">
				<input type="button" id="btn_create" value="새 클럽 등록하기" onclick="location.href='clubInsertPage.club'" />
			</c:if>
		</div>
	</div>

	<c:if test="${empty list}">
		<div id="none_content">등록된 클럽이 없습니다.</div>
	</c:if>
	<c:if test="${not empty list}">
		<c:forEach var="clubDto" items="${list}">
			<div class="group-list">
				<div class="col-4">
					<a class="ns" href="clubViewPage.club?c_no=${clubDto.c_no}&m_no=${clubDto.m_no}"> 
						<img alt="${clubDto.c_mainImg}" src="resources/images/storage/${clubDto.c_mainImg}">
					</a>
					<div class="title-container" style="height: 300px;">
						<div class="title-content">
							<div class="title inline">${clubDto.c_title}</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</form>

<%@ include file="../template/footer.jsp"%>
