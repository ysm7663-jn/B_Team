<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<jsp:include page="../template/header.jsp" >
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>    

<link rel="stylesheet" href="resources/style/myPageCommon.css">
<div class="mypage_body">
	<div class="mypage_category">
		<c:if test="${grade eq 'member'}">
			<h2>일반</h2>
			<a href="">내 프로필</a><br/>
			<a href="">위시리스트</a><br/>
			<a href="">정기 모임</a><br/>
			<a href="">번개 모임</a><br/>
			<a href="">결제내역</a><br/>
			<a href="">탈퇴하기</a><br/>
		
			<h2>모임장</h2>
			<a href="">모임 관리</a><br/>
			<a href="">결제내역</a><br/>
			
		</c:if>
		<c:if test="${grade eq 'seller'}">
			<h2>호스트</h2>
			<a href="">내 프로필</a><br/>
			<a href="">공간정보 관리</a><br/>
			<a href="">이용후기 관리</a><br/>
			<a href="">예약리스트</a><br/>
		</c:if>
		
	</div>
	<div class="mypage_contents">
		<h2>내 프로필</h2>
		<hr>
		
	</div>
</div>


<%@ include file="../template/footer.jsp" %>