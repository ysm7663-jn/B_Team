<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="마이페이지" name="title"/>
</jsp:include> 
    
<link rel="stylesheet" href="resources/style/myPage/myPageCommon.css">
<script>
	$(function(){
		$('body').on('click', '.member_category li > a', function(event){
			$('.member_category li > a').css('background','');
			$(this).css('color', 'red');
		});
	});
</script>
<div class="mypage-body">
	<div class="mypage-category">
		<c:if test="${grade eq 'member'}">
			<h2>일반</h2>
			<ul class="member-category">
				<li>
					<a class="btn" href="profile.myPage">내 프로필</a><br/>
				</li>
				<li>
					<a class="btn" href="wishList.myPage">위시리스트</a><br/>
				</li>
				<li>
					<a class="btn" href="regularClub.myPage?state=0">정기 모임</a><br/>
				</li>
				<li>
					<a class="btn active" href="instantClub.myPage?state=0">번개 모임</a><br/>
				</li>
				<li>
					<a class="btn" href="memberDeletePage.myPage">탈퇴하기</a><br/>
				</li>
			</ul>
		
			<h2>모임장</h2>
			<ul class="member-category">
				<li>
					<a href="clubManage.myPage">모임 관리</a><br/>
				</li>
				<li>
					<a href="clubPayment.myPage">결제내역</a><br/>
				</li>
			</ul>
			
		</c:if>
		<c:if test="${grade eq 'seller'}">
			<h2>호스트</h2>
			<ul class="seller-category">
				<li>
					<a href="">내 프로필</a><br/>
				</li>
				<li>
					<a href="">공간정보 관리</a><br/>
				</li>
				<li>
					<a href="">이용후기 관리</a><br/>
				</li>
				<li>
					<a href="">예약리스트</a><br/>
				</li>
			</ul>
		</c:if>
		
	</div>
	