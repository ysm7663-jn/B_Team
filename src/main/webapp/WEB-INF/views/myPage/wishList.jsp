<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="myPage.jsp" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
	
	<div class="mypage_contents">
		<h2>위시 리스트</h2>
		<hr>
		
		<c:if test="${empty list}">
			
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="wishListDto" items="${list}">
				<div class="clubImg">
					<img alt="클럽 이미지" src="">
					
					<h3>${wishListDto.c_title}</h3>
					<h5>${wishListDto.c_content}</h5>
				</div>
				
			</c:forEach>
		</c:if>
				
	</div>
</div>
<%@ include file="../template/footer.jsp" %>