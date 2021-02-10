<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<link rel="stylesheet" href="resources/style/myPage/memberDelete.css">	    
<jsp:include page="myPage.jsp" />

	<div class="mypage-contents">
		<h2>탈퇴하기</h2>
		<hr class="top">
		
		<div class="content-wrap">
			<p>지금 탈퇴하시면</p>
			<p>바라온과의 추억들은 되돌릴 수 없습니다.<i class="far fa-sad-tear"></i></p><br/>
			<p>정말로 떠나실건가요?</p>
		</div><br/>
		<div class="buttons">
			<input type="button" value="확인" onclick="location.href='infoDelete.myPage'" />
			<input type="button" value="취소" onclick="location.href='profile.myPage'" />
		</div>
	</div>
</div>


<%@ include file="../template/footer.jsp" %>
