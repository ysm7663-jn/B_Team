<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if (title == null || title.isEmpty()) {
		title = "BaraON";
	}
	pageContext.setAttribute("title", title);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>${title}</title>
<!-- header, footer css -->
<link rel="stylesheet" href="resources/style/common.css">
<!-- Fontawesome CDN -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" >
</head>
<body class="body">

	<div class="wrap">
	
		<!-- 로그인 전 -->
		<c:if test="${loginDto eq null}">
		<div class="head-wrap">
			<div class="left_head_wrap">
					<a href="index">
						<img alt="로고사진" src="">
					</a>
			</div>
			
			<div class="right_head_wrap">
				<nav id="right_head">
					<div><a href="loginPage.member">로그인</a></div>
					<div><a href="memberJoin.member">회원가입</a></div>
					<div><a href="">FAQ</a></div>
				</nav>
			</div>
		</div>	<!-- end : header-wrap -->
				
			<div class="head_content">
				<nav id="bottom_head">
					<div><a href="">바라온 소개</a></div>
					<div><a href="">정기 활동</a></div>
					<div><a href="">번개 활동</a></div>
					<div><a href="placeListPage.place">장소 공유</a></div>
					<div><a href="">공지사항&이벤트</a></div>
				</nav>
			</div>
		</c:if>
		
		<!-- 로그인 후 -->
		<c:if test="${loginDto ne null}">
			<div class="head-wrap">
				<div class="left_head_wrap">
						<a href="index">
							<img id="logo" alt="로고사진" src="">
						</a>
				</div>
				
				<div class="right_head_wrap">
					<nav id="right_head">
						<div><a href="logout.member">로그아웃</a></div>
						<div><a href="profile.myPage">마이페이지</a></div>
						<div><a href="">FAQ</a></div>
					</nav>
				</div>
			</div>	<!-- end : header-wrap -->
			
				<div class="head_content">
					<nav id="bottom_head">
						<div><a href="">바라온 소개</a></div>
						<div><a href="">정기 활동</a></div>
						<div><a href="">번개 활동</a></div>
						<div><a href="placeListPage.place">장소 공유</a></div>
						<div><a href="">공지사항&이벤트</a></div>
					</nav>
				</div>
		</c:if>
			
		<div class="body-wrap">