<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%-- 머리글 포함(파라미터(title)가 있으므로 동적 페이지 포함) --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="로그인" name="title"/>
</jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/style/member/loginPage.css">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$(".footer-wrap").css("background" , "white");
	});
</script>
</head>
<body>
<%
	String id = null;

	Cookie[] cookieList = request.getCookies();
	if(cookieList != null && cookieList.length != 0) {
		for(Cookie ck : cookieList) {
			if(ck.getName().equals("id")) {
				id = ck.getValue();
			}
		}
	}
	pageContext.setAttribute("id", id);
%>


	<div class="box">
		<div class="inner-box">
			<form action="login.member" method="post">
				<h3>로그인해주세요</h3>
	
				<input type="radio" name="grade" id="member" value="member" checked="checked"/>
				<label for="member">멤버&nbsp;</label>
				<input type="radio" name="grade" id="seller" value="seller" />
				<label for="seller">호스트&nbsp;</label><br/>
				
				<!-- 아이디가 쿠키에 남아있는 경우 -->
				<c:if test="${id ne null}">
					<input type="text" name="id" placeholder="아이디" value="${id}"/><br/>
					<input type="password" name="pw" placeholder="비밀번호" /><br/>
					<input type="checkbox" name="chkId" id="chkId" checked="checked"/><label for="chkId">아이디 기억하기</label><br/>
				</c:if>
				<!-- 아이디가 쿠키에 없는 경우 -->
				<c:if test="${id eq null}">
					<input type="text" name="id" placeholder="아이디" /><br/>
					<input type="password" name="pw" placeholder="비밀번호" /><br/>
					<input type="checkbox" name="chkId" id="chkId"/><label for="chkId">아이디 기억하기</label><br/>
				</c:if>
				
				<a href="" class="login">회원가입&nbsp;</a>
				<a href="" class="login">아이디/비밀번호를 잊으셨나요?</a><br/>
				
				<button>로그인</button>
				
			</form>
		</div>
	</div>
</body>
</html>

<%@ include file="../template/footer.jsp" %>