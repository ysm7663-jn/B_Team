<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../template/header.jsp" >
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include> 
   
<link rel="stylesheet" href="resources/style/findPage.css">
<div class="box">
	<div class="inner-box">
		<div class="main-aside">
			<input type="radio" name="tab" id="findId" checked />
			<input type="radio" name="tab" id="findPw" />
			<div class="tab-buttons">
				<label for="findId">아이디 찾기<hr></label>&nbsp;&nbsp;&nbsp;
				<label for="findPw">비밀번호 찾기<hr></label>
			</div>
			<div class="resultBox">
				<h4>인증번호가 메일로 전송되었습니다.</h4>
			</div>
			<div class="authInputBox">
				<input type="text" name="auth" placeholder="인증번호를 입력해주세요" />	&nbsp;&nbsp;			
				<input type="button" value="확인" onclick="loginPage.member"/>
			</div>
		</div>
	</div>
</div>

<%@ include file="../template/footer.jsp" %>