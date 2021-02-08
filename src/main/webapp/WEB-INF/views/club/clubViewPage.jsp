<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="클럽 내용 보기" name="title" />
</jsp:include>

<link rel="stylesheet" href="resources/style/common.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script>
	$(function() {
		  $('#btn1').click( function() {
		    if( $(this).val() == '참여하기' ) {
		      $(this).val('탈퇴하기');
		    }
		    else {
		      $(this).val('참여하기');
		    }
		  });
		});
</script>

	<div class="wrap">

		<div class="thumnail">
			<img alt="main사진" src="resources/images/club/${clubDto.c_mainImg}">
		</div>

		<c:if test="${clubDto.m_no ne memberDto.m_no}">
			<div class="side">

				<div class="side_content">
					<span id="content">${clubDto.c_title}</span>
				</div>

				<div class="side_content">
					<span id="content">활동 시작일 : ${clubDto.c_startDate}</span>
				</div>

				<div class="side_content">
					<span id="content">활동 종료일 : ${clubDto.c_endDate}</span>
				</div>

				<div class="side_content">
					<input type="button" value="참여하기" id="btn1" />
				</div>
			</div>
		</c:if>

		<c:if test="${clubDto.m_no eq memberDto.m_no}">
			<div class="side">

				<div class="side_content">
					<span id="content">${clubDto.c_title}</span>
				</div>

				<div class="side_content">
					<span id="content">활동 시작일 : ${clubDto.c_startDate}</span>
				</div>

				<div class="side_content">
					<span id="content">활동 종료일 : ${clubDto.c_endDate}</span>
				</div>

				<div class="side_content">
					<input type="button" value="탈퇴하기" onclick="" />
				</div>
			</div>
		</c:if>

		<div class="contents-wrap">
			<div class="content">
				<span id="title">클럽명</span> <span id="content">${clubDto.c_title}</span>
			</div>

			<div class="content">
				<span id="title">리더 소개</span> <span id="content">${memberDto.m_nick}</span>
			</div>

			<div class="content">
				<span id="title">클럽내용</span> <span id="content">${clubDto.c_content}</span>
			</div>

			<div class="content">
				<span id="content">${clubDto.c_img1}</span> <span id="content">${clubDto.c_subContent1}</span>
			</div>

			<div class="content">
				<span id="content">${clubDto.c_img2}</span> <span id="content">${clubDto.c_subContent2}</span>
			</div>

			<div class="content">
				<span id="content">${clubDto.c_img3}</span> <span id="content">${clubDto.c_subContent3}</span>
			</div>
		</div>

		<input type="button" value="목록으로 돌아가기" onclick="location.href='clubListPage.club'" />


	</div>

<c:if test="${loginDto eq null}">
	로그인 되지 않았습니다.
	
</c:if>

<%@ include file="../template/footer.jsp"%>
