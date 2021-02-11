<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<link rel="stylesheet" href="resources/style/myPage/clubManagePage.css">	    
<jsp:include page="myPage.jsp" />
<script>
	$(document).ready(function() {
		clubCount();
	});

	function clubCount() {
		var cNo = $('#cNo').val();
		
		$.ajax({
			url: 'clubCount/' + cNo,
			type: 'get',
			dataType: 'json',
			success: function(responseObj){
				$('.count').html('총 인원 :  ' + responseObj.clubCount + '명');
			},
			error: function() {
				alert('실패');
			}
		});
		
	}
</script>
	<div class="mypage-contents">
		<h2>모임 관리</h2>
		<hr class="top">
		
		<ul class="state">
			<li>
				<a href="clubManagePage.myPage?state=0">진행중&nbsp;</a>
			</li>
			<li>
				<a href="clubManagePage.myPage?state=1">지난모임</a>
			</li>
		</ul>
		
		<c:if test="${empty list}">
			<div class="emptyList">
				<div><i class="fas fa-exclamation-circle"></i></div>
				<div class="empty">진행중인 모임이 없습니다.</div>
			</div>
		</c:if>
		<c:if test="${not empty list}">
			<div class="clubwrap">
				<c:forEach var="clubListDto" items="${list}">
					<div class="clubList">
						<div class="clubImage"><a href=""><img alt="모임이미지" src="resources/images/club/${clubListDto.c_mainImg}"></a></div>
						<div class="clubContent">
							<div class="title">${clubListDto.c_title}</div>
							<div class="startDate">${clubListDto.c_startDate} 시작</div>
							<div class="min">최소 인원 : ${clubListDto.c_min} 명</div>
							<div class="max">최대 인원 : ${clubListDto.c_max} 명</div>
							<div class="count"></div>
							<form action="clubManageDetailPage.myPage" method="post">
								<input type="hidden" name="cNo" id="cNo" value="${clubListDto.c_no}" />
								<button>자세히</button>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</div>
<%@ include file="../template/footer.jsp" %>
