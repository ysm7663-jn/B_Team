<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="마이페이지" name="title"/>
</jsp:include> 
    
<link rel="stylesheet" href="resources/style/myPage/myPageCommon.css">
<div class="mypage_body">
	<div class="mypage_category">
		<c:if test="${grade eq 'member'}">
			<h2>일반</h2>
			<ul class="member_category">
				<li>
					<a href="pwCheck.myPage">내 프로필</a><br/>
				</li>
				<li>
					<a href="wishList.myPage">위시리스트</a><br/>
				</li>
				<li>
					<a href="regularClub.myPage">정기 모임</a><br/>
				</li>
				<li>
					<a href="instantClub.myPage">번개 모임</a><br/>
				</li>
				<li>
					<a href="memberPayment.myPage">결제내역</a><br/>
				</li>
				<li>
					<a href="memberDelete.myPage">탈퇴하기</a><br/>
				</li>
			</ul>
		
			<h2>모임장</h2>
			<ul class="member_category">
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
			<ul class="seller_category">
				<li>
					<a href="pwCheck2.seller">내 프로필</a><br/>
				</li>
				<li>
					<a href="spaceViewPage.seller">공간정보 관리</a><br/>
				</li>
				<li>
					<a href="reviewPage.seller">이용후기 관리</a><br/>
				</li>
				<li>
					<a href="reservation.seller">예약리스트</a><br/>
				</li>
			</ul>
		</c:if>
		
	</div>
	